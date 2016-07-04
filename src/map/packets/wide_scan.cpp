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

#include <string.h>

#include "wide_scan.h"
#include "../entities/charentity.h"


CWideScanPacket::CWideScanPacket(WIDESCAN_STATUS status) 
{
	this->type = 0xF6;
	this->size = 0x04;

	WBUFB(data,(0x04)) = status;
}

CWideScanPacket::CWideScanPacket(CCharEntity * PChar, CBaseEntity * PEntity) 
{
	this->type = 0xF4;
	this->size = 0x0E;

	WBUFW(data,(0x04)) = PEntity->targid;
  //WBUFB(data,(0x06)) = PEntity->GetMLevel();

	// 0 - черная точка (? Char ?) 
	// 1 - зеленая точка (NPC)
	// 2 - красная точка (Mob)
	WBUFB(data,(0x07)) = PEntity->objtype/2; 

	WBUFW(data,(0x08)) = (int16)(PEntity->loc.p.x - PChar->loc.p.x); // x - разница координат персонажа и объекта
	WBUFW(data,(0x0A)) = (int16)(PEntity->loc.p.z - PChar->loc.p.z); // z - разница координат персонажа и объекта

  //memcpy(data+(0x0C), PEntity->GetName(), (PEntity->name.size() > 14 ? 14 : PEntity->name.size()));  
}