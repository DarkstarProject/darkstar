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

#ifndef _BLOWFISH_H
#define _BLOWFISH_H

#include "../common/cbasetypes.h"

enum BLOWFISH
{
    BLOWFISH_WAITING,
    BLOWFISH_SENT,
    BLOWFISH_ACCEPTED,
};

struct blowfish_t 
{
	std::uint32_t key[5];
	uint8  hash[16];
	std::uint32_t P[18], S[4][256];
    BLOWFISH status;
};

void blowfish_decipher(std::uint32_t* xl, std::uint32_t* xr, std::uint32_t* P, std::uint32_t* S);
void blowfish_encipher(std::uint32_t* xl, std::uint32_t* xr, std::uint32_t* P, std::uint32_t* S);

std::uint32_t* blowfish_init(int8 key[], std::int16_t keybytes, std::uint32_t* P, std::uint32_t* S);

#endif