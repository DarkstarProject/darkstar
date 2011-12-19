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

#include "../common/showmsg.h"
#include "../common/sql.h"

#include "auction_house.h"


Sql_t* SqlHandle = NULL;

CAuctionHouse::CAuctionHouse(uint8 AuctionHouseID)
{
    m_AHID = AuctionHouseID;

    SqlHandle = Sql_Malloc();

	ShowStatus("sqlhandle is allocating\n");
	if( Sql_Connect(SqlHandle,"root",
							  "root",
							  "127.0.0.1",
							  3306,
							  "dspdb") == SQL_ERROR )
	{
		ShowError("cant connect\n");
	}
}

CAuctionHouse::~CAuctionHouse()
{
    Sql_Free(SqlHandle);
}

/************************************************************************
*                                                                       *
*  Список продаваемых предметов в указанной категории (пустышка)        *
*                                                                       *
************************************************************************/

std::vector<ahItem*> CAuctionHouse::GetItemsToCategry(uint8 AHCategoryID)
{
    ShowDebug("try find category %u\n", AHCategoryID);

    std::vector<ahItem*> ItemList;

    const int8* fmtQuery = "SELECT itemId, stackSize FROM item_basic WHERE aH = %u";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, AHCategoryID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			ahItem* PAHItem   = new ahItem;

            PAHItem->ItemID	= Sql_GetIntData(SqlHandle,0);

            PAHItem->SinglAmount	 = 0;
            PAHItem->StackAmount = 0;

            if (Sql_GetIntData(SqlHandle,1) == 1)
            {
                PAHItem->StackAmount = -1;
            }

            ItemList.push_back(PAHItem);
        }
    }
	return ItemList;
}