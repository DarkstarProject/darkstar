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

#ifndef _LUABATTLEFIELD_H
#define _LUABATTLEFIELD_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CBattlefield;

class CLuaBattlefield
{
    CBattlefield *m_PLuaBattlefield;
public:

    static const int8 className[];
    static Lunar<CLuaBattlefield>::Register_t methods[];

    CLuaBattlefield(lua_State*);
    CLuaBattlefield(CBattlefield*);

    CBattlefield* GetBattlefield() const
    {
        return m_PLuaBattlefield;
    }
    std::int32_t getBattlefieldNumber(lua_State*);
    std::int32_t getBcnmID(lua_State*);
    std::int32_t getTimeLimit(lua_State*);
    std::int32_t getTimeInside(lua_State*);
    std::int32_t getRecord(lua_State*);
    std::int32_t setAsFastest(lua_State*);
    std::int32_t setEntrance(lua_State*);
    std::int32_t getEntrance(lua_State*);
    std::int32_t insertAlly(lua_State*);
    std::int32_t getAllies(lua_State*);
    std::int32_t getEnemies(lua_State*);
    std::int32_t getPlayers(lua_State*);
    std::int32_t lose(lua_State*);
    std::int32_t win(lua_State*);
};

#endif