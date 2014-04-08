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
#include "../../common/showmsg.h"

#include <string.h>

#include "char_update.h"

#include "../entities/charentity.h"
#include "../utils/itemutils.h"
#include "../vana_time.h"


CCharUpdatePacket::CCharUpdatePacket(CCharEntity* PChar)
{
	this->type = 0x37;
	this->size = 0x2E;

	memcpy(data+(0x04)-4, PChar->StatusEffectContainer->m_StatusIcons, 32);

	WBUFL(data,(0x24)-4) = PChar->id;
	WBUFB(data,(0x2A)-4) = PChar->GetHPP();

	WBUFB(data,(0x28)-4) = (PChar->nameflags.byte2 << 1);
	WBUFB(data,(0x2B)-4) = (PChar->nameflags.byte4 << 5) + PChar->nameflags.byte3;
	WBUFB(data,(0x2F)-4) = (PChar->nameflags.byte4 >> 2);
    
	if (PChar->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_INVISIBLE))
	{
		WBUFB(data,(0x2D)-4) = 0x80;
	}
	if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
	{
		WBUFB(data,(0x38)-4) = 0x04;
	}

    if (PChar->m_isMentor)
        WBUFB(data,(0x38)-4) |= 0x10; // Mentor flag.
    if (PChar->m_isNewPlayer)
        WBUFB(data,(0x38)-4) |= 0x0C; // New player ?

    WBUFB(data,(0x29)-4) = PChar->GetGender(); // +  управляем ростом: 0x02 - 0; 0x08 - 1; 0x10 - 2;
    WBUFB(data,(0x2C)-4) = PChar->GetSpeed();
	WBUFB(data,(0x30)-4) = PChar->animation;

    if (PChar->equip[SLOT_LINK] != 0)
    {
	    CItemLinkshell* linkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);

	    if ((linkshell != NULL) && linkshell->isType(ITEM_LINKSHELL))
	    {
		    lscolor_t LSColor = linkshell->GetLSColor();

		    WBUFB(data,(0x31)-4) = (LSColor.R << 4) + 15;
		    WBUFB(data,(0x32)-4) = (LSColor.G << 4) + 15;
		    WBUFB(data,(0x33)-4) = (LSColor.B << 4) + 15;
	    }
    }
	if (PChar->PPet != NULL)
	{
		WBUFW(data,(0x34)-4) = PChar->PPet->targid << 3;
	}
    //Status flag: bit 4: frozen anim (terror),
    //  bit 6/7/8 related to Ballista (6 set - normal, 7 set san d'oria, 6+7 set bastok, 8 set windurst)
    uint8 flag = 0x20;
    if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TERROR))
        flag |= 0x08;
    WBUFB(data,(0x36)-4) = flag;

    if (!PChar->isDead() || PChar->m_DeathTimestamp == 0) //prevent this packet from resetting the homepoint timer after tractor
        WBUFL(data,(0x3C)-4) = 0x0003A020;

    WBUFL(data,(0x40)-4) = CVanaTime::getInstance()->getVanaTime();
    WBUFW(data,(0x44)-4) = PChar->m_Costum;

	if (PChar->animation == ANIMATION_FISHING_START)
	{
		WBUFB(data,(0x4A)-4) = 0x10;
	}
	WBUFU(data,(0x4C)-4) = PChar->StatusEffectContainer->m_Flags;
}