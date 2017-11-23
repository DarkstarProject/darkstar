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

#ifndef _LOBBY_H
#define _LOBBY_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "login_session.h"

extern std::int32_t login_lobbydata_fd;
extern std::int32_t login_lobbyview_fd;

/*
*
*	Parse connections for lobby data
*/
std::int32_t connect_client_lobbydata(std::int32_t listenfd);

/*
*
*	Parse connections for lobby view
*
*/
std::int32_t connect_client_lobbyview(std::int32_t listenfd);
/*==========================================
* Login Lobby Data parse
*-------------------------------------------*/
std::int32_t lobbydata_parse(std::int32_t fd);

/*==========================================
* Login Lobby View parse
*-------------------------------------------*/
std::int32_t lobbyview_parse(std::int32_t fd);

/*=============================================
* lobby data close socket
*-------------------------------------------*/
std::int32_t do_close_lobbydata(login_session_data_t* loginsd, std::int32_t fd);

std::int32_t do_close_lobbyview(login_session_data_t*, std::int32_t fd);


std::int32_t lobby_createchar(login_session_data_t* loginsd, std::int8_t* buf);
std::int32_t lobby_createchar_save(uint32 accid, uint32 charid, char_mini* createchar);
#endif