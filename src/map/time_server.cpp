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

#include "../common/showmsg.h"

#include "utils/guildutils.h"
#include "time_server.h"
#include "transport.h"
#include "vana_time.h"
#include "utils/zoneutils.h"
#include "conquest_system.h"
#include "lua/luautils.h"
#include "entities/charentity.h"


int32 time_server(uint32 tick,CTaskMgr::CTask* PTask)
{
    TIMETYPE VanadielTOTD = CVanaTime::getInstance()->SyncTime();
    uint8 WeekDay = (uint8)CVanaTime::getInstance()->getWeekday();

    // weekly update for conquest (sunday at midnight)
    if (CVanaTime::getInstance()->getSysWeekDay() == 0  && CVanaTime::getInstance()->getSysHour() == 0 && CVanaTime::getInstance()->getSysMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastConquestUpdate + 60000))
        {
            conquest::UpdateWeekConquest();
            CVanaTime::getInstance()->lastConquestUpdate = tick;
        }
    }

    if (CVanaTime::getInstance()->getHour() % 4 == 0 && CVanaTime::getInstance()->getMinute() == 30)
    {
        if (tick > (CVanaTime::getInstance()->lastWeatherUpdate + 4800))
        {
            zoneutils::UpdateWeather();
            CVanaTime::getInstance()->lastWeatherUpdate = tick;
        }
    }

    if (CVanaTime::getInstance()->getMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastVHourlyUpdate + 4800))
        {
            luautils::OnGameHourAutomatisation();

            for(uint16 zone = 0; zone < MAX_ZONEID; ++zone)
            {
                EntityList_t	m_charList = zoneutils::GetZone(zone)->GetCharList();

                for (EntityList_t::const_iterator it = m_charList.begin() ; it != m_charList.end() ; ++it)
                {
                    CCharEntity* PChar = (CCharEntity*)it->second;
                    PChar->PLatentEffectContainer->CheckLatentsHours();
                    PChar->PLatentEffectContainer->CheckLatentsMoonPhase();
                }
            }

            CVanaTime::getInstance()->lastVHourlyUpdate = tick;
        }

    }

    if (CVanaTime::getInstance()->getHour() == 0 && CVanaTime::getInstance()->getMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastVDailyUpdate + 4800))
        {
            for(uint16 zone = 0; zone < MAX_ZONEID; ++zone)
            {
                EntityList_t	m_charList = zoneutils::GetZone(zone)->GetCharList();

                for (EntityList_t::const_iterator it = m_charList.begin() ; it != m_charList.end() ; ++it)
                {
                    CCharEntity* PChar = (CCharEntity*)it->second;
                    PChar->PLatentEffectContainer->CheckLatentsWeekDay();
                }
            }

            guildutils::UpdateGuildsStock();
            luautils::OnGameDayAutomatisation();
            conquest::UpdateConquestSystem();
            zoneutils::SavePlayTime();

            CVanaTime::getInstance()->lastVDailyUpdate = tick;
        }
    }

    if (VanadielTOTD != TIME_NONE)
    {
        zoneutils::TOTDChange(VanadielTOTD);

        if((VanadielTOTD == TIME_DAY) || (VanadielTOTD == TIME_DUSK) || (VanadielTOTD == TIME_NIGHT))
        {
            for(uint16 zone = 0; zone < MAX_ZONEID; ++zone)
            {
                EntityList_t	m_charList = zoneutils::GetZone(zone)->GetCharList();

                for (EntityList_t::const_iterator it = m_charList.begin() ; it != m_charList.end() ; ++it)
                {
                    CCharEntity* PChar = (CCharEntity*)it->second;
                    PChar->PLatentEffectContainer->CheckLatentsDay();
                    PChar->PLatentEffectContainer->CheckLatentsJobLevel();
                }
            }
        }
    }

    CTransportHandler::getInstance()->TransportTimer();
    return 0;
}