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

#include "entity_update.h"

#include "../entities/baseentity.h"
#include "../entities/mobentity.h"
#include "../entities/npcentity.h"
#include "../entities/petentity.h"


CEntityUpdatePacket::CEntityUpdatePacket(CBaseEntity* PEntity, ENTITYUPDATE type, uint8 updatemask)
{
	this->type = 0x0E;
	this->size = 0x1C;

	WBUFL(data,(0x04)-4) = PEntity->id;
	WBUFW(data,(0x08)-4) = PEntity->targid;
	WBUFB(data,(0x0A)-4) = updatemask;

	switch(type)
	{
		case ENTITY_DESPAWN:
		{
			switch(PEntity->objtype)
			{
				case TYPE_NPC:
				{
					WBUFB(data,(0x0A)-4) = 0x20;
				}
				break;
				case TYPE_MOB:
				{
					WBUFB(data,(0x20)-4) = 0x07;
				}
				break;
				case TYPE_PET:
				{
					WBUFB(data,(0x0A)-4) = 0x20;
				}
				break;
			}
		}
		break;
		case ENTITY_SPAWN:
		{
			switch(PEntity->objtype)
			{
				WBUFB(data,(0x20)-4) = 0x20;
				case TYPE_PET:
				{
					WBUFB(data,(0x28)-4) = 0x04;
				}
				break;
			}
			WBUFW(data, (0x1A) - 4) = PEntity->m_TargID << 1;
		}
		case ENTITY_UPDATE:
		{
			WBUFB(data,(0x20)-4) = PEntity->status;
			WBUFB(data,(0x2B)-4) = PEntity->namevis;
			WBUFB(data,(0x1F)-4) = PEntity->animation;
			WBUFB(data,(0x2A)-4) = PEntity->animationsub;

			if (updatemask & UPDATE_POS){
				WBUFB(data,(0x0B)-4) = PEntity->loc.p.rotation;
				WBUFF(data,(0x0C)-4) = PEntity->loc.p.x;
				WBUFF(data,(0x10)-4) = PEntity->loc.p.y;
				WBUFF(data,(0x14)-4) = PEntity->loc.p.z;
				WBUFW(data,(0x18)-4) = PEntity->loc.p.moving;
				WBUFB(data,(0x1C)-4) = PEntity->speed;
				WBUFB(data,(0x1D)-4) = PEntity->speedsub;
			}

			switch(PEntity->objtype)
			{
				case TYPE_NPC:
				{
					if (updatemask & UPDATE_HP)
					{
						WBUFB(data,(0x1E)-4) = 0x64;
					}
					if (updatemask & UPDATE_STATUS)
					{
						WBUFL(data,(0x21)-4) = ((CNpcEntity*)PEntity)->unknown;
						WBUFB(data,(0x27)-4) = ((CNpcEntity*)PEntity)->name_prefix;     // gender and something else
					}
				}
				break;
				case TYPE_MOB:
				{
					CMobEntity* PMob = (CMobEntity*)PEntity;

					if(PMob->PMaster != NULL && PMob->PMaster->objtype == TYPE_PC && 
						PMob->PBattleAI->GetCurrentAction() == ACTION_FALL)
					{
                        WBUFB(data,(0x21)-4) = 0x99;
                        //WBUFB (data,(0x27)-4) = 0x28;
                        WBUFB(data,(0x1E)-4) = 0x00; //0% HP
                        WBUFB(data,(0x1F)-4) = ANIMATION_DEATH; //death anim
                        WBUFB(data,(0x20)-4) = STATUS_NORMAL;
					}
					else
					{
						if (updatemask & UPDATE_HP)
						{
							WBUFB(data,(0x1E)-4) = PMob->GetHPP();
						}
						if (updatemask & UPDATE_STATUS)
						{
							WBUFL(data,(0x21)-4) = PMob->m_unknown;
							WBUFB(data,(0x21)-4) |= PMob->m_CallForHelp;
							WBUFB(data,(0x27)-4) = PMob->m_name_prefix;
							WBUFL(data,(0x2C)-4) = PMob->m_OwnerID.id;

							//set to 1 to make HP bars invisible e.g. Yilgeban, 8 to make untargetable
							//WBUFB(data,(0x22)-4) = 0;

							if (PMob->PMaster != NULL && PMob->PMaster->objtype == TYPE_PC)
								WBUFB(data,(0x27)-4) = 0x08; //todo: may need |=
						}
					}
					if (updatemask & UPDATE_NAME)
					{
						this->size = 0x24;
						memcpy(data + (0x34) - 4, PEntity->GetName(), (PEntity->name.size() > 15 ? 15 : PEntity->name.size()));
					}
				}
				break;
				case TYPE_PET:
				{
					if(((CPetEntity*)PEntity)->PBattleAI->GetCurrentAction()==ACTION_FALL){
						WBUFB(data,(0x21)-4) = 0x99;
                        WBUFB(data,(0x25)-4) = 0x08;
                        WBUFB(data,(0x27)-4) = 0x08 | ((CPetEntity*)PEntity)->m_name_prefix;
                        WBUFB(data,(0x28)-4) = (((CBattleEntity*)PEntity)->health.hp > 0 ? 0x08 : 0x00);
						WBUFB(data,(0x1E)-4) = 0x00; //0% HP
						WBUFB(data,(0x1F)-4) = ANIMATION_DEATH;
						WBUFB(data,(0x20)-4) = STATUS_NORMAL;
					}
					else{
						if (updatemask & UPDATE_HP)
						{
							WBUFB(data,(0x1E)-4) = ((CPetEntity*)PEntity)->GetHPP();
						}
						if (updatemask & UPDATE_STATUS)
						{
							WBUFB(data,(0x27)-4) = 0x08 | ((CPetEntity*)PEntity)->m_name_prefix;
						}
						if (updatemask & UPDATE_NAME)
						{
							this->size = 0x24;
							memcpy(data + (0x34) - 4, PEntity->GetName(), (PEntity->name.size() > 15 ? 15 : PEntity->name.size()));
						}
					}
				}
				break;
			}

			switch(PEntity->look.size)
			{
				case MODEL_STANDARD:
				case MODEL_UNK_5:
				case MODEL_AUTOMATON:
				{
					WBUFL(data,(0x30)-4) = RBUFL(&PEntity->look,0);
				}
				break;
				case MODEL_EQUIPED:
                case MODEL_CHOCOBO:
				{
					this->size = 0x24;

					WBUFB (data,(0x0A)-4) = 0x57;
					memcpy(data+(0x30)-4, &(PEntity->look), 20);
				}
				break;
				case MODEL_DOOR:
				case MODEL_ELEVATOR:
				case MODEL_SHIP:
				{
					this->size = 0x24;

					WBUFW (data,(0x30)-4) = PEntity->look.size;
					memcpy(data+(0x34)-4, PEntity->GetName(),(PEntity->name.size() > 12 ? 12 : PEntity->name.size()));
				}
				break;
			}
		}
		break;
	}
}