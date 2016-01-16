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

#include "caught_fish.h"

#include "../entities/charentity.h"


CCaughtFishPacket::CCaughtFishPacket(CCharEntity * PChar, uint16 param0, uint16 messageID) 
{
	this->type = 0x27;
	this->size = 0x38;

	//DSP_DEBUG_BREAK_IF(PChar->name.size() > 15);

	WBUFL(data,(0x04)) = PChar->id;
	WBUFL(data,(0x08)) = PChar->targid;

	WBUFW(data,(0x0A)) = messageID + 0x8000;
	WBUFW(data,(0x10)) = param0;

	WBUFL(data,(0x14)) = 0x01;
	WBUFL(data,(0x1C)) = 0xF0;

	memcpy(data+(0x20), PChar->GetName(), PChar->name.size());
}