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

#ifndef _LOGIN_H
#define _LOGIN_H

#include "../common/cbasetypes.h"

#include <list>

#include "../common/kernel.h"
#include "../common/socket.h"
#include "../common/sql.h"
#include "../common/mmo.h"

#include "login_session.h"

extern lan_config_t lan_config;

struct login_config_t
{
	uint16 usLoginAuthPort;			// authentification port of login server      ->  54231
	uint32 uiLoginAuthIp;			// authentification ip of login server	      -> INADDR_ANY
	
	uint16 usLobbyDataPort;
	uint32 uiLobbyDataIp;
	
	uint16 usLobbyViewPort;
	uint32 uiLobbyViewIp;

    uint16 expansions;

    const char* servername;
	
	const char* mysql_host;			// mysql addr     -> localhost:3306
	uint16      mysql_port;			// mysql port     -> 3306
	const char* mysql_login;        // mysql login    -> default root
	const char* mysql_password;     // mysql pass     -> default NULL
	const char* mysql_database;		// mysql database -> default dspdb

	uint32 search_server_port;		// search_server_port	-> 54002
};

extern login_config_t login_config;

extern Sql_t *SqlHandle;
//////////////////////////////////////////////////////////

/*======================================================
 * Login-Server Version Screen [venom]
 *------------------------------------------------------*/
void login_helpscreen(int32 flag);
/*======================================================
 * Login-Server Version Screen [venom]
 *------------------------------------------------------*/
void login_versionscreen(int32 flag);
/*==========================================
 * Login-Server Config [venom]
 *------------------------------------------*/
int32 login_config_read(const char *cfgName);

int32 login_config_default();

#endif
