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

#include "entities/baseentity.h"
#include "utils/itemutils.h"
#include "universal_container.h"


/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CUContainer::CUContainer()
{
    m_ContainerType = UCONTAINER_EMPTY;
	Clean();
}

/************************************************************************
*																		*
*  Отчищаем контейнер													*
*																		*
************************************************************************/

void CUContainer::Clean()
{
    if (m_ContainerType == UCONTAINER_DELIVERYBOX)
    {
        for (std::uint8_t i = 0; i < UCONTAINER_SIZE; ++i)
        {
            delete m_PItem[i];
        }
    }
    if (m_ContainerType == UCONTAINER_TRADE)
    {
        for (auto&& PItem : m_PItem)
        {
            if (PItem)
            {
                PItem->setReserve(0);
            }
        }
    }
    m_ContainerType = UCONTAINER_EMPTY;

    m_lock   = 0;
    m_count  = 0;
    m_target = 0;

    m_PItem.clear();
    m_PItem.resize(UCONTAINER_SIZE, nullptr);
}

/************************************************************************
*                                                                       *
*  Узнаем цель обмена                                                   *
*                                                                       *
************************************************************************/

std::uint16_t CUContainer::GetTarget()
{
    return m_target;
}

/************************************************************************
*                                                                       *
*  Устанавливаем цель обмена                                            *
*                                                                       *
************************************************************************/
	
void CUContainer::SetTarget(std::uint16_t Target)
{
    m_target = Target;
}

/************************************************************************
*																		*
*  Узнаем текущий тип контейнера										*
*																		*
************************************************************************/

UCONTAINERTYPE CUContainer::GetType()
{
	return m_ContainerType;
}

/************************************************************************
*																		*
*  Устанавливаем текущий тип контейнера									*
*																		*
************************************************************************/

void CUContainer::SetType(UCONTAINERTYPE Type)
{
	DSP_DEBUG_BREAK_IF(m_ContainerType != UCONTAINER_EMPTY);

	m_ContainerType = Type;
}

/************************************************************************
*                                                                       *
*  Запрещаем изменение содержимого контейнера                           *
*                                                                       *
************************************************************************/

void CUContainer::SetLock()
{
    m_lock = true;
}

/************************************************************************
*                                                                       *
*  Unlock container														*
*                                                                       *
************************************************************************/

void CUContainer::UnLock()
{
	m_lock = false;
}

/************************************************************************
*                                                                       *
*  Проверяем, заблокирован ли контейнер                                 *
*                                                                       *
************************************************************************/

bool CUContainer::IsLocked()
{
	return m_lock;
}

/************************************************************************
*																		*
*  Проверяем, пуст ли контейнер											*
*																		*
************************************************************************/

bool CUContainer::IsContainerEmpty()
{
	return (m_ContainerType == UCONTAINER_EMPTY);
}

/************************************************************************
*                                                                       *
*  Проверяем, пуста ли ячейка                                           *
*                                                                       *
************************************************************************/

bool CUContainer::IsSlotEmpty(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
	{
        return m_PItem[slotID] == nullptr;
    }
    return true;
}

/************************************************************************
*																		*
*  Добавляем предмет в указанныю ячейку контейнера						*
*																		*
************************************************************************/

bool CUContainer::SetItem(std::uint8_t slotID, CItem* PItem)
{
	if (slotID < m_PItem.size() && !m_lock)
	{
        if (PItem != nullptr && m_PItem[slotID] == nullptr) m_count++;
        if (PItem == nullptr && m_PItem[slotID] != nullptr) m_count--;

		m_PItem[slotID] = PItem;
        return true;
	}
    return false;
}

void CUContainer::SetSize(std::uint8_t size)
{
    m_PItem.resize(size, nullptr);
}

void CUContainer::ClearSlot(std::uint8_t slotID)
{
    if (slotID < m_PItem.size())
    {
        m_PItem[slotID] = nullptr;
    }
}

/************************************************************************
*                                                                       *
*  Узнаем количество предметов, находящихся в контейнере                *
*                                                                       *
************************************************************************/

std::uint8_t CUContainer::GetItemsCount()
{
    return m_count;
}

/************************************************************************
*																		*
*  Получаем предмет из указанной ячейки контейнера						*
*																		*
************************************************************************/

CItem* CUContainer::GetItem(std::uint8_t slotID)
{
	if (slotID < m_PItem.size())
	{
		return m_PItem[slotID];
	}
	return nullptr;
}