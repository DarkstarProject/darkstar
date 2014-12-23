/*
===========================================================================

Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "caught_monster.h"

#include "../entities/charentity.h"


CCaughtMonsterPacket::CCaughtMonsterPacket(CCharEntity * PChar,  uint16 messageID)
{
	this->type = 0x43;
	this->size = 0x20;

	//DSP_DEBUG_BREAK_IF(PChar->name.size() > 15);

	WBUFL(data, (0x04) - 4) = PChar->id;
	WBUFL(data, (0x08) - 4) = PChar->targid;

	WBUFW(data, (0x0A) - 4) = messageID + 0x8000;

	//WBUFL(data, (0x14) - 4) = 0x01;
	//WBUFL(data, (0x1C) - 4) = 0xF0;

	memcpy(data + (0x10) - 4, PChar->GetName(), PChar->name.size());
}