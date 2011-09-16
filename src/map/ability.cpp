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

const int8* CAbility::getName()
{
	return m_name.c_str();
}

void CAbility::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}