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
#include "weapon_skill.h"

CWeaponSkill::CWeaponSkill(uint16 id)
{
	m_ID = id;
	m_AnimationId = 0;
	m_AOE = 0;
	//m_JobSkills[0] = 0;
	m_Skilllevel =0; 
	m_SkillTypeID = 0;
	m_name = "";
	m_Range = 0;
	m_SkillChain = 0;
	memset(m_Job, 0, sizeof(m_Job));
}
	
void CWeaponSkill::setID(uint16 id)
{
	m_ID = id;
}

void CWeaponSkill::setSkillType(uint8 id)
{
	m_SkillTypeID = id;
}

void CWeaponSkill::setJob(int8* jobs)
{
	memcpy(&m_Job[1], jobs, 20);
}

void CWeaponSkill::setSkillLevel(uint8 level)
{
	m_Skilllevel = level;
}

const int8* CWeaponSkill::getName()
{
	return m_name.c_str();
}

void CWeaponSkill::setSkillChain(uint8 skillChain)
{
	m_SkillChain = skillChain;
}

void CWeaponSkill::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

void CWeaponSkill::setAnimationId(int8 id) 
{
	m_AnimationId = id;
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

uint8 CWeaponSkill::getSkillType()
{
	return m_SkillTypeID;
}

uint8 CWeaponSkill::getJob(JOBTYPE job)
{
	return m_Job[job];
}

uint8 CWeaponSkill::getSkillLevel()
{
	return m_Skilllevel;
}

uint8 CWeaponSkill::getSkillChain()
{
	return m_SkillChain;
}

uint8 CWeaponSkill::getAnimationId()
{
	return m_AnimationId; 
}

uint8 CWeaponSkill::getAoe()
{
	return m_AOE;
}

uint8 CWeaponSkill::getRange()
{
	return m_Range;
}

int32 CWeaponSkill::hasElement(ELEMENTS element)
{
	return (m_SkillChain & element);
}


