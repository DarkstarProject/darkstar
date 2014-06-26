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

#include "../../common/timer.h"

#include <string.h>

#include "mobentity.h"

CMobEntity::CMobEntity()
{
	objtype = TYPE_MOB;

	m_DropID = 0;

	m_minLevel = 1;
	m_maxLevel = 1;

    HPscale = 1.0;
    MPscale = 1.0;
    m_unknown = 0;

	allegiance = ALLEGIANCE_MOB;

    // default to normal roaming
    m_roamFlags = ROAMFLAG_NONE;
    m_specialFlags = SPECIALFLAG_NONE;
    m_name_prefix = 0;

    memset(m_mobModStat,0, sizeof(m_mobModStat));
    memset(m_mobModStatSave,0, sizeof(m_mobModStatSave));

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
	m_ItemStolen = false;
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

	m_dmgMult = 100;

    m_giveExp = false;
    m_neutral = false;
	m_Aggro = AGGRO_NONE;
    m_Link = 0;

	m_battlefieldID = 0;
    m_bcnmID = 0;

    m_maxRoamDistance = 10.0f;
    m_disableScent = false;

    setMobMod(MOBMOD_SIGHT_RANGE, MOB_SIGHT_RANGE);
    setMobMod(MOBMOD_SOUND_RANGE, MOB_SOUND_RANGE);
    setMobMod(MOBMOD_ROAM_COOL, 45);

	memset(& m_SpawnPoint, 0, sizeof(m_SpawnPoint));

    m_SpellListContainer = NULL;
    PEnmityContainer = new CEnmityContainer(this);
    SpellContainer = new CMobSpellContainer(this);

    // For Dyna Stats
    m_StatPoppedMobs = false;
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

    int16 min = getMobMod(MOBMOD_GIL_MIN);
    int16 max = getMobMod(MOBMOD_GIL_MAX);

    if(min && max)
    {
        // make sure divide won't crash server
        if(max <= min)
        {
            max = min+1;
        }

        if(max-min <= 2)
        {
            max = min+2;
            ShowWarning("CMobEntity::GetRandomGil Max value is set too low, defauting\n");
        }

        return rand()%(max-min)+min;
    }

    float gil = pow(GetMLevel(), 1.05f);

    if(gil < 1){
        gil = 1;
    }

    uint16 highGil = (float)(gil) / 3 + 4;

    if(max)
    {
        highGil = max;
    }

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

    if(min && gil < min)
    {
        gil = min;
    }

    return gil;
}

bool CMobEntity::CanDropGil()
{
    // smaller than 0 means drop no gil
    if(getMobMod(MOBMOD_GIL_MAX) < 0) return false;

    if(getMobMod(MOBMOD_GIL_MIN) > 0 || getMobMod(MOBMOD_GIL_MAX))
    {
        return true;
    }

    return m_EcoSystem == SYSTEM_BEASTMEN;
}

bool CMobEntity::CanRoamHome()
{
    if(speed == 0 && !(m_roamFlags & ROAMFLAG_WORM)) return false;
    return getMobMod(MOBMOD_NO_DESPAWN);
}

bool CMobEntity::CanRoam()
{
    return !(m_roamFlags & ROAMFLAG_EVENT) && PMaster == NULL && (speed > 0 || (m_roamFlags & ROAMFLAG_WORM));
}

