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
#include "trust_spell_list.h"


CTrustSpellList::CTrustSpellList()
{

}

void CTrustSpellList::AddSpell(SpellID spellId, uint16 minLvl, uint16 maxLvl)
{
  TrustSpell_t Trust_Spell = {spellId, minLvl, maxLvl};

  m_spellList.push_back(Trust_Spell);
}

//Implement namespace to work with spells
namespace trustSpellList
{
    CTrustSpellList* PTrustSpellList[MAX_TRUSTSPELLLIST_ID];

    //Load list of spells
    void LoadTrustSpellList()
    {
        memset(PTrustSpellList, 0, sizeof(PTrustSpellList));
        PTrustSpellList[0] = new CTrustSpellList();

        const char* Query = "SELECT trust_spell_lists.spell_list_id, \
                            trust_spell_lists.spell_id, \
                            trust_spell_lists.min_level, \
                            trust_spell_lists.max_level, \
                            spell_list.content_tag \
                            FROM trust_spell_lists JOIN spell_list ON spell_list.spellid = trust_spell_lists.spell_id \
                            WHERE spell_list_id < %u order by trust_spell_lists.min_level desc;";

        int32 ret = Sql_Query(SqlHandle, Query, MAX_TRUSTSPELLLIST_ID);

        if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                SpellID spellId = (SpellID)Sql_GetIntData(SqlHandle,1);
                uint16 minLvl = (uint16)Sql_GetIntData(SqlHandle,2);
                uint16 maxLvl = (uint16)Sql_GetIntData(SqlHandle,3);

                uint16 pos = Sql_GetIntData(SqlHandle,0);
                if (!PTrustSpellList[pos])
                {
                    PTrustSpellList[pos] = new CTrustSpellList();
                }

                PTrustSpellList[pos]->AddSpell(spellId, minLvl, maxLvl);
            }
        }
    }

    //Get Spell By ID
    CTrustSpellList* GetTrustSpellList(uint16 TrustSpellListID)
    {
        if (TrustSpellListID < MAX_TRUSTSPELLLIST_ID)
        {
            return PTrustSpellList[TrustSpellListID];
        }
        ShowFatalError(CL_RED"TrustSpellListID <%u> out of range\n" CL_RESET, TrustSpellListID);
        return nullptr;
    }
};
