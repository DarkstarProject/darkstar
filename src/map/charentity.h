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

#ifndef _CHARENTITY_H
#define _CHARENTITY_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include <map>
#include <list>
#include <deque>

#include "battleentity.h"
#include "item_container.h"
#include "linkshell.h"
#include "trade_container.h"
#include "treasure_pool.h"

#include "universal_container.h"

// Quest Areas

enum QUESTAREA
{
	QUESTS_SANDORIA		= 0,
	QUESTS_BASTOK		= 1,
	QUESTS_WINDURST		= 2,
	QUESTS_JEUNO		= 3,
	QUESTS_OTHER		= 4,
	QUESTS_OUTLANDS		= 5,
	QUESTS_AHTURHGAN	= 6,
	QUESTS_CRYSTALWAR	= 7,
	QUESTS_ABYSSEA		= 8
};

#define MAX_QUESTAREA	  9      
#define MAX_QUESTID     256

struct jobs_t 
{
	uint32 unlocked;				// битовая маска профессий, доступных персонажу (первый бит - дополнительная профессия)
	uint8  job[MAX_JOBTYPE];		// текущий уровень для каждой из профессий
	uint16 exp[MAX_JOBTYPE];		// текущее количество опыта для каждой из профессий
	uint8  genkai;					// максимальный уровень профессий персонажа
};

struct event_t
{
	int32 EventID;
    CBaseEntity* Target;

	string_t Script;
	string_t Function;

	void reset() 
    {
		EventID = -1;
        Target  =  0;
		Script.clear();
		Function.clear();
	}
};

struct profile_t 
{
	uint8	   nation;			// принадлежность к государству
	uint8	   mhflag;			// флаг выхода из MogHouse
	uint16	   title;			// звание
	uint16     fame[4];			// известность
	uint8 	   rank[3];			// рагн в трех государствах
	uint32	   rankpoints;	    // очки ранга в трех государствах
	location_t home_point;		// точка возрождения персонажа
};

enum RECASTTYPE
{
    RECAST_ITEM,
    RECAST_MAGIC,
    RECAST_ABILITY,
};

struct Recast_t 
{
    uint16     ID;
    RECASTTYPE Type;
    uint32     TimeStamp;
    uint32     RecastTime;
    uint8      RecastID;
};

struct EntityID_t
{
    void clean()
    {
        id = 0;
        targid = 0;
    }

    uint32 id;
    uint16 targid;
};

class CBasicPacket;

typedef std::deque<CBasicPacket*> PacketList_t;
typedef std::map<uint32,CBaseEntity*> SpawnIDList_t;
typedef std::vector<EntityID_t> BazaarList_t;
typedef std::list<Recast_t*> RecastList_t;

class CCharEntity : public CBattleEntity 
{
public:

	jobs_t			 jobs;							// доступрые профессии персонажа
	keyitems_t		 keys;							// таблица ключевых предметов
	event_t			 m_event;						// структура для запуска событый
	skills_t		 RealSkills;					// структура всех реальных умений персонажа, с точностью до 0.1 и не ограниченных уровнем
	nameflags_t		 nameflags;						// флаги перед именем персонажа
	profile_t		 profile;						// профиль персонажа (все, что связывает города и персонажа)
	search_t		 search;						// данные и комментарий, отображаемые в окне поиска
	bazaar_t		 bazaar;						// все данные, необходимые для таботы bazaar
	uint16			 m_EquipFlag;					// текущие события, обрабатываемые экипировкой (потом упакую в структуру, вместе с equip[])
	uint8			 equip[17];						// экипировка персонажа

	uint8			 m_ZonesList[32];				// список посещенных персонажем зон
	uint8			 m_SpellList[96];				// список изученных заклинаний
	uint8			 m_Abilities[38];				// список текущих способностей
	uint8			 m_TraitList[16];				// список постянно активных способностей
    uint8            m_PetCommands[32];             // список доступных команд питомцу
	uint8            m_WeaponSkills[32];  
	questlog_t		 m_questLog[MAX_QUESTAREA];		// список всех квестов
	missionlog_t	 m_missionLog[6];				// список миссий
	assaultlog_t	 m_assaultLog;					// список assault миссий
	campaignlog_t	 m_campaignLog;					// список campaing миссий

