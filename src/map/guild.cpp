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

#include "guild.h"
#include "entities/charentity.h"
#include "items/item.h"

#include "utils/charutils.h"

CGuild::CGuild(uint8 id, const char* _pointsName)
{
    m_id = id;
    std::fill_n(m_GPItemsRank, sizeof(m_GPItemsRank), 0);

    pointsName = _pointsName;
}

CGuild::~CGuild()
{

}

uint8 CGuild::id()
{
    return m_id;
}

void CGuild::updateGuildPointsPattern(uint8 pattern)
{
    for (auto& GPItems : m_GPItems)
    {
        GPItems.clear();
    }

    for (auto i = 0; i < GP_ITEM_RANKS; ++i)
    {
        m_GPItemsRank[i] = (m_GPItemsRank[i] + 1) % (i + 4);

        std::string query = "SELECT itemid, points, max_points FROM guild_item_points WHERE "
            "guildid = %u AND pattern = %u AND rank = %u";
        int ret = Sql_Query(SqlHandle, query.c_str(), m_id, pattern, m_GPItemsRank[i]);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                m_GPItems[i].push_back(GPItem_t(
                    itemutils::GetItemPointer(Sql_GetUIntData(SqlHandle, 0)),
                    Sql_GetUIntData(SqlHandle, 3),
                    Sql_GetUIntData(SqlHandle, 2)));
            }
        }
    }
}

//TODO: get current daily guild points
void CGuild::addGuildPoints(CCharEntity* PChar, CItem* PItem)
{
    uint8 rank = PChar->RealSkills.rank[m_id + 48];

    if (rank >= 3)
    {
        for (auto& GPItem : m_GPItems[rank - 3])
        {
            if (GPItem.item->getID() == PItem->getID())
            {
                uint16 curPoints = 0;
                uint16 points = GPItem.points * PItem->getQuantity();
                if (points > GPItem.maxpoints - curPoints)
                {
                    points = GPItem.maxpoints - curPoints;
                }
                charutils::AddPoints(PChar, pointsName.c_str(), points);
            }
        }
    }
}