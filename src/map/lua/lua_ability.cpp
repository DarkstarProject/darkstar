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

#include "lua_ability.h"
#include "../ability.h"


/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaAbility::CLuaAbility(lua_State *L)
{
    if (!lua_isnil(L, -1))
    {
        m_PLuaAbility = (CAbility*)(lua_touserdata(L, -1));
        lua_pop(L, 1);
    }
    else
    {
        m_PLuaAbility = nullptr;
    }
}

/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaAbility::CLuaAbility(CAbility* PAbility)
{
    m_PLuaAbility = PAbility;
}

inline std::int32_t CLuaAbility::getID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);

    lua_pushinteger(L, m_PLuaAbility->getID());
    return 1;
}


std::int32_t CLuaAbility::getMsg(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);

    lua_pushinteger(L, m_PLuaAbility->getMessage());
    return 1;
}

inline std::int32_t CLuaAbility::getRecast(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);

    lua_pushinteger(L, m_PLuaAbility->getRecastTime());
    return 1;
}

inline std::int32_t CLuaAbility::getRange(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);

    lua_pushinteger(L, (lua_Integer)m_PLuaAbility->getRange());
    return 1;
}

inline std::int32_t CLuaAbility::getName(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);

    lua_pushstring(L, (const char*)m_PLuaAbility->getName());
    return 1;
}

std::int32_t CLuaAbility::getAnimation(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);

    lua_pushinteger(L, m_PLuaAbility->getAnimationID());
    return 1;
}

inline std::int32_t CLuaAbility::setMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaAbility->setMessage((std::uint16_t)lua_tointeger(L, -1));
    return 0;
}

inline std::int32_t CLuaAbility::setAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaAbility->setAnimationID((std::uint16_t)lua_tointeger(L, -1));
    return 0;
}

inline std::int32_t CLuaAbility::setRecast(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaAbility->setRecastTime((std::uint16_t)lua_tointeger(L, -1));
    return 0;
}

inline std::int32_t CLuaAbility::setCE(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaAbility->setCE((std::uint16_t)lua_tointeger(L, -1));
    return 0;
}

inline std::int32_t CLuaAbility::setVE(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaAbility->setVE((std::uint16_t)lua_tointeger(L, -1));
    return 0;
}

inline std::int32_t CLuaAbility::setRange(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaAbility->setRange((float)lua_tointeger(L, -1));
    return 0;
}

/************************************************************************
*																		*
*  Инициализация методов в lua											*
*																		*
************************************************************************/

const char CLuaAbility::className[] = "CAbility";

Lunar<CLuaAbility>::Register_t CLuaAbility::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaAbility,getID),
    LUNAR_DECLARE_METHOD(CLuaAbility,getRecast),
    LUNAR_DECLARE_METHOD(CLuaAbility,getRange),
    LUNAR_DECLARE_METHOD(CLuaAbility,getName),
    LUNAR_DECLARE_METHOD(CLuaAbility,getAnimation),
    LUNAR_DECLARE_METHOD(CLuaAbility,getMsg),
    LUNAR_DECLARE_METHOD(CLuaAbility,setMsg),
    LUNAR_DECLARE_METHOD(CLuaAbility,setAnimation),
    LUNAR_DECLARE_METHOD(CLuaAbility,setRecast),
    LUNAR_DECLARE_METHOD(CLuaAbility,setCE),
    LUNAR_DECLARE_METHOD(CLuaAbility,setVE),
    LUNAR_DECLARE_METHOD(CLuaAbility,setRange),
    {nullptr,nullptr}
};