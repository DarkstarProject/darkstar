/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

CItemFurnishing::CItemFurnishing(uint16 id) : CItem(id)
{
	setType(ITEM_FURNISHING);

	m_storage      = 0;
	m_moghancement = 0;
	m_element      = 0;
	m_aura         = 0;

	m_col		   = 0;
	m_row		   = 0;
	m_level		   = 0;
	m_rotation	   = 0;
}

CItemFurnishing::~CItemFurnishing()
{
}

void CItemFurnishing::setStorage(uint8 storage)
{
	m_storage = dsp_min(storage,80);
}

uint8 CItemFurnishing::getStorage()
{
	return m_storage;
}

void CItemFurnishing::setMoghancement(uint8 moghancement)
{
	m_moghancement = moghancement;
}

uint8 CItemFurnishing::getMoghancement()
{
	return m_moghancement;
}

void CItemFurnishing::setElement(uint8 element)
{
	m_element = element;
}

uint8 CItemFurnishing::getElement()
{
	return m_element;
}

void CItemFurnishing::setAura(uint8 aura)
{
	m_aura = aura;
}

uint8 CItemFurnishing::getAura()
{
	return m_aura;
}

void CItemFurnishing::setCol(uint8 col)
{
	m_col = col;
}
	
uint8 CItemFurnishing::getCol()
{
	return m_col;
}

void CItemFurnishing::setRow(uint8 row)
{
	m_row = row;
}

uint8 CItemFurnishing::getRow()
{
	return m_row;
}

void CItemFurnishing::setLevel(uint8 level)
{
	m_level = level;
}

uint8 CItemFurnishing::getLevel()
{
	return m_level;
}

void CItemFurnishing::setRotation(uint8 rotation)
{
	m_rotation = rotation;
}

uint8 CItemFurnishing::getRotation()
{
	return m_rotation;
}