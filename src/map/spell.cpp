/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

	m_MPCost = 0;
	m_CastTime = 0;
	m_RecastTime = 0;
	m_AnimationID = 0;
	m_SpellGroup = SPELLGROUP_NONE;	

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

uint16 CSpell::getCastTime()
{
	return m_CastTime;
}

void CSpell::setCastTime(uint16 CastTime)
{
	m_CastTime = CastTime;
}

uint8 CSpell::getRecastTime()
{
	return m_RecastTime;
}

void CSpell::setRecastTime(uint8 RecastTime)
{
	m_RecastTime = RecastTime;
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
	return m_SpellGroup;
}

void CSpell::setSpellGroup(SPELLGROUP SpellGroup)
{
	m_SpellGroup = SpellGroup;
}

uint16 CSpell::getAnimationID()
{
	return m_AnimationID;
}

void CSpell::setAnimationID(uint16 AnimationID)
{
	m_AnimationID = AnimationID;
}

uint16 CSpell::getMPCost()
{
	return m_MPCost;
}

void CSpell::setMPCost(uint16 MP)
{
	m_MPCost = MP;
}

bool CSpell::isAOE()
{
	return m_isAOE;
}

void CSpell::setAOE(uint8 AOE)
{
	m_isAOE = (AOE != 0);
}

// Added base damage and effect to spell.

uint16 CSpell::getBase()
{
	return m_base;
}

void CSpell::setBase(uint16 base)
{
	m_base = base;
}

uint8 CSpell::getEffect()
{
	return m_effect;
}

void CSpell::setEffect(uint8 effect)
{
	m_effect = effect;
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

uint16 CSpell::getElement()
{
	return m_element;
}

void CSpell::setElement(uint16 element)
{
	m_element = element;
}