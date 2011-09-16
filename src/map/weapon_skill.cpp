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

#include "weapon_skill.h"


CWeaponSkill::CWeaponSkill(uint16 id)
{
	m_ID = id;

	memset(m_JobSkills, 0, sizeof(m_JobSkills));
}
	
void CWeaponSkill::setID(uint16 id)
{
	m_ID = id;
}

uint16 CWeaponSkill::getID()
{
	return m_ID;
}

void CWeaponSkill::setSkillType(uint8 id)
{
	m_SkillTypeID = id;
}

uint8 CWeaponSkill::getSkillType()
{
	return m_SkillTypeID;
}

void CWeaponSkill::setJob(int8* jobs)
{
	memcpy(&m_JobSkills[1], jobs, 20);
}

uint8 CWeaponSkill::getJob(JOBTYPE job)
{
	return m_JobSkills[job];
}

void CWeaponSkill::setSkillLevel(uint8 level)
{
	m_Skilllevel = level;
}
	
uint8 CWeaponSkill::getSkillLevel()
{
	return m_Skilllevel;
}

const int8* CWeaponSkill::getName()
{
	return m_name.c_str();
}

uint32 CWeaponSkill::getSkillChain()
{
	return m_SkillChain;
}

void CWeaponSkill::setSkillChain(uint32 skillChain)
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

uint8 CWeaponSkill::getAnimationId()
{
	return m_AnimationId; 
}

void CWeaponSkill::setAoe(uint8 aoe) 
{
	m_AOE = aoe;
}

uint8 CWeaponSkill::getAoe()
{
	return m_AOE;
}

void CWeaponSkill::setRange(uint8 range)
{
	m_Rande = range;
}

uint8 CWeaponSkill::getRange()
{
	return m_Rande;
}