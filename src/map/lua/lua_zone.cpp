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

#include "../region.h"

#include "lua_zone.h"
#include "lua_baseentity.h"
#include "../zone.h"
#include "../entities/charentity.h"

/************************************************************************
*																		*
*  Конструктор															*
*																		*
************************************************************************/

CLuaZone::CLuaZone(lua_State *L)
{
    if (!lua_isnil(L, -1))
    {
        m_pLuaZone = (CZone*)(lua_touserdata(L, -1));
        lua_pop(L, 1);
    }
    else
    {
        m_pLuaZone = nullptr;
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
    if (m_pLuaZone != nullptr)
    {
        if (!lua_isnil(L, 1) && lua_isnumber(L, 1) &&
            !lua_isnil(L, 2) && lua_isnumber(L, 2) &&
            !lua_isnil(L, 3) && lua_isnumber(L, 3) &&
            !lua_isnil(L, 4) && lua_isnumber(L, 4) &&
            !lua_isnil(L, 5) && lua_isnumber(L, 5) &&
            !lua_isnil(L, 6) && lua_isnumber(L, 6) &&
            !lua_isnil(L, 7) && lua_isnumber(L, 7))
        {
            bool circleRegion = false;
            if (lua_tointeger(L, 5) == 0 && lua_tointeger(L, 6) == 0 && lua_tointeger(L, 7) == 0)
                circleRegion = true; // Parameters were 0, we must be a circle.

            CRegion* Region = new CRegion(lua_tointeger(L, 1), circleRegion);

            // If this is a circle, parameter 4 will be the radius.
            Region->SetULCorner(lua_tointeger(L, 2), lua_tointeger(L, 3), lua_tointeger(L, 4));
            Region->SetLRCorner(lua_tointeger(L, 5), lua_tointeger(L, 6), lua_tointeger(L, 7));

            m_pLuaZone->InsertRegion(Region);
        }
        else {
            ShowWarning(CL_YELLOW"Region cannot be registered. Please check the parameters.\n" CL_RESET);
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
    if (m_pLuaZone != nullptr)
    {

    }
    lua_pushnil(L);
    return 1;
}

inline int32 CLuaZone::getPlayers(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_pLuaZone == nullptr);

    lua_newtable(L);
    int newTable = lua_gettop(L);

    m_pLuaZone->ForEachChar([&L, &newTable](CCharEntity* PChar) {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PChar);
        lua_pcall(L, 2, 1, 0);
        lua_setfield(L, newTable, PChar->GetName());
    });

    return 1;
}

inline int32 CLuaZone::getID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_pLuaZone == nullptr);

    lua_pushinteger(L, m_pLuaZone->GetID());

    return 1;
}

inline int32 CLuaZone::getRegionID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_pLuaZone == nullptr);

    lua_pushinteger(L, m_pLuaZone->GetRegionID());

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
    LUNAR_DECLARE_METHOD(CLuaZone,getPlayers),
    LUNAR_DECLARE_METHOD(CLuaZone,getID),
    LUNAR_DECLARE_METHOD(CLuaZone,getRegionID),
    {nullptr,nullptr}
};