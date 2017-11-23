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

#ifndef _LOGIN_SESSION_H
#define _LOGIN_SESSION_H

#include "../common/cbasetypes.h"

#include <list>

struct login_session_data_t {
    char login[17];
    std::uint32_t accid;
    std::uint32_t serviced;
    std::uint32_t client_addr;
    uint16 client_port;
    std::uint32_t servip;

    char charname[17];
    std::int32_t login_fd;
    std::int32_t login_lobbydata_fd;
    std::int32_t login_lobbyview_fd;
};


typedef std::list<login_session_data_t*> login_sd_list_t;
extern login_sd_list_t login_sd_list;

login_session_data_t* find_loginsd_byaccid(std::uint32_t accid);
login_session_data_t* find_loginsd_byip(std::uint32_t ip);
void				  erase_loginsd_byaccid(std::uint32_t accid);
void				  erase_loginsd(std::int32_t loginfd);


#endif
