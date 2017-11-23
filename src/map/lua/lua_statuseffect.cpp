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

#include "../../common/showmsg.h"
#include "../../common/timer.h"

#include "lua_statuseffect.h"
#include "../status_effect.h"

//======================================================//

CLuaStatusEffect::CLuaStatusEffect(lua_State* L)
{
    if (!lua_isnil(L, 1))
    {
        m_PLuaStatusEffect = (CStatusEffect*)lua_touserdata(L, 1);
        lua_pop(L, 1);
    }
    else
    {
        m_PLuaStatusEffect = nullptr;
    }
}

//======================================================//

CLuaStatusEffect::CLuaStatusEffect(CStatusEffect* StatusEffect)
{
    m_PLuaStatusEffect = StatusEffect;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::getType(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetStatusID());
    return 1;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::getSubType(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetSubID());
    return 1;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::getPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetPower());
    return 1;
}

inline std::int32_t CLuaStatusEffect::getSubPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetSubPower());
    return 1;
}

inline std::int32_t CLuaStatusEffect::getTier(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetTier());
    return 1;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::getDuration(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetDuration() / 1000);
    return 1;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::getStartTime(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, (lua_Integer)std::chrono::duration_cast<std::chrono::milliseconds>(m_PLuaStatusEffect->GetStartTime() - get_server_start_time()).count());
    return 1;
}

/************************************************************************
*                                                                       *
* Returns remaining ticks until expiry                                  *
*																		*
************************************************************************/

inline std::int32_t CLuaStatusEffect::getLastTick(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    long long total = 0;

    if (m_PLuaStatusEffect->GetTickTime() != 0)
    {
        auto total_ticks = m_PLuaStatusEffect->GetDuration() / m_PLuaStatusEffect->GetTickTime();
        auto elapsed_ticks = m_PLuaStatusEffect->GetElapsedTickCount();
        total = total_ticks - elapsed_ticks;
    }
    lua_pushinteger(L, (lua_Integer)total);
    return 1;
}


/************************************************************************
*                                                                       *
*  Return how long is left until the effect expires (miliseconds)       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaStatusEffect::getTimeRemaining(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
    std::uint32_t remaining = 0;
    if (m_PLuaStatusEffect->GetDuration() > 0)
    {
        remaining = (std::uint32_t)std::max((m_PLuaStatusEffect->GetDuration() -
            std::chrono::duration_cast<std::chrono::milliseconds>(server_clock::now() - m_PLuaStatusEffect->GetStartTime()).count()), std::chrono::seconds::rep{});
    }

    lua_pushinteger(L, remaining);
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns number of elapsed ticks                                      *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaStatusEffect::getTickCount(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetElapsedTickCount());
    return 1;
}

inline std::int32_t CLuaStatusEffect::getTick(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger(L, m_PLuaStatusEffect->GetTickTime());
    return 1;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::setIcon(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetIcon((std::uint16_t)lua_tointeger(L, 1));
    return 0;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::setPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetPower((std::uint16_t)lua_tointeger(L, 1));
    return 0;
}

inline std::int32_t CLuaStatusEffect::setSubPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetSubPower((std::uint16_t)lua_tointeger(L, 1));
    return 0;
}

inline std::int32_t CLuaStatusEffect::setTier(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetTier((std::uint16_t)lua_tointeger(L, 1));
    return 0;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::setDuration(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetDuration((std::uint32_t)lua_tointeger(L, 1));
    return 0;
}

inline std::int32_t CLuaStatusEffect::setTick(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetTickTime((std::uint32_t)lua_tointeger(L, 1));
    return 0;
}

/************************************************************************
*                                                                       *
*  Перезапускаем эффект                                                 *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaStatusEffect::resetStartTime(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    m_PLuaStatusEffect->SetStartTime(server_clock::now());
    return 0;
}

inline std::int32_t CLuaStatusEffect::setStartTime(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));


    m_PLuaStatusEffect->SetStartTime(get_server_start_time() + std::chrono::milliseconds(lua_tointeger(L, 1)));
    return 0;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::addMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    m_PLuaStatusEffect->addMod(static_cast<Mod>(lua_tointeger(L, 1)), (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

//======================================================//

inline std::int32_t CLuaStatusEffect::setFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetFlag((std::uint32_t)lua_tonumber(L, 1));
    return 0;
}

inline std::int32_t CLuaStatusEffect::unsetFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->UnsetFlag((std::uint32_t)lua_tonumber(L, 1));
    return 0;
}

//======================================================//

const int8 CLuaStatusEffect::className[] = "CLuaStatusEffect";

Lunar<CLuaStatusEffect>::Register_t CLuaStatusEffect::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getType),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getSubType),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setIcon),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getPower),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setPower),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getDuration),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setDuration),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getStartTime),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getLastTick),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getTimeRemaining),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getTickCount),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,resetStartTime),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,addMod),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getSubPower),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setSubPower),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getTier),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setTier),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,getTick),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setTick),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setStartTime),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,setFlag),
    LUNAR_DECLARE_METHOD(CLuaStatusEffect,unsetFlag),
    {nullptr,nullptr}
};