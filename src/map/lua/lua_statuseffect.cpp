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

#include "../../common/showmsg.h"

#include "lua_statuseffect.h"


//======================================================//

CLuaStatusEffect::CLuaStatusEffect(lua_State* L)
{
	if( !lua_isnil(L,-1) )
	{
		m_pLuaStatusEffect = (CStatusEffect*)lua_touserdata(L,-1);
		lua_pop(L,1);
	}else{
		m_pLuaStatusEffect = NULL;
	}
}

//======================================================//

CLuaStatusEffect::CLuaStatusEffect(CStatusEffect* StatusEffect)
{
	m_pLuaStatusEffect = StatusEffect;
}

//======================================================//

inline int32 CLuaStatusEffect::getType(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		lua_pushinteger( L, m_pLuaStatusEffect->GetStatusID() );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getSubType(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		lua_pushinteger( L, m_pLuaStatusEffect->GetSubID() );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getPower(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		lua_pushinteger( L, m_pLuaStatusEffect->GetPower() );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getDuration(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		lua_pushinteger( L, m_pLuaStatusEffect->GetDuration() );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getStartTime(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		lua_pushinteger( L, m_pLuaStatusEffect->GetStartTime() );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getLastTick(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		lua_pushinteger( L, m_pLuaStatusEffect->GetLastTick() );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::getTickCount(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		uint32 count = 0;

		if (m_pLuaStatusEffect->GetTickTime() != 0)
		{
			count = (m_pLuaStatusEffect->GetLastTick() - m_pLuaStatusEffect->GetStartTime()) / m_pLuaStatusEffect->GetTickTime();
		}

		lua_pushinteger( L, count );
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::setPower(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
		{
			m_pLuaStatusEffect->SetPower( lua_tointeger(L,-1) );
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::setDuration(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL) 
	{
		if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
		{
			m_pLuaStatusEffect->SetDuration( lua_tointeger(L,-1) );
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaStatusEffect::addMod(lua_State* L)
{
	if (m_pLuaStatusEffect != NULL)
	{
		if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
			!lua_isnil(L,-2) && lua_isnumber(L,-2))
		{
			m_pLuaStatusEffect->addMod( lua_tointeger(L,-2), lua_tointeger(L,-1) );
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

const int8 CLuaStatusEffect::className[] = "CLuaStatusEffect";
Lunar<CLuaStatusEffect>::Register_t CLuaStatusEffect::methods[] = 
{
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getType),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getSubType),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getPower),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,setPower),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getDuration),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,setDuration),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getStartTime),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getLastTick),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,getTickCount),
	LUNAR_DECLARE_METHOD(CLuaStatusEffect,addMod),
	{NULL,NULL}
}; 