/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../common/cbasetypes.h"
#include "../common/mmo.h"


#define cap_value(a, min, max) ((a >= max) ? max : (a <= min) ? min : a)	// caps values to min/max

int32 checksum(uint8* buf,uint32 buflen,char checkhash[16]);

float distance(position_t A, position_t B);						// расстояние между двумя точками
int32 intpow32(int32 base, int32 exponent);						// Exponential power of integers
uint8 getangle(position_t A, position_t B);						// А - основная сущность, B - цель сущности (проекция вектора на OX)
bool  isFaceing(position_t A, position_t B, uint8 coneAngle);	// А - основная сущность, B - цель сущности

int32 hasBit(uint16 value, uint8* BitArray, uint32 size);		// проверяем наличие бита в массиве
int32 addBit(uint16 value, uint8* BitArray, uint32 size);		// добавляем бит в массив
int32 delBit(uint16 value, uint8* BitArray, uint32 size);		// удаляем бит из массива

	//(un)pack functions for Big Endian(BE) targets
uint32 packBitsBE(uint8* target, uint64 value, int32 byteOffset, int32 bitOffset, uint8 lengthInBit);
uint32 packBitsBE(uint8* target, uint64 value, int32 bitOffset, uint8 lengthInBit);
uint64 unpackBitsBE(uint8* target, int32 byteOffset, int32 bitOffset, uint8 lengthInBit);
uint64 unpackBitsBE(uint8* target, int32 bitOffset, uint8 lengthInBit);
	//(un)pack functions for Little Endian(LE) targets
uint32 packBitsLE(uint8* target, uint64 value, int32 byteOffset, int32 bitOffset, uint8 lengthInBit);
uint32 packBitsLE(uint8* target, uint64 value, int32 bitOffset, uint8 lengthInBit);
uint64 unpackBitsLE(uint8* target,int32 bitOffset, uint8 lengthInBit);
uint64 unpackBitsLE(uint8* target,int32 byteOffset, int32 bitOffset, uint8 lengthInBit);


#endif
