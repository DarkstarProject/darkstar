#include <type_traits>
#include <cstdint>
#include <algorithm>

namespace marshal
{
    template<std::size_t Size, typename T = int>
    struct bitsection
    {
        static std::size_t const size = Size;
        typedef T type;
    };

    template<std::size_t Bytes, typename... Sections>
    class bitfield
    {
    private:

        unsigned char buffer[Bytes] = {};

        template<std::size_t Index, typename Section, typename... Rest>
        struct section_at
        {
            typedef typename section_at<Index - 1, Rest...>::section section;
        };

        template<typename Section, typename... Rest>
        struct section_at<0, Section, Rest...>
        {
            typedef Section section;
        };

        template<std::size_t Index, typename Section, typename... Rest>
        struct offset_at
        {
            static std::size_t const value = offset_at<Index - 1, Section, Rest...>::value + section_at<Index - 1, Section, Rest...>::section::size;
        };

        template<typename Section, typename... Rest>
        struct offset_at<0, Section, Rest...>
        {
            static std::size_t const value = 0;
        };

    public:

        static_assert(offset_at<sizeof...(Sections), Sections..., void>::value <= 8 * Bytes, "Provided bit sections exceed available space.");

        bitfield()
        {}

        template<typename C>
        bitfield(C const& cont)
            : bitfield(cont.begin(), cont.end())
        {}

        template<std::size_t N>
        bitfield(char(&other)[N])
            : bitfield(other, other + N)
        {}

        template<std::size_t N>
        bitfield(unsigned char(&other)[N])
            : bitfield(other, other + N)
        {}

        template<typename It>
        bitfield(It const& start, It const& end)
        {
            static_assert(sizeof(*start) == 1, "Invalid range constructor. Underlying iterator type needs to be char or unsigned char.");

            std::copy(start, end, buffer);
        }

        template<std::size_t Index, typename R>
        void set(R value)
        {
            static_assert(Index < sizeof...(Sections), "Index out of bit field range.");

            auto const offset = offset_at<Index, Sections...>::value;
            auto const shift = offset % 8;
            typedef typename section_at<Index, Sections...>::section section;

            std::uint64_t copy = 0;
            std::copy_n(buffer + offset / 8, ((section::size + 7) & ~7) / 8, reinterpret_cast<unsigned char*>(&copy));
            copy &= ~(((1 << section::size) - 1) << shift);
            copy |= (value & ((1 << section::size) - 1)) << shift;
            std::copy_n(reinterpret_cast<unsigned char*>(&copy), ((shift + section::size + 7) & ~7) / 8, buffer + offset / 8);
        }

        template<std::size_t Index>
        typename section_at<Index, Sections...>::section::type get()
        {
            static_assert(Index < sizeof...(Sections), "Index out of bit field range.");

            auto const offset = offset_at<Index, Sections...>::value;
            auto const shift = offset % 8;
            typedef typename section_at<Index, Sections...>::section section;

            std::uint64_t copy = 0;
            std::copy_n(buffer + offset / 8, ((shift + section::size + 7) & ~7) / 8, reinterpret_cast<unsigned char*>(&copy));

            return (typename section::type)((copy >> shift) & ((1 << section::size) - 1));
        }

        std::size_t size() const
        {
            return Bytes;
        }

        unsigned char* data()
        {
            return buffer;
        }

        unsigned char* begin()
        {
            return buffer;
        }

        unsigned char* end()
        {
            return buffer + size();
        }

        unsigned char const* cbegin() const
        {
            return buffer;
        }

        unsigned char const* cend() const
        {
            return buffer + size();
        }
    };
}
