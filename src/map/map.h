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

#ifndef _MAP_H
#define _MAP_H

#include "../common/cbasetypes.h"

#include "../common/blowfish.h"
#include "../common/kernel.h"
#include "../common/socket.h"
#include "../common/sql.h"
#include "../common/mmo.h"
#include "../common/taskmgr.h"
#include "../common/dsprand.h"

#include <map>
#include <list>

#include "zone.h"
#include "commandhandler.h"

enum SKILLUP_STYLE
{
    NEWSTYLE_NONE  = 0,
    NEWSTYLE_PARRY = 1,
    NEWSTYLE_BLOCK = 2,
    NEWSTYLE_GUARD = 4,
    NEWSTYLE_ALL   = 7
};

/************************************************************************
*																		*
*  system options of map server											*
*  not for use common, only for system control							*
*																		*
************************************************************************/

struct map_config_t
{
	uint32 buffer_size;             // max size of recv buffer -> default 1800 bytes

	uint16 usMapPort;				// port of map server      -> xxxxx
	uint32 uiMapIp;					// ip of map server	       -> INADDR_ANY

	const int8 *mysql_host;			// mysql addr     -> localhost:3306
	uint16 mysql_port;				// mysql port     -> 3306
	const int8 *mysql_login;		// mysql login    -> default root
	const int8 *mysql_password;		// mysql pass     -> default nullptr
	const int8 *mysql_database;		// mysql database -> default dspdb

    string_t server_message;
    string_t server_message_fr;

	uint32 max_time_lastupdate;		// max interval wait of last update player char
    int32  vanadiel_time_offset;    // смещение игрового времени относительно реального времени
    int32  lightluggage_block;      // если значение отлично от нуля, то персонажи с lightluggage будут удаляться с сервера автоматически
    float  exp_rate;                // множитель получаемого опыта
	float  exp_loss_rate;			// same as exp rate but applies when player dies
	uint8  exp_party_gap_penalties;	// if 1 Party Gap Penalties will apply
	uint8  fov_party_gap_penalties;	// 1 if FOV Pages level and distance gap penalties apply
	uint8  fov_allow_alliance;		// if 1 allow alliance to farm fov pages
	float  exp_retain;				// percentage of normally lost experience to retain upon death
	int8   exp_loss_level;			// Minimum main job level at which a character may lose experience points.
    bool   level_sync_enable;       // Enable/disable Level Sync
    bool   all_jobs_widescan;       // Enable/disable jobs other than BST and RNG having widescan.
    int8   speed_mod;               // Modifier to add to player speed
    int8   mob_speed_mod;           // Modifier to add to monster speed
	float  skillup_chance_multiplier;		// Constant used in the skillup formula that has a strong effect on skill-up rates
	float  craft_chance_multiplier;			// Constant used in the crafting skill-up formula that has a strong effect on skill-up rates
	float  skillup_amount_multiplier;		// Used to increase the amount of skill gained during skill up
	float  craft_amount_multiplier;			// Used to increase the amount of skill gained during skill up
    bool   craft_day_matters;       // Enable/disable Element day factor in synthesis
    bool   craft_moonphase_matters; // Enable/disable Moon phase factor in synthesis
    bool   craft_direction_matters; // Enable/disable Compass direction factor in synthesis
	float  mob_tp_multiplier;		// Multiplies the amount of TP mobs gain on any effect that would grant TP
	float  player_tp_multiplier;	// Multiplies the amount of TP players gain on any effect that would grant TP
    float  nm_hp_multiplier;        // Multiplier for max HP of NM.
	float  mob_hp_multiplier;		// Multiplier for max HP pool of mob
	float  player_hp_multiplier;	// Multiplier for max HP pool of player
    float  nm_mp_multiplier;        // Multiplier for max MP of NM.
	float  mob_mp_multiplier;		// Multiplier for max MP pool of mob
	float  player_mp_multiplier;	// Multiplier for max MP pool of player
    float  sj_mp_divisor;           // Divisor to use on subjob max MP
    float  nm_stat_multiplier;      // Multiplier for str/vit/etc of NMs
    float  mob_stat_multiplier;     // Multiplier for str/vit/etc of mobs
    float  player_stat_multiplier;  // Multiplier for str/vit/etc. of NMs of player
	float  drop_rate_multiplier;	// Multiplier for drops
    uint32 all_mobs_gil_bonus;      // Sets the amount of bonus gil (per level) all mobs will drop.
    uint32 max_gil_bonus;           // Maximum total bonus gil that can be dropped. Default 9999 gil.
    uint8  newstyle_skillups;       // Allows failed parries and blocks to trigger skill up chance.
    int8   Battle_cap_tweak;        // Default is 0. Globally adjust the level of level capped fights.
    int8   CoP_Battle_cap;          // Default is 0. Disable/enable old lv caps on Chains of Promathia mission battles.
	uint8  max_merit_points;		// global variable, amount of merit points players are allowed
    uint16 yell_cooldown;           // Minimum time between uses of yell command (in seconds).
	bool   audit_chat;
	bool   audit_say;
	bool   audit_shout;
	bool   audit_tell;
	bool   audit_yell;
	bool   audit_linkshell;
	bool   audit_party;
	uint16 msg_server_port;			// central message server port
	const char* msg_server_ip;		// central message server IP
};

/************************************************************************
*																		*
*  Map's working session												*
*																		*
************************************************************************/

struct map_session_data_t
{
	uint32		 client_addr;
	uint16		 client_port;
	uint16		 client_packet_id;			// id последнего пакета, пришедшего от клиента
	uint16		 server_packet_id;			// id последнего пакета, отправленного сервером
	int8*		 server_packet_data; 		// указатель на собранный пакет, который был ранее отправлен клиенту
	size_t		 server_packet_size;	    // размер пакета, который был ранее отправлен клиенту
	time_t		 last_update;				// time of last packet recv
	blowfish_t   blowfish;					// unique decypher keys
	CCharEntity* PChar;						// game char
    uint8        shuttingDown;              // prevents double session closing

    map_session_data_t()
    {
        shuttingDown = 0;
    }
};

extern map_config_t map_config;
extern uint32 map_amntplayers;
extern int32 map_fd;

extern thread_local Sql_t* SqlHandle;

extern CCommandHandler CmdHandler;

typedef std::map<uint64,map_session_data_t*> map_session_list_t;
extern map_session_list_t map_session_list;

extern in_addr map_ip;
extern uint16 map_port;

extern inline map_session_data_t* mapsession_getbyipp(uint64 ipp);
extern inline map_session_data_t* mapsession_createsession(uint32 ip,uint16 port);

//=======================================================================

int32 recv_parse(int8 *buff,size_t* buffsize,sockaddr_in *from,map_session_data_t*);	// main function to parse recv packets
int32 parse(int8 *buff,size_t* buffsize,sockaddr_in *from,map_session_data_t*);			// main function parsing the packets
int32 send_parse(int8 *buff,size_t* buffsize, sockaddr_in *from,map_session_data_t*);	// main function is building big packet

void  map_helpscreen(int32 flag);														// Map-Server Version Screen [venom]
void  map_versionscreen(int32 flag);													// Map-Server Version Screen [venom]

int32 map_config_read(const int8 *cfgName);												// Map-Server Config [venom]
int32 map_config_default();

int32 map_cleanup(uint32 tick,CTaskMgr::CTask *PTask);									// Clean up timed out players
int32 map_close_session(uint32 tick, map_session_data_t* map_session_data);

int32 map_garbage_collect(uint32 tick, CTaskMgr::CTask* PTask);

#endif //_MAP_H
