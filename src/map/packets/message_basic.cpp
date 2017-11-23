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

#include "message_basic.h"

#include "../entities/baseentity.h"


CMessageBasicPacket::CMessageBasicPacket(CBaseEntity* PSender, CBaseEntity* PTarget, std::int32_t param, std::int32_t value, std::uint16_t messageID)
{
	this->type = 0x29;
	this->size = 0x0E;

	WBUFL(data,(0x04)) = PSender->id;
	WBUFL(data,(0x08)) = PTarget->id;

	WBUFW(data,(0x14)) = PSender->targid;
	WBUFW(data,(0x16)) = PTarget->targid;

	WBUFL(data,(0x0C)) = param;
	WBUFL(data,(0x10)) = value;
	WBUFW(data,(0x18)) = messageID;
}

std::uint16_t CMessageBasicPacket::getMessageID()
{
    return ref<std::uint16_t>(0x18);
}
