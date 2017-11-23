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

#include "event.h"
#include "../entities/charentity.h"


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
	uint32 param7,
    int16 textTable)
{
	this->type = 0x32;
	this->size = 0x0A;

	WBUFL(data,(0x04)) = PChar->id;

	if(numOfParams > 0) 
	{
		this->type = 0x34;
		this->size = 0x1A;

		WBUFL(data,(0x08)) = param0;
		WBUFL(data,(0x0C)) = param1;
		WBUFL(data,(0x10)) = param2;
		WBUFL(data,(0x14)) = param3;
		WBUFL(data,(0x18)) = param4;
		WBUFL(data,(0x1C)) = param5;
		WBUFL(data,(0x20)) = param6;
		WBUFL(data,(0x24)) = param7;

		WBUFW(data,(0x28)) = PChar->m_TargID;

        WBUFW(data,(0x2A)) = PChar->getZone();
        if (textTable != -1)
        {
            WBUFW(data,(0x30)) = textTable;
        }
        else
        {
            WBUFW(data,(0x30)) = PChar->getZone();
        }

		WBUFW(data,(0x2C)) = EventID;
		WBUFB(data,(0x2E)) = 8; // если патаметров меньше, чем 8, то после завершения события камера "прыгнет" за спину персонажу
	}
    else
    {
		WBUFW(data,(0x08)) = PChar->targid;
		WBUFW(data,(0x0C)) = EventID;
		
        WBUFW(data,(0x0A)) = PChar->getZone();
		WBUFW(data,(0x10)) = PChar->getZone();
	}
	PChar->m_event.EventID = EventID;
}
