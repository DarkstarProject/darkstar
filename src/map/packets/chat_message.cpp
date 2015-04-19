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
#include "chat_message.h"
#include "../entities/charentity.h"

CChatMessagePacket::CChatMessagePacket(CCharEntity* PChar, CHAT_MESSAGE_TYPE MessageType, int8* buff)
{
     // Determine the return message length..
     int32 buffSize = (strlen(buff) > 108) ? 108 : strlen(buff);

     // Build the packet..
     this->type = 0x17;
     this->size = dsp_min((32 + (buffSize + 1) + ((4 - ((buffSize + 1) % 4)) % 4)) / 2, 128);

     WBUFB(data, (0x04) ) = MessageType;
     if (PChar->nameflags.flags & FLAG_GM)
        WBUFB(data, (0x05) ) = 0x01;
     WBUFW(data, (0x06) ) = PChar->getZone();

     memcpy(data + (0x08) , PChar->GetName(), PChar->name.size());
     memcpy(data + (0x18) , buff, buffSize);
}
