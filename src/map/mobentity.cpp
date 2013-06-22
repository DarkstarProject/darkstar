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
    m_SpecialSkill = 0;

	m_minLevel = 1;
	m_maxLevel = 1;

    HPscale = 1.0;
    MPscale = 1.0;

    // default to normal roaming
    m_roamFlags = ROAMFLAG_NONE;
    m_specialFlags = SPECIALFLAG_NONE;

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
	m_extraVar = 0;
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

    m_SpecialCoolDown = 0;
    m_RoamCoolDown = 45000;

	memset(& m_SpawnPoint, 0, sizeof(m_SpawnPoint));

    PEnmityContainer = new CEnmityContainer(this);
    SpellContainer = new CMobSpellContainer(this);
}

CMobEntity::~CMobEntity()
{
    delete PEnmityContainer;
	delete SpellContainer;
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

    float gil = pow(GetMLevel(), 1.05f);

    if(gil < 1){
        gil = 1;
    }

    uint16 highGil = (float)(gil) / 3 + 4;

    if(highGil < 2){
        highGil = 2;
    }

    // randomize it
	gil += rand()%highGil;

    // NMs get more gil
    if((m_Type & MOBTYPE_NOTORIOUS) == MOBTYPE_NOTORIOUS){
        gil *= 10;
    }

    // thfs drop more gil
    if(GetMJob() == JOB_THF){
        gil = (float)gil * 1.5;
    }

    return gil;
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

void CMobEntity::ChangeMJob(uint16 job)
{
    this->SetMJob(job);

    // give him a spell list based on job
    if(m_EcoSystem == SYSTEM_BEASTMEN || m_EcoSystem == SYSTEM_UNDEAD || m_EcoSystem == SYSTEM_HUMANOID){
        uint16 spellList = 0;

        switch(job){
            case JOB_WHM:
                spellList = 1;
            break;
            case JOB_BLM:
                spellList = 2;
            break;
            case JOB_RDM:
                spellList = 3;
            break;
            case JOB_PLD:
                spellList = 4;
            break;
            case JOB_DRK:
                spellList = 5;
            break;
            case JOB_BRD:
                spellList = 6;
            break;
            case JOB_NIN:
                spellList = 7;
            break;
            case JOB_BLU:
                spellList = 8;
            break;
        }

        if(spellList > 0){
            m_SpellListContainer = mobSpellList::GetMobSpellList(spellList);
        } else {
            m_SpellListContainer = NULL;
        }
    }

    // give spells and proper traits
    mobutils::CalculateStats(this);
}

uint8 CMobEntity::TPUseChance()
{
    if(health.tp < 100) return 0;

    if(health.tp == 300 || (GetHPP() <= 25 && health.tp >= 100))
    {
        return 100;
    }

    return 40;
}

bool CMobEntity::CanUseTwoHour()
{

    // mobs below lvl 10 cannot two hour
    if(GetMLevel() < 10){
        return false;
    }

    if(m_Type & MOBTYPE_NOTORIOUS || isInDynamis())
    {
        return true;
    }

    if(m_EcoSystem == SYSTEM_BEASTMEN)
    {
        return true;
    }

    return false;
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