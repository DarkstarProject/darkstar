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

#include "lua_trustskill.h"
#include "../trust_weaponskill.h"


/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaTrustSkill::CLuaTrustSkill(lua_State *L)
{
    if (!lua_isnil(L, -1))
    {
        m_PLuaTrustSkill = (CTrustWeaponSkill*)(lua_touserdata(L, -1));
        lua_pop(L, 1);
    }
    else
    {
        m_PLuaTrustSkill = nullptr;
    }
}

/************************************************************************
*																		*
*  Constructor															*
*																		*
************************************************************************/

CLuaTrustSkill::CLuaTrustSkill(CTrustWeaponSkill* PSkill)
{
    m_PLuaTrustSkill = PSkill;
}

/************************************************************************
*                                                                       *
*  Set the tp skill message to be displayed (cure/damage/enfeeb)        *
*                                                                       *
************************************************************************/

inline int32 CLuaTrustSkill::setMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    m_PLuaTrustSkill->setMsg((uint16)lua_tointeger(L, -1));
    return 0;
}

inline int32 CLuaTrustSkill::hasMissMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushboolean(L, m_PLuaTrustSkill->hasMissMsg());
    return 1;
}

inline int32 CLuaTrustSkill::isSingle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushboolean(L, m_PLuaTrustSkill->isSingle());
    return 1;
}

inline int32 CLuaTrustSkill::isAoE(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushboolean(L, m_PLuaTrustSkill->isAoE());
    return 1;
}

inline int32 CLuaTrustSkill::isConal(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushboolean(L, m_PLuaTrustSkill->isConal());
    return 1;
}

inline int32 CLuaTrustSkill::getTotalTargets(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushinteger(L, m_PLuaTrustSkill->getTotalTargets());
    return 1;
}

inline int32 CLuaTrustSkill::getMsg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushinteger(L, m_PLuaTrustSkill->getMsg());
    return 1;
}

inline int32 CLuaTrustSkill::getID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushinteger(L, m_PLuaTrustSkill->getID());
    return 1;
}

inline int32 CLuaTrustSkill::getParam(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushinteger(L, m_PLuaTrustSkill->getParam());
    return 1;
}

/*************************************************************************

            get the TP for calculations

**************************************************************************/

inline int32 CLuaTrustSkill::getTP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushnumber(L, (float)m_PLuaTrustSkill->getTP());
    return 1;
}

inline int32 CLuaTrustSkill::getHPP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaTrustSkill == nullptr);

    lua_pushinteger(L, m_PLuaTrustSkill->getHPP());
    return 1;
}

/************************************************************************
*																		*
*  declare lua function													*
*																		*
************************************************************************/

const char CLuaTrustSkill::className[] = "CTrustSkill";
Lunar<CLuaTrustSkill>::Register_t CLuaTrustSkill::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,setMsg),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,getMsg),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,hasMissMsg),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,isAoE),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,isConal),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,isSingle),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,getParam),
  LUNAR_DECLARE_METHOD(CLuaTrustSkill,getID),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,getTotalTargets),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,getTP),
    LUNAR_DECLARE_METHOD(CLuaTrustSkill,getHPP),
    {nullptr,nullptr}
};
