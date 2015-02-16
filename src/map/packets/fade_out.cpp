/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "fade_out.h"

#include "../entities/baseentity.h"


CFadeOutPacket::CFadeOutPacket(CBaseEntity * PEntity)
{
	this->type = 0x38;
	this->size = 0x0A;

	WBUFL(data,(0x04)-4) = PEntity->id;
	WBUFL(data,(0x08)-4) = PEntity->id;
	
	WBUFB(data,(0x0C)-4) = 0x6b;
	WBUFB(data,(0x0D)-4) = 0x65;
	WBUFB(data,(0x0E)-4) = 0x73;
	WBUFB(data,(0x0F)-4) = 0x75;

	WBUFW(data,(0x10)-4) = PEntity->targid;
	WBUFW(data,(0x12)-4) = PEntity->targid;
}