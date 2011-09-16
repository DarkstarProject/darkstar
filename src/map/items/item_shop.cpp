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

#include "item_shop.h"


CItemShop::CItemShop(uint16 id) : CItem(id)
{
	// SetType(ITEM_SHOP);

	m_MinPrice = 0;
	m_MaxPrice = 0;
	
	m_IsInMenu = false;

	m_DailyIncrease = 0;
}

CItemShop::~CItemShop()
{
}

uint32 CItemShop::getMinPrice()
{
	return m_MinPrice;
}

void CItemShop::setMinPrice(uint32 price)
{
	m_MinPrice = price;
}
	
uint32 CItemShop::getMaxPrice()
{
	return m_MaxPrice;
}

void CItemShop::setMaxPrice(uint32 price)
{
	m_MaxPrice = price;
}
	
uint8 CItemShop::getDailyIncrease()
{
	return m_DailyIncrease;
}

void CItemShop::setDailyIncreace(uint8 quantity)
{
	m_DailyIncrease = quantity;
}

bool CItemShop::IsInMenu()
{
	return m_IsInMenu;
}
	
void  CItemShop::IsInMenu(bool menu)
{
	m_IsInMenu = menu;
}