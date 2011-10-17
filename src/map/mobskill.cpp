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
#include "mobskill.h"

CMobSkill::CMobSkill(uint16 id)
{
	m_ID = id;
	m_FamilyID= 0;
	m_Aoe = 0;
	m_SkillType = 0;
	m_Critical  = 0;
	m_name = "";
	m_Distance = 0;
	m_Flag = 0;
	m_Effect = 0;
	m_Element = 0;
}
	
void CMobSkill::setID(uint16 id)
{
	m_ID = id;
}

void CMobSkill::setSkillType(uint8 id)
{
	m_SkillType = id;
}

void CMobSkill::setfamilyID(uint16 familyID)
{
	m_FamilyID = familyID;
}

void CMobSkill::setElement(uint8 element)
{
	m_Element = element;
}

const int8* CMobSkill::getName()
{
	return m_name.c_str();
}

void CMobSkill::setCritical(uint8 critical)
{
	m_Critical = critical;
}

void CMobSkill::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

void CMobSkill::setAoe(uint8 aoe)
{
	m_Aoe = aoe;
}

void CMobSkill::setNumHits(uint8 numHits) 
{
	m_NumHits = numHits;
}

void CMobSkill::setDistance(float distance)
{
	m_Distance = distance;
}

void CMobSkill::setFlag(uint8 flag)
{
	m_Flag = flag;
}

void CMobSkill::setEffect(uint16 effect)
{
	m_Effect = effect;
}

uint16 CMobSkill::getID()
{
	return m_ID;
}

uint16 CMobSkill::getfamilyID()
{
	return m_FamilyID;
}

uint8 CMobSkill::getSkillType()
{
	return m_SkillType;
}

uint8 CMobSkill::getCritical()
{
	return m_Critical;
}

uint16 CMobSkill::getEffect()
{
	return m_Effect;
}

uint8 CMobSkill::getNumHits()
{
	return m_NumHits;
}

uint8 CMobSkill::getFlag()
{
	return m_Flag; 
}

uint8 CMobSkill::getAoe()
{
	return m_Aoe;
}

float CMobSkill::getDistance()
{
	return m_Distance;
}

uint8 CMobSkill::getElement()
{
	return m_Element;
}


