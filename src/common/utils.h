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


std::int32_t checksum(std::uint8_t* buf,std::uint32_t buflen,char checkhash[16]);
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
float rotationToRadian(std::uint8_t rotation);
std::uint8_t radianToRotation(float radian);
std::uint8_t getangle(const position_t& A, const position_t& B);						// А - основная сущность, B - цель сущности (проекция вектора на OX)
bool  isFaceing(const position_t& A, const position_t& B, std::uint8_t coneAngle);	// А - основная сущность, B - цель сущности
position_t nearPosition(const position_t& A, float offset, float radian); // Returns a position near the given position

std::int32_t hasBit(std::uint16_t value, std::uint8_t* BitArray, std::uint32_t size);		// проверяем наличие бита в массиве
std::int32_t addBit(std::uint16_t value, std::uint8_t* BitArray, std::uint32_t size);		// добавляем бит в массив
std::int32_t delBit(std::uint16_t value, std::uint8_t* BitArray, std::uint32_t size);		// удаляем бит из массива

	//(un)pack functions for Big Endian(BE) targets
std::uint32_t packBitsBE(std::uint8_t* target, std::uint64_t value, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit);
std::uint32_t packBitsBE(std::uint8_t* target, std::uint64_t value, std::int32_t bitOffset, std::uint8_t lengthInBit);
std::uint64_t unpackBitsBE(std::uint8_t* target, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit);
std::uint64_t unpackBitsBE(std::uint8_t* target, std::int32_t bitOffset, std::uint8_t lengthInBit);
	//(un)pack functions for Little Endian(LE) targets
std::uint32_t packBitsLE(std::uint8_t* target, std::uint64_t value, std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit);
std::uint32_t packBitsLE(std::uint8_t* target, std::uint64_t value, std::int32_t bitOffset, std::uint8_t lengthInBit);
std::uint64_t unpackBitsLE(std::uint8_t* target,std::int32_t bitOffset, std::uint8_t lengthInBit);
std::uint64_t unpackBitsLE(std::uint8_t* target,std::int32_t byteOffset, std::int32_t bitOffset, std::uint8_t lengthInBit);

    // Encode/Decode Strings to/from FFXI 6-bit format
void EncodeStringLinkshell(std::int8_t* signature, std::int8_t* target);
void DecodeStringLinkshell(std::int8_t* signature, std::int8_t* target);
std::int8_t* EncodeStringSignature(std::int8_t* signature, std::int8_t* target);
void DecodeStringSignature(std::int8_t* signature, std::int8_t* target);
std::string escape(std::string const &s);

#endif
