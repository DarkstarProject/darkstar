/**
 * Random number generator with period 2^{512}-1;
 * effectively a better version of MT19937 (smaller state, similarly fast,
 * simpler code, better distribution).
 *
 * Generator implemented for the Darkstar project (c)2014
 */
#include "cbasetypes.h"

class WELL512
{
private:
    static uint32 state[16];
    static uint32 index;

    /*Generates a random unsigned integer.
    @returns uint32 result
    */
    static inline uint32 irand()
    {
        // WELL512 implementation by Chris Lomont
        // http://lomont.org/Math/Papers/2008/Lomont_PRNG_2008.pdf)
        uint32 a, b, c, d;
        a = state[index];
        c = state[(index + 13) & 15];
        b = a ^ c ^ (a << 16) ^ (c << 15);
        c = state[(index + 9) & 15];
        c ^= (c >> 11);
        a = state[index] = b ^ c;
        d = a ^ ((a << 5) & 0xDA442D24UL);
        index = (index + 15) & 15;
        a = state[index];
        state[index] = a ^ b ^ d ^ (a << 2) ^ (b << 18) ^ (c << 28);
        return state[index];
    }

    /*Generates double floating point numbers in the half-open interval [0.0, 1.0)
    @returns double result
    */
    static inline double drand()
    {
        return (double)(irand()) / 4294967296.; // divided by 2^32
    }

public:
    static void seed(uint32 value);

    static void seed(uint32 values[16]);

    /*Generates a random number in the half-open interval [min, max)
    @param min
    @param max
    @returns result
    */
    template <typename Type>
    static inline Type GetRandomNumber(Type min, Type max)
    {
        return static_cast<Type>((WELL512::drand() * (max - min)) + min);
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
