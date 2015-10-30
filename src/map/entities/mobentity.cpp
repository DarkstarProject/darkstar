﻿/*
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

#include "../../common/timer.h"
#include "../packets/entity_update.h"

#include <string.h>

#include "mobentity.h"
#include "../utils/battleutils.h"

CMobEntity::CMobEntity()
{
	objtype = TYPE_MOB;

	m_DropID = 0;

	m_minLevel = 1;
	m_maxLevel = 1;

    HPscale = 1.0;
    MPscale = 1.0;
    m_flags = 0;

	allegiance = ALLEGIANCE_MOB;

    // default to normal roaming
    m_roamFlags = ROAMFLAG_NONE;
    m_specialFlags = SPECIALFLAG_NONE;
    m_name_prefix = 0;
    m_MobSkillList = 0;

    m_AllowRespawn = 0;
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

    strRank = 3;
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

    m_maxRoamDistance = 20.0f;
    m_disableScent = false;

	memset(& m_SpawnPoint, 0, sizeof(m_SpawnPoint));

    m_SpellListContainer = nullptr;
    PEnmityContainer = new CEnmityContainer(this);
    SpellContainer = new CMobSpellContainer(this);

    // For Dyna Stats
    m_StatPoppedMobs = false;
}

void CMobEntity::setMobFlags(uint32 MobFlags)
{
    m_flags = MobFlags;
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
            max = min+2;
        }

        if(max-min < 2)
        {
            max = min+2;
            ShowWarning("CMobEntity::GetRandomGil Max value is set too low, defauting\n");
        }

        return dsprand::GetRandomNumber(min,max);
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
    gil += dsprand::GetRandomNumber(highGil);

    if(min && gil < min)
    {
        gil = min;
    }

    if (getMobMod(MOBMOD_GIL_BONUS) != 0)
    {
        gil = (float)gil * (getMobMod(MOBMOD_GIL_BONUS) / 100.0f);
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

    return getMobMod(MOBMOD_GIL_BONUS) > 0;
}

bool CMobEntity::CanStealGil()
{
    // TODO: Some mobs cannot be mugged
    return CanDropGil();
}

void CMobEntity::ResetGilPurse()
{
    uint32 purse = GetRandomGil() / ((dsprand::GetRandomNumber(4,7)));
    if(purse == 0)
        purse = GetRandomGil();
    setMobMod(MOBMOD_MUG_GIL, purse);
}

bool CMobEntity::CanRoamHome()
{
    if(speed == 0 && !(m_roamFlags & ROAMFLAG_WORM)) return false;

    if (getMobMod(MOBMOD_NO_DESPAWN) != 0 ||
        map_config.mob_no_despawn)
    {
        return true;
    }

    return distance(m_SpawnPoint, loc.p) < MOB_ROAM_HOME_DISTANCE;
}

bool CMobEntity::CanRoam()
{
    return !(m_roamFlags & ROAMFLAG_EVENT) && PMaster == nullptr && (speed > 0 || (m_roamFlags & ROAMFLAG_WORM));
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

uint8 CMobEntity::TPUseChance()
{
    auto& MobSkillList = battleutils::GetMobSkillList(getMobMod(MOBMOD_SKILL_LIST));

    if (health.tp < 1000 || MobSkillList.empty() == true || !PBattleAI->GetMobAbilityEnabled())
    {
        return 0;
    }

    if (health.tp == 3000 || (GetHPP() <= 25 && health.tp >= 1000))
    {
        return 100;
    }

    return getMobMod(MOBMOD_TP_USE_CHANCE);
}

void CMobEntity::setMobMod(uint16 type, int16 value)
{
    m_mobModStat[type] = value;
}

int16 CMobEntity::getMobMod(uint16 type)
{
    return m_mobModStat[type];
}

void CMobEntity::addMobMod(uint16 type, int16 value)
{
    m_mobModStat[type] += value;
}

void CMobEntity::defaultMobMod(uint16 type, int16 value)
{
    if(m_mobModStat[type] == 0)
    {
        m_mobModStat[type] = value;
    }
}

void CMobEntity::resetMobMod(uint16 type)
{
    m_mobModStat[type] = m_mobModStatSave[type];
}

int32 CMobEntity::getBigMobMod(uint16 type)
{
    return getMobMod(type) * 1000;
}

void CMobEntity::saveMobModifiers()
{
    m_mobModStatSave = m_mobModStat;
}

void CMobEntity::restoreMobModifiers()
{
    m_mobModStat = m_mobModStatSave;
}

void CMobEntity::HideModel(bool hide)
{
    if(hide)
    {
        // I got this from ambush antlion
        // i'm not sure if this is right
        m_flags |= 0x80;
    }
    else
    {
        m_flags &= ~0x80;
    }
}

bool CMobEntity::IsModelHidden()
{
    return (m_flags & 0x80) == 0x80;
}

void CMobEntity::HideHP(bool hide)
{
    if (hide)
    {
        m_flags |= 0x100;
    }
    else
    {
        m_flags &= ~0x100;
    }
    updatemask |= UPDATE_HP;
}

bool CMobEntity::IsHPHidden()
{
    return (m_flags & 0x100) == 0x100;
}


void CMobEntity::CallForHelp(bool call)
{
    if (call)
    {
        m_flags |= 0x20;
    }
    else
    {
        m_flags &= ~0x20;
    }
    updatemask |= UPDATE_HP;
}

bool CMobEntity::CalledForHelp()
{
    return (m_flags & 0x20) == 0x20;
}

void CMobEntity::Untargetable(bool untargetable)
{
    if (untargetable)
    {
        m_flags |= 0x800;
    }
    else
    {
        m_flags &= ~0x800;
    }
    updatemask |= UPDATE_HP;
}

bool CMobEntity::IsUntargetable()
{
    return (m_flags & 0x800) == 0x800;
}

void CMobEntity::UpdateEntity()
{
    if (loc.zone && updatemask)
    {
        loc.zone->PushPacket(this, CHAR_INRANGE, new CEntityUpdatePacket(this, ENTITY_UPDATE, updatemask));
        updatemask = 0;
    }
}

float CMobEntity::GetRoamDistance()
{
    return (float)getMobMod(MOBMOD_ROAM_DISTANCE) / 10.0f;
}

float CMobEntity::GetRoamRate()
{
    return (float)getMobMod(MOBMOD_ROAM_RATE) / 10.0f;
}
