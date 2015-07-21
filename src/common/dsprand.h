#include <random>
 
class dsprand
{
private:
    static std::mt19937 & mt()
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
    template <typename Type>
    static inline Type GetRandomNumber(Type min, Type max)
    {        
        std::uniform_int_distribution<Type> dist(min, max - 1);
        return dist(mt());
    }
    
    /*Generates a random number in the half-open interval [0, max)
    @param min
    @param max
    @returns result
    */
    template <typename Type>
    static inline Type GetRandomNumber(Type max)
    {
        return GetRandomNumber<Type>(0, max);
    }
};

template<>
static inline double dsprand::GetRandomNumber(double min, double max)
{
    std::uniform_real_distribution<> dist(min, max);
    return dist(mt());
}

template<>
static inline float dsprand::GetRandomNumber(float min, float max)
{
    std::uniform_real_distribution<float> dist(min, max);
    return dist(mt());
}