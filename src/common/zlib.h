// Copyright (c) 2010-2015 Darkstar Dev Teams
#ifndef _ZLIB_H
#define _ZLIB_H

#include "../common/cbasetypes.h"

extern uint32 zlib_compress_table[];
extern uintptr zlib_decompress_table[];

int32   zlib_init();

int32   zlib_compress_sub(char * output,uint32 var1,uint32 cume, char * lookup1,uint32 var2,uint32 var3,uint32 lookup2);
int32   zlib_compress(char * input,uint32 var1, char * output, uint32 var2, uint32 * lookup);

uint32  zlib_decompress(char *in,uint32 inSize, char *out, uint32 outSize, uintptr *table);


#endif
