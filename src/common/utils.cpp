/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../common/utils.h"
#include "../common/md52.h"
#include "../common/showmsg.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef _MSC_VER
#	include <intrin.h>
#endif

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/


//--------------------------------------------------
// Return numerical value of a switch configuration
// on/off, english, fran<E7>ais, deutsch, espa<F1>ol
//--------------------------------------------------
int config_switch(const char* str)
{
    if(strcmpi(str, "true") == 0 || strcmpi(str, "on") == 0 || strcmpi(str, "yes") == 0 || strcmpi(str, "oui") == 0 || strcmpi(str, "ja") == 0 || strcmpi(str, "si") == 0)
        return 1;
    if(strcmpi(str, "false") == 0 || strcmpi(str, "off") == 0 || strcmpi(str, "no") == 0 || strcmpi(str, "non") == 0 || strcmpi(str, "nein") == 0)
        return 0;

    return (int)strtol(str, NULL, 0);
}

std::int32_t checksum(unsigned char *buf, std::uint32_t buflen, char checkhash[16])
{
    unsigned char hash[16];

    md5((unsigned char *)buf, hash, buflen);

    if(memcmp(hash, checkhash, 16) == 0)
    {
        return 0;
    }
    return -1;
}


/// Produces the hexadecimal representation of the given input.
/// The output buffer must be at least count*2+1 in size.
/// Returns true on success, false on failure.
///
/// @param output Output string
/// @param input Binary input buffer
/// @param count Number of bytes to convert
bool bin2hex(char* output, unsigned char* input, size_t count)
{
    char toHex[] = "0123456789abcdef";
    size_t i;

    for(i = 0; i < count; ++i)
    {
        *output++ = toHex[(*input & 0xF0) >> 4];
        *output++ = toHex[(*input & 0x0F) >> 0];
        ++input;
    }
    *output = '\0';
    return true;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float distance(const position_t& A, const position_t& B)
{
    return sqrt(distanceSquared(A, B));
}


float distanceSquared(const position_t& A, const position_t& B)
{
    float diff_x = A.x - B.x;
    float diff_y = A.y - B.y;
    float diff_z = A.z - B.z;
    return diff_x * diff_x + diff_y * diff_y + diff_z * diff_z;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

std::int32_t intpow32(std::int32_t base, std::int32_t exponent)
{
    std::int32_t power = 1;
    while(exponent)
    {
        if(exponent & 1)
            power *= base;
        exponent >>= 1;
        base *= base;
    }
    return power;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void getMSB(std::uint32_t* result, std::uint32_t value)
{
    *result = 0;
    if(value == 0)
        return;
#ifdef __GNUC__
    *result = 31 - (unsigned)__builtin_clz(value);
#elif defined _MSC_VER
    _BitScanReverse((unsigned long*)result, value);
#else
    while(value >>= 1)
        (*result)++;
#endif

}

/*
Rotations of entities are saved in uint8s, which can only hold up to a value of 255. In order to properly calculate rotations you'll need these methods to convert back and forth.
*/
float rotationToRadian(std::uint8_t rotation)
{
    return (float)((rotation / 256.0f) * 2 * M_PI);
}

std::uint8_t radianToRotation(float radian)
{
    return (std::uint8_t)((radian / (2 * M_PI)) * 256);
}


/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

std::uint8_t getangle(const position_t& A, const position_t& B)
{
    std::uint8_t angle = (std::uint8_t)(atanf((B.z - A.z) / (B.x - A.x)) * -(128.0f / M_PI));

    return (A.x > B.x ? angle + 128 : angle);
}

/************************************************************************
*																		*
*  Проверяем, находится ли цель в поле зрения (coneAngle)				*
*																		*
************************************************************************/

bool isFaceing(const position_t& A, const position_t& B, std::uint8_t coneAngle)
{
    std::int32_t angle = getangle(A, B);
    return abs(std::int8_t(angle - A.rotation)) < (coneAngle >> 1);
}

/**
Returns a position near the given position.

offset - distance to be placed away from given Position.
radian - angle relative to given position to be placed at. Zero will be a position infront of the given position.
Pi will make the position behind the target (180 degrees).
*/
position_t nearPosition(const position_t& A, float offset, float radian)
{
    // PI * 0.75 offsets the rotation to the proper place
    float totalRadians = rotationToRadian(A.rotation) + radian;
    position_t B;

    B.x = A.x + cosf((float)(2 * M_PI - totalRadians)) * offset;
    B.y = A.y;
    B.z = A.z + sinf((float)(2 * M_PI - totalRadians)) * offset;

    B.rotation = A.rotation;
    B.moving = A.moving;

    return B;
}

/************************************************************************
*																		*
*  Методы для работы с битовыми массивами								*
*																		*
************************************************************************/

std::int32_t hasBit(std::uint16_t value, std::uint8_t* BitArray, std::uint32_t size)
{
    if(value >= size * 8)
    {
        ShowError(CL_RED"hasBit: value (%u) is out of range\n" CL_RESET, value);
        return 0;
    }
    return (std::int32_t)(BitArray[value >> 3] & (1 << (value % 8)));
}

std::int32_t addBit(std::uint16_t value, std::uint8_t* BitArray, std::uint32_t size)
{
    if(!hasBit(value, BitArray, size) && (value < size * 8))
    {
        BitArray[value >> 3] |= (1 << (value % 8));
        return 1;
    }
    return 0;
}

std::int32_t delBit(std::uint16_t value, std::uint8_t* BitArray, std::uint32_t size)
{
    if(hasBit(value, BitArray, size))
    {
        BitArray[value >> 3] &= ~(1 << (value % 8));
        return 1;
    }
    return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

std::uint32_t packBitsBE(std::uint8_t* target, std::uint64_t value, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    return packBitsBE(target, value, 0, bitOffset, lengthInBit);
}

std::uint32_t packBitsBE(std::uint8_t* target, std::uint64_t value, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    byteOffset += (bitOffset >> 3);										//correct bitOffsets>=8
    bitOffset %= 8;

    std::uint64_t bitmask = 0xFFFFFFFFFFFFFFFFLL;								//Generate bitmask

    bitmask >>= (64 - lengthInBit);
    bitmask <<= bitOffset;

    value <<= bitOffset;												//shift value
    value &= bitmask;

    bitmask ^= 0xFFFFFFFFFFFFFFFFLL;									//invert bitmask

    if((lengthInBit + bitOffset) <= 8)									//write shifted value to target
    {
        std::uint8_t* dataPointer = (std::uint8_t*)&target[byteOffset];

        std::uint8_t bitmaskUC = (std::uint8_t)bitmask;
        std::uint8_t valueUC = (std::uint8_t)value;

        *dataPointer &= bitmaskUC;
        *dataPointer |= valueUC;
    }
    else if((lengthInBit + bitOffset) <= 16)
    {
        std::uint16_t* dataPointer = (std::uint16_t*)&target[byteOffset];

        std::uint16_t bitmaskUC = (std::uint16_t)bitmask;
        std::uint16_t valueUC = (std::uint16_t)value;

        *dataPointer &= bitmaskUC;
        *dataPointer |= valueUC;
    }
    else if((lengthInBit + bitOffset) <= 32)
    {
        std::uint32_t* dataPointer = (std::uint32_t*)&target[byteOffset];

        std::uint32_t bitmaskUC = (std::uint32_t)bitmask;
        std::uint32_t valueUC = (std::uint32_t)value;

        *dataPointer &= bitmaskUC;
        *dataPointer |= valueUC;
    }
    else if((lengthInBit + bitOffset) <= 64)
    {
        std::uint64_t* dataPointer = (std::uint64_t*)&target[byteOffset];

        *dataPointer &= bitmask;
        *dataPointer |= value;
    }
    else
    {
        ShowError("Pack Bits Error: packBitsBE(...) not implemented for targetsizes above 64 bits.\n Targetsize: %d\n", (lengthInBit + bitOffset));
    }
    return ((byteOffset << 3) + bitOffset + lengthInBit);
}


std::uint64_t unpackBitsBE(std::uint8_t* target, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    return unpackBitsBE(target, 0, bitOffset, lengthInBit);
}

std::uint64_t unpackBitsBE(std::uint8_t* target, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    byteOffset += (bitOffset >> 3);
    bitOffset %= 8;

    std::uint64_t bitmask = 0xFFFFFFFFFFFFFFFFLL;

    bitmask >>= (64 - lengthInBit);
    bitmask <<= bitOffset;

    std::uint64_t retVal;

    if((lengthInBit + bitOffset) <= 8)
    {
        std::uint8_t* dataPointer = (std::uint8_t*)&target[byteOffset];

        retVal = ((*dataPointer)&(std::uint8_t)bitmask) >> bitOffset;
    }
    else if((lengthInBit + bitOffset) <= 16)
    {
        std::uint16_t* dataPointer = (std::uint16_t*)&target[byteOffset];

        retVal = ((*dataPointer)&(std::uint16_t)bitmask) >> bitOffset;
    }
    else if((lengthInBit + bitOffset) <= 32)
    {
        std::uint32_t* dataPointer = (std::uint32_t*)&target[byteOffset];

        retVal = ((*dataPointer)&(std::uint32_t)bitmask) >> bitOffset;
    }
    else if((lengthInBit + bitOffset) <= 64)
    {
        std::uint64_t* dataPointer = (std::uint64_t*)&target[byteOffset];

        retVal = ((*dataPointer)&(std::uint64_t)bitmask) >> bitOffset;
    }
    else
    {
        ShowError("Unpack Bits Error: unpackBits(...) not implemented for targetsizes above 64 bits.\n Targetsize: %d\n", (lengthInBit + bitOffset));
        return 0;
    }
    return retVal;
}

std::uint32_t packBitsLE(std::uint8_t* target, std::uint64_t value, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    return packBitsLE(target, value, 0, bitOffset, lengthInBit);
}

std::uint32_t packBitsLE(std::uint8_t* target, std::uint64_t value, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    byteOffset += (bitOffset >> 3);													//correct bitOffsets >= 8
    bitOffset %= 8;

    std::uint8_t bytesNeeded;																//calculate how many bytes are needed
    if((bitOffset + lengthInBit) <= 8)
        bytesNeeded = 1;
    else if((bitOffset + lengthInBit) <= 16)
        bytesNeeded = 2;
    else if((bitOffset + lengthInBit) <= 32)
        bytesNeeded = 4;
    else if((bitOffset + lengthInBit) <= 64)
        bytesNeeded = 8;
    else
    {
        ShowError("Pack Bits Error: packBitsLE(...) not implemented for targetsizes above 64 bits.\n Targetsize: %d\n", (lengthInBit + bitOffset));
        return 0;
    }

    std::uint8_t* modifiedTarget = new std::uint8_t[bytesNeeded];									//convert byteOrder to Big Endian

    for(std::uint8_t curByte = 0; curByte < bytesNeeded; ++curByte)
    {
        modifiedTarget[curByte] = target[byteOffset + (bytesNeeded - 1) - curByte];
    }

    std::int32_t newBitOffset = (bytesNeeded << 3) - (bitOffset + lengthInBit); 			//calculate new bitOffset

    packBitsBE(&modifiedTarget[0], value, 0, newBitOffset, lengthInBit);			//write data to modified array

    for(std::uint8_t curByte = 0; curByte < bytesNeeded; ++curByte)						//copy back to target
    {
        target[byteOffset + (bytesNeeded - 1) - curByte] = modifiedTarget[curByte];
    }

    if(modifiedTarget) delete[] modifiedTarget;
    return ((byteOffset << 3) + bitOffset + lengthInBit);
}

std::uint64_t unpackBitsLE(std::uint8_t* target, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    return unpackBitsLE(target, 0, bitOffset, lengthInBit);
}

std::uint64_t unpackBitsLE(std::uint8_t* target, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit)
{
    byteOffset += (bitOffset >> 3);
    bitOffset %= 8;

    std::uint8_t bytesNeeded;
    if((bitOffset + lengthInBit) <= 8)
        bytesNeeded = 1;
    else if((bitOffset + lengthInBit) <= 16)
        bytesNeeded = 2;
    else if((bitOffset + lengthInBit) <= 32)
        bytesNeeded = 4;
    else if((bitOffset + lengthInBit) <= 64)
        bytesNeeded = 8;
    else
    {
        ShowError("Unpack Bits Error: packBitsLE(...) not implemented for targetsizes above 64 bits.\n Targetsize: %d\n", (lengthInBit + bitOffset));
        return 0;
    }

    std::uint64_t retVal;

    std::uint8_t* modifiedTarget = new std::uint8_t[bytesNeeded];

    for(std::uint8_t curByte = 0; curByte < bytesNeeded; ++curByte)
    {
        modifiedTarget[curByte] = target[byteOffset + (bytesNeeded - 1) - curByte];
    }
    if(bytesNeeded == 1)
    {
        std::uint8_t bitmask = 0xFF >> bitOffset;
        retVal = (modifiedTarget[0] & bitmask) >> (8 - (lengthInBit + bitOffset));
    }
    else
    {
        std::int32_t newBitOffset = (bytesNeeded * 8) - (bitOffset + lengthInBit);
        retVal = unpackBitsBE(&modifiedTarget[0], 0, newBitOffset, lengthInBit);
    }

    if(modifiedTarget) delete[]modifiedTarget;
    return retVal;
}

void EncodeStringLinkshell(std::int8_t* signature, std::int8_t* target)
{
    std::uint8_t encodedSignature[16];
    memset(encodedSignature, 0, sizeof encodedSignature);
    std::uint8_t chars = 0;
    std::uint8_t leftover = 0;
    for(std::uint8_t currChar = 0; currChar < std::min<size_t>(20, strlen((const char*)signature)); ++currChar)
    {
        std::uint8_t tempChar = 0;
        if((signature[currChar] >= '0') && (signature[currChar] <= '9'))
            tempChar = signature[currChar] - '0' + 53;
        else if((signature[currChar] >= 'A') && (signature[currChar] <= 'Z'))
            tempChar = signature[currChar] - 'A' + 27;
        else if((signature[currChar] >= 'a') && (signature[currChar] <= 'z'))
            tempChar = signature[currChar] - 'a' + 1;
        packBitsLE(encodedSignature, tempChar, 6 * currChar, 6);
        chars++;
    }
    leftover = (chars * 6) % 8;
    leftover = 8 - leftover;
    leftover = (leftover == 8 || leftover == 2 ? 6 : leftover);
    packBitsLE(encodedSignature, 0xFF, 6 * chars, leftover);

    strncpy((char*)target, (const char*)encodedSignature, sizeof encodedSignature);
}

void DecodeStringLinkshell(std::int8_t* signature, std::int8_t* target)
{
    std::uint8_t decodedSignature[21];
    memset(decodedSignature, 0, sizeof decodedSignature);

    for(std::uint8_t currChar = 0; currChar < std::min<size_t>(20, (strlen((const char*)signature) * 8) / 6); ++currChar)
    {
        std::uint8_t tempChar = '\0';
        tempChar = (std::uint8_t)unpackBitsLE((std::uint8_t*)signature, currChar * 6, 6);
        if(tempChar >= 1 && tempChar <= 26)
            tempChar = 'a' - 1 + tempChar;
        else if(tempChar >= 27 && tempChar <= 52)
            tempChar = 'A' - 27 + tempChar;
        else if(tempChar >= 53 && tempChar <= 62)
            tempChar = '0' - 53 + tempChar;

        if(tempChar == '\0')
        {
            decodedSignature[currChar == 0 ? currChar : currChar - 1] = '\0';
            break;
        }
        else if(tempChar == 63)
        {
            decodedSignature[currChar] = '\0';
            break;
        }
        else
            decodedSignature[currChar] = tempChar;
    }
    strncpy((char*)target, (const char*)decodedSignature, sizeof decodedSignature);
}

std::int8_t* EncodeStringSignature(std::int8_t* signature, std::int8_t* target)
{
    std::uint8_t encodedSignature[12];
    memset(encodedSignature, 0, sizeof encodedSignature);
    std::uint8_t chars = 0;
    // std::uint8_t leftover = 0;
    for(std::uint8_t currChar = 0; currChar < std::min<size_t>(15, strlen((const char*)signature)); ++currChar)
    {
        std::uint8_t tempChar = 0;
        if((signature[currChar] >= '0') && (signature[currChar] <= '9'))
            tempChar = signature[currChar] - '0' + 1;
        else if((signature[currChar] >= 'A') && (signature[currChar] <= 'Z'))
            tempChar = signature[currChar] - 'A' + 11;
        else if((signature[currChar] >= 'a') && (signature[currChar] <= 'z'))
            tempChar = signature[currChar] - 'a' + 37;
        packBitsLE(encodedSignature, tempChar, 6 * currChar, 6);
        chars++;
    }
    //leftover = (chars * 6) % 8;
    //leftover = 8 - leftover;
    //leftover = (leftover == 8 ? 6 : leftover);
    //packBitsLE(encodedSignature,0xFF,6*chars, leftover);

    return (std::int8_t*)strncpy((char*)target, (const char*)encodedSignature, sizeof encodedSignature);
}

void DecodeStringSignature(std::int8_t* signature, std::int8_t* target)
{
    std::uint8_t decodedSignature[16];
    memset(decodedSignature, 0, sizeof decodedSignature);

    for(std::uint8_t currChar = 0; currChar < std::min<size_t>(15, (strlen((const char*)signature) * 8) / 6); ++currChar)
    {
        std::uint8_t tempChar = '\0';
        tempChar = (std::uint8_t)unpackBitsLE((std::uint8_t*)signature, currChar * 6, 6);
        if(tempChar >= 1 && tempChar <= 10)
            tempChar = '0' - 1 + tempChar;
        else if(tempChar >= 11 && tempChar <= 36)
            tempChar = 'A' - 11 + tempChar;
        else if(tempChar >= 37 && tempChar <= 62)
            tempChar = 'a' - 37 + tempChar;

        decodedSignature[currChar] = tempChar;
    }
    strncpy((char*)target, (const char*)decodedSignature, sizeof decodedSignature);
}

std::string escape(std::string const &s)
{
    std::size_t n = s.length();
    std::string escaped;
    escaped.reserve(n * 2);
    for(std::size_t i = 0; i < n; ++i){
        if(s[i] == '\\' || s[i] == '\'')
            escaped += '\\';
        escaped += s[i];
    }
    return escaped;
}