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

#ifndef _ZONEUTILS_H
#define _ZONEUTILS_H

#include "../../common/cbasetypes.h"

#include "../zone.h"

/************************************************************************
*                                                                       *
*  Задумывалось, как что-то вроде контролера зон                        *
*                                                                       *
************************************************************************/

class CBaseEntity;
class CCharEntity;
class CNpcEntity;

namespace zoneutils
{
    void LoadZoneList();                                                            // загружаем список зон
    void FreeZoneList();                                                            // освобождаем список зон

    // Update the Treasure spawn point to a new point, retrieved from the database
    void UpdateTreasureSpawnPoint(std::uint32_t npcid, std::uint32_t respawnTime = 300000);
    void InitializeWeather();                                                       // обновляем погоду в зонах
    void TOTDChange(TIMETYPE TOTD);                                                 // реакция мира на смену времени суток
    void SavePlayTime();

    REGIONTYPE    GetCurrentRegion(std::uint16_t ZoneID);
    CONTINENTTYPE GetCurrentContinent(std::uint16_t ZoneID);

    int GetWeatherElement(WEATHER weather);

    CZone*       GetZone(std::uint16_t ZoneID);                                            // получаем указатель на зону
    CNpcEntity*  GetTrigger(std::uint16_t TargID, std::uint16_t ZoneID);                          // триггер для старта событий (как побочный эффект - вероятность появления прозрачного орка)
    CBaseEntity* GetEntity(std::uint32_t ID, std::uint8_t filter = -1);                           // получаем указатель на любую сущность
    CCharEntity* GetCharByName(std::int8_t* name);                                         // получаем указатель на персонажа по имени
    CCharEntity* GetCharFromWorld(std::uint32_t charid, std::uint16_t targid);                    // returns pointer to character by id and target id
    CCharEntity* GetChar(std::uint32_t id);                                                // returns pointer to character by id
    CCharEntity* GetCharToUpdate(std::uint32_t primary, std::uint32_t ternary);                   // returnes pointer to preferred char to update for party changes
    void         ForEachZone(std::function<void(CZone*)> func);
    std::uint64_t       GetZoneIPP(std::uint16_t zoneid);                                         // returns IPP for zone ID
    bool         IsResidentialArea(CCharEntity*);                                  // returns whether or not the area is a residential zone
};

#endif