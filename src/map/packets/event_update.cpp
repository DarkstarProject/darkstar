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

#include "event_update.h"
#include "../entities/charentity.h"


CEventUpdatePacket::CEventUpdatePacket(
	uint32 param0,
	uint32 param1,
	uint32 param2,
	uint32 param3,
	uint32 param4,
	uint32 param5,
	uint32 param6,
	uint32 param7)
{
	this->type = 0x5C;
	this->size = 0x12;

	WBUFL(data,(0x04)) = param0;
	WBUFL(data,(0x08)) = param1;
	WBUFL(data,(0x0C)) = param2;
	WBUFL(data,(0x10)) = param3;
	WBUFL(data,(0x14)) = param4;
	WBUFL(data,(0x18)) = param5;
	WBUFL(data,(0x1C)) = param6;
	WBUFL(data,(0x20)) = param7;
}
