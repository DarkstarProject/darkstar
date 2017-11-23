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

    CItemShop(uint16 id);
    virtual ~CItemShop();

    std::uint32_t  getMinPrice();
    std::uint32_t  getMaxPrice();

    bool    IsInMenu();
    bool    IsDailyIncrease();

    void    setMinPrice(std::uint32_t price);
    void    setMaxPrice(std::uint32_t price);
    void    setDailyIncrease(uint16 quantity);
    uint16  getDailyIncrease();
    void    setInitialQuantity(uint16 quantity);
    uint16  getInitialQuantity();
	uint16  getSellPrice();

private:

    std::uint32_t  m_MinPrice;
    std::uint32_t  m_MaxPrice;

    uint16    m_DailyIncrease;
    uint16    m_InitialQuantity;
};

#endif