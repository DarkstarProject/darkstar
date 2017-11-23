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

#include "../../common/utils.h"

#include "item_usable.h"

#include "../vana_time.h"
#include "../map.h"

CItemUsable::CItemUsable(std::uint16_t id) : CItem(id)
{
	setType(ITEM_USABLE);

	m_UseDelay		 = 0;
	m_MaxCharges	 = 0;
	m_Animation		 = 0;
	m_AnimationTime	 = 0;
	m_ActivationTime = 0;
	m_ValidTarget	 = 0;
	m_ReuseDelay	 = 0;
    m_AssignTime     = 0;
    m_AoE            = 0;
}

CItemUsable::~CItemUsable()
{
}

void CItemUsable::setUseDelay(std::uint8_t UseDelay)
{
	m_UseDelay = UseDelay;
}

std::uint8_t CItemUsable::getUseDelay()
{
	return m_UseDelay;
}

void CItemUsable::setReuseDelay(std::uint32_t ReuseDelay)
{
	m_ReuseDelay = ReuseDelay;
}

std::uint32_t CItemUsable::getReuseDelay()
{
	return m_ReuseDelay;
}

void CItemUsable::setLastUseTime(std::uint32_t LastUseTime)
{
	WBUFL(m_extra, 0x04) = LastUseTime;
}

std::uint32_t CItemUsable::getLastUseTime()
{
	return RBUFL(m_extra, 0x04);
}

std::uint32_t CItemUsable::getNextUseTime()
{
    return getLastUseTime() + m_ReuseDelay;
}

void CItemUsable::setCurrentCharges(std::uint8_t CurrCharges)
{
	WBUFB(m_extra, 0x01) = std::clamp<std::uint8_t>(CurrCharges, 0, m_MaxCharges);
}

std::uint8_t CItemUsable::getCurrentCharges()
{
    return RBUFB(m_extra, 0x01);
}

void CItemUsable::setMaxCharges(std::uint8_t MaxCharges)
{
	m_MaxCharges = MaxCharges;
}

std::uint8_t CItemUsable::getMaxCharges()
{
	return m_MaxCharges;
}

void CItemUsable::setAnimationID(std::uint16_t Animation)
{
	m_Animation = Animation;
}

std::uint16_t CItemUsable::getAnimationID()
{
	return m_Animation;
}

void CItemUsable::setAnimationTime(std::uint16_t AnimationTime)
{
	m_AnimationTime = AnimationTime;
}

std::uint16_t CItemUsable::getAnimationTime()
{
	return m_AnimationTime;
}

void CItemUsable::setActivationTime(std::uint16_t ActivationTime)
{
	m_ActivationTime = ActivationTime;
}

std::uint16_t CItemUsable::getActivationTime()
{
	return m_ActivationTime;
}

void CItemUsable::setValidTarget(std::uint8_t ValidTarget)
{
	m_ValidTarget = ValidTarget;
}
	
std::uint8_t CItemUsable::getValidTarget() 
{
	return m_ValidTarget;
}

std::uint16_t CItemUsable::getAoE()
{ 
    return m_AoE; 
}

void CItemUsable::setAoE(std::uint16_t AoE) 
{ 
    m_AoE = AoE; 
}

/************************************************************************
*																		*
*  Время экипировки предмета (VanaTime)                                 *
*																		*
************************************************************************/

void CItemUsable::setAssignTime(std::uint32_t VanaTime)
{
    m_AssignTime = VanaTime;
}

/************************************************************************
*																		*
*  Оставшееся время до следующего использования предмета                *
*																		*
************************************************************************/

std::uint32_t CItemUsable::getReuseTime()
{
    std::uint32_t CurrentTime = CVanaTime::getInstance()->getVanaTime();
    std::uint32_t ReuseTime   = std::max(m_AssignTime + m_UseDelay, getLastUseTime() + m_ReuseDelay);

    return (ReuseTime > CurrentTime ? (ReuseTime - CurrentTime) * 1000 : 0);
}