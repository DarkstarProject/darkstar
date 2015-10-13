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

#include "status_effects.h"
#include "../entities/charentity.h"
#include "../../common/timer.h"

CStatusEffectPacket::CStatusEffectPacket(CCharEntity* PChar)
{
    this->type = 0x63;
    this->size = 0x64;

    int i = 0;

    std::fill(reinterpret_cast<uint16*>(data+0x08), reinterpret_cast<uint16*>(data+0x08+32), 0x00FF);

    ref<uint8>(0x04) = 0x09;
    ref<uint8>(0x06) = 0xC4;

    PChar->StatusEffectContainer->ForEachEffect([this, &i](CStatusEffect* PEffect)
    {
        ref<uint16>(0x08 + (i * 0x02)) = PEffect->GetIcon();
        ref<uint32>(0x48 + (i * 0x04)) = PEffect->GetDuration() == 0 ? 0x7FFFFFFF : (((PEffect->GetDuration() - (gettick() - PEffect->GetStartTime())) / 1000) + CVanaTime::getInstance()->getVanaTime()) * 60;
        ++i;
    });
}
