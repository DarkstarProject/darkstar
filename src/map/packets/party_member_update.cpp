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

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(CCharEntity* PChar, std::uint8_t MemberNumber, std::uint16_t memberflags, std::uint16_t ZoneID)
{
    this->type = 0xDD;
    this->size = 0x20;

    DSP_DEBUG_BREAK_IF(PChar == nullptr);

    ref<uint32>(0x04) = PChar->id;

    ref<std::uint16_t>(0x14) = memberflags;

    if (PChar->getZone() != ZoneID)
    {
        ref<std::uint16_t>(0x20) = PChar->getZone();
    }
    else
    {
        ref<uint32>(0x08) = PChar->health.hp;
        ref<uint32>(0x0C) = PChar->health.mp;
        ref<std::uint16_t>(0x10) = PChar->health.tp;
        ref<std::uint16_t>(0x18) = PChar->targid;
        ref<std::uint8_t>(0x1A) = MemberNumber;
        ref<std::uint8_t>(0x1D) = PChar->GetHPP();
        ref<std::uint8_t>(0x1E) = PChar->GetMPP();

        if (!(PChar->nameflags.flags & FLAG_ANON))
        {
            ref<std::uint8_t>(0x22) = PChar->GetMJob();
            ref<std::uint8_t>(0x23) = PChar->GetMLevel();
            ref<std::uint8_t>(0x24) = PChar->GetSJob();
            ref<std::uint8_t>(0x25) = PChar->GetSLevel();
        }
    }

    memcpy(data + (0x26), PChar->GetName(), PChar->name.size());
}
CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(uint32 id, const std::int8_t* name, std::uint16_t memberFlags, std::uint8_t MemberNumber, std::uint16_t ZoneID)
{

    this->type = 0xDD;
    this->size = 0x20;

    ref<uint32>(0x04) = id;

    ref<std::uint16_t>(0x14) = memberFlags;
    ref<std::uint16_t>(0x20) = ZoneID;

    memcpy(data + (0x26), name, strlen((const char*)name));
}
