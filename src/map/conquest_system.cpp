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

/************************************************************************
*                                                                       *
*	Реализация namespace conquest                                       *
*                                                                       *
************************************************************************/

namespace conquest
{
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
            case REGION_RONFAURE:        return SANDORIA;
            case REGION_ZULKHEIM:        return SANDORIA;
            case REGION_NORVALLEN:       return SANDORIA;
            case REGION_GUSTABERG:       return BASTOK;
            case REGION_DERFLAND:        return WINDURST;
            case REGION_SARUTABARUTA:    return WINDURST;
            case REGION_KOLSHUSHU:       return WINDURST;
            case REGION_ARAGONEU:        return SANDORIA;
            case REGION_FAUREGANDI:      return BASTOK;
            case REGION_VALDEAUNIA:      return WINDURST;
            case REGION_QUFIMISLAND:     return BASTOK;
            case REGION_LITELOR:         return BASTOK;
            case REGION_KUZOTZ:          return SANDORIA;
            case REGION_VOLLBOW:         return WINDURST;
            case REGION_ELSHIMOLOWLANDS: return SANDORIA;
            case REGION_ELSHIMOUPLANDS:  return WINDURST;
            case REGION_TULIA:           return WINDURST;
            case REGION_MOVALPOLOS:      return BEASTMEN;
            case REGION_TAVNAZIA:        return WINDURST;
        }
        return NEUTRAL;
    }
};