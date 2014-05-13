/*
===========================================================================

Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "lua_instance.h"

#include "lua_baseentity.h"


/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaInstance::CLuaInstance(lua_State *L)
{
	if (!lua_isnil(L, -1))
	{
		m_PLuaInstance = (CInstance*)(lua_touserdata(L, -1));
		lua_pop(L, 1);
	}
	else{
		m_PLuaInstance = NULL;
	}
}

/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaInstance::CLuaInstance(CInstance* PBattlefield)
{
	m_PLuaInstance = PBattlefield;
}

inline int32 CLuaInstance::registerChar(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
	CBaseEntity* PChar = PLuaBaseEntity->GetBaseEntity();

	if (PChar->objtype == TYPE_PC)
	{
		lua_pushboolean(L, m_PLuaInstance->RegisterChar((CCharEntity*)PChar));
	}
	else
	{
		lua_pushnil(L);
	}
	return 1;
}

inline int32 CLuaInstance::setLevelCap(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

	m_PLuaInstance->SetLevelCap(lua_tonumber(L, 1));

	return 0;
}

/************************************************************************
*																		*
*  declare lua function													*
*																		*
************************************************************************/

const int8 CLuaInstance::className[] = "CInstance";
Lunar<CLuaInstance>::Register_t CLuaInstance::methods[] =
{
	LUNAR_DECLARE_METHOD(CLuaInstance, registerChar),
	LUNAR_DECLARE_METHOD(CLuaInstance, setLevelCap),
	{ NULL, NULL }
};