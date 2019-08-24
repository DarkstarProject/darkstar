/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

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
#include "../../common/utils.h"

#include "trust_sync.h"

#include "../entities/charentity.h"
#include "../entities/trustentity.h"

CTrustSyncPacket::CTrustSyncPacket(CCharEntity* PChar, CTrustEntity* PTrust)
{
    // The purpose of this packet is to make the client aware that this pet is a trust, and hence
    // to show trust options in the menu (like "Release").
    this->type = 0x67;
    this->size = 0x0C;

    // Sample packet:
    // 67 0C 58 00 03 05 F4 07 F4 28 08 01 00 04 00 00
    // 04 00 00 00 00 00 00 00

    if (PTrust->PMaster && PTrust->PMaster->id == PChar->id)
    {
        ref<uint8>(0x04) = 0x03;
        ref<uint8>(0x05) = 0x05;
    }

    ref<uint16>(0x06) = PTrust->targid;
    ref<uint32>(0x08) = PTrust->id;

    if (PTrust)
    {
        this->size = 0x16;
        packBitsBE(data + (0x04), (0x18) + PTrust->name.size(), 0, 6, 10); // Message Size

        if(PChar)
            ref<uint16>(0x0C) = PChar->targid;

        //ref<uint8>(0x0D) = PTrust->GetHPP();
        //ref<uint8>(0x0E) = PTrust->GetMPP();
        //ref<uint16>(0x0F) = PTrust->health.tp;
        //if (PTrust->animation == ANIMATION_ATTACK)
        //    ref<uint32>(0x14) = PTrust->GetBattleTarget()->id;

        memcpy(data + (0x18), PTrust->GetName(), PTrust->name.size());
    }

    //this->size = 0x16;
    //ref<uint16>(0x0C) = PChar->targid;
    //memcpy(data + (0x18), PTrust->GetName(), PTrust->name.size());

    // Unknown
    //ref<uint8>(0x10) = 0x04;
}
