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

#include "message_basic.h"

#include "../baseentity.h"


CMessageBasicPacket::CMessageBasicPacket(CBaseEntity* PSender, CBaseEntity* PTarget, int32 param, int32 value, uint16 messageID)
{
	this->type = 0x29;
	this->size = 0x0E;

	WBUFL(data,(0x04)-4) = PSender->id;
	WBUFL(data,(0x08)-4) = PTarget->id;

	WBUFW(data,(0x14)-4) = PSender->targid;
	WBUFW(data,(0x16)-4) = PTarget->targid;

	WBUFL(data,(0x0C)-4) = param;
	WBUFL(data,(0x10)-4) = value;
	WBUFW(data,(0x18)-4) = messageID;
}