/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "event.h"
#include "../charentity.h"


CEventPacket::CEventPacket(
	CCharEntity* PChar,
	uint16 EventID, 
	uint8  numOfParams, 
	uint32 param0,
	uint32 param1,
	uint32 param2,
	uint32 param3,
	uint32 param4,
	uint32 param5,
	uint32 param6,
	uint32 param7)
{
	this->type = 0x32;
	this->size = 0x0A;

	WBUFL(data,(0x04)-4) = PChar->id;

	if(numOfParams > 0) 
	{
		this->type = 0x34;
		this->size = 0x1A;

		WBUFL(data,(0x08)-4) = param0;
		WBUFL(data,(0x0C)-4) = param1;
		WBUFL(data,(0x10)-4) = param2;
		WBUFL(data,(0x14)-4) = param3;
		WBUFL(data,(0x18)-4) = param4;
		WBUFL(data,(0x1C)-4) = param5;
		WBUFL(data,(0x20)-4) = param6;
		WBUFL(data,(0x24)-4) = param7;

		WBUFW(data,(0x28)-4) = PChar->m_TargID;

		WBUFB(data,(0x2A)-4) = (PChar->getZone() != 0 ? PChar->loc.zone : PChar->loc.prevzone);
		WBUFB(data,(0x30)-4) = (PChar->getZone() != 0 ? PChar->loc.zone : PChar->loc.prevzone);

		WBUFW(data,(0x2C)-4) = EventID;
		WBUFB(data,(0x2E)-4) = 8; // если патаметров меньше, чем 8, то после завершения события камера "прыгнет" за спину персонажу
	}
    else
    {
		WBUFW(data,(0x08)-4) = PChar->targid;
		WBUFW(data,(0x0C)-4) = EventID;
		
		WBUFB(data,(0x0A)-4) = (PChar->getZone() != 0 ? PChar->loc.zone : PChar->loc.prevzone);
		WBUFB(data,(0x10)-4) = (PChar->getZone() != 0 ? PChar->loc.zone : PChar->loc.prevzone);
	}
	PChar->m_event.EventID = EventID;
}
