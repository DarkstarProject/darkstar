/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _MMO_H
#define _MMO_H

#include "cbasetypes.h"

#include <string>
#include <time.h>

#define FIFOSIZE_SERVERLINK	256*1024

#define FFXI_HEADER_SIZE 0x1C		// common packet header size
#define FFXI_CHANGE_ZONE 0x0A		// change zone cmd

typedef std::string string_t;

struct blowfish_t 
{
	uint32	key[5];
	uint8	hash[16];
	uint32	P[18], S[4][256];
};

// для персонажей в size хранится рост, 
// для npc и монстров что-то вроде типа используемой модели

struct look_t 
{
	uint16 size;
	uint8  face, race;
	uint16 head, body, hands, legs, feet, main, sub, ranged;
};

struct skills_t 
{
	union {
		struct {
			// SkillID 0
			uint16 unknown1;
			// SkillID  1-12
			uint16 h2h, dagger, sword, gsword, axe, gaxe, scythe, polearm, katana, gkatana, club, staff;
			// SkillID 13-24
			uint16 reserved1[12];
			// SkillID 25-33
			uint16 archery, marksmanship, throwing, guarding, evasion, shield, parrying, divine, healing;
			// SkillID 34-43
			uint16 enhancing, enfeebling, elemental, dark, summoning, ninjutsu, singing, string, wind, blue;
			// SkillID 44-47
			uint16 reserved2[4];
			// SkillID 48-54
			uint16 fishing, woodworking, smithing, goldsmithing, clothcraft, leathercraft, bonecraft;
			// SkillID 55-58
			uint16 alchemy, cooking, synergy, riding;
			// SkillID 59-62
			uint16 reserved3[4];
			// SkillID 63
			uint16 unknown2;
		};
		// index SkillID 0-63
		uint16 skill[64];
	};
	// ранг используется только в ремеслах. размер 64 необходим для совместимости ID
	uint8 rank[64];
};

struct keyitems_t 
{
	 uint8 keysList[256];	// таблица ключевых предметов
	 uint8 seenList[256];	// таблица ключевых предметов, отмеченных как "увиденные" 
};

struct position_t 
{
	uint8 rotation;			// угол поворота сущности относительно своей позиции (используется 255 система, место 360°)
	float x;			
	float y;				// высота расположения сущности относительно "уровня моря"
	float z;
	uint16 moving;			// что-то вроде расстояния перемещения, необходимое для правильной отрисовки в клиенте количества шагов сущности 
};

struct stats_t
{
	uint16 STR,DEX,VIT,AGI,INT,MND,CHR;
};

/************************************************************************
*																		*
*  TP хранится то пому же принципу, что и skill, т.е. 6,4% = 64			*
*																		*
************************************************************************/

struct health_t 
{
	int16	tp;
	int16   hp, mp;
	int16   maxhp, maxmp;
};

// ??? может стоит использовать вместо номеров зон (zone, prevzone) сразу указатели ???

struct location_t 
{
	position_t	p;			// позиция сущности
	uint8		zone;		// текущая зона
	uint8		prevzone;	// предыдущая зона (для монстров и npc не используется)
	bool		NeedToZone;	// флаг сбрасывается при каждом входе в новую зону. необходим для реализации логики игровых задач ("quests")
	uint16		boundary;	// определенная область в зоне, в которой находится сущность (используется персонажами и транспортом)
};

struct questlog_t 
{
	uint8 current [32];
	uint8 complete[32];
};

struct missionlog_t 
{
	uint16 current;
	bool   complete[64];
};

struct assaultlog_t 
{
	uint16 current;
	bool   complete[128];
};

struct campaignlog_t 
{
	uint16 current;
	bool   complete[512];
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

struct event_t
{
	int32 EventID;

	string_t Script;
	string_t Function;

