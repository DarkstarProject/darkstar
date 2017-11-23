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

#include "../common/showmsg.h"

#include <string.h>

#include "item_container.h"
#include "utils/itemutils.h"


CItemContainer::CItemContainer(std::uint16_t LocationID)
{
	m_id = LocationID;

    SortingPacket   = 0;
    LastSortingTime = 0;

    m_buff  = 0;
	m_size  = 0;
    m_count = 0;

	memset(m_ItemList, 0, sizeof(m_ItemList));
}

CItemContainer::~CItemContainer()
{
	for (std::uint8_t SlotID = 0; SlotID <= m_size; ++SlotID)
	{
        delete m_ItemList[SlotID];
	}
}

std::uint16_t CItemContainer::GetID()
{
	return m_id;
}

std::uint8_t CItemContainer::GetSize()
{
	return m_size;
}

std::uint8_t CItemContainer::GetFreeSlotsCount()
{
    return m_size - m_count;
}

/************************************************************************
*                                                                       *
*  Установка размера контейнера                                         *
*                                                                       *
************************************************************************/

std::uint16_t CItemContainer::GetBuff()
{
    return m_buff;
}

std::uint8_t CItemContainer::AddBuff(int8 buff)
{
    m_buff += buff;
    return SetSize(std::min<std::uint8_t>((std::uint8_t)m_buff, 80)); // ограничение в 80 ячеек для персонажа
}

/************************************************************************
*                                                                       *
*  Установка размера контейнера                                         *
*                                                                       *
************************************************************************/

// контейнер не несет ответственности за то, что предметы могут остаться за пределами размера

std::uint8_t CItemContainer::SetSize(std::uint8_t size) 
{
	if (size <= MAX_CONTAINER_SIZE) 
	{
		if (size >= m_count)
		{
			m_size = size;
			return m_size;
		}
	}
	ShowDebug(CL_CYAN"ItemContainer <%u>: Bad new container size %u\n" CL_RESET, m_id, size);
	return -1;
}

/************************************************************************
*                                                                       *
*  Увеличиваем/уменьшаем размер контейнера                              *
*                                                                       *
************************************************************************/

// контейнер не несет ответственности за то, что предметы могут остаться за пределами размера

std::uint8_t CItemContainer::AddSize(int8 size)
{
    std::uint8_t newsize = m_size + size;

    if (newsize <= MAX_CONTAINER_SIZE) 
	{
		if (newsize >= m_count)
		{
			m_size = newsize;
			return m_size;
		}
	}
	ShowDebug(CL_CYAN"ItemContainer <%u>: Bad new container size %u\n" CL_RESET, m_id, newsize);
	return -1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

std::uint8_t CItemContainer::InsertItem(CItem* PItem)
{
	DSP_DEBUG_BREAK_IF(PItem == nullptr);

	for (std::uint8_t SlotID = 1; SlotID <= m_size; ++SlotID) 
	{
		if (m_ItemList[SlotID] == nullptr) 
		{
            m_count++;

			PItem->setSlotID(SlotID);
			PItem->setLocationID((std::uint8_t)m_id);

			m_ItemList[SlotID] = PItem;
			return SlotID;
		}
	}
	ShowDebug("ItemContainer: Container is full\n");

	//delete PItem;//todo: what if the item is a valid item??
	return ERROR_SLOTID;
}

/************************************************************************
*																		*
*  Добавляем предмет в указанную ячейку. nullptr удаляет предмет			*
*																		*
************************************************************************/

std::uint8_t CItemContainer::InsertItem(CItem* PItem, std::uint8_t SlotID)
{
	if (SlotID <= m_size)
	{
		if (PItem != nullptr)
		{
			PItem->setSlotID(SlotID);
			PItem->setLocationID((std::uint8_t)m_id);

            if (m_ItemList[SlotID] == nullptr && SlotID != 0) m_count++;
		}
        else if(m_ItemList[SlotID] != nullptr && SlotID != 0) m_count--;
        
		m_ItemList[SlotID] = PItem;
		return SlotID;
	}
	ShowDebug("ItemContainer: SlotID %i is out of range\n", SlotID);

	delete PItem;
	return ERROR_SLOTID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CItem* CItemContainer::GetItem(std::uint8_t SlotID)
{
	if (SlotID <= m_size)
	{
		return m_ItemList[SlotID];
	}
	return nullptr;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

std::uint8_t CItemContainer::SearchItem(std::uint16_t ItemID)
{
	for (std::uint8_t SlotID = 0; SlotID <= m_size; ++SlotID) 
	{
		if ((m_ItemList[SlotID] != nullptr) && 
			(m_ItemList[SlotID]->getID() == ItemID)) 
		{
			return SlotID;
		}
	}
	return ERROR_SLOTID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

std::uint8_t CItemContainer::SearchItemWithSpace(std::uint16_t ItemID, std::uint32_t quantity)
{
	for (std::uint8_t SlotID = 0; SlotID <= m_size; ++SlotID) 
	{
		if ((m_ItemList[SlotID] != nullptr) && 
			(m_ItemList[SlotID]->getID() == ItemID) &&
            (m_ItemList[SlotID]->getQuantity() <= m_ItemList[SlotID]->getStackSize()-quantity)) 
		{
			return SlotID;
		}
	}
	return ERROR_SLOTID;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CItemContainer::Clear()
{
	for (std::uint8_t SlotID = 0; SlotID <= m_size; ++SlotID)
	{
		delete m_ItemList[SlotID];
		m_ItemList[SlotID] = nullptr;
	}
}