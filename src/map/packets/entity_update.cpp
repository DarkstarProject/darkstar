/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "../baseentity.h"
#include "../mobentity.h"
#include "../npcentity.h"
#include "../petentity.h"


CEntityUpdatePacket::CEntityUpdatePacket(CBaseEntity* PEntity, ENTITYUPDATE type)
{
	this->type = 0x0E;
	this->size = 0x1C;

	WBUFL(data,(0x04)-4) = PEntity->id;
	WBUFW(data,(0x08)-4) = PEntity->targid;

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
					WBUFB(data,(0x0A)-4) = 0x07;
					WBUFB(data,(0x20)-4) = 0x07;
				}
				break;
				case TYPE_PET:
				{
					WBUFB(data,(0x0A)-4) = 0x07;
					WBUFB(data,(0x1F)-4) = ANIMATION_DEATH;
					WBUFB(data,(0x28)-4) = 0x08;
				}
				break;
			}
		}
		break;
		case ENTITY_SPAWN:
		{
			switch(PEntity->objtype)
			{
				case TYPE_PET:
				{
					WBUFB(data,(0x28)-4) = 0x04;
				}
				break;
			}
		}
		case ENTITY_UPDATE:
		{
			WBUFB(data,(0x0B)-4) = PEntity->loc.p.rotation;		
			WBUFF(data,(0x0C)-4) = PEntity->loc.p.x;				
			WBUFF(data,(0x10)-4) = PEntity->loc.p.y;				
			WBUFF(data,(0x14)-4) = PEntity->loc.p.z;
			WBUFW(data,(0x18)-4) = PEntity->loc.p.moving;
			WBUFW(data,(0x1A)-4) = PEntity->m_TargID << 1;
			WBUFB(data,(0x1C)-4) = PEntity->speed;
			WBUFB(data,(0x1D)-4) = PEntity->speedsub;
			WBUFB(data,(0x1F)-4) = PEntity->animation;

			WBUFB(data,(0x20)-4) = PEntity->status;
			WBUFB(data,(0x2A)-4) = PEntity->animationsub;

			switch(PEntity->objtype)
			{
				case TYPE_NPC:
				{
					WBUFB(data,(0x1E)-4) = 0x64;
					WBUFL(data,(0x21)-4) = ((CNpcEntity*)PEntity)->unknown;
                    WBUFB(data,(0x27)-4) = ((CNpcEntity*)PEntity)->name_prefix;     // gender and something else 
					WBUFB(data,(0x2B)-4) = ((CNpcEntity*)PEntity)->namevis;
				}
				break;
				case TYPE_MOB:
				{
					WBUFB(data,(0x1E)-4) = ((CMobEntity*)PEntity)->GetHPP();
					WBUFB(data,(0x21)-4) = ((CMobEntity*)PEntity)->m_CallForHelp;
					WBUFL(data,(0x2C)-4) = ((CMobEntity*)PEntity)->m_OwnerID;

					if (((CMobEntity*)PEntity)->PMaster != NULL)
					{
						WBUFB(data,(0x27)-4) = 0x08;
					}
				}
				break;
				case TYPE_PET:
				{
					this->size = 0x24;

					WBUFB (data,(0x1E)-4) = ((CPetEntity*)PEntity)->GetHPP();
					WBUFB (data,(0x27)-4) = 0x08;
					memcpy(data+(0x34)-4, PEntity->GetName(),(PEntity->name.size() > 15 ? 15 : PEntity->name.size()));
				}
				break;
			}

			switch(PEntity->look.size)
			{
				case MODEL_STANDARD:
				case MODEL_UNK_5:
				case MODEL_UNK_6:
				{
					WBUFB(data,(0x0A)-4) = 0x0F;
					WBUFL(data,(0x30)-4) = RBUFL(&PEntity->look,0);
				}
				break;
				case MODEL_EQUIPED:
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

					WBUFB (data,(0x0A)-4) = 0x07;
					WBUFW (data,(0x30)-4) = PEntity->look.size;
					memcpy(data+(0x34)-4, PEntity->GetName(),(PEntity->name.size() > 12 ? 12 : PEntity->name.size()));
				}
				break;
			}
		}
		break;
	}
}

// speed

// Cactrot Rapido	180;
// Manticore		75;
// Raptor			70;
// Demons			70;
// Tiger			68;
// Coeurl			60;
// Hungerer			30;
// Adamantoise		27;