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

#include "../common/timer.h"

#include <string.h>

#include "mobentity.h"


CMobEntity::CMobEntity() 
{
	objtype = TYPE_MOB;

	m_DropID = 0;

	m_minLevel = 1;
	m_maxLevel = 1;

	m_CallForHelp  = 0;
    m_DespawnTimer = 0;
    m_DropItemTime = 0;
	m_Family = 0;
	m_Type      = MOBTYPE_NORMAL;
	m_Behaviour = BEHAVIOUR_NONE;
	m_SpawnType = SPAWNTYPE_NORMAL;
	m_EcoSystem = SYSTEM_UNCLASSIFIED;
	m_Element = 0; 
	m_HiPCLvl = 0;
	m_THLvl = 0;
	m_THPCID = 0;
	PEnmityContainer = new CEnmityContainer();
	PEnmityContainer->setEnmityHolder(this);
	memset(& m_SpawnPoint, 0, sizeof(m_SpawnPoint));
}

CMobEntity::~CMobEntity()
{
	delete PEnmityContainer;
}

uint32 CMobEntity::GetDespawnTimer()
{
	return m_DespawnTimer;
}

bool CMobEntity::CanDeaggro()
{
	return !(m_Type & MOBTYPE_NOTORIOUS || m_Type & MOBTYPE_BATTLEFIELD);
}

void CMobEntity::SetDespawnTimer(uint32 duration)
{
	m_DespawnTimer = (duration > 0 ? (duration * 1000) + gettick() : duration);
}