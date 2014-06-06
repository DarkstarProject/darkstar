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

#include "../../common/taskmgr.h"

#include "npcentity.h"
#include "../utils/zoneutils.h"

#include "../packets/entity_update.h"


/************************************************************************
*																		*
*  Таймер для закрывания дверей.										*
*																		*
*  Вообще можно подумать о реализации универсального таймера для		*
*  изменения анимации NPC, а не только закрытия дверей.					*
*																		*
************************************************************************/

int32 close_door(uint32 tick, CTaskMgr::CTask* PTask)
{
	//DSP_DEBUG_BREAK_IF(PTask->m_data == NULL)
    //DSP_DEBUG_BREAK_IF(((CBaseEntity*)PTask->m_data)->objtype != TYPE_NPC);

	CNpcEntity* PNpc = (CNpcEntity*)PTask->m_data;

	PNpc->animation = ANIMATION_CLOSE_DOOR;
	PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
	return 0;
}

int32 open_door(uint32 tick, CTaskMgr::CTask* PTask)
{
	CNpcEntity* PNpc = (CNpcEntity*)PTask->m_data;

	PNpc->animation = ANIMATION_OPEN_DOOR;
	PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
	return 0;
}

/************************************************************************
*																		*
*	Make an entity disappear											*
*																		*
************************************************************************/

int32 disappear_npc(uint32 tick, CTaskMgr::CTask* PTask)
{
	CNpcEntity* PNpc = (CNpcEntity*)PTask->m_data;

	PNpc->status = STATUS_DISAPPEAR;
	PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_DESPAWN, UPDATE_NONE));
	return 0;
}

/************************************************************************
*																		*
*	Make an entity reappear												*
*																		*
************************************************************************/

int32 reappear_npc(uint32 tick, CTaskMgr::CTask* PTask)
{
	CNpcEntity* PNpc = (CNpcEntity*)PTask->m_data;

	PNpc->status = STATUS_NORMAL;
	PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
	return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CNpcEntity::CNpcEntity() 
{
	objtype = TYPE_NPC;
	look.face = 0x32;
}

CNpcEntity::~CNpcEntity()
{
  
}