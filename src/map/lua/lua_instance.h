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

#ifndef _LUAINSTANCE_H
#define _LUAINSTANCE_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CInstance;
class CLuaInstance
{
    CInstance* m_PLuaInstance;
public:

    static const int8 className[];
    static Lunar<CLuaInstance>::Register_t methods[];

    CLuaInstance(lua_State*);
    CLuaInstance(CInstance*);

    CInstance* GetInstance() const
    {
        return m_PLuaInstance;
    }

    std::int32_t getID(lua_State*);
    std::int32_t getAllies(lua_State*);
    std::int32_t getChars(lua_State*);
    std::int32_t getMobs(lua_State*);
    std::int32_t getNpcs(lua_State*);
    std::int32_t getPets(lua_State*);
    std::int32_t getTimeLimit(lua_State*);
    std::int32_t getEntryPos(lua_State*);
    std::int32_t getLastTimeUpdate(lua_State*);
    std::int32_t getProgress(lua_State*);
    std::int32_t getWipeTime(lua_State*);
    std::int32_t getEntity(lua_State*);
    std::int32_t getStage(lua_State*);

    std::int32_t setLevelCap(lua_State*);
    std::int32_t setLastTimeUpdate(lua_State*);
    std::int32_t setProgress(lua_State*);
    std::int32_t setWipeTime(lua_State*);
    std::int32_t setStage(lua_State*);

    std::int32_t fail(lua_State*);
    std::int32_t failed(lua_State*);
    std::int32_t complete(lua_State*);
    std::int32_t completed(lua_State*);

    std::int32_t insertAlly(lua_State*);
};

#endif
