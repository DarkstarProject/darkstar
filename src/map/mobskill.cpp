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
#include "mobskill.h"

CMobSkill::CMobSkill(uint16 id)
{
	m_ID = id;
	m_AnimID = 0;
	m_Aoe = 0;
    m_Distance = 0;
	m_TotalTargets = 1;
	m_Flag = 0;
    m_ValidTarget = 0;
    m_AnimationTime = 0;
    m_ActivationTime = 0;
	m_Message = 0;
    m_Param = 0;
    m_skillchain = 0;
}

bool CMobSkill::hasMissMsg()
{
  return m_Message == 158 || m_Message == 188 || m_Message == 31 || m_Message == 30;
}

bool CMobSkill::isAoE()
{
  return m_Aoe > 0 && m_Aoe < 4;
}

bool CMobSkill::isConal()
{
  return m_Aoe == 4;
}

bool CMobSkill::isSingle()
{
  return m_Aoe == 0;
}

bool CMobSkill::isTwoHour()
{
  // flag means this skill is a real two hour
  return m_Flag & SKILLFLAG_TWO_HOUR;
}

void CMobSkill::setID(uint16 id)
{
	m_ID = id;
}

void CMobSkill::setMsg(uint16 msg)
{
	m_Message = msg;
}

void CMobSkill::setTotalTargets(uint16 targets)
{
    m_TotalTargets = targets;
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

void CMobSkill::setTP(int16 tp)
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

uint16 CMobSkill::getAnimationID()
{
	return m_AnimID;
}

uint16 CMobSkill::getPetAnimationID()
{
  // levi
  if(m_AnimID >= 552 && m_AnimID <= 560){
    return m_AnimID - 488;
  }
  // garuda
  if(m_AnimID >= 565 && m_AnimID <= 573){
    return m_AnimID - 485;
  }
  // titan
  if(m_AnimID >= 539 && m_AnimID <= 547){
    return m_AnimID - 491;
  }
  // ifrit
  if(m_AnimID >= 526 && m_AnimID <= 534){
    return m_AnimID - 494;
  }
  // fenrir
  if(m_AnimID >= 513 && m_AnimID <= 521){
    return m_AnimID - 497;
  }
  // shiva
  if(m_AnimID >= 578 && m_AnimID <= 586){
    return m_AnimID - 482;
  }
  // rumah
  if(m_AnimID >= 591 && m_AnimID <= 599){
    return m_AnimID - 479;
  }
  // carbuncle
  if(m_AnimID >= 605 && m_AnimID <= 611){
    return m_AnimID - 605;
  }

  // wyvern
  if (m_AnimID >= 621 && m_AnimID <= 632) {
      return m_AnimID - 493;
  }

  return m_AnimID;
}

int16 CMobSkill::getTP()
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

uint16 CMobSkill::getMsgForAction()
{
  uint16 id = getID();
    uint16 messageid = 256 + id;
    uint8 flag = getFlag();
    if (flag == SKILLFLAG_WS)
    {
        // Fomor weaponskills
        // the actual message is a player ability
        // messageid for 3825 should be 241
        // so 3825 - 3584 = 241, etc
        if (id >= 3825)
            messageid = id - 3584;
        else
            messageid = id;
    }
    return messageid;
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
            return 282;
        case 189:
            return 283;
        case 225:
            return 366;
        case 226:
            return 226; //no message for this... I guess there is no aoe TP drain move
        case 103: //recover hp
        case 102: //recover hp
        case 238: //recover hp
        case 306: //recover hp
        case 318: //recover hp
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
        case 224: //recovers mp
          return 276;
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

float CMobSkill::getRadius()
{
  if(m_Aoe == 2)
  {
    // centered around target, usually 8'
    return 8.0f;
  }

  return m_Distance;
}

int16 CMobSkill::getParam()
{
  return m_Param;
}

uint8 CMobSkill::getKnockback()
{
    return m_knockback;
}

bool CMobSkill::isDamageMsg()
{
  return m_Message == 110 || m_Message == 185 || m_Message == 197 || m_Message == 264 || m_Message == 187 || m_Message == 225 || m_Message == 226;
}

void CMobSkill::setParam(int16 value)
{
  m_Param = value;
}

void CMobSkill::setKnockback(uint8 knockback)
{
    m_knockback = knockback;
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

uint8 CMobSkill::getSkillchain()
{
    return m_skillchain;
}

void CMobSkill::setSkillchain(uint8 skillchain)
{
    m_skillchain = skillchain;
}
