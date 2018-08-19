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

#include "message_special.h"

#include "../entities/baseentity.h"


CMessageSpecialPacket::CMessageSpecialPacket(
	CBaseEntity* PEntity,
	uint16 messageID,
	uint32 param0,
	uint32 param1,
	uint32 param2,
	uint32 param3,
	bool ShowName,
	CBaseEntity* messageEntity)
{
    this->type = 0x2A;
    this->size = 0x10;

    //DSP_DEBUG_BREAK_IF(PEntity == nullptr);

    ref<uint32>(0x04) = PEntity->id;

    ref<uint32>(0x08) = param0;
    ref<uint32>(0x0C) = param1;
    ref<uint32>(0x10) = param2;
    ref<uint32>(0x14) = param3;

    ref<uint16>(0x18) = PEntity->targid;

    if (ShowName)
    {
        this->size = 0x18;

        if (messageEntity != nullptr)
        {
            memcpy(data + (0x1E), messageEntity->GetName(), (messageEntity->name.size() > 15 ? 15 : messageEntity->name.size()));
        }
        else
        {
            memcpy(data + (0x1E), PEntity->GetName(), (PEntity->name.size() > 15 ? 15 : PEntity->name.size()));
        }
    }
    else if (PEntity->objtype == TYPE_PC)
    {
        messageID += 0x8000;
    }

    ref<uint16>(0x1A) = messageID;
}