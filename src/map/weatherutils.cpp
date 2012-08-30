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

#include "../common/timer.h"

#include "packets/weather.h"

#include "zoneutils.h"
#include "charutils.h"
#include "weatherutils.h"
#include "mobutils.h"

namespace weatherutils
{
/************************************************************************
*																		*
*   if required, updates the weather for each player in the zone		*
*   and spawns/despawns the elemental mobs based on the weather			*
*																		*
************************************************************************/

void ImplementWeather(CZone* currentZone, WEATHER weatherType)
{	
	//exit if weatherType matches current weather
	if (currentZone->GetWeather() == weatherType)
		return;

	CMobEntity* PMob;
	const int8* elementalName = "None";

	currentZone->SetWeather(weatherType);

    //update each player in the zone with the current weather
    currentZone->PushPacket(NULL, CHAR_INZONE, new CWeatherPacket(1, weatherType));

	//lookup all elemental mobs for the current zone
	const int8* fmtQuery = "SELECT mobs.mobid \
							FROM mob_spawn_points AS mobs \
							INNER JOIN mob_groups AS groups USING (groupid) \
							WHERE mobs.pos_x != 0 AND mobs.pos_y != 0 AND mobs.pos_z != 0 \
							AND mobs.pos_x != 0 AND mobs.pos_y != 0 AND mobs.pos_z != 0 \
							AND groups.spawntype = 4 AND groups.zoneid = %u AND mobs.mobname LIKE '%%_Elemental'";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, currentZone->GetID());

	//determine which elementals should spawn
	if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		switch(weatherType)
		{
		case WEATHER_HOT_SPELL:
		case WEATHER_HEAT_WAVE:
			elementalName = "Fire_Elemental";
			break;
		case WEATHER_RAIN:
		case WEATHER_SQUALL:
			elementalName = "Water_Elemental";
			break;
		case WEATHER_DUST_STORM:
		case WEATHER_SAND_STORM:
			elementalName = "Earth_Elemental";
			break;
		case WEATHER_WIND:
		case WEATHER_GALES:
			elementalName = "Air_Elemental";
			break;
		case WEATHER_SNOW:
		case WEATHER_BLIZZARDS:
			elementalName = "Ice_Elemental";
			break;
		case WEATHER_THUNDER:
		case WEATHER_THUNDERSTORMS:
			elementalName = "Thunder_Elemental";
			break;
		case WEATHER_AURORAS:
		case WEATHER_STELLAR_GLARE:
			elementalName = "Light_Elemental";
			break;
		case WEATHER_GLOOM:
		case WEATHER_DARKNESS:
			elementalName = "Dark_Elemental";
			break;
		}

		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			PMob = (CMobEntity*)zoneutils::GetEntity((int32)Sql_GetIntData(SqlHandle,0), TYPE_MOB);

			if (PMob != NULL)
			{
				//despawn incorrect elemental type
				if ( strcmp(PMob->GetName(), elementalName) != 0 )
				{
                    PMob->SetDespawnTimer(1);
				}
				//spawn corrent element type
				else
				{
					PMob->SetDespawnTimer(0);
					PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
				}
			}
		}
	}
}
}; //end namespace