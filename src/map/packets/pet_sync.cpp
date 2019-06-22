﻿/*
===========================================================================

Copyright (c) 2010-2018 Darkstar Dev Teams

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

#include "pet_sync.h"

#include "../entities/charentity.h"

/************************************************************************
*                                                                       *
*  Synchronization of the pet with the owner                            *
*                                                                       *
************************************************************************/

CPetSyncPacket::CPetSyncPacket(CCharEntity* PChar)
{
    this->type = 0x68;
    this->size = 0x0E;

    ref<uint8>(0x04) |= 0x04; // Message Type
    packBitsBE(data+(0x04), (0x18), 0, 6, 10); // Message Size (0 for Despawn)
    ref<uint16>(0x06) = PChar->targid;
    ref<uint32>(0x08) = PChar->id;

    if (PChar->PPet != nullptr)
    {
        this->size = 0x16;
        packBitsBE(data+(0x04), (0x18)+PChar->PPet->name.size(), 0, 6, 10); // Message Size
        ref<uint16>(0x0C) = PChar->PPet->targid;
        ref<uint8>(0x0E) = PChar->PPet->GetHPP();
        ref<uint8>(0x0F) = PChar->PPet->GetMPP();
        ref<uint16>(0x10) = PChar->PPet->health.tp;
        if (PChar->PPet->animation == ANIMATION_ATTACK)
            ref<uint32>(0x14) = PChar->PPet->GetBattleTarget()->id;

        memcpy(data + (0x18), PChar->PPet->GetName(), PChar->PPet->name.size());
    }
}
