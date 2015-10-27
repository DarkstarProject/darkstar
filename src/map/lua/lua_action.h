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

#ifndef _LUAACTION_H
#define _LUAACTION_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

#include "../entities/battleentity.h"

class CLuaAction
{
    apAction_t* m_PLuaAction;

public:

    static const int8 className[];
    static Lunar<CLuaAction>::Register_t methods[];

    CLuaAction(lua_State*);
    CLuaAction(apAction_t*);

    apAction_t* GetAction() const
    {
        return m_PLuaAction;
    }

    int32 setParam(lua_State*);
    int32 setMessageID(lua_State*);
    int32 setAddEffectParam(lua_State*);
    int32 setAdditionalEffect(lua_State*);
};

#endif
