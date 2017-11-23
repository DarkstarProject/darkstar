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

#ifndef _CITEMSHOP_H
#define _CITEMSHOP_H

#include "../../common/cbasetypes.h"

#include "item.h"

/************************************************************************
*																		*
*  Предмет, используемый в магазине гильдий								*
*																		*
************************************************************************/

class CItemShop : public CItem
{
public:

    CItemShop(std::uint16_t id);
    virtual ~CItemShop();

    uint32  getMinPrice();
    uint32  getMaxPrice();

    bool    IsInMenu();
    bool    IsDailyIncrease();

    void    setMinPrice(uint32 price);
    void    setMaxPrice(uint32 price);
    void    setDailyIncrease(std::uint16_t quantity);
    std::uint16_t  getDailyIncrease();
    void    setInitialQuantity(std::uint16_t quantity);
    std::uint16_t  getInitialQuantity();
	std::uint16_t  getSellPrice();

private:

    uint32  m_MinPrice;
    uint32  m_MaxPrice;

    std::uint16_t    m_DailyIncrease;
    std::uint16_t    m_InitialQuantity;
};

#endif