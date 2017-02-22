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

#include "entity_update.h"

#include "../entities/baseentity.h"
#include "../entities/mobentity.h"
#include "../entities/npcentity.h"
#include "../entities/petentity.h"
#include "../status_effect_container.h"

CEntityUpdatePacket::CEntityUpdatePacket(CBaseEntity* PEntity, ENTITYUPDATE type, uint8 updatemask)
{
    this->type = 0x0E;
    this->size = 0x1C;

    WBUFL(data, (0x04)) = PEntity->id;
    WBUFW(data, (0x08)) = PEntity->targid;
    WBUFB(data, (0x0A)) = updatemask;

    switch (type)
    {
        case ENTITY_DESPAWN:
        {
            WBUFB(data, (0x0A)) = 0x20;
            updatemask = UPDATE_ALL_MOB;
        }
        break;
        case ENTITY_SPAWN:
        {
            updatemask = UPDATE_ALL_MOB;
            if (PEntity->objtype == TYPE_PET)
            {
                WBUFB(data, (0x28)) = 0x04;
            }
            if (PEntity->look.size == MODEL_EQUIPED || PEntity->look.size == MODEL_CHOCOBO)
            {
                updatemask = 0x57;
            }
            WBUFB(data, (0x0A)) = updatemask;
        }
        break;
    }

    if (updatemask & UPDATE_POS) {
        WBUFB(data, (0x0B)) = PEntity->loc.p.rotation;
        WBUFF(data, (0x0C)) = PEntity->loc.p.x;
        WBUFF(data, (0x10)) = PEntity->loc.p.y;
        WBUFF(data, (0x14)) = PEntity->loc.p.z;
        WBUFW(data, (0x18)) = PEntity->loc.p.moving;
        WBUFW(data, (0x1A)) = PEntity->m_TargID << 1;
        WBUFB(data, (0x1C)) = PEntity->speed;
        WBUFB(data, (0x1D)) = PEntity->speedsub;
    }

    if (PEntity->allegiance == ALLEGIANCE_PLAYER && PEntity->status == STATUS_MOB)
        WBUFB(data, (0x20)) = STATUS_NORMAL;
    else
        WBUFB(data, (0x20)) = PEntity->status;

    switch (PEntity->objtype)
    {
        case TYPE_NPC:
        {
            if (updatemask & UPDATE_HP)
            {
                WBUFB(data, (0x1E)) = 0x64;
                WBUFB(data, (0x1F)) = PEntity->animation;
                WBUFB(data, (0x2A)) = PEntity->animationsub;
                WBUFL(data, (0x21)) = ((CNpcEntity*)PEntity)->m_flags;
                WBUFB(data, (0x27)) = ((CNpcEntity*)PEntity)->name_prefix;     // gender and something else
                WBUFB(data, (0x29)) = PEntity->allegiance;
                WBUFB(data, (0x2B)) = PEntity->namevis;
            }
        }
        break;
        case TYPE_MOB:
        case TYPE_PET:
        {
            CMobEntity* PMob = (CMobEntity*)PEntity;

            //if(PMob->PMaster != nullptr && PMob->PMaster->objtype == TYPE_PC && 
            //	PMob->PBattleAI->GetCurrentAction() == ACTION_FALL)
            //{
            //    WBUFB(data,(0x21)) = 0x99;
            //    //WBUFB (data,(0x27)) = 0x28;
            //    WBUFB(data,(0x1E)) = 0x00; //0% HP
            //    WBUFB(data,(0x1F)) = ANIMATION_DEATH; //death anim
            //    WBUFB(data,(0x20)) = STATUS_NORMAL;
            //	  WBUFB(data,(0x29)) = PEntity->allegiance;
            //	  WBUFB(data,(0x2B)) = PEntity->namevis;
            //}
            //else
            {
                if (updatemask & UPDATE_HP)
                {
                    WBUFB(data, (0x1E)) = PMob->GetHPP();
                    WBUFB(data, (0x1F)) = PEntity->animation;
                    WBUFB(data, (0x2A)) = PEntity->animationsub;
                    WBUFL(data, (0x21)) = PMob->m_flags;
                    WBUFB(data, (0x25)) = PMob->health.hp > 0 ? 0x08 : 0;
                    WBUFB(data, (0x27)) = PMob->m_name_prefix;
                    if (PMob->PMaster != nullptr && PMob->PMaster->objtype == TYPE_PC)
                        WBUFB(data, (0x27)) |= 0x08;
                    WBUFB(data, (0x28)) |= (PMob->StatusEffectContainer->HasStatusEffect(EFFECT_TERROR) ? 0x10 : 0x00);
                    WBUFB(data, (0x28)) |= PMob->health.hp > 0 && PMob->animation == ANIMATION_DEATH ? 0x08 : 0;
                    WBUFB(data, (0x29)) = PEntity->allegiance;
                    WBUFB(data, (0x2B)) = PEntity->namevis;
                }
                if (updatemask & UPDATE_STATUS)
                {
                    WBUFL(data, (0x2C)) = PMob->m_OwnerID.id;
                }
            }
            if (updatemask & UPDATE_NAME)
            {
                //depending on size of name, this can be 0x20, 0x22, or 0x24
                this->size = 0x24;
                if (PMob->packetName.empty())
                    memcpy(data + (0x34), PEntity->GetName(), (PEntity->name.size() > 15 ? 15 : PEntity->name.size()));
                else
                    memcpy(data + (0x34), PMob->packetName.c_str(), (PMob->packetName.size() > 15 ? 15 : PMob->packetName.size()));
            }
        }
        break;
    }

    switch (PEntity->look.size)
    {
        case MODEL_STANDARD:
        case MODEL_UNK_5:
        case MODEL_AUTOMATON:
        {
            WBUFL(data, (0x30)) = RBUFL(&PEntity->look, 0);
        }
        break;
        case MODEL_EQUIPED:
        case MODEL_CHOCOBO:
        {
            this->size = 0x24;

            memcpy(data + (0x30), &(PEntity->look), 20);
        }
        break;
        case MODEL_DOOR:
        case MODEL_ELEVATOR:
        case MODEL_SHIP:
        {
            this->size = 0x24;

            WBUFW(data, (0x30)) = PEntity->look.size;
            memcpy(data + (0x34), PEntity->GetName(), (PEntity->name.size() > 12 ? 12 : PEntity->name.size()));
        }
        break;
    }
}