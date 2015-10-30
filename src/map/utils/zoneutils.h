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
    void UpdateTreasureSpawnPoint(uint32 npcid, uint32 respawnTime = 300000);
    void InitializeWeather();                                                       // обновляем погоду в зонах
    void TOTDChange(TIMETYPE TOTD);                                                 // реакция мира на смену времени суток
    void SavePlayTime();

    REGIONTYPE    GetCurrentRegion(uint16 ZoneID);
    CONTINENTTYPE GetCurrentContinent(uint16 ZoneID);

    int GetWeatherElement(WEATHER weather);

    CZone*       GetZone(uint16 ZoneID);                                            // получаем указатель на зону
    CNpcEntity*  GetTrigger(uint16 TargID, uint16 ZoneID);                          // триггер для старта событий (как побочный эффект - вероятность появления прозрачного орка)
    CBaseEntity* GetEntity(uint32 ID, uint8 filter = -1);                           // получаем указатель на любую сущность
    CCharEntity* GetCharByName(int8* name);                                         // получаем указатель на персонажа по имени
    CCharEntity* GetCharFromWorld(uint32 charid, uint16 targid);                    // returns pointer to character by id and target id
    CCharEntity* GetChar(uint32 id);                                                // returns pointer to character by id
    void         ForEachZone(std::function<void(CZone*)> func);
    uint64       GetZoneIPP(uint16 zoneid);                                         // returns IPP for zone ID
};

#endif