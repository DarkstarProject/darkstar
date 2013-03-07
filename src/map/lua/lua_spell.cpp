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

#include "lua_spell.h"


/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaSpell::CLuaSpell(lua_State *L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PLuaSpell = (CSpell*)(lua_touserdata(L,-1));
		lua_pop(L,1);
	}else{
		m_PLuaSpell = NULL;
	}
}

/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaSpell::CLuaSpell(CSpell* PSpell)
{
	m_PLuaSpell = PSpell;
}

/************************************************************************
*                                                                       *
*  Устанавливаем сообщение заклинания                                   *
*                                                                       *
************************************************************************/

inline int32 CLuaSpell::setMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    m_PLuaSpell->setMessage(lua_tointeger(L,-1));
	return 0;
}

inline int32 CLuaSpell::getTotalTargets(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
    lua_pushinteger(L, m_PLuaSpell->getTotalTargets());
    return 1;
}

inline int32 CLuaSpell::getDefaultMessage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
    lua_pushinteger(L, m_PLuaSpell->getDefaultMessage());
    return 1;
}

inline int32 CLuaSpell::getMagicBurstMessage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
    lua_pushinteger(L, m_PLuaSpell->getMagicBurstMessage());
    return 1;
}

inline int32 CLuaSpell::getElement(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
	lua_pushinteger(L,m_PLuaSpell->getElement());
	return 1;
}

inline int32 CLuaSpell::isAoE(lua_State *L)
{
  DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
  lua_pushboolean(L,m_PLuaSpell->isAOE() > 0);
  return 1;
}

inline int32 CLuaSpell::getID(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PLuaSpell == NULL);
	lua_pushinteger(L,m_PLuaSpell->getID());
	return 1;
}

/************************************************************************
*																		*
*  Инициализация методов в lua											*
*																		*
************************************************************************/

const int8 CLuaSpell::className[] = "CSpell";
Lunar<CLuaSpell>::Register_t CLuaSpell::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaSpell,setMsg),
    LUNAR_DECLARE_METHOD(CLuaSpell,isAoE),
    LUNAR_DECLARE_METHOD(CLuaSpell,getDefaultMessage),
    LUNAR_DECLARE_METHOD(CLuaSpell,getMagicBurstMessage),
  LUNAR_DECLARE_METHOD(CLuaSpell,getElement),
	LUNAR_DECLARE_METHOD(CLuaSpell,getTotalTargets),
	LUNAR_DECLARE_METHOD(CLuaSpell, getID),
	{NULL,NULL}
};