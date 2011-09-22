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
#include "trait.h"


CTrait::CTrait(uint16 id)
{
	m_id = id;
	
	m_Level = 0; 
	m_name = "";
	m_Job = 0;
}

void CTrait::setJob(int8 job)
{
	m_Job = job;
}

void CTrait::setLevel(uint8 level)
{
	m_Level = level;
}

const int8* CTrait::getName()
{
	return m_name.c_str();
}

void CTrait::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}


uint16 CTrait::getID()
{
	return m_id;
}

int8 CTrait::getJob()
{
	return m_Job;
}

int8 CTrait::getLevel()
{
	return m_Level;
}

