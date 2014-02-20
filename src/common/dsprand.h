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
    static bool init;

protected:
    uint32 rand_int32();

public:
    WELL512()
    {
        if (!init)
            seed((uint32)0);
        init = true;
    }
  
    WELL512(uint32 seed32)
    {
        seed(seed32);
        init = true;
    }

    uint32 operator()()
    {
        return rand_int32();
    }

    void seed(uint32 value);

    void seed(uint32 values[16]);

};

inline uint32 WELL512::rand_int32()
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

// generates double floating point numbers in the half-open interval [0, 1)
class DWELL512 : public WELL512
{
public:
    DWELL512() : WELL512() {}
    DWELL512(uint32 seed) : WELL512(seed) {}
    DWELL512(uint32 seed[16]) : WELL512(seed[16]) {}
    double operator()()
    {
        return (double)(rand_int32()) * (1. / 4294967296.); // divided by 2^32
    }
};