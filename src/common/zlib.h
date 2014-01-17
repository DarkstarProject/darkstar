// Copyright (c) 2010-2014 Darkstar Dev Teams
#ifndef _ZLIB_H
#define _ZLIB_H

#include "../common/cbasetypes.h"

extern ppuint32 zlib_compress_table[];
extern char*    zlib_decompress_table[];

int32   zlib_init();

int32   zlib_compress_sub(char * output,ppuint32 var1,ppuint32 cume, char * lookup1,ppuint32 var2,ppuint32 var3,ppuint32 lookup2);
int32   zlib_compress(char * input,ppuint32 var1, char * output, ppuint32 var2, ppuint32 * lookup);

ppuint32 zlib_decompress(char *in,ppuint32 inSize, char *out, ppuint32 outSize, char **table);


#endif 