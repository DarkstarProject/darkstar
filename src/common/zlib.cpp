#include "../common/zlib.h"
#include "../common/showmsg.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

ppuint32 zlib_compress_table[512];
char*    zlib_decompress_table[2556];

int32   zlib_init()
{
	FILE * fp;
	long size, i;

	fp = fopen("compress.dat", "rb");
	if( fp == NULL )
		ShowFatalError("zlib_init: can't open file <compress.dat> \n");
	fread(zlib_compress_table, sizeof(ppuint32),512, fp);
	fclose(fp);

	fp = fopen("decompress.dat","rb");
	if( fp == NULL )
		ShowFatalError("zlib_init: can't open file <decompress.dat> \n");
	fseek(fp,0,SEEK_END);
	size = ftell(fp);
	rewind(fp);
	fread(zlib_decompress_table, sizeof(char), size, fp);
	fclose(fp);

	for(i = 0; i < size/4; i++)
		if(zlib_decompress_table[i] > (char *)255)
			zlib_decompress_table[i] = zlib_decompress_table[i] - 0x15b3aaa0 + (unsigned long)zlib_decompress_table;

	return 0;
}

int32   zlib_compress_sub(char * output,ppuint32 var1,ppuint32 cume, char * lookup1,ppuint32 var2,ppuint32 var3,ppuint32 lookup2)
{
	if((cume + lookup2 + 7)/8 > var1)
		return -1;
	var1 = lookup2+var3;
	if((var1+7)/8 > var2){
		return -1;
	} else if(var3 < var1){
		lookup2 = cume - var3;
		for(; var3 < var1; var3++)
			output[(lookup2+var3)/8] = ((~(1<<((lookup2+var3)&7)))&output[(lookup2+var3)/8])+(((lookup1[var3/8]>>(var3&7))&1)<<((lookup2+var3)&7));
	}
	return 0;
}

int32   zlib_compress(char * input,ppuint32 var1, char * output, ppuint32 var2, ppuint32 * lookup)
{
	unsigned int i, cume = 0, tmp;
	unsigned long * ptr;

	tmp = (var2-1)*8;
	for(i = 0; i < var1 && var1; i++){
		if(lookup[input[i]+384] + cume < tmp){
			ptr = lookup+input[i]+128;
			zlib_compress_sub(output+1, var2-1, cume, (char *)ptr, 4, 0, lookup[input[i]+384]);
			cume += lookup[input[i]+384];
		} else if(var1+1 >= var2){
			memset(output, 0, (var2/4)+(var2&3));
			memset(output+1, var1, var1/4);
			memset(output+1+var1/4, (var1+1)*8, var1&3);
			return var1;
		} else
			return -1;
	}
	output[0] = 1;

	return (cume+8);
};

ppuint32 zlib_decompress(char *in,ppuint32 inSize, char *out, ppuint32 outSize, char **table)
{
	unsigned int ** follow = (unsigned int **)table[0];
	unsigned long i, j=0;

	if(in[0] != 1)
		return -1;
	in++;

	for(i = 0; i < inSize ;i++){
		if((in[i/8]>>(i&7))&1)
			follow = (unsigned int **)follow[1];
		else
			follow = (unsigned int **)follow[0];
		if(follow[0] == 0){
			if(follow[1]==0){
				void* ptr = follow[3];
				out[j] = (uintptr_t)(ptr) & 255;
				if(++j >= outSize)
					return -1;
				follow = (unsigned int **)table[0];
			}
		}
	}
	return j;
};
