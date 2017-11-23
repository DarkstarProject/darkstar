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

#include "item_furnishing.h"
#include "../map.h"

CItemFurnishing::CItemFurnishing(std::uint16_t id) : CItem(id)
{
	setType(ITEM_FURNISHING);

	m_storage      = 0;
	m_moghancement = 0;
	m_element      = 0;
	m_aura         = 0;
}

CItemFurnishing::~CItemFurnishing()
{
}

void CItemFurnishing::setInstalled(bool installed)
{
    if (installed)
        WBUFB(m_extra, 0x01) |= 0x40;
    else
        WBUFB(m_extra, 0x01) &= ~0x40;
}

bool CItemFurnishing::isInstalled()
{
    return WBUFB(m_extra, 0x01) & 0x40;
}

void CItemFurnishing::setStorage(std::uint8_t storage)
{
	m_storage = std::min<std::uint8_t>(storage, 80);
}

std::uint8_t CItemFurnishing::getStorage()
{
	return m_storage;
}

void CItemFurnishing::setMoghancement(std::uint8_t moghancement)
{
	m_moghancement = moghancement;
}

std::uint8_t CItemFurnishing::getMoghancement()
{
	return m_moghancement;
}

void CItemFurnishing::setElement(std::uint8_t element)
{
	m_element = element;
}

std::uint8_t CItemFurnishing::getElement()
{
	return m_element;
}

void CItemFurnishing::setAura(std::uint8_t aura)
{
	m_aura = aura;
}

std::uint8_t CItemFurnishing::getAura()
{
	return m_aura;
}

void CItemFurnishing::setCol(std::uint8_t col)
{
	WBUFB(m_extra, 0x06) = col;
}
	
std::uint8_t CItemFurnishing::getCol()
{
    return RBUFB(m_extra, 0x06);
}

void CItemFurnishing::setRow(std::uint8_t row)
{
    WBUFB(m_extra, 0x08) = row;
}

std::uint8_t CItemFurnishing::getRow()
{
    return RBUFB(m_extra, 0x08);
}

void CItemFurnishing::setLevel(std::uint8_t level)
{
    WBUFB(m_extra, 0x07) = level;
}

std::uint8_t CItemFurnishing::getLevel()
{
    return RBUFB(m_extra, 0x07);
}

void CItemFurnishing::setRotation(std::uint8_t rotation)
{
    WBUFB(m_extra, 0x09) = rotation;
}

std::uint8_t CItemFurnishing::getRotation()
{
    return RBUFB(m_extra, 0x09);
}