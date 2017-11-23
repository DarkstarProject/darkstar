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

#include "utils/itemutils.h"
#include "trade_container.h"


CTradeContainer::CTradeContainer()
{
	Clean();
}

CItem* CTradeContainer::getItem(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
	{
		return m_PItem[slotID];
	}
	return 0;
}

std::uint16_t CTradeContainer::getItemID(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
	{
		return m_itemID[slotID];
	}
	return 0;
}

std::uint8_t CTradeContainer::getInvSlotID(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
	{
		return m_slotID[slotID];
	}
	return 0xFF;
}

uint32 CTradeContainer::getQuantity(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
	{
		return m_quantity[slotID];
	}
	return 0;
}

std::uint8_t CTradeContainer::getConfirmedStatus(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
	{
		return m_confirmed[slotID];
	}
	return false;
}

uint32 CTradeContainer::getItemQuantity(std::uint16_t itemID)
{
	uint32 quantity = 0;
    for (std::uint8_t slotID = 0; slotID < m_PItem.size(); ++slotID)
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
    for (std::uint8_t slotID = 0; slotID < m_PItem.size(); ++slotID)
	{
		quantity += (m_itemID[slotID] == 0xFFFF ? 1 : m_quantity[slotID]);
	}
	return quantity;
}

std::uint8_t CTradeContainer::getSlotCount() 
{
	std::uint8_t count = 0;
    for (std::uint8_t slotID = 0; slotID < m_PItem.size(); ++slotID)
	{
		if (m_itemID[slotID] != 0)
		{
			count += 1;
		}
	}
	return count;
}

void CTradeContainer::setItem(std::uint8_t slotID, CItem* item)
{
    if (slotID < m_PItem.size())
	{
		m_PItem[slotID] = item;
	}
	return;
}

void CTradeContainer::setItemID(std::uint8_t slotID, std::uint16_t itemID)
{
    if (slotID < m_PItem.size())
	{
		m_itemID[slotID] = itemID;
	}
	return;
}

void CTradeContainer::setInvSlotID(std::uint8_t slotID, std::uint8_t invSlotID)
{
    if (slotID < m_PItem.size())
	{
		m_slotID[slotID] = invSlotID;
	}
	return;
}

void CTradeContainer::setQuantity(std::uint8_t slotID, uint32 quantity)
{
    if (slotID < m_PItem.size())
	{
		m_quantity[slotID] = quantity;
	}
	return;
}

bool CTradeContainer::setConfirmedStatus(std::uint8_t slotID, std::uint8_t amount)
{
    if (slotID < m_PItem.size() && m_PItem[slotID] && m_PItem[slotID]->getQuantity() >= amount)
	{
		m_confirmed[slotID] = std::min<std::uint8_t>(amount, m_PItem[slotID]->getQuantity());
        return true;
	}
    return false;
}

void CTradeContainer::setItem(std::uint8_t slotID, std::uint16_t itemID, std::uint8_t invSlotID, uint32 quantity, CItem* item)
{
	if (slotID < m_PItem.size())
	{
		m_ItemsCount += 1;

		m_PItem[slotID] = item;
		m_itemID[slotID] = itemID;
		m_slotID[slotID] = invSlotID;
		m_quantity[slotID] = quantity;
	}
	return;
}

std::uint8_t CTradeContainer::getSize()
{
    return (std::uint8_t)m_PItem.size();
}

void CTradeContainer::setSize(std::uint8_t size)
{
    m_PItem.resize(size, nullptr);
    m_itemID.resize(size, 0);
    m_slotID.resize(size, 0xFF);
    m_quantity.resize(size, 0);
    m_confirmed.resize(size, 0);
}

std::uint8_t CTradeContainer::getItemsCount()
{
	return m_ItemsCount;
}

void CTradeContainer::setItemsCount(std::uint8_t count)
{
	m_ItemsCount = count;
}

std::uint8_t CTradeContainer::getType()
{
	return m_type;
}

void CTradeContainer::setType(std::uint8_t type)
{
	m_type = type;
}

void CTradeContainer::Clean()
{
	m_type = 0;
	m_ItemsCount = 0;

    m_PItem.clear();
    m_PItem.resize(CONTAINER_SIZE, nullptr);
    m_itemID.clear();
    m_itemID.resize(CONTAINER_SIZE, 0);
    m_slotID.clear();
    m_slotID.resize(CONTAINER_SIZE, 0xFF);
    m_quantity.clear();
    m_quantity.resize(CONTAINER_SIZE, 0);
    m_confirmed.clear();
    m_confirmed.resize(CONTAINER_SIZE, 0);
}
