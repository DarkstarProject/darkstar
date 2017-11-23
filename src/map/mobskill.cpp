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

CMobSkill::CMobSkill(std::uint16_t id)
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
    m_primarySkillchain = 0;
    m_secondarySkillchain = 0;
    m_tertiarySkillchain = 0;
    m_HPP = 0;
}

bool CMobSkill::hasMissMsg() const
{
  return m_Message == 158 || m_Message == 188 || m_Message == 31 || m_Message == 30;
}

bool CMobSkill::isAoE() const
{
  return m_Aoe > 0 && m_Aoe < 4;
}

bool CMobSkill::isConal() const
{
  return m_Aoe == 4;
}

bool CMobSkill::isSingle() const
{
  return m_Aoe == 0;
}

bool CMobSkill::isTwoHour() const
{
  // flag means this skill is a real two hour
  return m_Flag & SKILLFLAG_TWO_HOUR;
}

bool CMobSkill::isTpSkill() const
{
    return !isSpecial();
}

bool CMobSkill::isSpecial() const
{
  // means it is a ranged attack or call beast, etc..
  return m_Flag & SKILLFLAG_SPECIAL;
}

void CMobSkill::setID(std::uint16_t id)
{
	m_ID = id;
}

void CMobSkill::setMsg(std::uint16_t msg)
{
	m_Message = msg;
}

void CMobSkill::setTotalTargets(std::uint16_t targets)
{
    m_TotalTargets = targets;
}

void CMobSkill::setAnimationID(std::uint16_t animID)
{
	m_AnimID = animID;
}

const std::int8_t* CMobSkill::getName() const
{
	return (const std::int8_t*)m_name.c_str();
}

void CMobSkill::setName(std::int8_t* name)
{
	m_name.clear();
	m_name.insert(0, (const char*)name);
}

void CMobSkill::setAoe(std::uint8_t aoe)
{
	m_Aoe = aoe;
}

void CMobSkill::setDistance(float distance)
{
	m_Distance = distance;
}

void CMobSkill::setFlag(std::uint8_t flag)
{
	m_Flag = flag;
}

void CMobSkill::setTP(std::int16_t tp)
{
	m_TP = tp;
}

void CMobSkill::setHPP(std::uint8_t hpp)
{
    m_HPP = hpp;
}

void CMobSkill::setAnimationTime(std::uint16_t AnimationTime)
{
    m_AnimationTime = AnimationTime;
}

void CMobSkill::setActivationTime(std::uint16_t ActivationTime)
{
    m_ActivationTime = ActivationTime;
}

void CMobSkill::setValidTargets(std::uint16_t targ)
{
    m_ValidTarget = targ;
}


std::uint16_t CMobSkill::getID() const
{
	return m_ID;
}

std::uint16_t CMobSkill::getAnimationID() const
{
	return m_AnimID;
}

std::uint16_t CMobSkill::getPetAnimationID() const
{
    // levi
    if (m_AnimID >= 552 && m_AnimID <= 560)
    {
        return m_AnimID - 488;
    }
    // garuda
    if (m_AnimID >= 565 && m_AnimID <= 573)
    {
        return m_AnimID - 485;
    }
    // titan
    if (m_AnimID >= 539 && m_AnimID <= 547)
    {
        return m_AnimID - 491;
    }
    // ifrit
    if (m_AnimID >= 526 && m_AnimID <= 534)
    {
        return m_AnimID - 494;
    }
    // fenrir
    if (m_AnimID >= 513 && m_AnimID <= 521)
    {
        return m_AnimID - 497;
    }
    // shiva
    if (m_AnimID >= 578 && m_AnimID <= 586)
    {
        return m_AnimID - 482;
    }
    // rumah
    if (m_AnimID >= 591 && m_AnimID <= 599)
    {
        return m_AnimID - 479;
    }
    // carbuncle
    if (m_AnimID >= 605 && m_AnimID <= 611)
    {
        return m_AnimID - 605;
    }

    // wyvern
    if (m_AnimID >= 621 && m_AnimID <= 632)
    {
        return m_AnimID - 493;
    }

  return m_AnimID;
}

std::int16_t CMobSkill::getTP() const
{
    return m_TP;
}

std::uint8_t CMobSkill::getHPP() const
{
    return m_HPP;
}

std::uint16_t CMobSkill::getTotalTargets() const
{
    return m_TotalTargets;
}

std::uint16_t CMobSkill::getMsg() const
{
    return m_Message;
}

std::uint16_t CMobSkill::getMsgForAction() const
{
    return getID();
}

std::uint16_t CMobSkill::getAoEMsg() const
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

std::uint8_t CMobSkill::getFlag() const
{
	return m_Flag;
}

std::uint8_t CMobSkill::getAoe() const
{
	return m_Aoe;
}

float CMobSkill::getDistance() const
{
	return m_Distance;
}

float CMobSkill::getRadius() const
{
  if(m_Aoe == 2)
  {
    // centered around target, usually 8'
    return 8.0f;
  }

  return m_Distance;
}

std::int16_t CMobSkill::getParam() const
{
  return m_Param;
}

std::uint8_t CMobSkill::getKnockback() const
{
    return m_knockback;
}

bool CMobSkill::isDamageMsg()
{
  return m_Message == 110 || m_Message == 185 || m_Message == 197 || m_Message == 264 || m_Message == 187 || m_Message == 225 || m_Message == 226;
}

void CMobSkill::setParam(std::int16_t value)
{
  m_Param = value;
}

void CMobSkill::setKnockback(std::uint8_t knockback)
{
    m_knockback = knockback;
}

std::uint16_t CMobSkill::getValidTargets() const
{
	return m_ValidTarget;
}

std::uint16_t CMobSkill::getAnimationTime() const
{
    return m_AnimationTime;
}

std::uint16_t CMobSkill::getActivationTime() const
{
    return m_ActivationTime;
}

std::uint8_t CMobSkill::getPrimarySkillchain() const
{
    return m_primarySkillchain;
}

std::uint8_t CMobSkill::getSecondarySkillchain() const
{
    return m_secondarySkillchain;
}

std::uint8_t CMobSkill::getTertiarySkillchain() const
{
    return m_tertiarySkillchain;
}

void CMobSkill::setPrimarySkillchain(std::uint8_t skillchain)
{
    m_primarySkillchain = skillchain;
}

void CMobSkill::setSecondarySkillchain(std::uint8_t skillchain)
{
    m_secondarySkillchain = skillchain;
}

void CMobSkill::setTertiarySkillchain(std::uint8_t skillchain)
{
    m_tertiarySkillchain = skillchain;
}