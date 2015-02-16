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

#include "char_health.h"

#include "../entities/charentity.h"


CCharHealthPacket::CCharHealthPacket(CCharEntity* PChar)
{
	this->type = 0xDF;
	this->size = 0x12;

	WBUFL(data,(0x04)-4) = PChar->id;

	WBUFL(data,(0x08)-4) = PChar->health.hp;
	WBUFL(data,(0x0C)-4) = PChar->health.mp;
	WBUFL(data,(0x10)-4) = PChar->health.tp;

	WBUFW(data,(0x14)-4) = PChar->targid;

	WBUFB(data,(0x16)-4) = PChar->GetHPP();
	WBUFB(data,(0x17)-4) = PChar->GetMPP();

    if (!(PChar->nameflags.flags & FLAG_ANON))
    {
        WBUFB(data, (0x20) - 4) = PChar->GetMJob();
        WBUFB(data, (0x21) - 4) = PChar->GetMLevel();
        WBUFB(data, (0x22) - 4) = PChar->GetSJob();
        WBUFB(data, (0x23) - 4) = PChar->GetSLevel();
    }
}