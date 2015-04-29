#include <type_traits>
#include <cstdint>
#include <algorithm>

namespace marshal
{
    typedef std::uint64_t max_bit_type;

    template<std::size_t Size, typename T = int>
    struct bitsection
    {
        static_assert(sizeof(T) <= sizeof(marshal::max_bit_type), "Type size exceeds highest allowed type size.");
#if !defined(__GNUC__) || __GNUC__ > 5
        static_assert(std::is_trivially_copyable<T>::value, "The type of a bit section needs to be trivially copyable.");
#endif

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

        template<std::size_t Index>
        class mirror
        {
        private:
            typedef typename section_at<Index, Sections...>::section section;
            static std::size_t const bit_offset = offset_at<Index, Sections...>::value;
            static std::size_t const bit_shift = bit_offset % 8;
            static std::size_t const byte_offset = bit_offset / 8;
            static std::size_t const byte_length = ((bit_shift + section::size + 7) & ~7) / 8;

            unsigned char* buffer;
            union
            {
                marshal::max_bit_type value;
                std::array<unsigned char, byte_length> array;
            };

            static_assert(Index < sizeof...(Sections), "Index out of bit field range.");
            static_assert(byte_length <= sizeof(marshal::max_bit_type), "Invalid type with size larger than the maximum allowed.");

        public:
            mirror(unsigned char* original)
                : buffer{original + byte_offset}, value{0}
            {}

            typename section::type operator =(typename section::type const& other)
            {
                std::copy_n(buffer, byte_length, array.data());
                value &= ~(((1 << section::size) - 1) << bit_shift);
                value |= (other & ((1 << section::size) - 1)) << bit_shift;
                std::copy_n(array.data(), byte_length, buffer);
                return other;
            }

            operator typename section::type()
            {
                std::copy_n(buffer, byte_length, array.data());
                return static_cast<typename section::type>((value >> bit_shift) & ((1 << section::size) - 1));
            }
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
        typename section_at<Index, Sections...>::section::type set(R value)
        {
            return mirror<Index>{buffer} = value;
        }

        template<std::size_t Index>
        typename section_at<Index, Sections...>::section::type get()
        {
            return mirror<Index>(buffer);
        }

        std::size_t size() const
        {
            return Bytes;
        }

        unsigned char* data()
        {
            return buffer;
        }
    };

    template<std::size_t Index, std::size_t Bytes, typename... Sections>
    auto set(bitfield<Bytes, Sections...> bf) -> decltype(bf.template set<Index>())
    {
        return bf.template set<Index>();
    }

    template<std::size_t Index, std::size_t Bytes, typename... Sections>
    auto get(bitfield<Bytes, Sections...> bf) -> decltype(bf.template get<Index>())
    {
        return bf.template get<Index>();
    }
}
