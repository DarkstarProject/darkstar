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

#include "party_effects.h"
#include "../party.h"
#include "../entities/battleentity.h"

CPartyEffectsPacket::CPartyEffectsPacket(CParty* PParty)
{
    this->type = 0x76;
    this->size = 0x7A;

    int i = 0;
    for (auto&& PMember : PParty->members) {
        ref<uint32>(i * 0x30 + 0x04) = PMember->id;
        ref<uint16>(i * 0x30 + 0x08) = PMember->targid;
        ref<uint64>(i * 0x30 + 0x0C) = PMember->StatusEffectContainer->m_Flags;
        memcpy(data + (i * 0x30 + 0x14), PMember->StatusEffectContainer->m_StatusIcons, 32);
        ++i;
    }
}
