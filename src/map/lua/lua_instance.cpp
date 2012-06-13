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

#include "lua_instance.h"


/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaInstance::CLuaInstance(lua_State *L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PLuaInstance = (CInstance*)(lua_touserdata(L,-1));
		lua_pop(L,1);
	}else{
		m_PLuaInstance = NULL;
	}
}

/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaInstance::CLuaInstance(CInstance* PInstance)
{
	m_PLuaInstance = PInstance;
}

/************************************************************************
*                                                                       *
*						Get methods								        *
*                                                                       *
************************************************************************/

inline int32 CLuaInstance::getInstanceNumber(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	
	lua_pushinteger( L, m_PLuaInstance->getInstanceNumber() );
	return 1;
}

inline int32 CLuaInstance::getTimeLimit(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	
	lua_pushinteger( L, m_PLuaInstance->getTimeLimit() );
	return 1;
}

inline int32 CLuaInstance::getBcnmID(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	
	lua_pushinteger( L, m_PLuaInstance->getID() );
	return 1;
}


/************************************************************************
*																		*
*  declare lua function													*
*																		*
************************************************************************/

const int8 CLuaInstance::className[] = "CInstance";
Lunar<CLuaInstance>::Register_t CLuaInstance::methods[] = 
{
    LUNAR_DECLARE_METHOD(CLuaInstance,getInstanceNumber),
	LUNAR_DECLARE_METHOD(CLuaInstance,getBcnmID),
	LUNAR_DECLARE_METHOD(CLuaInstance,getTimeLimit),
	{NULL,NULL}
}; 