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
*                                                                       *
*  system options of map server                                         *
*  not for use common, only for system control                          *
*                                                                       *
************************************************************************/

struct map_config_t
{
    std::uint32_t buffer_size;             // max size of recv buffer -> default 1800 bytes

    std::uint16_t usMapPort;               // port of map server      -> xxxxx
    std::uint32_t uiMapIp;                 // ip of map server        -> INADDR_ANY

    std::string mysql_host;         // mysql addr     -> localhost:3306
    std::uint16_t mysql_port;              // mysql port     -> 3306
    std::string mysql_login;        // mysql login    -> default root
    std::string mysql_password;     // mysql pass     -> default nullptr
    std::string mysql_database;     // mysql database -> default dspdb

    std::string server_message;
    std::string server_message_fr;

    std::uint32_t max_time_lastupdate;       // max interval wait of last update player char
    std::int32_t  vanadiel_time_offset;      // смещение игрового времени относительно реального времени
    std::int32_t  lightluggage_block;        // если значение отлично от нуля, то персонажи с lightluggage будут удаляться с сервера автоматически

    std::uint16_t ah_base_fee_single;        // Base AH fee for single items
    std::uint16_t ah_base_fee_stacks;        // Base AH fee for stacks
    float  ah_tax_rate_single;        // Percent of listing price to tax single items
    float  ah_tax_rate_stacks;        // Percent of listing price to tax stacks
    std::uint32_t ah_max_fee;                // Maximum total AH fees/taxes

    float  exp_rate;                  // множитель получаемого опыта
    float  exp_loss_rate;             // same as exp rate but applies when player dies
    std::uint8_t  exp_party_gap_penalties;   // if 1 Party Gap Penalties will apply
    std::uint8_t  fov_allow_alliance;        // if 1 allow alliance to farm fov pages
    float  exp_retain;                // percentage of normally lost experience to retain upon death
    int8   exp_loss_level;            // Minimum main job level at which a character may lose experience points.
    bool   level_sync_enable;         // Enable/disable Level Sync
    bool   disable_gear_scaling;      // Disables ability to equip higher level gear when level cap/sync effect is on player.
    bool   all_jobs_widescan;         // Enable/disable jobs other than BST and RNG having widescan.
    int8   speed_mod;                 // Modifier to add to player speed
    int8   mob_speed_mod;             // Modifier to add to monster speed
    float  skillup_chance_multiplier; // Constant used in the skillup formula that has a strong effect on skill-up rates
    float  craft_chance_multiplier;   // Constant used in the crafting skill-up formula that has a strong effect on skill-up rates
    float  skillup_amount_multiplier; // Used to increase the amount of skill gained during skill up
    float  craft_amount_multiplier;   // Used to increase the amount of skill gained during skill up
    bool   craft_day_matters;         // Enable/disable Element day factor in synthesis
    bool   craft_moonphase_matters;   // Enable/disable Moon phase factor in synthesis
    bool   craft_direction_matters;   // Enable/disable Compass direction factor in synthesis
    float  mob_tp_multiplier;         // Multiplies the amount of TP mobs gain on any effect that would grant TP
    float  player_tp_multiplier;      // Multiplies the amount of TP players gain on any effect that would grant TP
    bool   mob_no_despawn;            // Toggle whether mobs roam home or despawn
    float  nm_hp_multiplier;          // Multiplier for max HP of NM.
    float  mob_hp_multiplier;         // Multiplier for max HP pool of mob
    float  player_hp_multiplier;      // Multiplier for max HP pool of player
    float  nm_mp_multiplier;          // Multiplier for max MP of NM.
    float  mob_mp_multiplier;         // Multiplier for max MP pool of mob
    float  player_mp_multiplier;      // Multiplier for max MP pool of player
    float  sj_mp_divisor;             // Divisor to use on subjob max MP
    float  nm_stat_multiplier;        // Multiplier for str/vit/etc of NMs
    float  mob_stat_multiplier;       // Multiplier for str/vit/etc of mobs
    float  player_stat_multiplier;    // Multiplier for str/vit/etc. of NMs of player
    float  ability_recast_multiplier; // Adjust ability recast time
    float  drop_rate_multiplier;      // Multiplier for drops
    std::uint32_t all_mobs_gil_bonus;        // Sets the amount of bonus gil (per level) all mobs will drop.
    std::uint32_t max_gil_bonus;             // Maximum total bonus gil that can be dropped. Default 9999 gil.
    std::uint8_t  newstyle_skillups;         // Allows failed parries and blocks to trigger skill up chance.
    int8   Battle_cap_tweak;          // Default is 0. Globally adjust the level of level capped fights.
    int8   CoP_Battle_cap;            // Default is 0. Disable/enable old lv caps on Chains of Promathia mission battles.
    std::uint8_t  max_merit_points;          // global variable, amount of merit points players are allowed
    std::uint16_t yell_cooldown;             // Minimum time between uses of yell command (in seconds).
    float  fame_multiplier;           // Fame multiplier
    bool   audit_chat;
    bool   audit_say;
    bool   audit_shout;
    bool   audit_tell;
    bool   audit_yell;
    bool   audit_linkshell;
    bool   audit_party;
    std::uint8_t  healing_tick_delay;
    std::uint16_t msg_server_port;           // central message server port
    std::string msg_server_ip;        // central message server IP
};

