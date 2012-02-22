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

#include <string.h>

#include "spell.h"

CSpell::CSpell(uint16 id)
{
	m_ID = id;

	m_mpCost        = 0;
	m_castTime      = 0;
	m_recastTime    = 0;
	m_animation     = 0;
    m_animationTime = 0;
    m_message       = 0;
    m_element       = 0;
	m_spellGroup    = SPELLGROUP_NONE;
	
	memset(m_job, 0, sizeof(m_job));
}
	
void CSpell::setID(uint16 id)
{
	m_ID = id;
}

uint16 CSpell::getID()
{
	return m_ID;
}

uint8 CSpell::getJob(JOBTYPE JobID)
{
	return (m_job[JobID] == CANNOT_USE_SPELL ? 255 : m_job[JobID]);
}

void CSpell::setJob(int8* jobs)
{
	memcpy(&m_job[1], jobs, 20);
}

uint32 CSpell::getCastTime()
{
	return m_castTime;
}

void CSpell::setCastTime(uint32 CastTime)
{
	m_castTime = CastTime;
}

uint32 CSpell::getRecastTime()
{
	return m_recastTime;
}

void CSpell::setRecastTime(uint32 RecastTime)
{
	m_recastTime = RecastTime;
}

const int8* CSpell::getName()
{
	return m_name.c_str();
}

void CSpell::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

SPELLGROUP CSpell::getSpellGroup()
{
	return m_spellGroup;
}

void CSpell::setSpellGroup(SPELLGROUP SpellGroup)
{
	m_spellGroup = SpellGroup;
}

uint16 CSpell::getAnimationID()
{
	return m_animation;
}

void CSpell::setAnimationID(uint16 AnimationID)
{
	m_animation = AnimationID;
}

uint16 CSpell::getAnimationTime()
{
    return m_animationTime;
}

void CSpell::setAnimationTime(uint16 AnimationTime)
{
    m_animationTime = AnimationTime;
}

uint16 CSpell::getMPCost()
{
	return m_mpCost;
}

void CSpell::setMPCost(uint16 MP)
{
	m_mpCost = MP;
}

bool CSpell::isAOE()
{
	return m_isAOE;
}

void CSpell::setAOE(uint8 AOE)
{
	m_isAOE = (AOE != 0);
}

uint16 CSpell::getBase()
{
	return m_base;
}

void CSpell::setBase(uint16 base)
{
	m_base = base;
}

uint8 CSpell::getValidTarget()
{
	return m_ValidTarget;
}

void CSpell::setValidTarget(uint8 ValidTarget)
{
	m_ValidTarget = ValidTarget;
}

float CSpell::getMultiplier()
{
	return m_multiplier;
}

void CSpell::setMultiplier(float multiplier)
{
	m_multiplier = multiplier;
}

uint16 CSpell::getMessage()
{
    return m_message;
}

void CSpell::setMessage(uint16 message)
{
    m_message = message;
}

uint16 CSpell::getElement()
{
	return m_element;
}

void CSpell::setElement(uint16 element)
{
	m_element = element;
}

void CSpell::setCE(uint16 ce)
{
	m_CE = ce;
}

uint16 CSpell::getCE()
{
	return m_CE;
}

void CSpell::setVE(uint16 ve)
{
	m_VE = ve;
}

uint16 CSpell::getVE()
{
	return m_VE;
}
