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

#ifndef _CZONE_H
#define _CZONE_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"
#include "../common/taskmgr.h"

#include <list>
#include <map>

#include "region.h"
#include "vana_time.h"
#include "instance_handler.h"

#include "packets\weather.h"

enum ZONEMISC
{
    MISC_NONE       = 0x0000,   // 0x0000, // возможность использовать в любой зоне
	MISC_ESCAPE		= 0x0001,	// 0x0001, // возможность использования заклинания escape;
	MISC_TRACTOR	= 0x0010,	// 0x0002, // возможность использования заклинания tractor;
	MISC_MAZURKA	= 0x0008,	// 0x0004, // возможность использования заклинания mazurka;
	MISC_FELLOW		= 0x0002,	// 0x0008, // возможность призыва напарника npc
	MISC_PET		= 0x0080,	// 0x0010, // возможность призыва питомца
	MISC_CHOCOBO	= 0x0004,	// 0x0020, // возможность использования chocobo
	MISC_MOGMENU	= 0x0020,	// 0x0040, // возможность общения с Nomad Moogle (доступ к меню mog house)
	MISC_COSTUME	= 0x0040,	// 0x0080, // возможность использовать маскарадный костюм (costume)
	MISC_TREASURE	= 0x0100,	// 0x0100, // наличие в зоне глобального TreasurePool
};

enum GLOBAL_MESSAGE_TYPE 
{
	CHAR_INRANGE,
	CHAR_INRANGE_SELF,
	CHAR_INSHOUT,
	CHAR_INZONE
};

struct zoneMusic_t 
{
	uint8 m_song;		// фоновая музыка
	uint8 m_bSongS;		// музыка в одиночном бою
	uint8 m_bSongM;		// музыка в групповом бою
};

/************************************************************************
*																		*
*  zoneLine - уникальный идентификатор пути из одной точки какой-либо	*
*  зоны в другую точку какой-либо зоны.	Зоной отправления является зона,*
*  хранящая данный zoneLineID. Зона прибытия и точное местоназначение	*
*  определены в структуре.												*
*																		*
************************************************************************/

struct zoneLine_t 
{
	uint32	   m_zoneLineID;
	uint8	   m_toZone;
	position_t m_toPos;
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CBasicPacket;
class CBaseEntity;
class CCharEntity;
class CBattleEntity;
class CTreasurePool;

typedef std::list<CRegion*> regionList_t;
typedef std::list<zoneLine_t*> zoneLineList_t;

typedef std::map<uint16,CBaseEntity*> EntityList_t;


class CZone
{
public:

	uint8			GetID();
    uint8           GetRegionID();
	uint32			GetIP();
	uint16			GetPort();
	uint16			GetTax();
	WEATHER			GetWeather();
    uint32          GetWeatherChangeTime();
	const int8*		GetName();
	uint8			GetSoloBattleMusic();
	uint8			GetPartyBattleMusic();
	uint8			GetBackgroundMusic();
	zoneLine_t*		GetZoneLine(uint32 zoneLineID);

    CCharEntity*    FindPlayerInZone(int8* name);                                   // finds the player if exists in zone
	CBaseEntity*	GetEntity(uint16 targid, uint8 filter = -1); 					// получаем указатель на любую сущность в зоне

    bool            IsWeatherStatic();                                              // погода в зоне не требует изменения (никогда не меняется)
	bool			CanUseMisc(uint16 misc);
    void            SetWeather(WEATHER weatherCondition);

	void			SpawnPCs(CCharEntity* PChar);									// отображаем персонажей в зоне
	void			SpawnMOBs(CCharEntity* PChar);									// отображаем MOBs в зоне
	void			SpawnPETs(CCharEntity* PChar);									// отображаем PETs в зоне
	void			SpawnNPCs(CCharEntity* PChar);									// отображаем NPCs в зоне
	void			SpawnMoogle(CCharEntity* PChar);								// отображаем Moogle в MogHouse
    void            SpawnTransport(CCharEntity* PChar);                             // отображаем транспорт

	void			WideScan(CCharEntity* PChar, uint16 radius);					// сканирование местности с заданным радиусом

	void			DecreaseZoneCounter(CCharEntity* PChar);						// добавляем персонажа в зону
	void			IncreaseZoneCounter(CCharEntity* PChar);						// удаляем персонажа из зоны

	void			InsertNPC(CBaseEntity* PNpc);									// добавляем в зону npc
	void			InsertMOB(CBaseEntity* PMob);									// добавляем в зону mob
	void			InsertPET(CBaseEntity* PPet);									// добавляем в зону pet
	void			DeletePET(CBaseEntity* PPet);       	                        // derefs the pet's ID from this zone

	void			GenerateCureEnmity(CBattleEntity* PSource,CBattleEntity* PTarget,uint16 amount);
    void            FindPartyForMob(CBaseEntity* PEntity);                          // ищем группу для монстра
    void            TransportDepart(CBaseEntity* PTransportNPC);                    // транспотр отправляется, необходимо собрать пассажиров

	void			InsertRegion(CRegion* Region);									// добавляем в зону активную область

	void			TOTDChange(TIMETYPE TOTD);										// обработка реакции мира на смену времени суток
	void			PushPacket(CBaseEntity*, GLOBAL_MESSAGE_TYPE, CBasicPacket*);	// отправляем глобальный пакет в пределах зоны

	uint32			m_RegionCheckTime;												// время последней проверки регионов
    uint8           m_WeatherFrequency[MAX_WEATHER_ID];                             // вероятность появления каждого типа погоды

	void			ZoneServer(uint32 tick);
	void			ZoneServerRegion(uint32 tick);

	CZone(uint8 ZoneID, uint8 RegionID);

    CInstanceHandler* m_InstanceHandler;	// BCNM Instances in this zone

private:

	uint8			m_zoneID;				// ID зоны
    uint8           m_regionID;             // id области
	string_t		m_zoneName;				// имя зоны
	uint16			m_zonePort;				// порт зоны
	uint32			m_zoneIP;               // IP зоны
      
	WEATHER			m_Weather;              // текущая погода
    uint32          m_WeatherChangeTime;    // время начала текущей погоды
    bool            m_IsWeatherStatic;      // погода в зоне никогда не меняется

	uint16			m_tax;					// налог в bazaar 
	uint16			m_miscMask;				// битовое поле, описывающее возможности использования в зоне определенных умений

	zoneMusic_t		m_zoneMusic;			// информация о мелодиях, используемых в зоне

	EntityList_t	m_mobList;				// список всех MOBs в зоне
	EntityList_t	m_petList;				// список всех PETs в зоне
	EntityList_t	m_npcList;				// список всех NPCs в зоне
	EntityList_t	m_charList;				// список всех PCs  в зоне

	regionList_t	m_regionList;			// список активных областей зоны
	zoneLineList_t	m_zoneLineList;			// список всех доступных zonelines для зоны

    CBaseEntity*    m_Transport;            // указатель на транспорт в зоне
	CTreasurePool*	m_TreasurePool;			// глобальный TreasuerPool

	CTaskMgr::CTask* ZoneTimer;				// указатель на созданный таймер - ZoneServer. необходим для возможности его остановки

	void	LoadZoneLines();				// список zonelines (можно было бы заменить этот метод методом InsertZoneLine)
    void    LoadZoneWeather();              // погода
	void	LoadZoneSettings();				// настройки зоны
};

#endif