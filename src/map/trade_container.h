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

#ifndef _CTRADECONTAINER_H
#define _CTRADECONTAINER_H

#include "../common/cbasetypes.h"

#define CONTAINER_SIZE			17	
#define TRADE_CONTAINER_SIZE	 8

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CItem;

class CTradeContainer
{
public:

	CTradeContainer();

	uint8	getType();
	uint8	getItemsCount();
	uint8	getSlotCount();									// количество занятых ячеек
	uint32	getTotalQuantity();								// общее количество предметов (gil считаются за 1)
	CItem*	getItem(uint8 slotID);
	uint16	getItemID(uint8 slotID);						
	uint8	getInvSlotID(uint8 slotID);
	uint32	getQuantity(uint8 slotID);						// количество предметов в ячейке
	uint32	getItemQuantity(uint16 itemID);					// количество предметов одного типа

	void	setType(uint8 type);
	void	setItemsCount(uint8 count);
	void	setItem(uint8 slotID, CItem* item);
	void	setItemID(uint8 slotID, uint16 itemID);
	void	setInvSlotID(uint8 slotID, uint8 invSlotID);
	void	setQuantity(uint8 slotID, uint32 quantity);
	void	setItem(uint8 slotID, uint16 itemID, uint8 invSlotID, uint32 quantity, CItem* item = NULL);

	void	Clean();										// отчищаем контейнер

private:

	uint8	m_type;											// тип контейнера (тип кристалла, нация магазина и т.д.)
	uint8	m_ItemsCount;									// количество предметов в контейнере (устанавливаем самостоятельно)

	CItem*  m_PItem[CONTAINER_SIZE];
	uint8	m_slotID[CONTAINER_SIZE];
	uint16	m_itemID[CONTAINER_SIZE];
	uint32	m_quantity[CONTAINER_SIZE];
};

#endif