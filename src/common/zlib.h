// Copyright (c) 2010-2015 Darkstar Dev Teams
#ifndef _ZLIB_H
#define _ZLIB_H

#include "../common/cbasetypes.h"

static inline size_t zlib_compressed_size(const size_t sz)
{
    return (sz + 7) / 8;
}

std::int32_t zlib_init();
std::int32_t zlib_compress(const std::int8_t *in, const std::uint32_t in_sz, std::int8_t *out, const std::uint32_t out_sz);
std::uint32_t zlib_decompress(const std::int8_t *in, const std::uint32_t in_sz, std::int8_t *out, const std::uint32_t out_sz);

#endif
