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

#include "item_shop.h"


CItemShop::CItemShop(std::uint16_t id) : CItem(id)
{
	// SetType(ITEM_SHOP);

	m_MinPrice = 0;
	m_MaxPrice = 0;

	m_DailyIncrease = false;
}

CItemShop::~CItemShop()
{
}

uint32 CItemShop::getMinPrice()
{
	return m_MinPrice;
}


uint32 CItemShop::getMaxPrice()
{
	return m_MaxPrice;
}

bool CItemShop::IsInMenu()
{
    return getQuantity() != 0;
}

bool CItemShop::IsDailyIncrease()
{
	return m_DailyIncrease;
}

void CItemShop::setMinPrice(uint32 price)
{
	m_MinPrice = price;
}

void CItemShop::setMaxPrice(uint32 price)
{
	m_MaxPrice = price;
}

void CItemShop::setDailyIncrease(std::uint16_t increase)
{
    m_DailyIncrease = increase;
}

std::uint16_t CItemShop::getDailyIncrease()
{
    return m_DailyIncrease;
}

void CItemShop::setInitialQuantity(std::uint16_t increase)
{
    m_InitialQuantity = increase;
}

std::uint16_t CItemShop::getInitialQuantity()
{
    return m_InitialQuantity;
}

std::uint16_t CItemShop::getSellPrice()
{
	if (getID() >= 0x2800 && getID() <= 0x6FFF)
	{
		return (std::uint16_t)((getMinPrice() + (getQuantity() / getStackSize()) * (getMinPrice() * 0.10f)) / 12);
	}
	else
	{
		return getBasePrice() / 3;
	}
}