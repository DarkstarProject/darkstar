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

#ifndef _LUAINSTANCE_H
#define _LUAINSTANCE_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

#include "../instance.h"


class CLuaInstance
{
	CInstance *m_PLuaInstance;
public:

	static const int8 className[];
	static Lunar<CLuaInstance>::Register_t methods[];

	CLuaInstance(lua_State*);
	CLuaInstance(CInstance*);

	CInstance* GetInstance() const
	{
		return m_PLuaInstance;
	}
	int32 getInstanceNumber(lua_State*);
	int32 getBcnmID(lua_State*);
    int32 getTimeLimit(lua_State*);
	int32 getTimeInside(lua_State*);
	int32 getFastestTime(lua_State*);
	int32 getFastestPlayer(lua_State*);
	int32 setAsFastest(lua_State*);
	int32 setEntrance(lua_State*);
	int32 getEntrance(lua_State*);
};

#endif