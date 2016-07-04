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

#include "../common/malloc.h"
#include "../common/showmsg.h"

#include <string.h>

#include "item_container.h"
#include "utils/itemutils.h"


CItemContainer::CItemContainer(uint16 LocationID)
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
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID)
	{
        delete m_ItemList[SlotID];
	}
}

uint16 CItemContainer::GetID()
{
	return m_id;
}

uint8 CItemContainer::GetSize()
{
	return m_size;
}

uint8 CItemContainer::GetFreeSlotsCount()
{
    return m_size - m_count;
}

/************************************************************************
*                                                                       *
*  Установка размера контейнера                                         *
*                                                                       *
************************************************************************/

uint16 CItemContainer::GetBuff()
{
    return m_buff;
}

uint8 CItemContainer::AddBuff(int8 buff)
{
    m_buff += buff;
    return SetSize(dsp_min(m_buff, 80)); // ограничение в 80 ячеек для персонажа
}

/************************************************************************
*                                                                       *
*  Установка размера контейнера                                         *
*                                                                       *
************************************************************************/

// контейнер не несет ответственности за то, что предметы могут остаться за пределами размера

uint8 CItemContainer::SetSize(uint8 size) 
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

uint8 CItemContainer::AddSize(int8 size)
{
    uint8 newsize = m_size + size;

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

uint8 CItemContainer::InsertItem(CItem* PItem)
{
	DSP_DEBUG_BREAK_IF(PItem == nullptr);

	for (uint8 SlotID = 1; SlotID <= m_size; ++SlotID) 
	{
		if (m_ItemList[SlotID] == nullptr) 
		{
            m_count++;

			PItem->setSlotID(SlotID);
			PItem->setLocationID(m_id);

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

uint8 CItemContainer::InsertItem(CItem* PItem, uint8 SlotID)
{
	if (SlotID <= m_size)
	{
		if (PItem != nullptr)
		{
			PItem->setSlotID(SlotID);
			PItem->setLocationID(m_id);

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

CItem* CItemContainer::GetItem(uint8 SlotID)
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

uint8 CItemContainer::SearchItem(uint16 ItemID)
{
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID) 
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

uint8 CItemContainer::SearchItemWithSpace(uint16 ItemID, uint32 quantity)
{
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID) 
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
	for (uint8 SlotID = 0; SlotID <= m_size; ++SlotID)
	{
		delete m_ItemList[SlotID];
		m_ItemList[SlotID] = nullptr;
	}
}