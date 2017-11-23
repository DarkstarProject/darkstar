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

#ifndef _LUASTATUSEFFECT_H
#define _LUASTATUSEFFECT_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CStatusEffect;
class CLuaStatusEffect
{
    CStatusEffect *m_PLuaStatusEffect;

public:

    static const int8 className[];
    static Lunar<CLuaStatusEffect>::Register_t methods[];

    CLuaStatusEffect(lua_State*);
    CLuaStatusEffect(CStatusEffect*);

    CStatusEffect* GetStatusEffect()const
    {
        return m_PLuaStatusEffect;
    }

    std::int32_t getType(lua_State*);
    std::int32_t getSubType(lua_State*);
    std::int32_t getPower(lua_State*);
    std::int32_t getSubPower(lua_State*);
    std::int32_t getTier(lua_State*);
    std::int32_t getDuration(lua_State*);
    std::int32_t getStartTime(lua_State*);
    std::int32_t getLastTick(lua_State*);
    std::int32_t getTimeRemaining(lua_State*);
    std::int32_t getTickCount(lua_State*);
    std::int32_t getTick(lua_State*);

    std::int32_t setIcon(lua_State*);
    std::int32_t setPower(lua_State*);
    std::int32_t setSubPower(lua_State*);
    std::int32_t setTier(lua_State*);
    std::int32_t setDuration(lua_State*);
    std::int32_t setTick(lua_State*);
    std::int32_t setStartTime(lua_State*);

    std::int32_t resetStartTime(lua_State*);

    std::int32_t addMod(lua_State*);
    std::int32_t setFlag(lua_State*);
    std::int32_t unsetFlag(lua_State*);
};

#endif