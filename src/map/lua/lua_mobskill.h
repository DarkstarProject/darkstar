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

#ifndef _LUAMOBSKILL_H
#define _LUAMOBSKILL_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CMobSkill;

class CLuaMobSkill
{
    CMobSkill *m_PLuaMobSkill;
public:

    static const char className[];
    static Lunar<CLuaMobSkill>::Register_t methods[];

    CLuaMobSkill(lua_State*);
    CLuaMobSkill(CMobSkill*);

    CMobSkill* GetMobSkill() const
    {
        return m_PLuaMobSkill;
    }
    std::int32_t getTP(lua_State*);
    std::int32_t getHPP(lua_State*);
    std::int32_t getID(lua_State*);
    std::int32_t getParam(lua_State*);
    std::int32_t isAoE(lua_State*);
    std::int32_t isConal(lua_State*);
    std::int32_t isSingle(lua_State*);
    std::int32_t hasMissMsg(lua_State*);
    std::int32_t setMsg(lua_State*);
    std::int32_t getMsg(lua_State*);
    std::int32_t getTotalTargets(lua_State*);
};

#endif
