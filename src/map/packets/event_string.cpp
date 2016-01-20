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

	WBUFL(data,(0x04)) = PChar->id;
	WBUFW(data,(0x08)) = PChar->m_TargID;
    WBUFW(data,(0x0A)) = PChar->getZone();
	WBUFW(data,(0x0C)) = EventID;
	WBUFB(data,(0x0E)) = 8; // если патаметров меньше, чем 8, то после завершения события камера "прыгнет" за спину персонажу

    memcpy(data+(0x10), string0.c_str(), string0.size());
    memcpy(data+(0x20), string1.c_str(), string1.size());
    memcpy(data+(0x30), string2.c_str(), string2.size());
    memcpy(data+(0x40), string3.c_str(), string3.size());

	WBUFL(data,(0x50)) = param0;
	WBUFL(data,(0x54)) = param1;
	WBUFL(data,(0x58)) = param2;
	WBUFL(data,(0x5C)) = param3;
	WBUFL(data,(0x60)) = param4;
	WBUFL(data,(0x64)) = param5;
	WBUFL(data,(0x68)) = param6;
	WBUFL(data,(0x6C)) = param7;

	PChar->m_event.EventID = EventID;
}
