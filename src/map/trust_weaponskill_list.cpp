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

#include "lua/luautils.h"

#include "map.h"
#include "trust_weaponskill_list.h"


CTrustWSList::CTrustWSList()
{

}

void CTrustWSList::AddWS(uint16 wsMobId, uint16 minLvl, uint16 maxLvl) //uint16 wsId
{
    TrustWS_t Trust_WS = {wsMobId, minLvl, maxLvl}; //wsId

    m_wsList.push_back(Trust_WS);
}

//Implement namespace to work with spells
namespace trustWSList
{
    CTrustWSList* PTrustWSList[MAX_TRUSTWSLIST_ID];

    //Load list of spells
    void LoadTrustWSList()
    {
        memset(PTrustWSList, 0, sizeof(PTrustWSList));
        PTrustWSList[0] = new CTrustWSList();

        const char* Query = "SELECT trust_skill_lists.skill_list_id, \
                            trust_skill_lists.mob_skill_id, \
                            trust_skill_lists.min_level, \
                            trust_skill_lists.max_level \
                            FROM trust_skill_lists \
                            LEFT JOIN mob_skills ON mob_skills.mob_skill_id = trust_skill_lists.mob_skill_id \
                            WHERE skill_list_id < %u;";

                            //trust_skill_lists.skill_id,

        int32 ret = Sql_Query(SqlHandle, Query, MAX_TRUSTWSLIST_ID);

        if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint16 wsMobId = (uint16)Sql_GetIntData(SqlHandle, 1);
                uint16 minLvl = (uint16)Sql_GetIntData(SqlHandle,2);
                uint16 maxLvl = (uint16)Sql_GetIntData(SqlHandle,3);

                uint16 pos = Sql_GetIntData(SqlHandle,0);
                if (!PTrustWSList[pos])
                {
                    PTrustWSList[pos] = new CTrustWSList();
                }

                PTrustWSList[pos]->AddWS(wsMobId, minLvl, maxLvl); //wsId
            }
        }
    }

    //Get Spell By ID
    CTrustWSList* GetTrustWSList(uint16 TrustWSListID)
    {
        if (TrustWSListID < MAX_TRUSTWSLIST_ID)
        {
            return PTrustWSList[TrustWSListID];
        }
        ShowFatalError(CL_RED"TrustWSListID <%u> out of range\n" CL_RESET, TrustWSListID);
        return nullptr;
    }
};
