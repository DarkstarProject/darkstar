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

#ifndef _CTRADECONTAINER_H
#define _CTRADECONTAINER_H

#include "../common/cbasetypes.h"
#include <vector>

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

	std::uint8_t	getType();
	std::uint8_t	getItemsCount();
	std::uint8_t	getSlotCount();									// количество занятых ячеек
	uint32	getTotalQuantity();								// общее количество предметов (gil считаются за 1)
	CItem*	getItem(std::uint8_t slotID);
	std::uint16_t	getItemID(std::uint8_t slotID);						
	std::uint8_t	getInvSlotID(std::uint8_t slotID);
	uint32	getQuantity(std::uint8_t slotID);						// количество предметов в ячейке
	std::uint8_t	getConfirmedStatus(std::uint8_t slotID);
	uint32	getItemQuantity(std::uint16_t itemID);					// количество предметов одного типа
    std::uint8_t   getSize();

	void	setType(std::uint8_t type);
	void	setItemsCount(std::uint8_t count);
	void	setItem(std::uint8_t slotID, CItem* item);
	void	setItemID(std::uint8_t slotID, std::uint16_t itemID);
	void	setInvSlotID(std::uint8_t slotID, std::uint8_t invSlotID);
	void	setQuantity(std::uint8_t slotID, uint32 quantity);
	bool	setConfirmedStatus(std::uint8_t slotID, std::uint8_t amount);
	void	setItem(std::uint8_t slotID, std::uint16_t itemID, std::uint8_t invSlotID, uint32 quantity, CItem* item = nullptr);
    void    setSize(std::uint8_t size);

	void	Clean();										// отчищаем контейнер

private:

	std::uint8_t	m_type;											// тип контейнера (тип кристалла, нация магазина и т.д.)
	std::uint8_t	m_ItemsCount;									// количество предметов в контейнере (устанавливаем самостоятельно)

	std::vector<CItem*>     m_PItem;
    std::vector<std::uint8_t>	    m_slotID;
    std::vector<std::uint16_t>	    m_itemID;
    std::vector<uint32>	    m_quantity;
    std::vector<std::uint8_t>	    m_confirmed;
};

#endif