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

#include "../../common/socket.h"

#include "entity_animation.h"

#include "../entities/baseentity.h"

const char* CEntityAnimationPacket::Fade_Out = "kesu";

CEntityAnimationPacket::CEntityAnimationPacket(CBaseEntity * PEntity, const char type[4])
{
	this->type = 0x38;
	this->size = 0x0A;

	WBUFL(data,(0x04)) = PEntity->id;
	WBUFL(data,(0x08)) = PEntity->id;
	
	memcpy(data + ((0x0C)), type, 4);

	WBUFW(data,(0x10)) = PEntity->targid;
	WBUFW(data,(0x12)) = PEntity->targid;
}