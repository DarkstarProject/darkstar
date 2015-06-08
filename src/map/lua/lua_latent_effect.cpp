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

#include "lua_latent_effect.h"

#include "../latent_effect.h"


CLuaLatentEffect::CLuaLatentEffect(lua_State* L)
{
    if (!lua_isnil(L, 1))
    {
        m_PLuaLatentEffect = (CLatentEffect*)lua_touserdata(L, 1);
        lua_pop(L, 1);
    }
    else{
        m_PLuaLatentEffect = nullptr;
    }
}

CLuaLatentEffect::CLuaLatentEffect(CLatentEffect* PLatentEffect)
{
    m_PLuaLatentEffect = PLatentEffect;
}

inline int32 CLuaLatentEffect::getConditionID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaLatentEffect == nullptr);

    lua_pushinteger(L, ((CLatentEffect*)m_PLuaLatentEffect)->GetConditionsID());
    return 1;
}

inline int32 CLuaLatentEffect::getConditionValue(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaLatentEffect == nullptr);

    lua_pushinteger(L, ((CLatentEffect*)m_PLuaLatentEffect)->GetConditionsValue());
    return 1;
}

inline int32 CLuaLatentEffect::getModID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaLatentEffect == nullptr);

    lua_pushinteger(L, ((CLatentEffect*)m_PLuaLatentEffect)->GetModValue());
    return 1;
}

inline int32 CLuaLatentEffect::getModPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaLatentEffect == nullptr);

    lua_pushinteger(L, ((CLatentEffect*)m_PLuaLatentEffect)->GetModPower());
    return 1;
}

inline int32 CLuaLatentEffect::setMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaLatentEffect == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CLatentEffect*)m_PLuaLatentEffect)->SetModValue(lua_tointeger(L, 1));
    ((CLatentEffect*)m_PLuaLatentEffect)->SetModPower(lua_tointeger(L, 2));
    return 0;
}

//==========================================================//

const int8 CLuaLatentEffect::className[] = "CLatentEffect";

Lunar<CLuaLatentEffect>::Register_t CLuaLatentEffect::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaLatentEffect, getConditionID),
    LUNAR_DECLARE_METHOD(CLuaLatentEffect, getConditionValue),
    LUNAR_DECLARE_METHOD(CLuaLatentEffect, getModID),
    LUNAR_DECLARE_METHOD(CLuaLatentEffect, getModPower),
    LUNAR_DECLARE_METHOD(CLuaLatentEffect, setMod),
    { nullptr, nullptr }
};
