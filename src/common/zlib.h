// Copyright (c) 2010-2015 Darkstar Dev Teams
#ifndef _ZLIB_H
#define _ZLIB_H

#include "../common/cbasetypes.h"

static inline size_t zlib_compressed_size(const size_t sz)
{
    return (sz + 7) / 8;
}

std::int32_t zlib_init();
std::int32_t zlib_compress(const int8 *in, const uint32 in_sz, int8 *out, const uint32 out_sz);
uint32 zlib_decompress(const int8 *in, const uint32 in_sz, int8 *out, const uint32 out_sz);

#endif
