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

#include "ability.h"


CAbility::CAbility(uint16 id)
{
	m_ID = id;
}
	
void CAbility::setID(uint16 id)
{
	m_ID = id;
}

uint16 CAbility::getID()
{
	return m_ID;
}

void CAbility::setJob(JOBTYPE Job)
{
	m_Job = Job;
}

JOBTYPE	CAbility::getJob()
{
	return m_Job;
}

void CAbility::setLevel(uint8 level)
{
	m_level = level;
}
	
uint8 CAbility::getLevel()
{
	return m_level;
}

void CAbility::setRange(uint8 range)
{
	m_range = range;
}
	
uint8 CAbility::getRange()
{
	return m_range;
}

void CAbility::setAOE(uint8 aoe)
{
	m_aoe = aoe;
}
	
uint8 CAbility::getAOE()
{
	return m_aoe;
}

void CAbility::setAnimationID(uint8 animationID)
{
	m_animationID = animationID;
}
	
uint8 CAbility::getAnimationID()
{
	return m_animationID;
}

void CAbility::setRecastTime(uint16 recastTime)
{
	m_recastTime =  recastTime;
}
	
uint16 CAbility::getRecastTime()
{
	return m_recastTime;
}

void CAbility::setValidTarget(uint8 validTarget)
{
	m_validTarget = validTarget;
}
	
uint8 CAbility::getValidTarget()
{
	return m_validTarget;
}



const int8* CAbility::getName()
{
	return m_name.c_str();
}

void CAbility::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

uint16 CAbility::getRecastId()
{
	return m_recastId;
}

void CAbility::setRecastId(uint16 recastId)
{
	m_recastId = recastId;
}

void CAbility::setCE(uint16 CE)
{
	m_CE = CE;
}

uint16 CAbility::getCE()
{
	return m_CE;
}

void CAbility::setVE(uint16 VE)
{
	m_VE = VE;
}

uint16 CAbility::getVE()
{
	return m_VE;
}