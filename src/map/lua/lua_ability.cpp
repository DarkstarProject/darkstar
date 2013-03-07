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

#include "lua_ability.h"


/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaAbility::CLuaAbility(lua_State *L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PLuaAbility = (CAbility*)(lua_touserdata(L,-1));
		lua_pop(L,1);
	}else{
		m_PLuaAbility = NULL;
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

/************************************************************************
*                                                                       *
*  Устанавливаем сообщение способности                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaAbility::setMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == NULL); 
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    m_PLuaAbility->setMessage(lua_tointeger(L,-1));
	return 0;
}

/************************************************************************
*                                                                       *
*  Устанавливаем анимацию способности                                   *
*                                                                       *
************************************************************************/

inline int32 CLuaAbility::setAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == NULL); 
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    m_PLuaAbility->setAnimationID(lua_tointeger(L,-1));
	return 0;
}

inline int32 CLuaAbility::getID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaAbility == NULL); 

	lua_pushinteger(L, m_PLuaAbility->getID());
	return 1;
}

/************************************************************************
*																		*
*  Инициализация методов в lua											*
*																		*
************************************************************************/

const int8 CLuaAbility::className[] = "CAbility";

Lunar<CLuaAbility>::Register_t CLuaAbility::methods[] = 
{
    LUNAR_DECLARE_METHOD(CLuaAbility,setMsg),
    LUNAR_DECLARE_METHOD(CLuaAbility,setAnimation),
	LUNAR_DECLARE_METHOD(CLuaAbility,getID),
	{NULL,NULL}
}; 