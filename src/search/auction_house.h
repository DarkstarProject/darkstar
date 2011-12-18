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

#ifndef _CAUCTIONHOUSE_H_
#define _CAUCTIONHOUSE_H_

#include "../common/cbasetypes.h"

#include <vector>

typedef struct  
{
    uint16  itemId;
    uint8   amount;
    uint8   stacked;
    uint8   amountStack;
    uint32	sellDate;
    uint32  price;
} ahItem;

class CAuctionHouse
{
private:

	uint8 m_AHID;

public:

	CAuctionHouse(uint8 AuctionHouseID);
   ~CAuctionHouse();

	std::vector<ahItem*> GetItemsToCategry(uint8 AHCategoryID);
};


#endif
