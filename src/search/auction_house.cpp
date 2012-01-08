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
#include "search.h"


Sql_t* SqlHandle = NULL;

CAuctionHouse::CAuctionHouse(uint8 AuctionHouseID)
{
    m_AHID = AuctionHouseID;

    SqlHandle = Sql_Malloc();

	ShowStatus("sqlhandle is allocating\n");
    if( Sql_Connect(SqlHandle,search_config.mysql_login,
                              search_config.mysql_password,
                              search_config.mysql_host,
                              search_config.mysql_port,
                              search_config.mysql_database) == SQL_ERROR )
	{
		ShowError("cant connect\n");
	}
}

CAuctionHouse::~CAuctionHouse()
{
    Sql_Free(SqlHandle);
}

std::vector<ahHistory*> CAuctionHouse::GetItemHystory(uint16 ItemID)
{
    std::vector<ahHistory*> HistoryList;

    const int8* fmtQuery = "SELECT sale, sell_date, seller_name, buyer_name \
                            FROM auction_house \
                            WHERE itemid = %u AND buyer_name IS NOT NULL \
                            ORDER BY sell_date DESC \
                            LIMIT 10";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, ItemID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
            ahHistory* PAHHistory = new ahHistory;

            PAHHistory->Price = Sql_GetUIntData(SqlHandle,0);
            PAHHistory->Data  = Sql_GetUIntData(SqlHandle,1);

            snprintf((int8*)PAHHistory->Name1, 15, "%s", Sql_GetData(SqlHandle,2));
            snprintf((int8*)PAHHistory->Name2, 15, "%s", Sql_GetData(SqlHandle,3));

            HistoryList.push_back(PAHHistory);
        }
    }
    return HistoryList;
}

/************************************************************************
*                                                                       *
*  Список продаваемых предметов в указанной категории                   *
*                                                                       *
************************************************************************/

std::vector<ahItem*> CAuctionHouse::GetItemsToCategry(uint8 AHCategoryID)
{
    ShowDebug("try find category %u\n", AHCategoryID);

    std::vector<ahItem*> ItemList;

    const int8* fmtQuery = "SELECT item_basic.itemid, item_basic.stackSize, COUNT(*)-SUM(stack), SUM(stack) \
                            FROM item_basic \
	                        LEFT JOIN auction_house ON item_basic.itemId = auction_house.itemid AND auction_house.buyer_name IS NULL \
                            LEFT JOIN item_armor ON item_basic.itemid = item_armor.itemid \
                            LEFT JOIN item_weapon ON item_basic.itemid = item_weapon.itemid \
                            WHERE aH = %u \
                            GROUP BY item_basic.itemid \
                            ORDER BY item_armor.level DESC, item_weapon.dmg DESC, item_basic.sortname ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, AHCategoryID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			ahItem* PAHItem   = new ahItem;

            PAHItem->ItemID	= Sql_GetIntData(SqlHandle,0);

            PAHItem->SinglAmount = Sql_GetIntData(SqlHandle,2);
            PAHItem->StackAmount = Sql_GetIntData(SqlHandle,3);

            if (Sql_GetIntData(SqlHandle,1) == 1)
            {
                PAHItem->StackAmount = -1;
            }

            ItemList.push_back(PAHItem);
        }
    }
	return ItemList;
}