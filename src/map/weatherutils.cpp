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
//#include "battleutils.h"

namespace weatherutils
{
/************************************************************************
*																		*
*  determines what weather conditions each zone qualifies for			*
*  and what the current weather condition should be						*
*																		*
************************************************************************/
void UpdateZoneWeather()
{
	CZone* currentZone;
	const int8* fmtQuery;
	int32 ret;
	int32 weatherFrequency = 0;
	int32 weatherChange = 0;
	WEATHER weatherType = WEATHER_NONE;
	WEATHER weatherTypes [20] = {WEATHER_NONE,
								 WEATHER_SUNSHINE,
								 WEATHER_CLOUDS,
								 WEATHER_FOG,
								 WEATHER_HOT_SPELL,
								 WEATHER_HEAT_WAVE,
								 WEATHER_RAIN,
								 WEATHER_SQUALL,
								 WEATHER_DUST_STORM,
								 WEATHER_SAND_STORM,
								 WEATHER_WIND,
								 WEATHER_GALES,
								 WEATHER_SNOW,
								 WEATHER_BLIZZARDS,
								 WEATHER_THUNDER,
								 WEATHER_THUNDERSTORMS,
								 WEATHER_AURORAS,
								 WEATHER_STELLAR_GLARE,
								 WEATHER_GLOOM,
								 WEATHER_DARKNESS};	

	//lookup possible weather for each zone
    for(int32 zoneid = 0; zoneid < 256; zoneid++)    
	{
		weatherType = WEATHER_NONE;
		currentZone = zoneutils::GetZone(zoneid);

		fmtQuery = "SELECT weather.none,weather.sunshine,weather.clouds,weather.fog,weather.hot_spell, \
					weather.heat_wave,weather.rain,weather.squall,weather.dust_storm,weather.sand_storm, \
					weather.wind,weather.gales,weather.snow,weather.blizzards,weather.thunder, \
					weather.thunder_storms,weather.auroras,weather.stellar_glares,weather.gloom,weather.darkness, \
					weather.shared, weather.static \
					FROM zone_weather AS weather \
					WHERE zoneid = %u LIMIT 1";

		ret = Sql_Query(SqlHandle, fmtQuery, currentZone->GetID());

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			//skip zones with static weather
			if ((uint8)Sql_GetIntData(SqlHandle,21) == 0)
			{
				//set weather for shared zones
				if((uint8)Sql_GetIntData(SqlHandle,20) != 0)
				{
					weatherType = zoneutils::GetZone((uint8)Sql_GetIntData(SqlHandle,20))->GetWeather();
				}
				else
				{
					//cycle through all weathers
					for(int32 w = 1; w < 19; w++)
					{
						//generate a new random chance for each weather condidtion
						weatherChange = rand()%100+1;
						weatherFrequency = (int32)Sql_GetIntData(SqlHandle,w);				

						if(weatherFrequency >= weatherChange)
						{
							weatherType = weatherTypes[w];
						}
					}
					//call ImplementWeather to update players and spawn/despawn mobs					
				}
				ImplementWeather(currentZone, weatherType);
			}
		}
    }
	ShowDebug(CL_CYAN"UpdateWeather Finished\n"CL_RESET);
}
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
	
	EntityList_t charList = currentZone->GetPCs();
	currentZone->SetWeather(weatherType);

	//update each player in the zone with the current weather
	for (EntityList_t::const_iterator it = charList.begin() ; it != charList.end() ; ++it)
	{
		CCharEntity* PCurrentChar = (CCharEntity*)it->second;
		PCurrentChar->pushPacket(new CWeatherPacket(1, weatherType));
	}

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
					if(PMob->m_OwnerID.id != 0)
					{
						PMob->SetDespawnTimer(1);
					}
					else
					{
						PMob->PBattleAI->SetLastActionTime(gettick() - 1200000);
						PMob->m_SpawnType = (SPAWNTYPE)4;
						PMob->PBattleAI->SetCurrentAction(ACTION_DEATH);
					}
				}
				//spawn corrent element type
				else
				{
					PMob->SetDespawnTimer(0);
					PMob->m_SpawnType = (SPAWNTYPE)0;
					PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
				}
			}
		}
	}
}
}; //end namespace