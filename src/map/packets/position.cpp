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

#include "../../common/socket.h"

#include "position.h"
#include "../entities/baseentity.h"


CPositionPacket::CPositionPacket(CBaseEntity* PEntity) 
{
	this->type = 0x5B;
	this->size = 0x0E;
	
	WBUFF(data,(0x04)) = PEntity->loc.p.x;
	WBUFF(data,(0x08)) = PEntity->loc.p.y;  
	WBUFF(data,(0x0C)) = PEntity->loc.p.z; 
	WBUFB(data,(0x17)) = PEntity->loc.p.rotation;

	WBUFL(data,(0x10)) = PEntity->id;
	WBUFW(data,(0x14)) = PEntity->targid;
}