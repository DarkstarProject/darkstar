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

#ifndef _CITEMCONTAINER_H
#define _CITEMCONTAINER_H

#include "../common/cbasetypes.h"

enum CONTAINER_ID
{
    LOC_INVENTORY       = 0,
    LOC_MOGSAFE         = 1,
    LOC_STORAGE         = 2,
    LOC_TEMPITEMS       = 3,
    LOC_MOGLOCKER       = 4,
    LOC_MOGSATCHEL      = 5,
    LOC_MOGSACK         = 6,
    LOC_MOGCASE         = 7,
    LOC_WARDROBE        = 8,
    LOC_MOGSAFE2        = 9,
    LOC_WARDROBE2       = 10,
    LOC_WARDROBE3       = 11,
    LOC_WARDROBE4       = 12
};

#define MAX_CONTAINER_ID	 13
#define MAX_CONTAINER_SIZE	120
#define ERROR_SLOTID		255

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CItem;

class CItemContainer
{
public:

	CItemContainer(std::uint16_t LocationID);
   ~CItemContainer();

	std::uint16_t	GetID();
    std::uint16_t  GetBuff();                              // планируемый размер хранилища (размер без ограничений)
	std::uint8_t	GetSize();
	std::uint8_t	GetFreeSlotsCount();					// количество свободных ячеек в хранилище
    std::uint8_t   AddBuff(std::int8_t buff);                     // планируемый размер хранилища (размер без ограничений)
    std::uint8_t   AddSize(std::int8_t size);                     // увеличиваем/уменьшаем размер контейнера
	std::uint8_t	SetSize(std::uint8_t size);
	std::uint8_t	SearchItem(std::uint16_t ItemID);				// поиск предмета в хранилище
    std::uint8_t   SearchItemWithSpace(std::uint16_t ItemID, std::uint32_t quantity); //search for item that has space to accomodate x items added

	std::uint8_t	InsertItem(CItem* PItem);				// добавляем заранее созданный предмет в свободную ячейку
	std::uint8_t	InsertItem(CItem* PItem, std::uint8_t slotID);	// добавляем заранее созданный предмет в выбранную ячейку

    std::uint32_t  SortingPacket;                          // количество запросов на сортировку за такт
    std::uint32_t  LastSortingTime;                        // время последней сортировки контейнера

	CItem*	GetItem(std::uint8_t slotID);					// получаем указатель на предмет, находящийся в указанной ячейка.
	void	Clear();								// Remove all items from container

    template<typename F, typename... Args>
    void ForEachItem(F func, Args&&... args)
    {
        for (std::uint8_t SlotID = 0; SlotID <= m_size; ++SlotID)
        {
            if (m_ItemList[SlotID])
            {
                func(m_ItemList[SlotID], std::forward<Args>(args)...);
            }
        }
    }

private:

	std::uint16_t	m_id;
    std::uint16_t  m_buff;
	std::uint8_t	m_size;
    std::uint8_t   m_count;

	CItem*	m_ItemList[MAX_CONTAINER_SIZE+1];
};

#endif