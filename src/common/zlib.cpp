#include "../common/zlib.h"
#include "../common/showmsg.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

uint32 zlib_compress_table[512];
uintptr zlib_decompress_table[2556];

int32 zlib_init()
{
    memset(zlib_compress_table, 0, sizeof(zlib_compress_table));
    memset(zlib_decompress_table, 0, sizeof(zlib_decompress_table));

    auto fp = fopen("compress.dat", "rb");
    if (fp == NULL)
        ShowFatalError("zlib_init: can't open file <compress.dat> \n");
    fread(zlib_compress_table, sizeof(uint32), 512, fp);
    fclose(fp);

    uint32 temp_decompress_table[2556];
    fp = fopen("decompress.dat", "rb");
    if (fp == NULL)
        ShowFatalError("zlib_init: can't open file <decompress.dat> \n");
    fseek(fp, 0, SEEK_END);
    auto size = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    fread(temp_decompress_table, sizeof(char), size, fp);
    fclose(fp);

    // Align the jump table with our internal table..
    for (auto x = 0; x < size / 4; x++)
    {
        if (temp_decompress_table[x] > 0xff)
            zlib_decompress_table[x] = (uintptr)((uintptr*)zlib_decompress_table + ((temp_decompress_table[x] - 0x15b3aaa0) / 4));
        else
            zlib_decompress_table[x] = temp_decompress_table[x];
    }

    return 0;
}

int32 zlib_compress_sub(char * output, uint32 var1, uint32 cume, char * lookup1, uint32 var2, uint32 var3, uint32 lookup2)
{
    if ((cume + lookup2 + 7) / 8 > var1)
        return -1;
    var1 = lookup2 + var3;
    if ((var1 + 7) / 8 > var2)
    {
        return -1;
    }
    else if (var3 < var1)
    {
        lookup2 = cume - var3;
        for (; var3 < var1; var3++)
            output[(lookup2 + var3) / 8] = ((~(1 << ((lookup2 + var3) & 7)))&output[(lookup2 + var3) / 8]) + (((lookup1[var3 / 8] >> (var3 & 7)) & 1) << ((lookup2 + var3) & 7));
    }
    return 0;
}

int32 zlib_compress(char * input, uint32 var1, char * output, uint32 var2, uint32 * lookup)
{
    uint32 i, cume = 0, tmp;
    uint32 * ptr;

    tmp = (var2 - 1) * 8;
    for (i = 0; i < var1 && var1; i++)
    {
        if (lookup[input[i] + 384] + cume < tmp)
        {
            ptr = lookup + input[i] + 128;
            zlib_compress_sub(output + 1, var2 - 1, cume, (char *)ptr, 4, 0, lookup[input[i] + 384]);
            cume += lookup[input[i] + 384];
        }
        else if (var1 + 1 >= var2)
        {
            memset(output, 0, (var2 / 4) + (var2 & 3));
            memset(output + 1, var1, var1 / 4);
            memset(output + 1 + var1 / 4, (var1 + 1) * 8, var1 & 3);
            return var1;
        }
        else
            return -1;
    }
    output[0] = 1;

    return (cume + 8);
}

uint32 zlib_decompress(char *in, uint32 inSize, char *out, uint32 outSize, uintptr *table)
{
    uintptr* follow = (uintptr*)table[0];
    uint32 i, j = 0;

    if (in[0] != 1)
        return -1;
    in++;

    for (i = 0; i < inSize; i++)
    {
        if ((in[i / 8] >> (i & 7)) & 1)
            follow = (uintptr*)follow[1];
        else
            follow = (uintptr*)follow[0];
        if (follow[0] == 0)
        {
            if (follow[1] == 0)
            {
                void *ptr = (void*)follow[3];
                out[j] = (uintptr)(ptr)& 255;
                if (++j >= outSize)
                    return -1;
                follow = (uintptr*)table[0];
            }
        }
    }
    return j;
}
