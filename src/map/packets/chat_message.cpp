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
    //there seems to be some sort of variable cap on the length of the packet, which I cannot determine
    // (it changed when zoning, but not when zoning back)
    // if you'd like to try and figure out what the cap is based on, the client side max message length is also
    // variable in the same way, and is probably so under the same circumstances
    // until that can be found, we'll just use the max length 
    int32 buffSize = (strlen(buff) > 236) ? 236 : strlen(buff);

    // Build the packet..
    CBasicPacket::id(id);
    this->type = 0x17;
    //12 (base length / 2) + ((buffSize in chunks of 4) / 2) 
    //this->size = 12 + ((buffSize / 4) + 1) * 2;
    this->size = 0x82;

    ref<uint8>(0x04) = MessageType;
    if (PChar->nameflags.flags & FLAG_GM)
    ref<uint8>(0x05) = 0x01;
    ref<uint16>(0x06) = PChar->getZone();

    memcpy(data + (0x08) , PChar->GetName(), PChar->name.size());
    memcpy(data + (0x18) , buff, buffSize);
}
