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

#ifndef _CUNIVERSALCONTAINER_H
#define _CUNIVERSALCONTAINER_H

#include "../common/cbasetypes.h"
#include <vector>

enum UCONTAINERTYPE
{
	UCONTAINER_EMPTY,
	UCONTAINER_SYNTES,
	UCONTAINER_FISHING,
	UCONTAINER_SHOP,
	UCONTAINER_TRADE,
	UCONTAINER_USEITEM,
    UCONTAINER_AUCTION,
    UCONTAINER_DELIVERYBOX
};

#define UCONTAINER_SIZE		16

/************************************************************************
*																		*
*  Универсальный контейнер общего назначения							*
*																		*
************************************************************************/

// главный предмет (gil, кристалл, используемый предмет ...)

class CItem;
class CBaseEntity;

class CUContainer
{
public:

	CUContainer();

	UCONTAINERTYPE	GetType();

    void    SetLock();
	void    UnLock();
    void    SetTarget(std::uint16_t Target);
	void	SetType(UCONTAINERTYPE Type);
	bool	SetItem(std::uint8_t slotID, CItem* PItem);
    void    SetSize(std::uint8_t size);
    void    ClearSlot(std::uint8_t slotID);

	void	Clean();
    bool    IsLocked();
	bool	IsContainerEmpty();
    bool    IsSlotEmpty(std::uint8_t slotID);

    std::uint16_t  GetTarget();
    std::uint8_t	GetItemsCount();
	CItem*	GetItem(std::uint8_t slotID);

private:

	UCONTAINERTYPE	m_ContainerType;

    bool    m_lock;
    std::uint8_t   m_count;
    std::uint16_t  m_target;
	std::vector<CItem*>  m_PItem;
};

#endif