/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../../common/utils.h"

#include "../battleutils.h"
#include "../petentity.h"
#include "../zone.h"

#include "../packets/entity_update.h"

#include "ai_pet_dummy.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CAIPetDummy::CAIPetDummy(CPetEntity* PPet)
{
	m_PPet = PPet;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIPetDummy::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;

	switch(m_ActionType)
	{
		case ACTION_NONE:							break;
		case ACTION_ROAMING:	ActionRoaming();	break;
		case ACTION_DEATH:		ActionDeath();		break;
		case ACTION_SPAWN:		ActionSpawn();		break;

		default : DSP_DEBUG_BREAK_IF(true);
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionRoaming()
{
	if (distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) > 3)
	{
		m_PPet->loc.p.rotation = getangle(m_PPet->loc.p, m_PPet->PMaster->loc.p);

		battleutils::MoveTo(m_PPet, m_PPet->PMaster->loc.p, 2);

        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionDeath()
{
    m_ActionType = ACTION_NONE;

    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN));
}

/************************************************************************
*																		*
*  При появлении питомца задержка в 4.5 секунды перед началом			*
*  следования за персонажем. Состояние может быть перезаписано.			*
*																		*
************************************************************************/

void CAIPetDummy::ActionSpawn()
{
	if ((m_Tick - m_LastActionTime) > 4000)
	{
		m_ActionType = ACTION_ROAMING;
	}
}