
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
#include <string.h>

#include "../entities/charentity.h"
#include "../entities/mobentity.h"
#include "../party.h"
#include "../treasure_pool.h"
#include "charutils.h"
#include "../alliance.h"
#include "zoneutils.h"
#include "itemutils.h"
#include "battlefieldutils.h"
#include "mobutils.h"
#include "../battlefield.h"
#include "../battlefield_handler.h"
#include "../packets/entity_update.h"
#include "../ai/ai_container.h"


namespace battlefieldutils {

    /*************************************************************
    Returns the losing exit position for this BCNM.
    ****************************************************************/
    void getLosePosition(CBattlefield* battlefield, int(&pPosition)[4]) {
        if (battlefield == nullptr)
            return;

        switch (battlefield->GetZoneID()) {
            case 139: //Horlais Peak
                pPosition[0] = -503; pPosition[1] = 158; pPosition[2] = -212; pPosition[3] = 131;
                break;
        }
    }

    void getStartPosition(uint16 zoneid, int(&pPosition)[4]) {

        switch (zoneid) {
            case 139: //Horlais Peak
                pPosition[0] = -503; pPosition[1] = 158; pPosition[2] = -212; pPosition[3] = 131;
                break;
            case 144: //Waug. Shrine
                pPosition[0] = -361; pPosition[1] = 100; pPosition[2] = -260; pPosition[3] = 131;
                break;
            case 146: //Balgas Dias
                pPosition[0] = 317; pPosition[1] = -126; pPosition[2] = 380; pPosition[3] = 131;
                break;
            case 165: //Throne Room
                pPosition[0] = 114; pPosition[1] = -8; pPosition[2] = 0; pPosition[3] = 131;
                break;
            case 206: //QuBia Arena
                pPosition[0] = -241; pPosition[1] = -26; pPosition[2] = 20; pPosition[3] = 131;
                break;
        }
    }

    /*************************************************************
    Returns the winning exit position for this BCNM.
    ****************************************************************/
    void getWinPosition(CBattlefield* battlefield, int(&pPosition)[4]) {
        if (battlefield == nullptr)
            return;

        switch (battlefield->GetZoneID()) {
            case 139: //Horlais Peak
                pPosition[0] = 445; pPosition[1] = -38; pPosition[2] = -19; pPosition[3] = 200;
                break;
        }
    }


    uint8 getMaxLootGroups(CBattlefield* battlefield) {
        /*
        const int8* fmtQuery = "SELECT MAX(lootGroupId) \
                        FROM bcnm_loot \
                        JOIN bcnm_info ON bcnm_info.LootDropId = bcnm_loot.LootDropId \
                        WHERE bcnm_info.LootDropId = %u LIMIT 1";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getLootId());
        if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0 || Sql_NextRow(SqlHandle) != SQL_SUCCESS) {
            ShowError("SQL error occured \n");
            return 0;
        }
        else {
            return (uint8)Sql_GetUIntData(SqlHandle, 0);
        }
        */
        return 0;
    }

    uint16 getRollsPerGroup(CBattlefield* battlefield, uint8 groupID) {
        /*
        const int8* fmtQuery = "SELECT SUM(CASE \
            WHEN LootDropID = %u \
            AND lootGroupId = %u \
            THEN rolls  \
            ELSE 0 END) \
            FROM bcnm_loot;";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, battlefield->getLootId(), groupID);
        if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) == 0 || Sql_NextRow(SqlHandle) != SQL_SUCCESS) {
            ShowError("SQL error occured \n");
            return 0;
        }
        else {
            return (uint16)Sql_GetUIntData(SqlHandle, 0);
        }
        */
        return 0;
    }

    /*************************************************************
    Get loot from the armoury crate
    ****************************************************************/

    void getChestItems(CBattlefield* battlefield) {
        /*
        int instzone = battlefield->getZoneId();
        uint8 maxloot = 0;
        LootList_t* LootList = itemutils::GetLootList(battlefield->getLootId());

        if (LootList == nullptr) {
            ShowError("BCNM Chest opened with no valid loot list!");
            //no loot available for bcnm. End bcnm.
            battlefield->winBcnm();
            return;
        }
        else
        {
            for (uint8 sizeoflist = 0; sizeoflist < LootList->size(); ++sizeoflist) {
                if (LootList->at(sizeoflist).LootGroupId > maxloot) {
                    maxloot = LootList->at(sizeoflist).LootGroupId;
                }
            }
        }
        //getMaxLootGroups(battlefield);
        if (maxloot != 0) {
            for (uint8 group = 0; group <= maxloot; ++group) {
                uint16 maxRolls = getRollsPerGroup(battlefield, group);
                uint16 groupRoll = dsprand::GetRandomNumber(maxRolls);
                uint16 itemRolls = 0;

                for (uint8 item = 0; item < LootList->size(); ++item)
                {
                    if (group == LootList->at(item).LootGroupId)
                    {
                        itemRolls += LootList->at(item).Rolls;
                        if (groupRoll <= itemRolls)
                        {
                            battlefield->m_PlayerList.at(0)->PTreasurePool->AddItem(LootList->at(item).ItemID, battlefield->m_NpcList.at(0));
                            break;
                        }
                    }
                }
            }
        }
        //user opened chest, complete bcnm
        if (instzone != 37 && instzone != 38) {
            battlefield->winBcnm();
        }
        else {
            battlefield->m_NpcList.clear();
        }
        */
    }
};