	void reset() {
		EventID = -1;
		Script.clear();
		Function.clear();
	}
};

struct nameflags_t 
{
	union {
		struct {
			uint8 byte1;
			uint8 byte2;
			uint8 byte3;
			uint8 byte4;
		};
		uint32 flags;
	};
};

// информация для окна поиска
struct search_t 
{
	uint8 language;			// предпочтительный язык общения
	uint8 messagetype;		// тип комментария

	string_t message;	// комментарий поиска
};

struct bazaar_t
{
	string_t message;
};

// небольшой комментарий к пакетам ниже, определенным в виде констант
// 1-й байт - размер пакета
// через 4-ре байта начинается заголовк 0x49, 0x58, 0x46, 0x46 - IXFF
// после заголовка идет предположительно тип сообщения:
// 0x03 - положительный результат
// 0x04 - ошибка (в случае ошибки начиная с 33 байта идет код ошибки uint16) 

#define LOBBY_A1_RESERVEPACKET(a)\
unsigned char a[] = { \
		0xc4, 0x01, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x20, 0x00, 0x00, 0x00, 0x2a, 0x72, 0x4a, 0x94, \
		0x4f, 0x60, 0x27, 0xc4, 0x45, 0x4b, 0x7d, 0xcf, 0x27, 0x8e, 0x6d, 0xcd, 0x03, 0x00, 0x00, 0x00, \
		0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, \
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x56, 0x61, 0x6c, 0x65, 0x00, 0x00, 0x00, 0x00, \
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x05, 0x00, \
		0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x02, 0x00, 0x10, 0x00, 0x20, 0x00, 0x30, \
		0x00, 0x40, 0x00, 0x50, 0x00, 0x60, 0x00, 0x70, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, \
		0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0xb5, 0xfa, 0x01, 0x00, \
		0x7e, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, \
		0x01, 0x01, 0x01, 0x01, 0x46, 0x6e, 0xcf, 0x09, 0xde, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
		0x0a, 0x52, 0x03, 0x00, 0x0e, 0x08, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00							\
}

#define LOBBY_A2_RESERVEPACKET(a)\
unsigned char a[]={ \
		0x48, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x0b, 0x00, 0x00, 0x00, 0x30, 0xD0, 0x10, 0xDC,\
		0x87, 0x64, 0x4B, 0x34, 0x72, 0x9A, 0x51, 0x23, 0x54, 0x14, 0x67, 0xF0, 0x82, 0xB2, 0xc0, 0x00,\
		0xC3, 0x57, 0x00, 0x00, 0x52, 0x65, 0x67, 0x69, 0x75, 0x7A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
		0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x01, 0xd6, 0xd3, 0x00, 0x00,\
		0x7F, 0x00, 0x00, 0x01, 0xf2, 0xd2, 0x00, 0x00\
	}

#define LOBBY_026_RESERVEPACKET(a) \
unsigned char a[]={\
		0x28, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4f, 0xe0, 0x5d, 0xad,\
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00\
	}

#define LOBBY_024_RESERVEPACKET(a) \
unsigned char a[]={ \
		0x40, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x23, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00,\
		0x64, 0x00, 0x00, 0x00, 0x70, 0x58, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 \
	}

#define LOBBY_ACTION_DONE(a)\
unsigned char a[]={\
			0x20, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00\
		}

#define LOBBBY_ERROR_MESSAGE(a)\
unsigned char a[]={ \
			0x24, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
			0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,\
			0x00, 0x00, 0x00, 0x00\
		}

#define LAN_CONFIG_NAME "conf/lan_config.conf"

struct lan_config_t
{
	uint32 uiLoginLanIP;
	uint16 usLoginLanPort;

	uint32 uiMapLanIP;
	uint16 usMapLanPort;

	uint32 wait_time;
	uint8  connect_try_num;
};


class char_mini
{
public:

	int8	m_name[16];

	uint8	m_mjob;
	uint8	m_zone;
	uint8	m_nation;

	look_t	m_look;	

	 char_mini() {};
	~char_mini() {};
};

#endif // _MMO_H