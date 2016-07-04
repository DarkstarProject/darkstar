/*
===========================================================================

  Copyright (c) 2010-2016 Darkstar Dev Teams

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
    uint16 login_auth_port;         // authentication port of login server ->  54231
    const char* login_auth_ip;           // authentication ip of login server   -> INADDR_ANY

    uint16 login_data_port;
    const char* login_data_ip;

    uint16 login_view_port;
    const char* login_view_ip;

    uint16 expansions;

    const char* servername;

    const char* mysql_host;         // mysql addr     -> localhost:3306
    uint16      mysql_port;         // mysql port     -> 3306
    const char* mysql_login;        // mysql login    -> default root
    const char* mysql_password;     // mysql pass     -> default NULL
    const char* mysql_database;     // mysql database -> default dspdb

    uint32 search_server_port;      // search_server_port -> 54002

    uint16 msg_server_port;         // chat server port
    const char* msg_server_ip;      // chat server IP
    bool  log_user_ip;              // log user ip -> default false
};

struct version_info_t
{
    const char* CLIENT_VER;         // Expected Client version
};

extern login_config_t login_config;
extern version_info_t version_info;

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

int32 version_info_read(const char *cfgName);
int32 version_info_default();

#endif
