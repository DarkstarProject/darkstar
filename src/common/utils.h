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

#ifndef _UTILS_H_
#define _UTILS_H_
#define _USE_MATH_DEFINES

#include <math.h>
#include "../common/cbasetypes.h"
#include "../common/mmo.h"


std::int32_t checksum(uint8* buf,std::uint32_t buflen,char checkhash[16]);
int config_switch(const char* str);
bool bin2hex(char* output, unsigned char* input, size_t count);

float distance(const position_t& A, const position_t& B);		// distance between positions
float distanceSquared(const position_t& A, const position_t& B);// squared distance between positions (use squared unless otherwise needed)
constexpr float square(float distance)                          // constexpr square (used with distanceSquared)
{
    return distance * distance;
}

std::int32_t intpow32(std::int32_t base, std::int32_t exponent);						// Exponential power of integers
void getMSB(std::uint32_t* result,std::uint32_t value);						// fast Most Significant Byte search under GCC or MSVC. Fallback included.
float rotationToRadian(uint8 rotation);
uint8 radianToRotation(float radian);
uint8 getangle(const position_t& A, const position_t& B);						// А - основная сущность, B - цель сущности (проекция вектора на OX)
bool  isFaceing(const position_t& A, const position_t& B, uint8 coneAngle);	// А - основная сущность, B - цель сущности
position_t nearPosition(const position_t& A, float offset, float radian); // Returns a position near the given position

std::int32_t hasBit(std::uint16_t value, uint8* BitArray, std::uint32_t size);		// проверяем наличие бита в массиве
std::int32_t addBit(std::uint16_t value, uint8* BitArray, std::uint32_t size);		// добавляем бит в массив
std::int32_t delBit(std::uint16_t value, uint8* BitArray, std::uint32_t size);		// удаляем бит из массива

	//(un)pack functions for Big Endian(BE) targets
std::uint32_t packBitsBE(uint8* target, std::uint64_t value, std::int32_t byteOffset, std::int32_t bitOffset, uint8 lengthInBit);
std::uint32_t packBitsBE(uint8* target, std::uint64_t value, std::int32_t bitOffset, uint8 lengthInBit);
std::uint64_t unpackBitsBE(uint8* target, std::int32_t byteOffset, std::int32_t bitOffset, uint8 lengthInBit);
std::uint64_t unpackBitsBE(uint8* target, std::int32_t bitOffset, uint8 lengthInBit);
	//(un)pack functions for Little Endian(LE) targets
std::uint32_t packBitsLE(uint8* target, std::uint64_t value, std::int32_t byteOffset, std::int32_t bitOffset, uint8 lengthInBit);
std::uint32_t packBitsLE(uint8* target, std::uint64_t value, std::int32_t bitOffset, uint8 lengthInBit);
std::uint64_t unpackBitsLE(uint8* target,std::int32_t bitOffset, uint8 lengthInBit);
std::uint64_t unpackBitsLE(uint8* target,std::int32_t byteOffset, std::int32_t bitOffset, uint8 lengthInBit);

    // Encode/Decode Strings to/from FFXI 6-bit format
int8* EncodeStringLinkshell(int8* signature, int8* target);
int8* DecodeStringLinkshell(int8* signature, int8* target);
int8* EncodeStringSignature(int8* signature, int8* target);
int8* DecodeStringSignature(int8* signature, int8* target);
std::string escape(std::string const &s);

#endif
