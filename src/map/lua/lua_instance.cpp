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

inline int32 CLuaInstance::getTimeInside(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	uint32 duration = (m_PLuaInstance->lastTick - m_PLuaInstance->getStartTime())/1000;
	lua_pushinteger( L, duration);
	return 1;
}

inline int32 CLuaInstance::getFastestTime(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	
	lua_pushinteger( L, m_PLuaInstance->m_FastestTime );
	return 1;
}

inline int32 CLuaInstance::getFastestPlayer(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	
	lua_pushstring( L, m_PLuaInstance->m_FastestName.c_str() );
	return 1;
}

inline int32 CLuaInstance::setAsFastest(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	
	lua_pushinteger( L, 0 );
	return 1;
}

inline int32 CLuaInstance::getEntrance(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);

	lua_pushinteger(L, m_PLuaInstance->getEntrance());
	return 1;
}

inline int32 CLuaInstance::setEntrance(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaInstance == NULL);
	DSP_DEBUG_BREAK_IF(!lua_isnumber(L, 1) || lua_isnil(L, 1));
	m_PLuaInstance->setEntrance(lua_tointeger(L, 1));
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
    LUNAR_DECLARE_METHOD(CLuaInstance,getInstanceNumber),
	LUNAR_DECLARE_METHOD(CLuaInstance,getBcnmID),
	LUNAR_DECLARE_METHOD(CLuaInstance,getTimeLimit),
	LUNAR_DECLARE_METHOD(CLuaInstance,getTimeInside),
	LUNAR_DECLARE_METHOD(CLuaInstance,getFastestTime),
	LUNAR_DECLARE_METHOD(CLuaInstance,getFastestPlayer),
	LUNAR_DECLARE_METHOD(CLuaInstance,getEntrance),
	LUNAR_DECLARE_METHOD(CLuaInstance,setEntrance),
	{NULL,NULL}
}; 