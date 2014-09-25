/*
===========================================================================

Copyright (c) 2010-2014 Darkstar Dev Teams

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

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(CCharEntity* PChar, uint8 MemberNumber, uint16 ZoneID)
{
    this->type = 0xDD;
    this->size = 0x20;

    DSP_DEBUG_BREAK_IF(PChar == NULL);

    WBUFL(data, (0x04) - 4) = PChar->id;

    if (PChar->PParty != NULL)
    {
        WBUFW(data, (0x14) - 4) = PChar->PParty->GetMemberFlags(PChar);
    }

    if (PChar->getZone() != ZoneID)
    {
        WBUFW(data, (0x20) - 4) = PChar->getZone();
    }
    else
    {
        WBUFL(data, (0x08) - 4) = PChar->health.hp;
        WBUFL(data, (0x0C) - 4) = PChar->health.mp;
        WBUFW(data, (0x10) - 4) = PChar->health.tp;
        WBUFW(data, (0x18) - 4) = PChar->targid;
        WBUFB(data, (0x1A) - 4) = MemberNumber;
        WBUFB(data, (0x1D) - 4) = PChar->GetHPP();
        WBUFB(data, (0x1E) - 4) = PChar->GetMPP();

        if (!(PChar->nameflags.flags & FLAG_ANON))
        {
            WBUFB(data, (0x22) - 4) = PChar->GetMJob();
            WBUFB(data, (0x23) - 4) = PChar->GetMLevel();
            WBUFB(data, (0x24) - 4) = PChar->GetSJob();
            WBUFB(data, (0x25) - 4) = PChar->GetSLevel();
        }
    }

    memcpy(data + (0x26) - 4, PChar->GetName(), PChar->name.size());
}
CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(uint32 id, const int8* name, uint16 memberFlags, uint8 ZoneID)
{

	this->type = 0xDD;
	this->size = 0x20;

	WBUFL(data, (0x04) - 4) = id;

	WBUFW(data, (0x14) - 4) = memberFlags;
	WBUFW(data, (0x20) - 4) = ZoneID;

	memcpy(data + (0x26) - 4, name, strlen(name));
}
