#include <random>

class dsprand
{
private:
    static std::mt19937& mt()
    {
        static std::mt19937 e{};
        return e;
    }

public:
    static void seed(void)
    {
        std::random_device rd;
        mt().seed(rd());
    }

    /*Generates a random number in the half-open interval [min, max)
    @param min
    @param max
    @returns result
    */
    template <typename T>
    static inline typename std::enable_if<std::is_integral<T>::value, T>::type
        GetRandomNumber(T min, T max)
    {
        if (min == max - 1 || max == min)
        {
            return min;
        }
        std::uniform_int_distribution<T> dist(min, max - 1);
        return dist(mt());
    }

    template<typename T>
    static inline typename std::enable_if<std::is_floating_point<T>::value, T>::type
        GetRandomNumber(T min, T max)
    {
        if (min == max)
        {
            return min;
        }
        std::uniform_real_distribution<T> dist(min, max);
        return dist(mt());
    }

    /*Generates a random number in the half-open interval [0, max)
    @param min
    @param max
    @returns result
    */
    template <typename T>
    static inline T GetRandomNumber(T max)
    {
        return GetRandomNumber<T>(0, max);
    }
};