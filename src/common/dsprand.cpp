#include "dsprand.h"

uint32 WELL512::state[16];
uint32 WELL512::index = 0;
bool WELL512::init = false;

void WELL512::seed(uint32 value)
{
    index = 0;
     // Expand the seed with the same algorithm as mersenne twister
    const uint32 mask = ~0u;
    state[0] = value & mask;
    for (uint32 i = 1; i < 16; ++i)
        state[i] = (1812433253UL * (state[i - 1] ^ (state[i - 1] >> 30)) + i) & mask;
}

void WELL512::seed(uint32 values[16])
{
    index = 0;
    for (uint32 i = 0; i < 16; ++i)
        state[i] = values[i];
}