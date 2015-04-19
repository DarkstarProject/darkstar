﻿/*
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


//======================================================//

CLuaStatusEffect::CLuaStatusEffect(lua_State* L)
{
	if( !lua_isnil(L,1) )
	{
		m_PLuaStatusEffect = (CStatusEffect*)lua_touserdata(L,1);
		lua_pop(L,1);
	}else{
		m_PLuaStatusEffect = nullptr;
	}
}

//======================================================//

CLuaStatusEffect::CLuaStatusEffect(CStatusEffect* StatusEffect)
{
	m_PLuaStatusEffect = StatusEffect;
}

//======================================================//

inline int32 CLuaStatusEffect::getType(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	lua_pushinteger( L, m_PLuaStatusEffect->GetStatusID() );
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getSubType(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	lua_pushinteger( L, m_PLuaStatusEffect->GetSubID() );
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getPower(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	lua_pushinteger( L, m_PLuaStatusEffect->GetPower() );
	return 1;
}

inline int32 CLuaStatusEffect::getSubPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
    
    lua_pushinteger( L, m_PLuaStatusEffect->GetSubPower() );
    return 1;
}

inline int32 CLuaStatusEffect::getTier(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    lua_pushinteger( L, m_PLuaStatusEffect->GetTier() );
    return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getDuration(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	lua_pushinteger( L, m_PLuaStatusEffect->GetDuration() );
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getStartTime(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	lua_pushinteger( L, m_PLuaStatusEffect->GetStartTime() );
	return 1;
}

/************************************************************************
*                                                                       *
*  Возвращаем количество тактов до окончания действия эффекта.          *
*  В данном выражении нельзя выносить делитель за скобку, это приведет 	*
*  к нарушению логики, т.к. мы сталкнемся с погрешностью таймера        *
*																		*	
************************************************************************/

inline int32 CLuaStatusEffect::getLastTick(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    uint32 count = 0;

    if (m_PLuaStatusEffect->GetTickTime() != 0)
	{
		count = m_PLuaStatusEffect->GetDuration() / m_PLuaStatusEffect->GetTickTime() - (m_PLuaStatusEffect->GetLastTick() - m_PLuaStatusEffect->GetStartTime()) / m_PLuaStatusEffect->GetTickTime();
    }
	lua_pushinteger( L, count );
	return 1;
}


/************************************************************************
*                                                                       *
*  Return how long is left until the effect expires (miliseconds)       *
*                                                                       *
************************************************************************/

inline int32 CLuaStatusEffect::getTimeRemaining(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
    uint32 remaining = 0;
    if (m_PLuaStatusEffect->GetStartTime() > 0)
    {
        remaining = dsp_max(m_PLuaStatusEffect->GetDuration() - (gettick() - m_PLuaStatusEffect->GetStartTime()), 0);
    }

    lua_pushinteger(L, remaining);
    return 1;
}

/************************************************************************
*                                                                       *
*  Возвращаем количество тактов с начала действия эффекта	            *
*                                                                       *
************************************************************************/

inline int32 CLuaStatusEffect::getTickCount(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    uint32 count = 0;

    if (m_PLuaStatusEffect->GetTickTime() != 0)
	{
		count = (m_PLuaStatusEffect->GetLastTick() - m_PLuaStatusEffect->GetStartTime()) / m_PLuaStatusEffect->GetTickTime();
    }
	lua_pushinteger( L, count );
	return 1;
}

inline int32 CLuaStatusEffect::getTick(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	lua_pushinteger( L, m_PLuaStatusEffect->GetTickTime() );
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::setIcon(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	m_PLuaStatusEffect->SetIcon( lua_tointeger(L,1) );
	return 0;
}

//======================================================//

inline int32 CLuaStatusEffect::setPower(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	m_PLuaStatusEffect->SetPower( lua_tointeger(L,1) );
	return 0;
}

inline int32 CLuaStatusEffect::setSubPower(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    m_PLuaStatusEffect->SetSubPower( lua_tointeger(L,1) );
    return 0;
}

inline int32 CLuaStatusEffect::setTier(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    m_PLuaStatusEffect->SetTier( lua_tointeger(L,1) );
    return 0;
}

//======================================================//

inline int32 CLuaStatusEffect::setDuration(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
	m_PLuaStatusEffect->SetDuration( lua_tointeger(L,1) );
	return 0;
}

inline int32 CLuaStatusEffect::setTick(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    m_PLuaStatusEffect->SetTickTime( lua_tointeger(L,1) );
    return 0;
}

/************************************************************************
*                                                                       *
*  Перезапускаем эффект                                                 *
*                                                                       *
************************************************************************/

inline int32 CLuaStatusEffect::resetStartTime(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	m_PLuaStatusEffect->SetStartTime(gettick());
	return 0;
}

inline int32 CLuaStatusEffect::setStartTime(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
	m_PLuaStatusEffect->SetStartTime( lua_tointeger(L,1) );
	return 0;
}

//======================================================//

inline int32 CLuaStatusEffect::addMod(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);
	
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
	
	m_PLuaStatusEffect->addMod( lua_tointeger(L,1), lua_tointeger(L,2) );
	return 0;
}

//======================================================//

inline int32 CLuaStatusEffect::setFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->SetFlag(lua_tonumber(L,1));
    return 0;
}

inline int32 CLuaStatusEffect::unsetFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaStatusEffect == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PLuaStatusEffect->UnsetFlag(lua_tonumber(L, 1));
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