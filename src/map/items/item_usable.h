﻿/*
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

	CItemUsable(uint16);
	virtual ~CItemUsable();

	uint8	getUseDelay();
	uint8	getCurrentCharges();
	uint8	getMaxCharges();
	uint16	getAnimationID();
	uint16	getAnimationTime();
	uint16	getActivationTime();
	uint8	getValidTarget();
    uint32  getReuseTime();
	uint32	getReuseDelay();
	uint32	getLastUseTime();
    uint32  getNextUseTime();
    uint16  getAoE();

	void	setUseDelay(uint8 UseDelay);
	void	setCurrentCharges(uint8 CurrCharges);
	void	setMaxCharges(uint8 MaxCharges);
	void	setAnimationID(uint16 Animation);
	void	setAnimationTime(uint16 AnimationTime);
	void	setActivationTime(uint16 ActivationTime);
	void	setValidTarget(uint8 ValidTarget);
	void	setReuseDelay(uint32 ReuseDelay);
	void	setLastUseTime(uint32 LastUseTime);
    void    setAssignTime(uint32 VanaTime);
	void    setAoE(uint16 AoE);

private:

	uint8	m_UseDelay;         // задержка использования после экипировки 
	uint8	m_MaxCharges;       // максимальное количество зарядов предмета
	uint16	m_Animation;
	uint16	m_AnimationTime;    // время анимации для правильного отображения сообщения (эффектов)
	uint16	m_ActivationTime;   // время активации предмета во время использования
	uint8	m_ValidTarget;
	uint32	m_ReuseDelay;       // задержка между использованием предмета
    uint32  m_AssignTime;       // время экипировки предмета
    uint16  m_AoE;
};

#endif