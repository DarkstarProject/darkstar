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

#include <string.h>

#include "itemutils.h"
#include "trade_container.h"


CTradeContainer::CTradeContainer()
{
	Clean();
}

CItem* CTradeContainer::getItem(uint8 slotID)
{
	if (slotID < CONTAINER_SIZE)
	{
		return m_PItem[slotID];
	}
	return 0;
}

uint16 CTradeContainer::getItemID(uint8 slotID)
{
	if (slotID < CONTAINER_SIZE)
	{
		return m_itemID[slotID];
	}
	return 0;
}

uint8 CTradeContainer::getInvSlotID(uint8 slotID)
{
	if (slotID < CONTAINER_SIZE)
	{
		return m_slotID[slotID];
	}
	return 0xFF;
}

uint32 CTradeContainer::getQuantity(uint8 slotID)
{
	if (slotID < CONTAINER_SIZE)
	{
		return m_quantity[slotID];
	}
	return 0;
}

uint32 CTradeContainer::getItemQuantity(uint16 itemID)
{
	uint32 quantity = 0;
	for(uint8 slotID = 0; slotID < CONTAINER_SIZE; ++slotID) 
	{
		if( m_itemID[slotID] == itemID)
		{
			quantity += m_quantity[slotID];
		}
	}
	return quantity;
}

uint32 CTradeContainer::getTotalQuantity() 
{
	uint32 quantity = 0;
	for(uint8 slotID = 0; slotID < CONTAINER_SIZE; ++slotID) 
	{
		quantity += (m_itemID[slotID] == 0xFFFF ? 1 : m_quantity[slotID]);
	}
	return quantity;
}

uint8 CTradeContainer::getSlotCount() 
{
	uint8 count = 0;
	for(uint8 slotID = 0; slotID < CONTAINER_SIZE; ++slotID) 
	{
		if (m_itemID[slotID] != 0)
		{
			count += 1;
		}
	}
	return count;
}

void CTradeContainer::setItem(uint8 slotID, CItem* item)
{
	if (slotID < CONTAINER_SIZE)
	{
		m_PItem[slotID] = item;
	}
	return;
}

void CTradeContainer::setItemID(uint8 slotID, uint16 itemID)
{
	if (slotID < CONTAINER_SIZE)
	{
		m_itemID[slotID] = itemID;
	}
	return;
}

void CTradeContainer::setInvSlotID(uint8 slotID, uint8 invSlotID)
{
	if (slotID < CONTAINER_SIZE)
	{
		m_slotID[slotID] = invSlotID;
	}
	return;
}

void CTradeContainer::setQuantity(uint8 slotID, uint32 quantity)
{
	if (slotID < CONTAINER_SIZE)
	{
		m_quantity[slotID] = quantity;
	}
	return;
}

void CTradeContainer::setItem(uint8 slotID, uint16 itemID, uint8 invSlotID, uint32 quantity, CItem* item)
{
	if (slotID < CONTAINER_SIZE)
	{
		m_ItemsCount += 1;

		m_PItem[slotID] = item;
		m_itemID[slotID] = itemID;
		m_slotID[slotID] = invSlotID;
		m_quantity[slotID] = quantity;
	}
	return;
}

uint8 CTradeContainer::getItemsCount()
{
	return m_ItemsCount;
}

void CTradeContainer::setItemsCount(uint8 count)
{
	m_ItemsCount = count;
}

uint8 CTradeContainer::getType()
{
	return m_type;
}

void CTradeContainer::setType(uint8 type)
{
	m_type = type;
}

void CTradeContainer::Clean()
{
	m_type = 0;
	m_ItemsCount = 0;

	memset(m_PItem,	   0x00, sizeof(m_PItem));
	memset(m_itemID,   0x00, sizeof(m_itemID));
	memset(m_slotID,   0xFF, sizeof(m_slotID));
	memset(m_quantity, 0x00, sizeof(m_quantity));
}
