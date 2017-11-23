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

CWeaponSkill::CWeaponSkill(std::uint16_t id)
{
	m_ID = id;

	m_AnimationId = 0;
	m_AOE         = 0;
	m_Skilllevel  = 0;
	m_TypeID      = 0;
	m_Range       = 0;
	m_PrimarySkillchain   = SC_NONE;
    m_SecondarySkillchain = SC_NONE;
    m_TertiarySkillchain  = SC_NONE;
    m_mainOnly = 0;

	memset(m_Job, 0, sizeof(m_Job));
}

void CWeaponSkill::setID(std::uint16_t id)
{
	m_ID = id;
}

void CWeaponSkill::setType(std::uint8_t type)
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

void CWeaponSkill::setMainOnly(std::uint8_t main)
{
    m_mainOnly = main;
}

void CWeaponSkill::setUnlockId(std::uint8_t id)
{
    m_unlockId = id;
}

void CWeaponSkill::setJob(std::int8_t* jobs)
{
	memcpy(&m_Job[1], jobs, 22);
}

void CWeaponSkill::setSkillLevel(std::uint16_t level)
{
	m_Skilllevel = level;
}

const std::int8_t* CWeaponSkill::getName()
{
	return (const std::int8_t*)m_name.c_str();
}

void CWeaponSkill::setElement(std::uint8_t element)
{
    m_Element = element;
}

void CWeaponSkill::setPrimarySkillchain(std::uint8_t skillchain)
{
	m_PrimarySkillchain = skillchain;
}

void CWeaponSkill::setSecondarySkillchain(std::uint8_t skillchain)
{
    m_SecondarySkillchain = skillchain;
}

void CWeaponSkill::setTertiarySkillchain(std::uint8_t skillchain)
{
    m_TertiarySkillchain = skillchain;
}

void CWeaponSkill::setName(std::int8_t* name)
{
	m_name.clear();
	m_name.insert(0, (const char*)name);
}

void CWeaponSkill::setAnimationId(std::int8_t id)
{
	m_AnimationId = id;
}

void CWeaponSkill::setAnimationTime(duration time)
{
    m_AnimationTime = time;
}

void CWeaponSkill::setAoe(std::uint8_t aoe)
{
	m_AOE = aoe;
}

void CWeaponSkill::setRange(std::uint8_t range)
{
	m_Range = range;
}

std::uint16_t CWeaponSkill::getID()
{
	return m_ID;
}

std::uint8_t CWeaponSkill::getType()
{
	return m_TypeID;
}

std::uint8_t CWeaponSkill::getUnlockId()
{
    return m_unlockId;
}

std::uint8_t CWeaponSkill::getJob(JOBTYPE job)
{
	return m_Job[job];
}

std::uint16_t CWeaponSkill::getSkillLevel()
{
	return m_Skilllevel;
}

std::uint8_t CWeaponSkill::getElement()
{
	return m_Element;
}

bool CWeaponSkill::isElemental()
{
    return m_Element != 0;
}

std::uint8_t CWeaponSkill::getAnimationId()
{
	return m_AnimationId;
}

duration CWeaponSkill::getAnimationTime()
{
    return m_AnimationTime;
}

std::uint8_t CWeaponSkill::getAoe()
{
	return m_AOE;
}

std::uint8_t CWeaponSkill::getRange()
{
	return m_Range;
}

std::uint8_t CWeaponSkill::getPrimarySkillchain()
{
    return m_PrimarySkillchain;
}

std::uint8_t CWeaponSkill::getSecondarySkillchain()
{
    return m_SecondarySkillchain;
}

std::uint8_t CWeaponSkill::getTertiarySkillchain()
{
    return m_TertiarySkillchain;
}