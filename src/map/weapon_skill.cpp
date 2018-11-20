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

#include <string.h>
#include "weapon_skill.h"

CWeaponSkill::CWeaponSkill(uint16 id)
{
	m_ID = id;
    m_TypeID = 0;
    memset(m_Job, 0, sizeof(m_Job));
    m_Skilllevel = 0;
	m_AnimationId = 0;
    m_Element = 0;
    m_PrimarySkillchain = SC_NONE;
    m_SecondarySkillchain = SC_NONE;
    m_TertiarySkillchain = SC_NONE;
    m_Range = 0;
    m_AOE = 0;
    m_mainOnly = 0;
    m_unlockId = 0;
}

void CWeaponSkill::setID(uint16 id)
{
	m_ID = id;
}

void CWeaponSkill::setType(uint8 type)
{
	m_TypeID = type;
}

bool CWeaponSkill::isAoE()
{
    return m_AOE == 2;
}

bool CWeaponSkill::mainOnly()
{
    return m_mainOnly;
}

void CWeaponSkill::setMainOnly(uint8 main)
{
    m_mainOnly = main;
}

void CWeaponSkill::setUnlockId(uint8 id)
{
    m_unlockId = id;
}

void CWeaponSkill::setJob(int8* jobs)
{
	memcpy(&m_Job[1], jobs, 22);
}

void CWeaponSkill::setSkillLevel(uint16 level)
{
	m_Skilllevel = level;
}

const int8* CWeaponSkill::getName()
{
	return (const int8*)m_name.c_str();
}

void CWeaponSkill::setElement(uint8 element)
{
    m_Element = element;
}

void CWeaponSkill::setPrimarySkillchain(uint8 skillchain)
{
	m_PrimarySkillchain = skillchain;
}

void CWeaponSkill::setSecondarySkillchain(uint8 skillchain)
{
    m_SecondarySkillchain = skillchain;
}

void CWeaponSkill::setTertiarySkillchain(uint8 skillchain)
{
    m_TertiarySkillchain = skillchain;
}

void CWeaponSkill::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0, (const char*)name);
}

void CWeaponSkill::setAnimationId(int8 id)
{
	m_AnimationId = id;
}

void CWeaponSkill::setAnimationTime(duration time)
{
    m_AnimationTime = time;
}

void CWeaponSkill::setAoe(uint8 aoe)
{
	m_AOE = aoe;
}

void CWeaponSkill::setRange(uint8 range)
{
	m_Range = range;
}

uint16 CWeaponSkill::getID()
{
	return m_ID;
}

uint8 CWeaponSkill::getType()
{
	return m_TypeID;
}

uint8 CWeaponSkill::getUnlockId()
{
    return m_unlockId;
}

uint8 CWeaponSkill::getJob(JOBTYPE job)
{
	return m_Job[job];
}

uint16 CWeaponSkill::getSkillLevel()
{
	return m_Skilllevel;
}

uint8 CWeaponSkill::getElement()
{
	return m_Element;
}

bool CWeaponSkill::isElemental()
{
    return m_Element != 0;
}

uint8 CWeaponSkill::getAnimationId()
{
	return m_AnimationId;
}

duration CWeaponSkill::getAnimationTime()
{
    return m_AnimationTime;
}

uint8 CWeaponSkill::getAoe()
{
	return m_AOE;
}

uint8 CWeaponSkill::getRange()
{
	return m_Range;
}

uint8 CWeaponSkill::getPrimarySkillchain()
{
    return m_PrimarySkillchain;
}

uint8 CWeaponSkill::getSecondarySkillchain()
{
    return m_SecondarySkillchain;
}

uint8 CWeaponSkill::getTertiarySkillchain()
{
    return m_TertiarySkillchain;
}