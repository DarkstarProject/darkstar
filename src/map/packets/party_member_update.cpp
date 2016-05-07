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

#include "party_member_update.h"

#include "../entities/charentity.h"
#include "../alliance.h"
#include "../party.h"

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(CCharEntity* PChar, uint8 MemberNumber, uint16 memberflags, uint16 ZoneID)
{
    this->type = 0xDD;
    this->size = 0x20;

    DSP_DEBUG_BREAK_IF(PChar == nullptr);

    ref<uint32>(0x04) = PChar->id;

    ref<uint16>(0x14) = memberflags;

    if (PChar->getZone() != ZoneID)
    {
        ref<uint16>(0x20) = PChar->getZone();
    }
    else
    {
        ref<uint32>(0x08) = PChar->health.hp;
        ref<uint32>(0x0C) = PChar->health.mp;
        ref<uint16>(0x10) = PChar->health.tp;
        ref<uint16>(0x18) = PChar->targid;
        ref<uint8>(0x1A) = MemberNumber;
        ref<uint8>(0x1D) = PChar->GetHPP();
        ref<uint8>(0x1E) = PChar->GetMPP();

        if (!(PChar->nameflags.flags & FLAG_ANON))
        {
            ref<uint8>(0x22) = PChar->GetMJob();
            ref<uint8>(0x23) = PChar->GetMLevel();
            ref<uint8>(0x24) = PChar->GetSJob();
            ref<uint8>(0x25) = PChar->GetSLevel();
        }
    }

    memcpy(data + (0x26), PChar->GetName(), PChar->name.size());
}
CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(uint32 id, const int8* name, uint16 memberFlags, uint8 MemberNumber, uint16 ZoneID)
{

    this->type = 0xDD;
    this->size = 0x20;

    ref<uint32>(0x04) = id;

    ref<uint16>(0x14) = memberFlags;
    ref<uint16>(0x20) = ZoneID;

    memcpy(data + (0x26), name, strlen(name));
}
