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

#ifndef _LUASPELL_H
#define _LUASPELL_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CSpell;
class CLuaSpell
{
    CSpell *m_PLuaSpell;
public:

    static const char className[];
    static Lunar<CLuaSpell>::Register_t methods[];

    CLuaSpell(lua_State*);
    CLuaSpell(CSpell*);

    CSpell* GetSpell() const
    {
        return m_PLuaSpell;
    }

    std::int32_t setMsg(lua_State*);
    std::int32_t setAoE(lua_State*);
    std::int32_t setFlag(lua_State*);
    std::int32_t setRadius(lua_State*);
    std::int32_t setAnimation(lua_State*);
    std::int32_t setMPCost(lua_State*);
    std::int32_t canTargetEnemy(lua_State*);
    std::int32_t isAoE(lua_State*);
    std::int32_t tookEffect(lua_State*);
    std::int32_t getTotalTargets(lua_State*);
    std::int32_t getMagicBurstMessage(lua_State*);
    std::int32_t getElement(lua_State*);
    std::int32_t getID(lua_State*);
    std::int32_t getSkillType(lua_State*);
    std::int32_t getSpellGroup(lua_State*);
    std::int32_t getFlag(lua_State*);
    std::int32_t castTime(lua_State*);
};

#endif
