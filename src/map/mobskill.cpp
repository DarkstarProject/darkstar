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
#include "mobskill.h"

CMobSkill::CMobSkill(uint16 id)
{
	m_ID = id;
	m_FamilyID= 0;
	m_AnimID = 0;
	m_Aoe = 0;
    m_Distance = 0;
	m_TotalTargets = 1;
	m_Flag = 0;
    m_ValidTarget = 0;
    m_AnimationTime = 0;
    m_ActivationTime = 0;
	m_Message = 0;
}

void CMobSkill::setID(uint16 id)
{
	m_ID = id;
}

void CMobSkill::resetMsg()
{
  m_Message = 185;
}

void CMobSkill::setMsg(uint16 msg)
{
	m_Message = msg;
}

void CMobSkill::setTotalTargets(uint16 targets)
{
    m_TotalTargets = targets;
}

void CMobSkill::setfamilyID(uint16 familyID)
{
	m_FamilyID = familyID;
}

void CMobSkill::setAnimationID(uint16 animID)
{
	m_AnimID = animID;
}

const int8* CMobSkill::getName()
{
	return m_name.c_str();
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

void CMobSkill::setDistance(float distance)
{
	m_Distance = distance;
}

void CMobSkill::setFlag(uint8 flag)
{
	m_Flag = flag;
}

void CMobSkill::setTP(uint16 tp)
{
	m_TP = tp;
}

void CMobSkill::setAnimationTime(uint16 AnimationTime)
{
    m_AnimationTime = AnimationTime;
}

void CMobSkill::setActivationTime(uint16 ActivationTime)
{
    m_ActivationTime = ActivationTime;
}

void CMobSkill::setValidTargets(uint16 targ)
{
    m_ValidTarget = targ;
}


uint16 CMobSkill::getID()
{
	return m_ID;
}

uint16 CMobSkill::getfamilyID()
{
	return m_FamilyID;
}

uint16 CMobSkill::getAnimationID()
{
	return m_AnimID;
}

uint16 CMobSkill::getTP()
{
	return m_TP;
}

uint16 CMobSkill::getTotalTargets()
{
    return m_TotalTargets;
}

uint16 CMobSkill::getMsg()
{
	return m_Message;
}

uint16 CMobSkill::getAoEMsg()
{

    switch(m_Message){
        case 185:
            return 264;
        case 186:
            return 266;
        case 187:
            return 281;
        case 188:
            return 63;
        case 189:
            return 283;
        case 225:
            return 366;
        case 226:
            return 226; //no message for this... I guess there is no aoe TP drain move
        case 238:
            return 24;
        case 242:
            return 277;
        case 243:
            return 278;
        case 284:
            return 284; //already the aoe message
        case 370:
            return 404;
        case 362:
            return 363;
        case 378:
            return 343;
        default:
            return m_Message;
    }
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

uint16 CMobSkill::getValidTargets()
{
	return m_ValidTarget;
}

uint16 CMobSkill::getAnimationTime()
{
    return m_AnimationTime;
}

uint16 CMobSkill::getActivationTime()
{
    return m_ActivationTime;
}