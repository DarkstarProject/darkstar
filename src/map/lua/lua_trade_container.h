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

#ifndef _LUATRADECONTAINER_H
#define _LUATRADECONTAINER_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CTradeContainer;
class CLuaTradeContainer
{
    CTradeContainer *m_pMyTradeContainer;
public:

    static const char className[];
    static Lunar<CLuaTradeContainer>::Register_t methods[];

    CLuaTradeContainer(lua_State*);
    CLuaTradeContainer(CTradeContainer*);

    CTradeContainer* GetTradeContainer()const
    {
        return m_pMyTradeContainer;
    }

    std::int32_t getGil(lua_State*);
    std::int32_t getItem(lua_State*);
    std::int32_t getItemId(lua_State*);
    std::int32_t getItemSubId(lua_State*);
    std::int32_t getItemQty(lua_State*);
    std::int32_t hasItemQty(lua_State*);
    std::int32_t getSlotQty(lua_State*);		// количество предметов в указанной ячейке
    std::int32_t getItemCount(lua_State*);		// общее количество предметов
    std::int32_t getSlotCount(lua_State*);
    std::int32_t confirmItem(lua_State*);
};

#endif