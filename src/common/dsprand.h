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

    public:
    static void seed(uint32 value);

    static void seed(uint32 values[16]);

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

    /*Generates double floating point numbers in the half-open interval, from 0.0 to 1.0.
    @returns double result
    */
    static inline double drand()
    {
        return (double)(irand()) * (1. / 4294967296.); // divided by 2^32
    }

    /*Generates a random int32 value between and inclusive the specified min and max values.
    @param min type int32
    @param max type int32
    @returns int32 result
    */
    static inline int32 GetRandomInt32(int32 min, int32 max)
    {
        min--;
        return static_cast<int32>(ceil(WELL512::drand() * (max - min)) + min);
    }

    /*Generates a random int32 value between and inclusive zero and the specified max value.
    @param max type int32
    @returns int32 result
    */
    static inline int32 GetRandomInt32(int32 max)
    {
        return GetRandomInt32(0, max);
    }

    /*Generates a random int16 value between and inclusive the specified min and max values.
    @param min type int16
    @param max type int16
    @returns int16 result
    */
    static inline int16 GetRandomInt16(int16 min, int16 max)
    {
        min--;
        return static_cast<int16>(ceil(WELL512::drand() * (max - min)) + min);
    }

    /*Generates a random int16 value between and inclusive zero and the specified max value.
    @param max type int16
    @returns int16 result
    */
    static inline int16 GetRandomInt16(int16 max)
    {
        return GetRandomInt16(0, max);
    }

    /*Generates a random int8 value between and inclusive the specified min and max values.
    @param min type int8
    @param max type int8
    @returns int8 result
    */
    static inline int8 GetRandomInt8(int8 min, int8 max)
    {
        min--;
        return static_cast<int8>(ceil(WELL512::drand() * (max - min)) + min);
    }

    /*Generates a random int8 value between and inclusive zero and the specified max value.
    @param max type int8
    @returns int8 result
    */
    static inline int8 GetRandomInt8(int8 max)
    {
        return GetRandomInt8(0, max);
    }

    /*Generates a random float value between and inclusive the specified min and max values.
    @param min type float
    @param max type float
    @returns float result
    */
    static inline float GetRandomFloat(float min, float max, bool allow_decimals = false)
    {
        if (allow_decimals)
        {
            return static_cast<float>(WELL512::drand() * (max - min) + min);
        }
        else
        {
            min--;
            return static_cast<float>(ceil(WELL512::drand() * (max - min)) + min);
        }
    }

    /*Generates a random float value between and inclusive zero and the specified max value.
    @param max type float
    @returns float result
    */
    static inline float GetRandomFloat(float max, bool allow_decimals = false)
    {
        return GetRandomFloat(0.0f, max, allow_decimals);
    }
};
