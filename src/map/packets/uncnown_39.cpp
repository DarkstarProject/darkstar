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

#include "../../common/socket.h"

#include "../entities/baseentity.h"

#include "uncnown_39.h"


CUncnown0x39Packet::CUncnown0x39Packet(CBaseEntity* PEntity, uint8 param1, uint8 param2, uint8 param3, uint8 param4)
{
	this->type = 0x39;
	this->size = 0x0A;

	WBUFL(data,(0x04)-4) = PEntity->id;
	WBUFL(data,(0x08)-4) = PEntity->id;

    WBUFL(data,(0x0C)-4) = param1;
    WBUFL(data,(0x0D)-4) = param2;
    WBUFL(data,(0x0E)-4) = param3;
    WBUFL(data,(0x0F)-4) = param4;

    WBUFW(data,(0x10)-4) = PEntity->targid;
	WBUFW(data,(0x12)-4) = PEntity->targid;
}