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

#include "message_standard.h"

#include "../entities/charentity.h"


CMessageStandardPacket::CMessageStandardPacket(uint16 MessageID)
{
    this->type = 0x09;
	this->size = 0x08;

    WBUFW(data,(0x0A)) = MessageID;
}

CMessageStandardPacket::CMessageStandardPacket(CCharEntity* PChar, uint32 param0, uint32 param1, uint16 MessageID)
{
	this->type = 0x09;
	this->size = 0x12;

	WBUFW(data,(0x0A)) = MessageID;

	if (PChar != nullptr)
	{
		WBUFL(data,(0x04)) = PChar->id;
		WBUFW(data,(0x08)) = PChar->targid;
		
		if (MessageID == 0x59) 
		{
			this->size = 0x30;

			WBUFB(data,(0x0C)) = 0x10;

			snprintf((int8*)data+(0x0D), 24, "string2 %s", PChar->GetName());
		}
	}
	else
	{
		snprintf((int8*)data+(0x0D), 20, "Para0 %d Para1 %d", param0, param1);
	}
}

CMessageStandardPacket::CMessageStandardPacket(uint32 param0, uint32 param1, uint32 param2, uint32 param3, uint16 MessageID)
{
	this->type = 0x09;
	this->size = 0x08;

	WBUFW(data,(0x0A)) = MessageID;

	snprintf((int8*)data+(0x0D), 100, "Para0 %d Para1 %d Para2 %d Para3 %d", param0, param1, param2, param3);

	this->size += (strlen((int8*)data+(0x0D)) >> 1) & 0xFE;
}

/************************************************************************
*																		*
*  Используется только для 0x58-го сообщения (/diceroll) 				*
*																		*
************************************************************************/

CMessageStandardPacket::CMessageStandardPacket(CCharEntity* PChar, uint32 param0, uint16 MessageID)
{
	this->type = 0x09;
	this->size = 0x18;

	//DSP_DEBUG_BREAK_IF(MessageID != 0x58);

	WBUFW(data,(0x0A)) = MessageID;

	snprintf((int8*)data+(0x0D), 40, "string2 %s string3 %u", PChar->GetName(), param0);

	//WBUFB(data,(0x2F)) = 0x02;
}