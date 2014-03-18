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

#include "conquest_system.h"
#include "entities/charentity.h"
#include "vana_time.h"
#include "utils/zoneutils.h"

#include "lua/luautils.h"

int32 g_Conquest[46][7];

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
        "SELECT region_id, region_control, sandoria_influence, bastok_influence, windurst_influence, beastmen_influence, graphics_arrows FROM conquest_system";

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
				g_Conquest[regNum][6] = (uint32)Sql_GetIntData(SqlHandle,6); // Number for graphics with arrows
				regNum++;
			}
		}
	}

	/************************************************************************
    *                                                                       *
    *	UpdateConquestSystem		                                        *
    *                                                                       *
    ************************************************************************/

	void UpdateConquestSystem()
	{
		for (uint8 i=0; i <= 18; i++)
		{
			g_Conquest[i][6] = CreateInfluenceGraphics(i);

			const int8* Query =  "UPDATE conquest_system "
								 "SET region_control = %u, sandoria_influence = %u, bastok_influence = %u, windurst_influence = %u, beastmen_influence = %u, graphics_arrows = %u "
								 "WHERE region_id = %u";

			Sql_Query(SqlHandle, Query, g_Conquest[i][1], g_Conquest[i][2], g_Conquest[i][3], g_Conquest[i][4], g_Conquest[i][5], g_Conquest[i][6], i);


            for (uint16 zone = 0; zone < MAX_ZONEID; ++zone)
            {
                //only find chars for zones that have had conquest updated
                if (zoneutils::GetZone(zone)->GetRegionID() == i)
                {
                    EntityList_t charList = zoneutils::GetZone(zone)->GetCharList();

                    //run an iterator over the zone's char list
                    for (EntityList_t::const_iterator it = charList.begin(); it != charList.end(); ++it)
                    {
                        CCharEntity* PChar = (CCharEntity*)it->second;

                        //check conquest latents
                        PChar->PLatentEffectContainer->CheckLatentsZone();
                    }

                }
            }


		}
	}

	/************************************************************************
    *    GainInfluencePoints                                                *
    *    +1 point for nation							                    *
    *						                                                *
    ************************************************************************/

    void GainInfluencePoints(CCharEntity* PChar)
    {
        REGIONTYPE region = PChar->loc.zone->GetRegionID();
        if (region == REGIONTYPE::REGION_UNKNOWN)
            return;

        g_Conquest[region][PChar->profile.nation + 2] += 1;
    }

	/************************************************************************
    *    LoseInfluencePoints                                                *
    *    -x point for nation							                    *
    *    +x point for beastmen                                              *
    ************************************************************************/

	void LoseInfluencePoints(CCharEntity* PChar)
	{
		REGIONTYPE region = PChar->loc.zone->GetRegionID();
		int8 point = 0;

		switch (region)
		{
			case REGION_RONFAURE:
			case REGION_GUSTABERG:
			case REGION_SARUTABARUTA:
			{
				point = 1;
			}
			case REGION_ZULKHEIM:
			case REGION_KOLSHUSHU:
			case REGION_NORVALLEN:
			case REGION_DERFLAND:
			case REGION_ARAGONEU:
			{
				point = 3;
			}
			case REGION_QUFIMISLAND:
			case REGION_LITELOR:
			case REGION_KUZOTZ:
			case REGION_ELSHIMOLOWLANDS:
			{
				point = 6;
			}
			case REGION_VOLLBOW:
			case REGION_VALDEAUNIA:
			case REGION_FAUREGANDI:
			case REGION_ELSHIMOUPLANDS:
			{
				point = 9;
			}
			case REGION_TULIA:
			case REGION_MOVALPOLOS:
			case REGION_TAVNAZIA:
			{
				point = 12;
			}
		}

		if(g_Conquest[region][PChar->profile.nation + 2] >= point)
		{
			g_Conquest[region][PChar->profile.nation + 2] -= point;
		}

		g_Conquest[region][5] += point;
	}

	/************************************************************************
    *                                                                       *
    *	GetInfluencePoints			                                        *
    *                                                                       *
    ************************************************************************/

	uint32 GetInfluencePoints(REGIONTYPE RegionID, uint8 nation)
	{
		return g_Conquest[RegionID][nation + 2];
	}

	/************************************************************************
    *                                                                       *
    *	CreateInfluenceGraphics		                                        *
    *   Graphic with the arrows in the conquest menu                        *
    ************************************************************************/

	uint8 CreateInfluenceGraphics(uint8 RegionID)
	{
		//if all nations and beastmen == 0
		if(g_Conquest[RegionID][2] == 0 && g_Conquest[RegionID][3] == 0 && g_Conquest[RegionID][4] == 0 && g_Conquest[RegionID][5] == 0)
		{
			return 0;
		}
		//if all nations and beastmen, has same number
		else if(g_Conquest[RegionID][2] == g_Conquest[RegionID][3] &&
				g_Conquest[RegionID][2] == g_Conquest[RegionID][4] &&
				g_Conquest[RegionID][2] == g_Conquest[RegionID][5] &&
				g_Conquest[RegionID][3] == g_Conquest[RegionID][4] &&
				g_Conquest[RegionID][3] == g_Conquest[RegionID][5] &&
				g_Conquest[RegionID][4] == g_Conquest[RegionID][5])
		{
			return 0;
		}
		//if Beast influence > all nations
		else if(g_Conquest[RegionID][5] > g_Conquest[RegionID][2] &&
				g_Conquest[RegionID][5] > g_Conquest[RegionID][3] &&
				g_Conquest[RegionID][5] > g_Conquest[RegionID][4])
		{
			return 64;
		}
		else
		{
			uint8 offset = 0;
			int32 maxP = 0;

			if(g_Conquest[RegionID][2] > g_Conquest[RegionID][3] && g_Conquest[RegionID][2] > g_Conquest[RegionID][4]) maxP = g_Conquest[RegionID][2];
			else if(g_Conquest[RegionID][3] > g_Conquest[RegionID][2] && g_Conquest[RegionID][3] > g_Conquest[RegionID][4]) maxP = g_Conquest[RegionID][3];
			else maxP = g_Conquest[RegionID][4];

			int32 lev = maxP / 4;

			//Sandoria
			if(g_Conquest[RegionID][2] >= maxP)			offset = 3;
			else if(g_Conquest[RegionID][2] >= lev * 3) offset = 2;
			else if(g_Conquest[RegionID][2] >= lev * 2)	offset = 1;
			else										offset = 0;

			//Bastok
			if(g_Conquest[RegionID][3] >= maxP)			offset += 12;
			else if(g_Conquest[RegionID][3] >= lev * 3) offset += 8;
			else if(g_Conquest[RegionID][3] >= lev * 2)	offset += 4;
			else										offset += 0;

			//Windurst
			if(g_Conquest[RegionID][4] >= maxP)			offset += 48;
			else if(g_Conquest[RegionID][4] >= lev * 3) offset += 32;
			else if(g_Conquest[RegionID][4] >= lev * 2)	offset += 16;
			else										offset += 0;

			return offset;
		}
	}

	/************************************************************************
    *                                                                       *
    *	GetInfluenceGraphics		                                        *
    *												                        *
    ************************************************************************/

	uint8 GetInfluenceGraphics(REGIONTYPE RegionID)
	{
		return g_Conquest[RegionID][6];
	}

	/************************************************************************
    *   UpdateConquestGM                                                    *
    *	Update region control		                                        *
    *   just used by GM command			                                    *
    ************************************************************************/

	void UpdateConquestGM()
	{
		LoadConquestSystem();
		luautils::SetRegionalConquestOverseers();
	}

	/************************************************************************
    *   UpdateWeekConquest                                                  *
    *	Update region control		                                        *
    *   update 1 time per week			                                    *
    ************************************************************************/

	void UpdateWeekConquest()
	{
		//TODO:
		//launch conquest message in all zone (monday server midnight)

		//change region control with the best influence
		for (uint8 i=0; i <= 18; i++)
		{
			if(g_Conquest[i][2] > g_Conquest[i][3] && g_Conquest[i][2] > g_Conquest[i][4] && g_Conquest[i][2] > g_Conquest[i][5])
				g_Conquest[i][1] = 0;
			else if(g_Conquest[i][3] > g_Conquest[i][2] && g_Conquest[i][3] > g_Conquest[i][4] && g_Conquest[i][3] > g_Conquest[i][5])
				g_Conquest[i][1] = 1;
			else if(g_Conquest[i][4] > g_Conquest[i][2] && g_Conquest[i][4] > g_Conquest[i][3] && g_Conquest[i][4] > g_Conquest[i][5])
				g_Conquest[i][1] = 2;
			else if(g_Conquest[i][5] > g_Conquest[i][2] && g_Conquest[i][5] > g_Conquest[i][3] && g_Conquest[i][5] > g_Conquest[i][4])
				g_Conquest[i][1] = 3;
			else
				g_Conquest[i][1] = WELL512::irand() % 3; //random 0,1,2

			//reset all influence points
			g_Conquest[i][2] = 0;
			g_Conquest[i][3] = 0;
			g_Conquest[i][4] = 0;
			g_Conquest[i][5] = 0;
			g_Conquest[i][6] = 0;
		}

		luautils::SetRegionalConquestOverseers();

		//launch end message ?
		//Update packet ?

		UpdateConquestSystem();
		ShowDebug(CL_CYAN"Conquest Weekly Update is finished\n" CL_RESET);
	}

	/************************************************************************
    *                                                                       *
    *	GetBalance					                                        *
    *   Classment for the 3 nations                                         *
    ************************************************************************/

    uint8 GetBalance()
    {
	    int8 sandy = 0;
		int8 basty = 0;
		int8 windy = 0;

		for (uint8 i=0; i <= 18; i++)
		{
			if(g_Conquest[i][1] == 0) sandy++;
			else if(g_Conquest[i][1] == 1) basty++;
			else if(g_Conquest[i][1] == 2) windy++;
		}

		// Based on the below values, it seems to be in pairs of bits.
		// Order is Windurst, Bastok, San d'Oria
		// 01 for first place, 10 for second, 11 for third.
		// 45 = 0b101101 = Windurst in second, Bastok in third, San d'Oria in first
		// 30 = 0b011110 = Windurst in first, Bastok in third, San d'Oria in second

		uint8 ranking = 63;
		if(sandy >= basty)
			ranking -= 1;

		if(sandy >= windy)
			ranking -= 1;

		if(basty >= sandy)
			ranking -= 4;

		if(basty >= windy)
			ranking -= 4;

		if(windy >= sandy)
			ranking -= 16;

		if(windy >= basty)
			ranking -= 16;

		return ranking;
    }

    /************************************************************************
    *                                                                       *
    *  Оставшееся количество дней до подсчета conquest                      *
    *                                                                       *
    ************************************************************************/

    uint8 GetNexTally()
    {
	    uint8 dayspassed = CVanaTime::getInstance()->getSysWeekDay() * 25;
	    dayspassed += ((CVanaTime::getInstance()->getSysHour() * 60 + CVanaTime::getInstance()->getSysMinute()) * 25 ) / 1440;
	    return (uint8)(175 - dayspassed);
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

            PChar->m_currency.conquestpoints[PChar->profile.nation] += exp * (PChar->profile.nation == GetRegionOwner(region) ? 0.1 : 0.15);
        }
        return 0; // added conquest points (пока не вижу в этом определенного смысла)
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