bool CMobEntity::CanLink(position_t* pos, int16 superLink)
{
    // handle super linking
    if(superLink && getMobMod(MOBMOD_SUPERLINK) == superLink)
    {
        return true;
    }

    // can't link right now
    if(m_neutral)
    {
        return false;
    }

    // link only if I see him
	if ((m_Aggro & AGGRO_DETECT_SIGHT) || (m_Aggro & AGGRO_DETECT_TRUESIGHT)){

       if(!isFaceing(loc.p, *pos, 40)) return false;
    }

    // link if close enough
    return distance(loc.p, *pos) <= getMobMod(MOBMOD_LINK_RADIUS);
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

bool CMobEntity::IsFarFromHome()
{
    return distance(loc.p, m_SpawnPoint) > m_maxRoamDistance;
}

bool CMobEntity::CanBeNeutral()
{
    return !(m_Type & MOBTYPE_NOTORIOUS);
}

bool CMobEntity::CanDetectTarget(CBattleEntity* PTarget, bool forceSight)
{
	if (PTarget->isDead() || m_Aggro == AGGRO_NONE || PTarget->animation == ANIMATION_CHOCOBO) return false;

    float verticalDistance = abs(loc.p.y - PTarget->loc.p.y);

    if(verticalDistance > 8)
    {
        return false;
    }

    float currentDistance = distance(PTarget->loc.p, loc.p) + PTarget->getMod(MOD_STEALTH);

    bool detectSight = (m_Aggro & AGGRO_DETECT_SIGHT) || forceSight;

    if (detectSight && !PTarget->StatusEffectContainer->HasStatusEffectByFlag(EFFECTFLAG_INVISIBLE) && currentDistance < getMobMod(MOBMOD_SIGHT_RANGE) && isFaceing(loc.p, PTarget->loc.p, 40))
    {
        return true;
    }

	if ((m_Aggro & AGGRO_DETECT_TRUESIGHT) && currentDistance < getMobMod(MOBMOD_SIGHT_RANGE) && isFaceing(loc.p, PTarget->loc.p, 40))
    {
        return true;
    }

	if ((m_Aggro & AGGRO_DETECT_TRUEHEARING) && currentDistance < getMobMod(MOBMOD_SOUND_RANGE))
    {
        return true;
    }

	if ((m_Behaviour & BEHAVIOUR_AGGRO_AMBUSH) && currentDistance < 3 && !PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
    {
        return true;
    }

	if ((m_Aggro & AGGRO_DETECT_HEARING) && currentDistance < getMobMod(MOBMOD_SOUND_RANGE) && !PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
    {
        return true;
    }

    // everything below require distance to be below 20
    if(currentDistance > 20)
    {
        return false;
    }

	if ((m_Aggro & AGGRO_DETECT_LOWHP) && PTarget->GetHPP() < 75)
    {
        return true;
    }

	if ((m_Aggro & AGGRO_DETECT_MAGIC) && PTarget->PBattleAI->GetCurrentAction() == ACTION_MAGIC_CASTING && PTarget->PBattleAI->GetCurrentSpell()->hasMPCost())
    {
        return true;
    }

	if ((m_Aggro & AGGRO_DETECT_WEAPONSKILL) && PTarget->PBattleAI->GetCurrentAction() == ACTION_WEAPONSKILL_FINISH)
    {
        return true;
    }

	if ((m_Aggro & AGGRO_DETECT_JOBABILITY) && PTarget->PBattleAI->GetCurrentAction() == ACTION_JOBABILITY_FINISH)
    {
        return true;
    }

    return false;
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

        m_SpellListContainer = mobSpellList::GetMobSpellList(spellList);
    }

    // give spells and proper traits
    mobutils::CalculateStats(this);
}

uint8 CMobEntity::TPUseChance()
{
    if(health.tp < 1000) return 0;

    if(health.tp == 3000 || (GetHPP() <= 25 && health.tp >= 1000))
    {
        return 100;
    }

    return getMobMod(MOBMOD_TP_USE_CHANCE);
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

void CMobEntity::setMobMod(uint16 type, int16 value)
{
    if (type < MAX_MOBMODIFIER)
    {
        m_mobModStat[type] = value;
    }
    else
    {
        ShowError("CMobEntity::setMobMod Trying to set value out of range (%d)\n", type);
    }
}

int16 CMobEntity::getMobMod(uint16 type)
{
    if (type < MAX_MOBMODIFIER)
    {
        return m_mobModStat[type];
    }
    else
    {
        ShowError("CMobEntity::getMobMod Trying to get value out of range (%d)\n", type);
        return -1;
    }
}

void CMobEntity::addMobMod(uint16 type, int16 value)
{
    if (type < MAX_MOBMODIFIER)
    {
        m_mobModStat[type] += value;
    }
    else
    {
        ShowError("CMobEntity::addMobMod Trying to set value out of range (%d)\n", type);
    }
}

void CMobEntity::defaultMobMod(uint16 type, int16 value)
{
    if (type < MAX_MOBMODIFIER)
    {
        if(m_mobModStat[type] == 0)
        {
            m_mobModStat[type] = value;
        }
    }
    else
    {
        ShowError("CMobEntity::addMobMod Trying to set value out of range (%d)\n", type);
    }
}

void CMobEntity::resetMobMod(uint16 type)
{
    if (type < MAX_MOBMODIFIER)
    {
        m_mobModStat[type] = m_mobModStatSave[type];
    }
    else
    {
        ShowError("CMobEntity::addMobMod Trying to set value out of range (%d)\n", type);
    }
}

int32 CMobEntity::getBigMobMod(uint16 type)
{
    return getMobMod(type) * 1000;
}

void CMobEntity::saveMobModifiers()
{
    memcpy(m_mobModStatSave, m_mobModStat, sizeof(m_mobModStat));
}

void CMobEntity::restoreMobModifiers()
{
    memcpy(m_mobModStat, m_mobModStatSave, sizeof(m_mobModStatSave));
}

void CMobEntity::HideModel(bool hide)
{
    if(hide)
    {
        // I got this from ambush antlion
        // i'm not sure if this is right
        m_unknown = 2181;
    }
    else
    {
        m_unknown = 0;
    }
}

bool CMobEntity::IsModelHidden()
{
    return m_unknown == 0;
}
