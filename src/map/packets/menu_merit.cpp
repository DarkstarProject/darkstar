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

#include "menu_merit.h"

#include "../charentity.h"
#include "../charutils.h"


CMenuMeritPacket::CMenuMeritPacket(CCharEntity* PChar) 
{
	this->type = 0x63;
	this->size = 0x06;
	
	WBUFB(data,(0x04)-4) = 0x02;
	WBUFB(data,(0x06)-4) = 0x08;

    WBUFW(data,(0x08)-4) = PChar->PMeritPoints->GetLimitPoints();
    WBUFB(data,(0x0A)-4) = PChar->PMeritPoints->GetMeritPoints();

	if (PChar->jobs.job[PChar->GetMJob()] >= 75 && charutils::hasKeyItem(PChar, 606))			// keyitem Limit Breaker
	{
        WBUFB(data,(0x0B)-4) = PChar->MeritMode ? 0xE0 : 0x20; 					// режим (0xE0 limit pints, 0x20 exp points)
	}

    PChar->pushPacket(new CBasicPacket(*this));

    // ver 30121205_4 second packet

    this->size = 0x6E;

	memset(data, 0, sizeof(data));

    uint8 packet[] = 
    {
		0x03, 0x00, 0xD8
    };

	memcpy(data+(0x04)-4, &packet, sizeof(packet));
	PChar->pushPacket(new CBasicPacket(*this));

	// ver 30130319_5 third packet

	this->size = 0x44;

	memset(data, 0, sizeof(data));

	uint8 packet2[] = 
	{
		0x04, 0x00, 0x84
	};
	memcpy(data+(0x04)-4, &packet2, sizeof(packet2));
}




//0x63, 0x06, 0x88, 0x41, 0x02, 0x00, 0x08, 0x00, 0xD3, 0x03, 0x03, 0x60