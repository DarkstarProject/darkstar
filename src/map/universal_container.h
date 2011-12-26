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

#ifndef _CUNIVERSALCONTAINER_H
#define _CUNIVERSALCONTAINER_H

#include "../common/cbasetypes.h"


enum UCONTAINERTYPE
{
	UCONTAINER_EMPTY,
	UCONTAINER_SYNTES,
	UCONTAINER_FISHING,
	UCONTAINER_SHOP,
	UCONTAINER_PC_TRADE,
	UCONTAINER_NPC_TRADE,
	UCONTAINER_USEITEM,
    UCONTAINER_AUCTION
};

#define UCONTAINER_SIZE		16

/************************************************************************
*																		*
*  Универсальный контейнер общего назначения							*
*																		*
************************************************************************/

// скорее всего понадобятся:
// главный предмет (gil, кристалл, используемый предмет ...)
// цель обмена (npc, персонаж)

class CUContainer
{
public:

	CUContainer();

	UCONTAINERTYPE	GetType();

	void	SetType(UCONTAINERTYPE Type);
	void	SetItem(uint8 slotID, CItem* PItem);

	void	Clean();
	bool	IsContainerEmpty();

	CItem*	GetItem(uint8 slotID);

private:

	UCONTAINERTYPE	m_ContainerType;
	
	CItem*  m_PItem[UCONTAINER_SIZE];
};

#endif