/************************************************************************
*                                                                       *
*  Map's working session                                                *
*                                                                       *
************************************************************************/

struct map_session_data_t
{
    std::uint32_t       client_addr;
    std::uint16_t       client_port;
    std::uint16_t       client_packet_id;          // id последнего пакета, пришедшего от клиента
    std::uint16_t       server_packet_id;          // id последнего пакета, отправленного сервером
    int8*        server_packet_data;        // указатель на собранный пакет, который был ранее отправлен клиенту
    size_t       server_packet_size;        // размер пакета, который был ранее отправлен клиенту
    time_t       last_update;               // time of last packet recv
    blowfish_t   blowfish;                  // unique decypher keys
    CCharEntity* PChar;                     // game char
    std::uint8_t        shuttingDown;              // prevents double session closing

    map_session_data_t()
    {
        shuttingDown = 0;
    }
};

extern map_config_t map_config;
extern std::uint32_t map_amntplayers;
extern std::int32_t map_fd;

static constexpr float server_tick_rate = 2.5f;

extern thread_local Sql_t* SqlHandle;

extern CCommandHandler CmdHandler;

typedef std::map<std::uint64_t,map_session_data_t*> map_session_list_t;
extern map_session_list_t map_session_list;

extern in_addr map_ip;
extern std::uint16_t map_port;

extern inline map_session_data_t* mapsession_getbyipp(std::uint64_t ipp);
extern inline map_session_data_t* mapsession_createsession(std::uint32_t ip,std::uint16_t port);

//=======================================================================

std::int32_t recv_parse(int8 *buff,size_t* buffsize,sockaddr_in *from,map_session_data_t*);    // main function to parse recv packets
std::int32_t parse(int8 *buff,size_t* buffsize,sockaddr_in *from,map_session_data_t*);         // main function parsing the packets
std::int32_t send_parse(int8 *buff,size_t* buffsize, sockaddr_in *from,map_session_data_t*);   // main function is building big packet

void  map_helpscreen(std::int32_t flag);                                                       // Map-Server Version Screen [venom]
void  map_versionscreen(std::int32_t flag);                                                    // Map-Server Version Screen [venom]

std::int32_t map_config_read(const int8 *cfgName);                                             // Map-Server Config [venom]
std::int32_t map_config_default();

std::int32_t map_cleanup(time_point tick,CTaskMgr::CTask *PTask);                              // Clean up timed out players
std::int32_t map_close_session(time_point tick, map_session_data_t* map_session_data);

std::int32_t map_garbage_collect(time_point tick, CTaskMgr::CTask* PTask);

#endif //_MAP_H
