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
#include "trust_weaponskill.h"

CTrustWeaponSkill::CTrustWeaponSkill(uint16 id)
{
	m_ID = id;
	m_AnimID = 0;
    m_Mlvl = 0;
	m_Aoe = 0;
    m_Distance = 0;
	m_TotalTargets = 1;
	m_Flag = 0;
    m_ValidTarget = 0;
    m_ActivationTime = 0;
	m_Message = 0;
    m_Param = 0;
    m_primarySkillchain = 0;
    m_secondarySkillchain = 0;
    m_tertiarySkillchain = 0;
    m_TP = 0;
    m_HPP = 0;
    m_knockback = 0;
    m_name = "";
}

bool CTrustWeaponSkill::hasMissMsg() const
{
  return m_Message == 158 || m_Message == 188 || m_Message == 31 || m_Message == 30;
}

bool CTrustWeaponSkill::isAoE() const
{
  return m_Aoe > 0 && m_Aoe < 4;
}

bool CTrustWeaponSkill::isConal() const
{
  return m_Aoe == 4;
}

bool CTrustWeaponSkill::isSingle() const
{
  return m_Aoe == 0;
}

void CTrustWeaponSkill::setID(uint16 id)
{
	m_ID = id;
}

void CTrustWeaponSkill::setMsg(uint16 msg)
{
	m_Message = msg;
}

void CTrustWeaponSkill::setTotalTargets(uint16 targets)
{
    m_TotalTargets = targets;
}

void CTrustWeaponSkill::setAnimationID(uint16 animID)
{
	m_AnimID = animID;
}

const int8* CTrustWeaponSkill::getName() const
{
	return (const int8*)m_name.c_str();
}

void CTrustWeaponSkill::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0, (const char*)name);
}

void CTrustWeaponSkill::setAoe(uint8 aoe)
{
	m_Aoe = aoe;
}

void CTrustWeaponSkill::setDistance(float distance)
{
	m_Distance = distance;
}

void CTrustWeaponSkill::setFlag(uint8 flag)
{
	m_Flag = flag;
}

void CTrustWeaponSkill::setTP(int16 tp)
{
	m_TP = tp;
}

void CTrustWeaponSkill::setHPP(uint8 hpp)
{
    m_HPP = hpp;
}

void CTrustWeaponSkill::setAnimationTime(duration time)
{
    m_AnimationTime = time;
}

void CTrustWeaponSkill::setActivationTime(uint16 ActivationTime)
{
    m_ActivationTime = ActivationTime;
}

void CTrustWeaponSkill::setValidTargets(uint16 targ)
{
    m_ValidTarget = targ;
}


uint16 CTrustWeaponSkill::getID() const
{
	return m_ID;
}

uint16 CTrustWeaponSkill::getMLvl() const
{
    return m_Mlvl;
}

uint16 CTrustWeaponSkill::getAnimationID() const
{
	return m_AnimID;
}

int16 CTrustWeaponSkill::getTP() const
{
    return m_TP;
}

uint8 CTrustWeaponSkill::getHPP() const
{
    return m_HPP;
}

uint16 CTrustWeaponSkill::getTotalTargets() const
{
    return m_TotalTargets;
}

uint16 CTrustWeaponSkill::getMsg() const
{
    return m_Message;
}

uint16 CTrustWeaponSkill::getMsgForAction() const
{
    return getID();
}

uint16 CTrustWeaponSkill::getAoEMsg() const
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

uint8 CTrustWeaponSkill::getFlag() const
{
	return m_Flag;
}

uint8 CTrustWeaponSkill::getAoe() const
{
	return m_Aoe;
}

float CTrustWeaponSkill::getDistance() const
{
	return m_Distance;
}

float CTrustWeaponSkill::getRadius() const
{
  if(m_Aoe == 2)
  {
    // centered around target, usually 8'
    return 8.0f;
  }

  return m_Distance;
}

int16 CTrustWeaponSkill::getParam() const
{
  return m_Param;
}

uint8 CTrustWeaponSkill::getKnockback() const
{
    return m_knockback;
}

bool CTrustWeaponSkill::isDamageMsg()
{
  return m_Message == 110 || m_Message == 185 || m_Message == 197 || m_Message == 264 || m_Message == 187 || m_Message == 225 || m_Message == 226;
}

void CTrustWeaponSkill::setParam(int16 value)
{
  m_Param = value;
}

void CTrustWeaponSkill::setKnockback(uint8 knockback)
{
    m_knockback = knockback;
}

uint16 CTrustWeaponSkill::getValidTargets() const
{
	return m_ValidTarget;
}

duration CTrustWeaponSkill::getAnimationTime() const
{
    return m_AnimationTime;
}

uint16 CTrustWeaponSkill::getActivationTime() const
{
    return m_ActivationTime;
}

uint8 CTrustWeaponSkill::getPrimarySkillchain() const
{
    return m_primarySkillchain;
}

uint8 CTrustWeaponSkill::getSecondarySkillchain() const
{
    return m_secondarySkillchain;
}

uint8 CTrustWeaponSkill::getTertiarySkillchain() const
{
    return m_tertiarySkillchain;
}

void CTrustWeaponSkill::setPrimarySkillchain(uint8 skillchain)
{
    m_primarySkillchain = skillchain;
}

void CTrustWeaponSkill::setSecondarySkillchain(uint8 skillchain)
{
    m_secondarySkillchain = skillchain;
}

void CTrustWeaponSkill::setTertiarySkillchain(uint8 skillchain)
{
    m_tertiarySkillchain = skillchain;
}