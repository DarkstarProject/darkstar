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

#ifndef _MAP_H
#define _MAP_H

#include "../common/cbasetypes.h"

#include "../common/kernel.h"
#include "../common/socket.h"
#include "../common/sql.h"
#include "../common/mmo.h"
#include "../common/taskmgr.h"

#include <map>
#include <list>

#include "zone.h"
#include "commandhandler.h"


/************************************************************************
*																		*
*  system options of map server											*
*  not for use common, only for system control							*
*																		*
************************************************************************/

struct map_config_t
{
	uint32 uiBuffMaxSize;			// max size of recv buffer -> default 1024 bytes

	uint16 usMapPort;				// port of map server      -> xxxxx
	uint32 uiMapIp;					// ip of map server	       -> INADDR_ANY

	const int8 *mysql_host;			// mysql addr     -> localhost:3306
	uint16 mysql_port;				// mysql port     -> 3306
	const int8 *mysql_login;		// mysql login    -> default root
	const int8 *mysql_password;		// mysql pass     -> default NULL
	const int8 *mysql_database;		// mysql database -> default dspdb

    const int8 *server_message;     // сообщение сервера

	uint32 max_time_lastupdate;		// max interval wait of last update player char
    int32  vanadiel_time_offset;    // смещение игрового времени относительно реального времени
    int32  lightluggage_block;      // если значение отлично от нуля, то персонажи с lightluggage будут удаляться с сервера автоматически
};

/************************************************************************
*																		*
*  Map's working session												*
*																		*
************************************************************************/

struct map_session_data_t
{
	uint32		client_addr;
	uint16		client_port;
	uint16		client_packet_id;			// id последнего пакета, пришедшего от клиента
	uint16		server_packet_id;			// id последнего пакета, отправленного сервером
	int8*		server_packet_data; 		// указатель на собранный пакет, который был ранее отправлен клиенту
	size_t		server_packet_size;			// размер пакета, который был ранее отправлен клиенту
	time_t		last_update;				// time of last packet recv
	blowfish_t  blowfish;					// unique decypher keys 
	CCharEntity *PChar;						// game char
};

extern map_config_t map_config;
extern uint32 map_amntplayers;
extern int32 map_fd;
extern Sql_t* SqlHandle;
extern CCommandHandler CmdHandler;

typedef std::map<uint64,map_session_data_t*> map_session_list_t;
extern map_session_list_t map_session_list;

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
int32 map_close_session(uint32 tick,CTaskMgr::CTask *PTask);							// завершение сессии

#endif //_MAP_H



