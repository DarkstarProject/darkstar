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

#include "../common/showmsg.h"

#include <time.h>

#include "vana_time.h"
#include "utils/zoneutils.h"

CVanaTime* CVanaTime::_instance = nullptr;

CVanaTime::CVanaTime()
{
    setCustomOffset(0);
}

CVanaTime* CVanaTime::getInstance()
{
    if (_instance == nullptr)
    {
        _instance = new CVanaTime();
    }
    return _instance;
}

std::uint32_t CVanaTime::getDate()
{
    return m_vanaDate;
}

std::uint32_t CVanaTime::getYear()
{
    return m_vYear;
}

std::uint32_t CVanaTime::getMonth()
{
    return m_vMon;
}

std::uint32_t CVanaTime::getDayOfTheMonth()
{
    return m_vDate;
}

std::uint32_t CVanaTime::getHour()
{
    return m_vHour;
}

std::uint32_t CVanaTime::getMinute()
{
    return m_vMin;
}

std::uint32_t CVanaTime::getWeekday()
{
    return m_vDay;
}

std::uint32_t CVanaTime::getSysHour()
{
    time_t now = time(0);
    tm *ltm = localtime(&now);

    return ltm->tm_hour;
}

std::uint32_t CVanaTime::getSysMinute()
{
    time_t now = time(0);
    tm *ltm = localtime(&now);

    return ltm->tm_min;
}

std::uint32_t CVanaTime::getSysSecond()
{
    time_t now = time(0);
    tm *ltm = localtime(&now);

    return ltm->tm_sec;
}

std::uint32_t CVanaTime::getSysWeekDay()
{
    time_t now = time(0);
    tm *ltm = localtime(&now);

    return ltm->tm_wday;
}

std::uint32_t CVanaTime::getSysYearDay()
{
    time_t now = time(0);
    tm *ltm = localtime(&now);

    return ltm->tm_yday;
}

std::uint32_t CVanaTime::getVanaTime()
{
    //if custom offset is re-implemented here is the place to put it
    //all functions/variables for in game time should be derived from this
    return (std::uint32_t)time(nullptr) - VTIME_BASEDATE;
}

std::int32_t CVanaTime::getCustomOffset()
{
    return m_customOffset;
}

void CVanaTime::setCustomOffset(std::int32_t offset)
{
    m_customOffset = offset;
    m_TimeType = SyncTime();
}

TIMETYPE CVanaTime::GetCurrentTOTD()
{
    return m_TimeType;
}

std::uint32_t CVanaTime::getMoonPhase()
{
    std::int32_t phase = 0;
    double daysmod = (std::int32_t)(((m_vanaDate / VTIME_DAY) + 26) % 84);

    if (daysmod >= 42)
    {
        phase = (std::int32_t)(100 * ((daysmod - 42) / 42) + 0.5);
    }
    else
    {
        phase = (std::int32_t)(100 * (1 - (daysmod / 42)) + 0.5);
    }

    return phase;
}

uint8 CVanaTime::getMoonDirection()
{
    double daysmod = (std::int32_t)(((m_vanaDate / VTIME_DAY) + 26) % 84);

    if (daysmod == 42 || daysmod == 0)
    {
        return 0; //neither waxing nor waning
    }
    else if (daysmod < 42)
    {
        return 1;   //waning
    }
    else
    {
        return 2;   //waxing
    }
}

uint8 CVanaTime::getRSERace()
{
    return (uint8)(((m_vanaDate / VTIME_WEEK) - 22) % 8) + 1;
}

uint8 CVanaTime::getRSELocation()
{
    return (uint8)(((m_vanaDate / VTIME_WEEK) - 21) % 3);
}

TIMETYPE CVanaTime::SyncTime()
{
    m_vanaDate  = (std::uint32_t)(this->getVanaTime() / 60.0 * 25) + 886 * VTIME_YEAR; //convert vana time (from SE epoch in earth seconds) to vanadiel minutes and add 886 vana years

    m_vYear = (std::uint32_t)( m_vanaDate / VTIME_YEAR);
    m_vMon  = (std::uint32_t)((m_vanaDate / VTIME_MONTH) % 12) + 1;
    m_vDate = (std::uint32_t)((m_vanaDate / VTIME_DAY) % 30 ) + 1;
    m_vDay  = (std::uint32_t)((m_vanaDate % VTIME_WEEK)  / VTIME_DAY);
    m_vHour = (std::uint32_t)((m_vanaDate % VTIME_DAY)   / VTIME_HOUR);
    m_vMin  = (std::uint32_t)( m_vanaDate % VTIME_HOUR);

    if (m_vMin == 0)
    {
        switch (m_vHour)
        {
            case  0: m_TimeType = TIME_NIGHT;   return TIME_MIDNIGHT;
            case  4: m_TimeType = TIME_NEWDAY;  return TIME_NEWDAY;
            case  6: m_TimeType = TIME_DAWN;    return TIME_DAWN;
            case  7: m_TimeType = TIME_DAY;     return TIME_DAY;
            case 17: m_TimeType = TIME_DUSK;    return TIME_DUSK;
            case 18: m_TimeType = TIME_EVENING; return TIME_EVENING;
            case 20: m_TimeType = TIME_NIGHT;   return TIME_NIGHT;
        }
    }
    return TIME_NONE;
}