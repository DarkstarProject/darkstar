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

#include <string.h>

#include "event_string.h"
#include "../entities/charentity.h"


CEventStringPacket::CEventStringPacket(
	CCharEntity* PChar,
	uint16 EventID, 
    string_t string0,
    string_t string1,
    string_t string2,
    string_t string3,
	uint32 param0,
	uint32 param1,
	uint32 param2,
	uint32 param3,
	uint32 param4,
	uint32 param5,
	uint32 param6,
	uint32 param7)
{
	this->type = 0x33;
	this->size = 0x38;

	WBUFL(data,(0x04)-4) = PChar->id;
	WBUFW(data,(0x08)-4) = PChar->m_TargID;
    WBUFW(data,(0x0A)-4) = (PChar->getZone() != 0 ? PChar->getZone() : PChar->loc.prevzone);
	WBUFW(data,(0x0C)-4) = EventID;
	WBUFB(data,(0x0E)-4) = 8; // если патаметров меньше, чем 8, то после завершения события камера "прыгнет" за спину персонажу

    memcpy(data+(0x10)-4, string0.c_str(), string0.size());
    memcpy(data+(0x20)-4, string1.c_str(), string1.size());
    memcpy(data+(0x30)-4, string2.c_str(), string2.size());
    memcpy(data+(0x40)-4, string3.c_str(), string3.size());

	WBUFL(data,(0x50)-4) = param0;
	WBUFL(data,(0x54)-4) = param1;
	WBUFL(data,(0x58)-4) = param2;
	WBUFL(data,(0x5C)-4) = param3;
	WBUFL(data,(0x60)-4) = param4;
	WBUFL(data,(0x64)-4) = param5;
	WBUFL(data,(0x68)-4) = param6;
	WBUFL(data,(0x6C)-4) = param7;

	PChar->m_event.EventID = EventID;
}
