﻿/*
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

#include "lua_battlefield.h"


/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaBattlefield::CLuaBattlefield(lua_State *L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PLuaBattlefield = (CBattlefield*)(lua_touserdata(L,-1));
		lua_pop(L,1);
	}else{
		m_PLuaBattlefield = NULL;
	}
}

/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaBattlefield::CLuaBattlefield(CBattlefield* PBattlefield)
{
	m_PLuaBattlefield = PBattlefield;
}

/************************************************************************
*                                                                       *
*						Get methods								        *
*                                                                       *
************************************************************************/

inline int32 CLuaBattlefield::getBattlefieldNumber(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	
	lua_pushinteger( L, m_PLuaBattlefield->getBattlefieldNumber() );
	return 1;
}

inline int32 CLuaBattlefield::getTimeLimit(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	
	lua_pushinteger( L, m_PLuaBattlefield->getTimeLimit() );
	return 1;
}

inline int32 CLuaBattlefield::getBcnmID(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	
	lua_pushinteger( L, m_PLuaBattlefield->getID() );
	return 1;
}

inline int32 CLuaBattlefield::getTimeInside(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	uint32 duration = (m_PLuaBattlefield->lastTick - m_PLuaBattlefield->getStartTime())/1000;
	lua_pushinteger( L, duration);
	return 1;
}

inline int32 CLuaBattlefield::getFastestTime(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	
	lua_pushinteger( L, m_PLuaBattlefield->m_FastestTime );
	return 1;
}

inline int32 CLuaBattlefield::getFastestPlayer(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	
	lua_pushstring( L, m_PLuaBattlefield->m_FastestName.c_str() );
	return 1;
}

inline int32 CLuaBattlefield::setAsFastest(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	
	lua_pushinteger( L, 0 );
	return 1;
}

inline int32 CLuaBattlefield::getEntrance(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);

	lua_pushinteger(L, m_PLuaBattlefield->getEntrance());
	return 1;
}

inline int32 CLuaBattlefield::setEntrance(lua_State* L){
	DSP_DEBUG_BREAK_IF(m_PLuaBattlefield == NULL);
	DSP_DEBUG_BREAK_IF(!lua_isnumber(L, 1) || lua_isnil(L, 1));
	m_PLuaBattlefield->setEntrance(lua_tointeger(L, 1));
	return 0;
}

/************************************************************************
*																		*
*  declare lua function													*
*																		*
************************************************************************/

const int8 CLuaBattlefield::className[] = "CBattlefield";
Lunar<CLuaBattlefield>::Register_t CLuaBattlefield::methods[] = 
{
    LUNAR_DECLARE_METHOD(CLuaBattlefield,getBattlefieldNumber),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,getBcnmID),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,getTimeLimit),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,getTimeInside),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,getFastestTime),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,getFastestPlayer),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,getEntrance),
	LUNAR_DECLARE_METHOD(CLuaBattlefield,setEntrance),
	{NULL,NULL}
}; 