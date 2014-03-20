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

#include <time.h>
#include <sys/timeb.h>

#include "vana_time.h"
#include "utils/zoneutils.h"

#define VTIME_BASEDATE		1009810800		// Real starting date for Vana time - used to be 1024844400?
#define VTIME_YEAR			518400			// 360 * GameDay
#define VTIME_MONTH			43200			// 30 * GameDay
#define VTIME_WEEK			11520			// 8 * GameDay
#define VTIME_DAY			1440			// 24 hours * GameHour
#define VTIME_HOUR			60				// 60 minutes


CVanaTime* CVanaTime::_instance = NULL;

CVanaTime::CVanaTime()
{
	setCustomOffset(0);
    lastConquestUpdate = 0;
	lastWeatherUpdate = 0;
	lastVHourlyUpdate = 0;
	lastVDailyUpdate = 0;
}

CVanaTime* CVanaTime::getInstance()
{
	if(_instance == NULL) {
		_instance = new CVanaTime();
	}
	return _instance;
}

uint32 CVanaTime::getDate()
{
	return m_vanaDate;
}

uint32 CVanaTime::getYear()
{
	return m_vYear;
}

uint32 CVanaTime::getMonth()
{
	return m_vMon;
}

uint32 CVanaTime::getDayOfTheMonth()
{
	return m_vDate;
}

uint32 CVanaTime::getHour()
{
	return m_vHour;
}

uint32 CVanaTime::getMinute()
{
	return m_vMin;
}

uint32 CVanaTime::getWeekday()
{
	return m_vDay;
}

uint32 CVanaTime::getSysTime()
{
	return (uint32)(time(NULL) + m_customOffset * 2.4f);
}

uint32 CVanaTime::getSysHour()
{
	time_t now = time(0);
	tm *ltm = localtime(&now);

	return ltm->tm_hour;
}

uint32 CVanaTime::getSysMinute()
{
	time_t now = time(0);
	tm *ltm = localtime(&now);

	return ltm->tm_min;
}

uint32 CVanaTime::getSysSecond()
{
	time_t now = time(0);
	tm *ltm = localtime(&now);

	return ltm->tm_sec;
}

uint32 CVanaTime::getSysWeekDay()
{
	time_t now = time(0);
	tm *ltm = localtime(&now);

	return ltm->tm_wday;
}

uint32 CVanaTime::getSysYearDay()
{
	time_t now = time(0);
	tm *ltm = localtime(&now);

	return ltm->tm_yday;
}



uint32 CVanaTime::getVanaTime()
{
    return getSysTime() - VTIME_BASEDATE;
}

int32 CVanaTime::getCustomOffset()
{
	return m_customOffset;
}

void CVanaTime::setCustomOffset(int32 offset)
{
	m_customOffset = offset;

	SyncTime();

	if (m_vHour >= 20)      m_TimeType = TIME_NIGHT;
	else if (m_vHour >= 18) m_TimeType = TIME_EVENING;
	else if (m_vHour >= 17) m_TimeType = TIME_DUSK;
	else if (m_vHour >=  7) m_TimeType = TIME_DAY;
	else if (m_vHour >=  6) m_TimeType = TIME_DAWN;
	else if (m_vHour >=  4) m_TimeType = TIME_NEWDAY;
}

TIMETYPE CVanaTime::GetCurrentTOTD()
{
	return m_TimeType;
}

uint32 CVanaTime::getMoonPhase()
{
	int32  phase = 0;
	uint32 rawtime = this->getSysTime();

	int32  game_days = (int32)(rawtime - VTIME_BASEDATE) / 3456;
	double daysmod   = (int32)(game_days - 22) % 84;

	if (daysmod >= 42){
		phase = (int32)(100*(1 - (daysmod - 42)/42) + 0.5);
	}else{
		phase = (int32)(100*daysmod/42 + 0.5);
	}

	return phase;
}

uint8 CVanaTime::getMoonDirection()
{
	int32  phase = 0;
	uint32 rawtime = this->getSysTime();

	int32  game_days = (int32)(rawtime - VTIME_BASEDATE) / 3456;
	double daysmod   = (int32)(game_days - 22) % 84;

	if (daysmod == 42 || daysmod == 0){
		return 0; //neither waxing nor waning
	}else if (daysmod > 42){
		return 1;	//waning
	}else {
		return 2;   //waxing
	}
}

TIMETYPE CVanaTime::SyncTime()
{
	timeb SysTime;
	ftime(&SysTime);

	//Convert real time into Vana minutes

	m_vanaDate  = (uint32)((SysTime.time + 92514960 ) / 60.0 * 25 );

	m_vYear = (uint32)( m_vanaDate / VTIME_YEAR);
	m_vMon  = (uint32)((m_vanaDate / VTIME_MONTH) % 12) + 1;
	m_vDate = (uint32)((m_vanaDate / VTIME_DAY) % 30 ) + 1;
	m_vDay  = (uint32)((m_vanaDate % VTIME_WEEK)  / VTIME_DAY);
	m_vHour = (uint32)((m_vanaDate % VTIME_DAY)   / VTIME_HOUR);
	m_vMin  = (uint32)( m_vanaDate % VTIME_HOUR);

	if (m_vMin == 0)
	{
		switch (m_vHour)
		{
            // FOG и MIDNIGHT являются TIME_NIGHT (это не ошибка)

            case  0: m_TimeType = TIME_NIGHT;   return TIME_MIDNIGHT;
            case  2: m_TimeType = TIME_NIGHT;   return TIME_FOG;
			case  4: m_TimeType = TIME_NEWDAY;	return TIME_NEWDAY;
			case  6: m_TimeType = TIME_DAWN;	return TIME_DAWN;
			case  7: m_TimeType = TIME_DAY;		return TIME_DAY;
			case 17: m_TimeType = TIME_DUSK;	return TIME_DUSK;
			case 18: m_TimeType = TIME_EVENING; return TIME_EVENING;
			case 20: m_TimeType = TIME_NIGHT;	return TIME_NIGHT;
		}
	}
	return TIME_NONE;
}