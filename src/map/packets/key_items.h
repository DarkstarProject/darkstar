﻿/*
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

#ifndef _CKEYITEMSPACKET_H
#define _CKEYITEMSPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

// нет какой-либо зависимости между номерами таблиц и типами ключевых предметов 

enum KEYS_TABLE 
{
	KEYS_TABLE_0,
	KEYS_TABLE_1,
	KEYS_TABLE_2,
	KEYS_TABLE_3,
    KEYS_TABLE_4
};

#define MAX_KEYS_TABLE 5

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CKeyItemsPacket : public CBasicPacket
{
public:

	CKeyItemsPacket(CCharEntity* PChar, KEYS_TABLE KeyTable);
};

#endif