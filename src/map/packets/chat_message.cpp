/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "chat_message.h"

#include "../charentity.h"


CChatMessagePacket::CChatMessagePacket(CCharEntity* PChar, CHAT_MESSAGE_TYPE MessageType, int8* buff) 
{
	this->type = 0x17;
	this->size = ((24 + (strlen(buff) + 3) >> 1) + 1) & 0xFE;

	//DSP_DEBUG_BREAK_IF(strlen(buff) > 256);
	//DSP_DEBUG_BREAK_IF(PChar->name.size() > 15);

	if (PChar->nameflags.flags & FLAG_GM)
	{
		WBUFB(data,(0x05)-4) = 0x01;
	}

	WBUFB(data,(0x04)-4) = MessageType;

	memcpy(data+(0x08)-4, PChar->GetName(), PChar->name.size());
	memcpy(data+(0x18)-4, buff, strlen(buff));
}