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

#include "auction_house.h"

CAuctionHouse::CAuctionHouse(uint8 AuctionHouseID)
{
    m_AHID = AuctionHouseID;
}

CAuctionHouse::~CAuctionHouse()
{

}

/************************************************************************
*                                                                       *
*  Список продаваемых предметов в указанной категории (пустышка)        *
*                                                                       *
************************************************************************/

std::vector<ahItem*> CAuctionHouse::GetItemsToCategry(uint8 AHCategoryID)
{
    std::vector<ahItem*> ItemList;
	
    for (uint8 i = 0; i < 25; ++i)
    {
	    ahItem* PAHItem	= new ahItem;

        PAHItem->itemId	  = 1000 + i;
        PAHItem->price	  = 1000 + i;
        PAHItem->stacked	  = 1;
        PAHItem->amount   = 1;
        PAHItem->sellDate = 1277536043;

        ItemList.push_back(PAHItem);
    }
	return ItemList;
}