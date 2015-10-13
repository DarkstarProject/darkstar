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

#include "lua_action.h"

CLuaAction::CLuaAction(lua_State *L)
{
    if (!lua_isnil(L, -1))
    {
        m_PLuaAction = (apAction_t*)(lua_touserdata(L, -1));
        lua_pop(L, 1);
    }
    else
    {
        m_PLuaAction = nullptr;
    }
}

CLuaAction::CLuaAction(apAction_t* Action)
{
    m_PLuaAction = Action;
}

inline int32 CLuaAction::setParam(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAction == nullptr);
    m_PLuaAction->param = lua_tointeger(L, -1);
    return 0;
}

inline int32 CLuaAction::setMessageID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAction == nullptr);

    m_PLuaAction->messageID = lua_tointeger(L, -1);
    return 0;
}

inline int32 CLuaAction::setAdditionalEffect(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAction == nullptr);

    m_PLuaAction->additionalEffect = static_cast<SUBEFFECT>(lua_tointeger(L, -1));
    return 0;
}

inline int32 CLuaAction::setAddEffectParam(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAction == nullptr);
    m_PLuaAction->addEffectParam = lua_tointeger(L, -1);
    return 0;
}


// Initialize Lua Methods
const int8 CLuaAction::className[] = "CAction";

Lunar<CLuaAction>::Register_t CLuaAction::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaAction, setParam),
    LUNAR_DECLARE_METHOD(CLuaAction, setMessageID),
    LUNAR_DECLARE_METHOD(CLuaAction, setAddEffectParam),
    LUNAR_DECLARE_METHOD(CLuaAction, setAdditionalEffect),
    {nullptr,nullptr}
};