	// Эти миссии не нуждаются в списке пройденных, т.к. клиент автоматически
	// отображает более ранние миссии выплненными

	uint16			 m_copCurrent;					// текущая миссия Chains of Promathia
	uint16			 m_acpCurrent;					// текущая миссия A Crystalline Prophecy
	uint16			 m_mkeCurrent;					// текущая миссия A Moogle Kupo d'Etat
	uint16			 m_asaCurrent;					// текущая миссия A Shantotto Ascension

    uint8            GetGender();                   // узнаем пол персонажа

	int32			 firstPacketSize();				// размер первого пакета в PacketList
	int32			 clearPacketList();				// отчистка PacketList
	int32			 pushPacket(CBasicPacket*);		// добавление копии пакета в PacketList
	bool			 isPacketListEmpty();			// проверка размера PacketList
	CBasicPacket*	 popPacket();					// получение первого пакета из PacketList

    CLinkshell*      PLinkshell;                    // linkshell, в которой общается персонаж
	CTreasurePool*	 PTreasurePool;					// сокровища, добытые с монстров

	CItemContainer*  PGuildShop;					// текущий магазин гильдии, в котором персонаж производит закупки
	CItemContainer*	 getStorage(uint8 LocationID);	// получение указателя на соответствующее хранилище

	CTradeContainer* Container;						// универсальный контейнер для обмена, синтеза, магазина и т.д.
	CUContainer*	 UContainer;					// новый универсальный контейнер для обмена, синтеза, магазина и т.д.
	
	CBaseEntity*	 PWideScanTarget;				// wide scane цель

	SpawnIDList_t	 SpawnPCList;					// список видимых персонажей
	SpawnIDList_t	 SpawnMOBList;					// список видимых монстров
	SpawnIDList_t	 SpawnPETList;					// список видимых питомцев
	SpawnIDList_t	 SpawnNPCList;					// список видимых npc

	RecastList_t	 RecastList;					// recast list for spells, abilities and items

	void			 SetName(int8* name);			// устанавливаем имя персонажа (имя ограничивается 15-ю символами)

    EntityID_t       TradePending;                  // ID персонажа, предлагающего обмен
	EntityID_t       InvitePending;					// ID персонажа, отправившего приглашение в группу
    EntityID_t       BazaarID;                      // Pointer to the bazaar we are browsing.
	BazaarList_t	 BazaarCustomers;               // Array holding the IDs of the current customers

	uint32			 m_InsideRegionID;				// номер региона, в котором сейчас находится персонаж (??? может засунуть в m_event ???)
	uint8			 m_LevelRestriction;			// ограничение уровня персонажа
    uint16           m_Costum;                      // карнавальный костюм персонажа (модель)

    uint8            m_PVPFlag;                     // pvp
	uint8			 m_hasTractor;					// checks if player has tractor already
	uint8			 m_hasRaise;					// checks if player has raise already
    uint8            m_hasAutoTarget;               // возможность использования AutoTarget функции
	position_t		 m_StartActionPos;				// позиция начала действия (использование предмета, начало стрельбы, позиция tractor)

	 CCharEntity();									// конструктор
	~CCharEntity();									// деструктор

private:

	CItemContainer*  m_Inventory;
	CItemContainer*  m_Mogsafe;
	CItemContainer*  m_Storage;
	CItemContainer*	 m_Tempitems;
	CItemContainer*  m_Moglocker;
	CItemContainer*	 m_Mogsatchel;
	CItemContainer*	 m_Mogsack;

	PacketList_t     PacketList;					// в этом списке хранятся все пакеты, предназначенные для отправки персонажу
};

#endif