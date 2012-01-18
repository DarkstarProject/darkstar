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

#include "../common/cbasetypes.h"


struct search_config_t
{
    const int8* mysql_host;         // mysql addr     -> localhost
    uint16      mysql_port;         // mysql port     -> 3306
    const int8* mysql_login;        // mysql login    -> default root
    const int8* mysql_password;     // mysql pass     -> default root
    const int8* mysql_database;     // mysql database -> default dspdb
};

extern search_config_t search_config;