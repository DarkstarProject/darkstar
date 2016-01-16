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

#include "cs_position.h"

#include "../entities/charentity.h"


CCSPositionPacket::CCSPositionPacket(CCharEntity* PChar) 
{
	this->type = 0x65;
	this->size = 0x10;
	
	WBUFF(data,(0x04)) = PChar->loc.p.x;
	WBUFF(data,(0x08)) = PChar->loc.p.y;  
	WBUFF(data,(0x0C)) = PChar->loc.p.z; 
	WBUFB(data,(0x17)) = PChar->loc.p.rotation;

	WBUFL(data,(0x10)) = PChar->id;
	WBUFW(data,(0x14)) = PChar->targid;

    if (PChar->status == STATUS_DISAPPEAR)
    {
        WBUFB(data,(0x16)) = 0x05;
        WBUFB(data,(0x1C)) = 0x01;
    } else {
        WBUFB(data,(0x16)) = 0x01;
        WBUFB(data,(0x18)) = 0x01;
    }
}