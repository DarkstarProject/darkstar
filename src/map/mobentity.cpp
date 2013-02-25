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

    HPstat = 1.0;
    MPstat = 1.0;

    m_AllowRespawn = 0;
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
    m_RageMode = 0;
	m_NewSkin = 0;
	m_SkinID = 0;
    strRank = 3;
    defRank = 3;
    vitRank = 3;
    agiRank = 3;
    intRank = 3;
    mndRank = 3;
    chrRank = 3;
    attRank = 3;
    defRank = 3;
    accRank = 3;
    evaRank = 3;
    linkRadius = 10;

	memset(& m_SpawnPoint, 0, sizeof(m_SpawnPoint));

    PEnmityContainer = new CEnmityContainer(this);
}

CMobEntity::~CMobEntity()
{
	delete PEnmityContainer;
}

/************************************************************************
*                                                                       *
*  Время исчезновения монстра в секундах                                *
*                                                                       *
************************************************************************/

uint32 CMobEntity::GetDespawnTimer()
{
	return m_DespawnTimer;
}

void CMobEntity::SetDespawnTimer(uint32 duration)
{
	m_DespawnTimer = (duration > 0 ? (duration * 1000) + gettick() : duration);
}

uint32 CMobEntity::GetRandomGil()
{
    float multiplier = 1 + (float)GetMLevel() / 75.0;

    uint16 base = GetMLevel() * ((m_Type & MOBTYPE_NOTORIOUS) ? 10 : multiplier);

    uint16 highBase = (float)(base*(multiplier*1.4))/2;

    // randomize it
    base += rand()%highBase;

    return base;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

bool CMobEntity::CanDeaggro()
{
	return !(m_Type & MOBTYPE_NOTORIOUS || m_Type & MOBTYPE_BATTLEFIELD);
}

/************************************************************************
*                                                                       *
*  RAGE MODE                                                            *
*                                                                       *
************************************************************************/

bool CMobEntity::hasRageMode()
{
	return m_RageMode;
}

void CMobEntity::addRageMode()
{
    if (!m_RageMode)
    {
	    stats.AGI *= 10;
	    stats.CHR *= 10;
	    stats.DEX *= 10;
	    stats.INT *= 10;
	    stats.MND *= 10;
	    stats.STR *= 10;
	    stats.VIT *= 10;
    }
	m_RageMode = true;
}

void CMobEntity::delRageMode()
{
    if (m_RageMode)
    {
	    stats.AGI /= 10;
	    stats.CHR /= 10;
	    stats.DEX /= 10;
	    stats.INT /= 10;
	    stats.MND /= 10;
	    stats.STR /= 10;
	    stats.VIT /= 10;
    }
	m_RageMode = false;
}

/************************************************************************
*                                                                       *
*  Change Skin of the Mob                                               *
*                                                                       *
************************************************************************/

void CMobEntity::SetMainSkin(uint32 mobid)
{
	if(m_NewSkin)
	{
		const int8* Query = "SELECT modelid \
							 FROM mob_spawn_points, mob_groups, mob_pools \
							 WHERE mob_spawn_points.mobid = %u \
							 AND mob_groups.groupid = mob_spawn_points.groupid \
							 AND mob_groups.poolid = mob_pools.poolid";

		int32 ret = Sql_Query(SqlHandle, Query, mobid);

		if(ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			memcpy(&look,Sql_GetData(SqlHandle,0),23);
			m_NewSkin = false;
			m_SkinID = 0;
		}
	}
}

void CMobEntity::SetNewSkin(uint8 skinid)
{
	const int8* Query = "SELECT skin_model FROM mob_change_skin WHERE skinid = %u";

	int32 ret = Sql_Query(SqlHandle, Query, skinid);

	if(ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		memcpy(&look,Sql_GetData(SqlHandle,0),23);
		m_NewSkin = true;
		m_SkinID = skinid;
	}
}

uint32 CMobEntity::GetSkinID()
{
	return m_SkinID;
}