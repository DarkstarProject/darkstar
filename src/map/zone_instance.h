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

#ifndef _CZONEINSTANCE_H
#define _CZONEINSTANCE_H

#include "zone.h"

class CZoneInstance : CZone
{
public:

	virtual void	HealAllMobs();

	virtual void	SpawnPCs(CCharEntity* PChar);									// отображаем персонажей в зоне
	virtual void	SpawnMOBs(CCharEntity* PChar);									// отображаем MOBs в зоне
	virtual void	SpawnPETs(CCharEntity* PChar);									// отображаем PETs в зоне
	virtual void	SpawnNPCs(CCharEntity* PChar);									// отображаем NPCs в зоне
	virtual void	SpawnMoogle(CCharEntity* PChar);								// отображаем Moogle в MogHouse
	virtual void    SpawnTransport(CCharEntity* PChar);                             // отображаем транспорт

	virtual void	WideScan(CCharEntity* PChar, uint16 radius);					// сканирование местности с заданным радиусом

	virtual void	DecreaseZoneCounter(CCharEntity* PChar);						// добавляем персонажа в зону
	virtual void	IncreaseZoneCounter(CCharEntity* PChar);						// удаляем персонажа из зоны

	virtual void	InsertNPC(CBaseEntity* PNpc);									// добавляем в зону npc
	virtual void	InsertMOB(CBaseEntity* PMob);									// добавляем в зону mob
	virtual void	InsertPET(CBaseEntity* PPet);									// добавляем в зону pet
	virtual void	DeletePET(CBaseEntity* PPet);       	                        // derefs the pet's ID from this zone
	virtual void	InsertPatrol(CBaseEntity* PNpc);

	virtual void    FindPartyForMob(CBaseEntity* PEntity);                          // ищем группу для монстра
	virtual void    TransportDepart(CBaseEntity* PTransportNPC);                    // транспотр отправляется, необходимо собрать пассажиров

	virtual void	PushPacket(CBaseEntity*, GLOBAL_MESSAGE_TYPE, CBasicPacket*);	// отправляем глобальный пакет в пределах зоны

	virtual void	ZoneServer(uint32 tick);
	virtual void	ZoneServerRegion(uint32 tick);

	CZoneInstance(ZONEID ZoneID, REGIONTYPE RegionID, CONTINENTTYPE ContinentID);
};

#endif