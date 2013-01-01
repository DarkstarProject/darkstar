/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "conquest_system.h"
#include "charentity.h"
#include "vana_time.h"

#include "lua\luautils.h"

uint32 g_Conquest[19][6];

/************************************************************************
*                                                                       *
*	Реализация namespace conquest                                       *
*                                                                       *
************************************************************************/

namespace conquest
{
    /************************************************************************
    *                                                                       *
    *	LoadConquestSystem			                                        *
    *                                                                       *
    ************************************************************************/

	void LoadConquestSystem()
	{
		int8 regNum = 0;
		const int8* Query =  
        "SELECT region_id, region_control, sandoria_influence, bastok_influence, windurst_influence, beastmen_influence FROM conquest_system";

		int32 ret = Sql_Query(SqlHandle, Query);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0) 
		{	
			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
			{
				g_Conquest[regNum][0] = (uint32)Sql_GetIntData(SqlHandle,0); // Region ID
				g_Conquest[regNum][1] = (uint32)Sql_GetIntData(SqlHandle,1); // Region Control
				g_Conquest[regNum][2] = (uint32)Sql_GetIntData(SqlHandle,2); // Influence of sandoria
				g_Conquest[regNum][3] = (uint32)Sql_GetIntData(SqlHandle,3); // Influence of bastok
				g_Conquest[regNum][4] = (uint32)Sql_GetIntData(SqlHandle,4); // Influence of windurst
				g_Conquest[regNum][5] = (uint32)Sql_GetIntData(SqlHandle,5); // Influence of beastmen
				regNum++;
			}
		}
	}

	/************************************************************************
    *   UpdateWeekConquest                                                  *
    *	Update region control		                                        *
    *   just used by GM command for now                                     *
    ************************************************************************/

	void UpdateWeekConquest()
	{
		LoadConquestSystem();
		luautils::SetRegionalConquestOverseers();
		//TODO: 
		//launch conquest message in all zone (sunday server midnight)
		//LoadConquestSystem()
		//change region control with the best influence
		//reset all influence
		//luautils::SetRegionalConquestOverseers();
		//launch end message ?
	}
	
	/************************************************************************
    *                                                                       *
    *	Баланс сил на текущий conquest                                      *
    *                                                                       *
    ************************************************************************/

    uint8 GetBalance()
    {
	    return 0x1E;
    }

    /************************************************************************
    *                                                                       *
    *  Оставшееся количество дней до подсчета conquest                      *
    *                                                                       *
    ************************************************************************/

    uint8 GetNexTally()
    {
	    uint32 currData = CVanaTime::getInstance()->getDate() / 1440;
	    return (uint8)(175 - ((currData - 85)%175));
    }

    /************************************************************************
    *                                                                       *
    *  Добавляем персонажу conquest points, основываясь на полученном опыте *
    *                                                                       *
    ************************************************************************/

    // TODO: необходимо учитывать добавленные очки для еженедельного подсчета conquest

    uint32 AddConquestPoints(CCharEntity* PChar, uint32 exp)
    {
        // ВНИМЕНИЕ: не нужно отправлять персонажу CConquestPacket, 
        // т.к. клиент сам запрашивает этот пакет через фиксированный промежуток времени

        REGIONTYPE region = PChar->loc.zone->GetRegionID();

        if(region != REGION_UNKNOWN)
        {
            // 10% if region control is player's nation 
            // 15% otherwise
            
            PChar->RegionPoints[PChar->profile.nation] += exp * (PChar->profile.nation == GetRegionOwner(region) ? 0.1 : 0.15);
        }
        return 0; // added conquest points (пока не вижу в этом определенного смысла)
    }

    /************************************************************************
    *                                                                       *
    *  Узнаем страну, владеющую данной зоной                                *
    *                                                                       *
    ************************************************************************/

    uint8 GetRegionOwner(REGIONTYPE RegionID)
    {
        switch (RegionID)
        {
            case REGION_RONFAURE:        return g_Conquest[REGION_RONFAURE][1];
            case REGION_ZULKHEIM:        return g_Conquest[REGION_ZULKHEIM][1];
            case REGION_NORVALLEN:       return g_Conquest[REGION_NORVALLEN][1];
            case REGION_GUSTABERG:       return g_Conquest[REGION_GUSTABERG][1];
            case REGION_DERFLAND:        return g_Conquest[REGION_DERFLAND][1];
            case REGION_SARUTABARUTA:    return g_Conquest[REGION_SARUTABARUTA][1];
            case REGION_KOLSHUSHU:       return g_Conquest[REGION_KOLSHUSHU][1];
            case REGION_ARAGONEU:        return g_Conquest[REGION_ARAGONEU][1];
            case REGION_FAUREGANDI:      return g_Conquest[REGION_FAUREGANDI][1];
            case REGION_VALDEAUNIA:      return g_Conquest[REGION_VALDEAUNIA][1];
            case REGION_QUFIMISLAND:     return g_Conquest[REGION_QUFIMISLAND][1];
            case REGION_LITELOR:         return g_Conquest[REGION_LITELOR][1];
            case REGION_KUZOTZ:          return g_Conquest[REGION_KUZOTZ][1];
            case REGION_VOLLBOW:         return g_Conquest[REGION_VOLLBOW][1];
            case REGION_ELSHIMOLOWLANDS: return g_Conquest[REGION_ELSHIMOLOWLANDS][1];
            case REGION_ELSHIMOUPLANDS:  return g_Conquest[REGION_ELSHIMOUPLANDS][1];
            case REGION_TULIA:           return g_Conquest[REGION_TULIA][1];
            case REGION_MOVALPOLOS:      return g_Conquest[REGION_MOVALPOLOS][1];
            case REGION_TAVNAZIA:        return g_Conquest[REGION_TAVNAZIA][1];
        }
        return NEUTRAL;
    }

	
	//GetConquestInfluence(region,nation)
	//AddConquestInfluence(region,nation)
	//ResetConquestInfluence()
	//UpdateConquestInfluence()

	//gain/loss influence
	//Dying in the Outlands decrease your Allegiance influence and increase the influence of the Beastmen hordes instead. 
	//Gain: XP/CP, Garrison quests, Expeditionary Forces, trade items to Outpost Vendors (influence only) 

	//Region control
	//0: sandoria
	//1: bastok
	//2: windurst
	//3: beastmen
};