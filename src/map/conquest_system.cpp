﻿/*
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

#include "conquest_system.h"
#include "entities/charentity.h"
#include "vana_time.h"
#include "utils/zoneutils.h"
#include "utils/charutils.h"

#include "packets/conquest_map.h"

#include "lua/luautils.h"
#include "latent_effect_container.h"

/************************************************************************
*                                                                       *
*	Реализация namespace conquest                                       *
*                                                                       *
************************************************************************/

namespace conquest
{
	/************************************************************************
    *                                                                       *
    *	UpdateConquestSystem		                                        *
    *                                                                       *
    ************************************************************************/

	void UpdateConquestSystem()
	{
		zoneutils::ForEachZone([](CZone* PZone)
		{
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() <= 18)
            {
                luautils::OnConquestUpdate(PZone, Conquest_Update);
				PZone->ForEachChar([](CCharEntity* PChar)
				{
					PChar->PLatentEffectContainer->CheckLatentsZone();
				});
            }
		});
	}

    void UpdateInfluencePoints(int points, unsigned int nation, REGIONTYPE region)
    {
        if (region == REGIONTYPE::REGION_UNKNOWN)
        {
            return;
        }

        std::string Query = "SELECT sandoria_influence, bastok_influence, windurst_influence, beastmen_influence FROM conquest_system WHERE region_id = %d;";

        int ret = Sql_Query(SqlHandle, Query.c_str(), region);

        if (ret == SQL_ERROR || Sql_NextRow(SqlHandle) != SQL_SUCCESS)
        {
            return;
        }

        int influences[4] =
        {
            Sql_GetIntData(SqlHandle, 0),
            Sql_GetIntData(SqlHandle, 1),
            Sql_GetIntData(SqlHandle, 2),
            Sql_GetIntData(SqlHandle, 3),
        };

        if (influences[nation] == 5000)
            return;

        auto lost = 0;
        for (auto i = 0; i < 4; ++i)
        {
            if (i == nation)
            {
                continue;
            }

            auto loss = std::min<int>(points * influences[i] / 5000 - influences[nation], influences[i]);
            influences[i] -= loss;
            lost += loss;
        }

        influences[nation] += lost;

        Sql_Query(SqlHandle, "UPDATE conquest_system SET sandoria_influence = %d, bastok_influence = %d, "
            "windurst_influence = %d, beastmen_influence = %d WHERE region_id = %d;", influences[0], influences[1], influences[2], influences[3], region);
    }

    /************************************************************************
    *    GainInfluencePoints                                                *
    *    +1 point for nation							                    *
    *						                                                *
    ************************************************************************/

    void GainInfluencePoints(CCharEntity* PChar, uint32 points)
    {
        conquest::UpdateInfluencePoints(points, PChar->profile.nation, PChar->loc.zone->GetRegionID());
    }

    /************************************************************************
    *    LoseInfluencePoints                                                *
    *    -x point for nation							                    *
    *    +x point for beastmen                                              *
    ************************************************************************/

    void LoseInfluencePoints(CCharEntity* PChar)
    {
        REGIONTYPE region = PChar->loc.zone->GetRegionID();
        int points = 0;

        switch (region)
        {
            case REGION_RONFAURE:
            case REGION_GUSTABERG:
            case REGION_SARUTABARUTA:
            {
                points = 10;
                break;
            }
            case REGION_ZULKHEIM:
            case REGION_KOLSHUSHU:
            case REGION_NORVALLEN:
            case REGION_DERFLAND:
            case REGION_ARAGONEU:
            {
                points = 50;
                break;
            }
            case REGION_QUFIMISLAND:
            case REGION_LITELOR:
            case REGION_KUZOTZ:
            case REGION_ELSHIMOLOWLANDS:
            {
                points = 75;
                break;
            }
            case REGION_VOLLBOW:
            case REGION_VALDEAUNIA:
            case REGION_FAUREGANDI:
            case REGION_ELSHIMOUPLANDS:
            {
                points = 300;
                break;
            }
            case REGION_TULIA:
            case REGION_MOVALPOLOS:
            case REGION_TAVNAZIA:
            {
                points = 600;
                break;
            }
        }

        conquest::UpdateInfluencePoints(points, BEASTMEN, region);
    }

	/************************************************************************
    *                                                                       *
    *	GetInfluenceGraphics		                                        *
    *												                        *
    ************************************************************************/

    uint8 GetInfluenceGraphics(int32 san_inf, int32 bas_inf, int32 win_inf, int32 bst_inf)
	{
        //if all nations and beastmen == 0
        if (san_inf == 0 && bas_inf == 0 && win_inf == 0 && bst_inf == 0)
        {
            return 0;
        }
        //if all nations and beastmen, has same number
        else if (san_inf == bas_inf &&
            san_inf == win_inf &&
            san_inf == bst_inf)
        {
            return 0;
        }
        //if Beast influence > all nations
        else if (bst_inf > san_inf &&
            bst_inf > win_inf &&
            bst_inf > bas_inf)
        {
            return 64;
        }
        else
        {
            uint8 offset = 0;
            int64 total = san_inf + bas_inf + win_inf;

            //Sandoria
            if (san_inf >= total * 0.65)	  offset = 3;
            else if (san_inf >= total * 0.5)  offset = 2;
            else if (san_inf >= total * 0.25) offset = 1;
            else							  offset = 0;

            //Bastok
            if (bas_inf >= total * 0.65)	  offset += 12;
            else if (bas_inf >= total * 0.5)  offset += 8;
            else if (bas_inf >= total * 0.25) offset += 4;
            else							  offset += 0;

            //Windurst
            if (win_inf >= total * 0.65)	  offset += 48;
            else if (win_inf >= total * 0.5)  offset += 32;
            else if (win_inf >= total * 0.25) offset += 16;
            else							  offset += 0;

            return offset;
        }
	}

    uint8 GetInfluenceGraphics(REGIONTYPE regionid)
    {
        int32 sandoria = 0;
        int32 bastok = 0;
        int32 windurst = 0;
        int32 beastmen = 0;
        const int8* Query = "SELECT sandoria_influence, bastok_influence, windurst_influence, beastmen_influence \
                             FROM conquest_system WHERE region_id = %d;";

        int32 ret = Sql_Query(SqlHandle, Query, regionid);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            sandoria = Sql_GetIntData(SqlHandle, 0);
            bastok = Sql_GetIntData(SqlHandle, 1);
            windurst = Sql_GetIntData(SqlHandle, 2);
            beastmen = Sql_GetIntData(SqlHandle, 3);
        }
        return GetInfluenceGraphics(sandoria, bastok, windurst, beastmen);
    }

    //TODO: figure out what the beastmen-less numbers are for
    uint8 GetInfluenceRanking(int32 san_inf, int32 bas_inf, int32 win_inf, int32 bst_inf)
    {
        uint8 ranking = 63;
        if (san_inf >= bas_inf)
            ranking -= 1;

        if (san_inf >= win_inf)
            ranking -= 1;

        if (bas_inf >= san_inf)
            ranking -= 4;

        if (bas_inf >= win_inf)
            ranking -= 4;

        if (win_inf >= san_inf)
            ranking -= 16;

        if (win_inf >= bas_inf)
            ranking -= 16;

        return ranking;
    }

    uint8 GetInfluenceRanking(int32 san_inf, int32 bas_inf, int32 win_inf)
    {
        return GetInfluenceRanking(san_inf, bas_inf, win_inf, 0);
    }

	/************************************************************************
    *   UpdateConquestGM                                                    *
    *	Update region control		                                        *
    *   just used by GM command			                                    *
    ************************************************************************/

    void UpdateConquestGM(ConquestUpdate type)
    {
        if (type == Conquest_Tally_Start || type == Conquest_Tally_End)
            UpdateWeekConquest();
        else
            UpdateConquestSystem();
	}

	/************************************************************************
    *   UpdateWeekConquest                                                  *
    *	Update region control		                                        *
    *   update 1 time per week			                                    *
    ************************************************************************/

	void UpdateWeekConquest()
	{
		//TODO: move to lobby server
		//launch conquest message in all zone (monday server midnight)

        zoneutils::ForEachZone([](CZone* PZone)
        {
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() <= 18)
            {
                luautils::OnConquestUpdate(PZone, Conquest_Tally_Start);
            }
        });

        const int8* Query = "UPDATE conquest_system SET region_control = \
                            IF(sandoria_influence > bastok_influence AND sandoria_influence > windurst_influence AND \
                            sandoria_influence > beastmen_influence, 0, \
                            IF(bastok_influence > sandoria_influence AND bastok_influence > windurst_influence AND \
                            bastok_influence > beastmen_influence, 1, \
                            IF(windurst_influence > bastok_influence AND windurst_influence > sandoria_influence AND \
                            windurst_influence > beastmen_influence, 2, 3)));";

        Sql_Query(SqlHandle, Query);

		//update conquest overseers
		for (uint8 i=0; i <= 18; i++)
		{
            luautils::SetRegionalConquestOverseers(i);
		}

        zoneutils::ForEachZone([](CZone* PZone)
        {
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() <= 18)
            {
                luautils::OnConquestUpdate(PZone, Conquest_Tally_End);
                PZone->ForEachChar([](CCharEntity* PChar)
                {
                    PChar->pushPacket(new CConquestPacket(PChar));
                    PChar->PLatentEffectContainer->CheckLatentsZone();
                });
            }
        });

		ShowDebug(CL_CYAN"Conquest Weekly Update is finished\n" CL_RESET);
	}

	/************************************************************************
    *                                                                       *
    *	GetBalance					                                        *
    *   Ranking for the 3 nations                                           *
    ************************************************************************/

    uint8 GetBalance(uint8 sandoria, uint8 bastok, uint8 windurst, uint8 sandoria_prev, uint8 bastok_prev, uint8 windurst_prev)
    {
		// Based on the below values, it seems to be in pairs of bits.
		// Order is Windurst, Bastok, San d'Oria
		// 01 for first place, 10 for second, 11 for third.
		// 45 = 0b101101 = Windurst in second, Bastok in third, San d'Oria in first
		// 30 = 0b011110 = Windurst in first, Bastok in third, San d'Oria in second

		uint8 ranking = 63;
        if (sandoria >= bastok)
			ranking -= 1;

        if (sandoria >= windurst)
			ranking -= 1;

        if (bastok >= sandoria)
			ranking -= 4;

        if (bastok >= windurst)
			ranking -= 4;

        if (windurst >= sandoria)
			ranking -= 16;

        if (windurst >= bastok)
			ranking -= 16;

        if (GetAlliance(sandoria_prev, bastok_prev, windurst_prev) != 0)
        {
            //there was an alliance last conquest week, so the allied nations will be tied for first (unless they didn't pass the other nation)
            if (sandoria_prev > bastok_prev && sandoria_prev > windurst_prev && (ranking & 0x03) != 0x01)
            {
                ranking = 0x17;
            }
            else if (bastok_prev > sandoria_prev && bastok_prev > windurst_prev && (ranking & 0x0C) != 0x04)
            {
                ranking = 0x1D;
            }
            else if (windurst_prev > bastok_prev && windurst_prev > sandoria_prev && (ranking & 0x30) != 0x10)
            {
                ranking = 0x35;
            }
        }

		return ranking;
    }

    uint8 GetBalance()
    {
        uint8 sandoria = 0;
        uint8 bastok = 0;
        uint8 windurst = 0;
        const int8* Query = "SELECT region_control, COUNT(*) FROM conquest_system WHERE region_control < 3 GROUP BY region_control;";

        int32 ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria = Sql_GetIntData(SqlHandle, 1);
                else if(Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst = Sql_GetIntData(SqlHandle, 1);
            }
        }

        uint8 sandoria_prev = 0;
        uint8 bastok_prev = 0;
        uint8 windurst_prev = 0;

        Query = "SELECT region_control_prev, COUNT(*) FROM conquest_system WHERE region_control_prev < 3 GROUP BY region_control_prev;";

        ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst_prev = Sql_GetIntData(SqlHandle, 1);
            }
        }
        return GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, sandoria_prev);
    }

    uint8 GetAlliance(uint8 sandoria, uint8 bastok, uint8 windurst)
    {
        if ((sandoria > (bastok + windurst) && sandoria > bastok && sandoria > windurst) && sandoria > 9||
            (bastok > (sandoria + windurst) && bastok > sandoria && bastok > windurst) && bastok > 9||
            (windurst > (sandoria + bastok) && windurst > bastok && windurst > sandoria) && windurst > 9)
        {
            return 1;
        }
        return 0;
    }

    uint8 GetAlliance(uint8 sandoria, uint8 bastok, uint8 windurst, uint8 sandoria_prev, uint8 bastok_prev, uint8 windurst_prev)
    {
        if (sandoria > (bastok + windurst) && sandoria > bastok && sandoria > windurst)
        {
            uint8 ranking = GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
            if ((ranking & 0x03) == 0x01)
                return 1;
        }
        else if (bastok > (sandoria + windurst) && bastok > sandoria && bastok > windurst)
        {
            uint8 ranking = GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
            if ((ranking & 0x0C) == 0x04)
                return 1;
        }
        else if (windurst > (sandoria + bastok) && windurst > bastok && windurst > sandoria)
        {
            uint8 ranking = GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
            if ((ranking & 0x30) == 0x10)
                return 1;
        }
        return 0;
    }

    bool IsAlliance()
    {
        uint8 sandoria = 0;
        uint8 bastok = 0;
        uint8 windurst = 0;
        const int8* Query = "SELECT region_control, COUNT(*) FROM conquest_system WHERE region_control < 3 GROUP BY region_control;";

        int32 ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst = Sql_GetIntData(SqlHandle, 1);
            }
        }

        uint8 sandoria_prev = 0;
        uint8 bastok_prev = 0;
        uint8 windurst_prev = 0;

        Query = "SELECT region_control_prev, COUNT(*) FROM conquest_system WHERE region_control_prev < 3 GROUP BY region_control_prev;";

        ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst_prev = Sql_GetIntData(SqlHandle, 1);
            }
        }

        return GetAlliance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev) == 1;
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
        const int8* Query = "SELECT region_control FROM conquest_system WHERE region_id = %d";

        int32 ret = Sql_Query(SqlHandle, Query, RegionID);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            return Sql_GetIntData(SqlHandle, 0);
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

            uint32 points = exp * (PChar->profile.nation == GetRegionOwner(region) ? 0.1 : 0.15);

            charutils::AddPoints(PChar, charutils::GetConquestPointsName(PChar).c_str(), points);
            GainInfluencePoints(PChar, points/2);
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