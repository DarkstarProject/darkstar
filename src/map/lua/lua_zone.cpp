/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "../region.h"

#include "lua_zone.h"


/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaZone::CLuaZone(lua_State *L)
{
	if( !lua_isnil(L,-1) )
	{
		m_pLuaZone = (CZone*)(lua_touserdata(L,-1));
		lua_pop(L,1);
	}else{
		m_pLuaZone = NULL;
	}
}

/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaZone::CLuaZone(CZone* PZone)
{
	m_pLuaZone = PZone;
}

/************************************************************************
*																		*
*  Регистрируем активную область в зоне									*
*  Формат входных данных: RegionID, x1, y1, z1, x2, y2, z2				*
*																		*
************************************************************************/

inline int32 CLuaZone::registerRegion(lua_State *L)
{
	if( m_pLuaZone != NULL) 
	{
		if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
			!lua_isnil(L,2) && lua_isnumber(L,2) &&
			!lua_isnil(L,3) && lua_isnumber(L,3) &&
			!lua_isnil(L,4) && lua_isnumber(L,4) &&
			!lua_isnil(L,5) && lua_isnumber(L,5) &&
			!lua_isnil(L,6) && lua_isnumber(L,6) &&
			!lua_isnil(L,7) && lua_isnumber(L,7))
		{
			CRegion* Region = new CRegion(lua_tointeger(L,1));

			Region->SetULCorner(lua_tointeger(L,2),lua_tointeger(L,3),lua_tointeger(L,4));
			Region->SetLRCorner(lua_tointeger(L,5),lua_tointeger(L,6),lua_tointeger(L,7));

			m_pLuaZone->InsertRegion(Region);
		} else {
			ShowWarning(CL_YELLOW"Region cannot be registered. Please check the parameters.\n"CL_RESET);
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Устанавливаем ограничение уровня для зоны							*
*																		*
************************************************************************/

inline int32 CLuaZone::levelRestriction(lua_State *L)
{
	if( m_pLuaZone != NULL) 
	{
		
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Инициализация методов в lua											*
*																		*
************************************************************************/

const int8 CLuaZone::className[] = "CZone";
Lunar<CLuaZone>::Register_t CLuaZone::methods[] = 
{
	LUNAR_DECLARE_METHOD(CLuaZone,levelRestriction),
	LUNAR_DECLARE_METHOD(CLuaZone,registerRegion),
	{NULL,NULL}
}; 