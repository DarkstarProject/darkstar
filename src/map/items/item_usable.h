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

#ifndef _CITEMUSABLE_H
#define _CITEMUSABLE_H

#include "../../common/cbasetypes.h"

#include "item.h"

class CItemUsable : public CItem
{
public:

	CItemUsable(std::uint16_t);
	virtual ~CItemUsable();

	std::uint8_t	getUseDelay();
	std::uint8_t	getCurrentCharges();
	std::uint8_t	getMaxCharges();
	std::uint16_t	getAnimationID();
	std::uint16_t	getAnimationTime();
	std::uint16_t	getActivationTime();
	std::uint8_t	getValidTarget();
    std::uint32_t  getReuseTime();
	std::uint32_t	getReuseDelay();
	std::uint32_t	getLastUseTime();
    std::uint32_t  getNextUseTime();
    std::uint16_t  getAoE();

	void	setUseDelay(std::uint8_t UseDelay);
	void	setCurrentCharges(std::uint8_t CurrCharges);
	void	setMaxCharges(std::uint8_t MaxCharges);
	void	setAnimationID(std::uint16_t Animation);
	void	setAnimationTime(std::uint16_t AnimationTime);
	void	setActivationTime(std::uint16_t ActivationTime);
	void	setValidTarget(std::uint8_t ValidTarget);
	void	setReuseDelay(std::uint32_t ReuseDelay);
	void	setLastUseTime(std::uint32_t LastUseTime);
    void    setAssignTime(std::uint32_t VanaTime);
	void    setAoE(std::uint16_t AoE);

private:

	std::uint8_t	m_UseDelay;         // задержка использования после экипировки 
	std::uint8_t	m_MaxCharges;       // максимальное количество зарядов предмета
	std::uint16_t	m_Animation;
	std::uint16_t	m_AnimationTime;    // время анимации для правильного отображения сообщения (эффектов)
	std::uint16_t	m_ActivationTime;   // время активации предмета во время использования
	std::uint8_t	m_ValidTarget;
	std::uint32_t	m_ReuseDelay;       // задержка между использованием предмета
    std::uint32_t  m_AssignTime;       // время экипировки предмета
    std::uint16_t  m_AoE;
};

#endif