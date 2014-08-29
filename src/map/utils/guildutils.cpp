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

#include <vector>

#include "../items/item_shop.h"

#include "guildutils.h"
#include "../item_container.h"
#include "../map.h"

// TODO: во время закрытия гильдии всем просматривающим список товаров отправляется пакет 0x86 с информацией о закрытии гильдии

//#define количество обновляемых предметов при restock (в процентах от максимального количества)

/************************************************************************
*																		*
*  Список гильдий														*
*																		*
************************************************************************/

std::vector<CItemContainer*> g_PGuildList;

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

namespace guildutils
{

/************************************************************************
*																		*
*  Инициализация гильдий												*
*																		*
************************************************************************/

void Initialize()
{
	DSP_DEBUG_BREAK_IF(g_PGuildList.size() != 0);

	const int8* fmtQuery = "SELECT DISTINCT guildid FROM guild_shops ORDER BY guildid ASC LIMIT 256";

	if (Sql_Query(SqlHandle,fmtQuery) != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		g_PGuildList.reserve(Sql_NumRows(SqlHandle));

		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			g_PGuildList.push_back(new CItemContainer(Sql_GetIntData(SqlHandle,0)));
		}
	}
	for (std::vector<CItemContainer*>::iterator iter = g_PGuildList.begin(); iter != g_PGuildList.end(); iter++)
    {
		CItemContainer* PGuild = *iter;

		fmtQuery = "SELECT itemid, min_price, max_price, max_quantity, daily_increase, initial_quantity \
				    FROM guild_shops \
					WHERE guildid = %u \
                    LIMIT %u";

		int32 ret = Sql_Query(SqlHandle, fmtQuery, PGuild->GetID(), MAX_CONTAINER_SIZE);

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			PGuild->SetSize((uint8)Sql_NumRows(SqlHandle));

			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				CItemShop* PItem = new CItemShop(Sql_GetIntData(SqlHandle,0));

				PItem->setMinPrice(Sql_GetIntData(SqlHandle,1));
				PItem->setMaxPrice(Sql_GetIntData(SqlHandle,2));
				PItem->setStackSize(Sql_GetIntData(SqlHandle,3));
                PItem->setDailyIncrease(Sql_GetIntData(SqlHandle,4));
				PItem->setInitialQuantity(Sql_GetIntData(SqlHandle,5));

				PItem->setQuantity(PItem->IsDailyIncrease() ? PItem->getInitialQuantity() : 0);
				PItem->setBasePrice(PItem->getMinPrice() + ((float)(PItem->getStackSize() - PItem->getQuantity()) / PItem->getStackSize()) * (PItem->getMaxPrice() - PItem->getMinPrice()));

				PGuild->InsertItem(PItem);
			}
		}
	}
}

/************************************************************************
*                                                                       *
*  Обновляем запас гильдий                                              *
*                                                                       *
************************************************************************/

void UpdateGuildsStock()
{
    for (std::vector<CItemContainer*>::iterator iter = g_PGuildList.begin(); iter != g_PGuildList.end(); iter++)
	{
		CItemContainer* PGuild = *iter;
        for(uint8 slotid = 1; slotid <= PGuild->GetSize(); ++slotid)
        {
            CItemShop* PItem = (CItemShop*)PGuild->GetItem(slotid);

			PItem->setBasePrice(PItem->getMinPrice() + ((float)(PItem->getStackSize() - PItem->getQuantity()) / PItem->getStackSize()) * (PItem->getMaxPrice() - PItem->getMinPrice()));

            if (PItem->IsDailyIncrease())
            {
                PItem->setQuantity(PItem->getQuantity() + PItem->getDailyIncrease());
            }
        }
	}
    ShowDebug(CL_CYAN"UpdateGuildsStock is finished\n" CL_RESET);
}

/************************************************************************
*																		*
*  Получаем указатель на магазин гильдии с указанным ID					*
*																		*
************************************************************************/

CItemContainer* GetGuildShop(uint16 GuildID)
{
	for (uint16 i = 0; i < g_PGuildList.size(); ++i)
	{
		if (g_PGuildList.at(i)->GetID() == GuildID)
		{
			return g_PGuildList.at(i);
		}
	}
	ShowDebug(CL_CYAN"Guild with id <%u> is not found on server\n" CL_RESET);
    return NULL;
}

} // namespace guildutils
