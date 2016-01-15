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
#include "../../common/showmsg.h"

#include <string.h>

#include "char_update.h"

#include "../entities/charentity.h"
#include "../utils/itemutils.h"
#include "../vana_time.h"
#include "../status_effect_container.h"

CCharUpdatePacket::CCharUpdatePacket(CCharEntity* PChar)
{
    this->type = 0x37;
    this->size = 0x2E;

    memcpy(data + (0x04), PChar->StatusEffectContainer->m_StatusIcons, 32);

    WBUFL(data, (0x24)) = PChar->id;
    WBUFB(data, (0x2A)) = PChar->GetHPP();

    WBUFB(data, (0x28)) = (PChar->nameflags.byte2 << 1);
    WBUFB(data, (0x2B)) = (PChar->nameflags.byte4 << 5) + PChar->nameflags.byte3;
    WBUFB(data, (0x2F)) = ((PChar->nameflags.byte4 >> 2) & 0xFE);
    WBUFB(data, (0x2F)) |= PChar->isCharmed ? 0x40 : 0x00;

    if (PChar->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_INVISIBLE))
    {
        WBUFB(data, (0x2D)) = 0x80;
    }
    if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
    {
        WBUFB(data, (0x38)) = 0x04;
    }

    if (PChar->m_mentor >= 2)
        WBUFB(data, (0x38)) |= 0x10; // Mentor flag.
    if (PChar->m_isNewPlayer)
        WBUFB(data, (0x38)) |= 0x08; // New player ?

    WBUFB(data, (0x29)) = PChar->GetGender() + (PChar->look.size > 0 ? PChar->look.size * 8 : 2); // +  управляем ростом: 0x02 - 0; 0x08 - 1; 0x10 - 2;
    WBUFB(data, (0x2C)) = PChar->GetSpeed();
    WBUFW(data, (0x2E)) |= PChar->speedsub << 1;
    WBUFB(data, (0x30)) = PChar->animation;

    CItemLinkshell* linkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK1);

    if ((linkshell != nullptr) && linkshell->isType(ITEM_LINKSHELL))
    {
        lscolor_t LSColor = linkshell->GetLSColor();

        WBUFB(data, (0x31)) = (LSColor.R << 4) + 15;
        WBUFB(data, (0x32)) = (LSColor.G << 4) + 15;
        WBUFB(data, (0x33)) = (LSColor.B << 4) + 15;
    }
    if (PChar->PPet != nullptr)
    {
        WBUFW(data, (0x34)) = PChar->PPet->targid << 3;
    }
    //Status flag: bit 4: frozen anim (terror),
    //  bit 6/7/8 related to Ballista (6 set - normal, 7 set san d'oria, 6+7 set bastok, 8 set windurst)
    uint8 flag = 0x20;
    if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TERROR))
        flag |= 0x08;
    WBUFB(data, (0x36)) = flag;

    if (!PChar->isDead() || PChar->m_DeathCounter == 0) //prevent this packet from resetting the homepoint timer after tractor
        WBUFL(data, (0x3C)) = 0x0003A020;

    WBUFL(data, (0x40)) = CVanaTime::getInstance()->getVanaTime();
    WBUFW(data, (0x44)) = PChar->m_Costum;

    if (PChar->animation == ANIMATION_FISHING_START)
    {
        WBUFB(data, (0x4A)) = 0x10;
    }
    WBUFU(data, (0x4C)) = PChar->StatusEffectContainer->m_Flags;
}