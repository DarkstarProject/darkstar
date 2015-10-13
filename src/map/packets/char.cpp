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

#include "char.h"

#include "../entities/charentity.h"
#include "../utils/itemutils.h"


CCharPacket::CCharPacket(CCharEntity * PChar, ENTITYUPDATE type, uint8 updatemask)
{
	this->type = 0x0D;
	this->size = 0x3A;

	WBUFL(data,(0x04)) = PChar->id;
	WBUFW(data,(0x08)) = PChar->targid;

	switch(type)
	{
		case ENTITY_DESPAWN:
		{
            WBUFB(data, (0x0A) ) = 0x20;
		}
		break;
		case ENTITY_SPAWN:
            updatemask = 0x1F;
		case ENTITY_UPDATE:
		{
			WBUFB(data,(0x0A)) = updatemask;

            if (updatemask & UPDATE_POS)
            {
                WBUFB(data, (0x0B) ) = PChar->loc.p.rotation;
                WBUFF(data, (0x0C) ) = PChar->loc.p.x;
                WBUFF(data, (0x10) ) = PChar->loc.p.y;
                WBUFF(data, (0x14) ) = PChar->loc.p.z;
                WBUFW(data, (0x18) ) = PChar->loc.p.moving;
                WBUFW(data, (0x1A) ) = PChar->m_TargID << 1;
                WBUFB(data, (0x1C) ) = PChar->GetSpeed();
                WBUFB(data, (0x1D) ) = PChar->speedsub;
            }

            if (updatemask & UPDATE_HP)
            {
                WBUFB(data, (0x1E) ) = PChar->GetHPP();
                WBUFB(data, (0x1F) ) = PChar->animation;
                WBUFL(data, (0x20) ) = PChar->nameflags.flags;
                WBUFB(data, (0x21) ) |= PChar->GetGender() * 128 + (1 << PChar->look.size);

                //if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
                //{
                //	WBUFB(data,(0x22)) = 0x20;
                //}

                if (PChar->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_INVISIBLE))
                {
                    WBUFB(data, (0x23) ) = 0x20;
                }

                if (PChar->equip[SLOT_LINK1] != 0)
                {
                    CItemLinkshell* linkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK1);

                    if ((linkshell != nullptr) && linkshell->isType(ITEM_LINKSHELL))
                    {
                        lscolor_t LSColor = linkshell->GetLSColor();

                        WBUFB(data, (0x24) ) = (LSColor.R << 4) + 15;
                        WBUFB(data, (0x25) ) = (LSColor.G << 4) + 15;
                        WBUFB(data, (0x26) ) = (LSColor.B << 4) + 15;
                    }
                }
                WBUFB(data, (0x27) ) = (PChar->isCharmed ? 0x08 : 0x00);

                // Mentor flag..
                if (PChar->m_mentor >= 2)
                    WBUFB(data, (0x2B) ) = 0x01;
                else
                    WBUFB(data, (0x2B) ) = 0x00;

                // New Player Flag..
                if (PChar->m_isNewPlayer)
                    WBUFB(data, (0x2A) ) |= 0x80;

                WBUFW(data, (0x30) ) = PChar->m_Costum;

                WBUFL(data, (0x34) ) = 0x010CA248; // black chocobo
            }
			if (PChar->PPet != nullptr)
			{
				WBUFW(data,(0x3C)) = PChar->PPet->targid;
			}

            if (updatemask & UPDATE_LOOK)
            {
                look_t *look = (PChar->getStyleLocked() ? &PChar->mainlook : &PChar->look);
                WBUFB(data, (0x48) ) = look->face;
                WBUFB(data, (0x49) ) = look->race;
                WBUFW(data, (0x4A) ) = look->head + 0x1000;
                WBUFW(data, (0x4C) ) = look->body + 0x2000;
                WBUFW(data, (0x4E) ) = look->hands + 0x3000;
                WBUFW(data, (0x50) ) = look->legs + 0x4000;
                WBUFW(data, (0x52) ) = look->feet + 0x5000;
                WBUFW(data, (0x54) ) = look->main + 0x6000;
                WBUFW(data, (0x56) ) = look->sub + 0x7000;
                WBUFW(data, (0x58) ) = look->ranged + 0x8000;

                if (PChar->m_Monstrosity != 0)
                {
                    WBUFW(data, (0x48) ) = PChar->m_Monstrosity;
                    WBUFW(data, (0x58) ) = 0xFFFF;
                }
            }

            if (updatemask & UPDATE_NAME)
            {
                memcpy(data + (0x5A) , PChar->GetName(), PChar->name.size());
            }
		}
		break;
	}
}

// некоторые манипуляции с пакетом приводят к интересному результату (количество голов в какой-то игре)