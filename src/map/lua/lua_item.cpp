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

#include "lua_item.h"

#include "../items/item_armor.h"
#include "../items/item_weapon.h"
#include "../items/item_general.h"


CLuaItem::CLuaItem(lua_State* L)
{
    if (!lua_isnil(L, 1))
    {
        m_PLuaItem = (CItem*)lua_touserdata(L, 1);
        lua_pop(L, 1);
    }
    else
    {
        m_PLuaItem = nullptr;
    }
}

CLuaItem::CLuaItem(CItem* PItem)
{
    m_PLuaItem = PItem;
}

inline int32 CLuaItem::getID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getID());
    return 1;
}

inline int32 CLuaItem::getSubID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getSubID());
    return 1;
}

inline int32 CLuaItem::getFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getFlag());
    return 1;
}

inline int32 CLuaItem::getAHCat(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getAHCat());
    return 1;
}

inline int32 CLuaItem::getQuantity(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getQuantity());
    return 1;
}

inline int32 CLuaItem::getLocationID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getLocationID());
    return 1;
}

inline int32 CLuaItem::getSlotID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->getSlotID());
    return 1;
}

inline int32 CLuaItem::getWornItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushinteger(L, m_PLuaItem->m_extra[0]);
    return 1;
}

inline int32 CLuaItem::isType(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint8 type = lua_tointeger(L, 1);

    lua_pushboolean(L, m_PLuaItem->isType((ITEM_TYPE)type));
    return 1;
}

inline int32 CLuaItem::isSubType(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint8 subtype = lua_tointeger(L, 1);

    lua_pushboolean(L, m_PLuaItem->isSubType((ITEM_SUBTYPE)subtype));
    return 1;
}

inline int32 CLuaItem::getName(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);

    lua_pushstring(L, m_PLuaItem->getName());
    return 1;
}

inline int32 CLuaItem::getMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CItemArmor* PItem = (CItemArmor*)m_PLuaItem;

    uint16 mod = lua_tointeger(L, 1);

    lua_pushinteger(L, PItem->getModifier(mod));
    return 1;
}

inline int32 CLuaItem::addMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CItemArmor* PItem = (CItemArmor*)m_PLuaItem;

    uint32 mod = lua_tointeger(L, 1);
    int32 power = lua_tointeger(L, 2);

    PItem->addModifier(new CModifier(mod, power));
    return 0;
}

inline int32 CLuaItem::delMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CItemArmor* PItem = (CItemArmor*)m_PLuaItem;

    uint32 mod = lua_tointeger(L, 1);
    int32 power = lua_tointeger(L, 2);

    PItem->addModifier(new CModifier(mod, -power));
    return 0;
}

inline int32 CLuaItem::getAugment(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PLuaItem == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CItemArmor* PItem = (CItemArmor*)m_PLuaItem;

    uint8 slot = lua_tointeger(L, 1);
    uint16 augment = PItem->getAugment(slot);
    uint16 augmentid = unpackBitsBE((uint8*)(&augment), 0, 11);
    uint8 augmentVal = unpackBitsBE((uint8*)(&augment), 11, 5);

    lua_pushinteger(L, augmentid);
    lua_pushinteger(L, augmentVal);

    return 2;
}

//==========================================================//

const int8 CLuaItem::className[] = "CItem";

Lunar<CLuaItem>::Register_t CLuaItem::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaItem,getID),
    LUNAR_DECLARE_METHOD(CLuaItem,getSubID),
    LUNAR_DECLARE_METHOD(CLuaItem,getFlag),
    LUNAR_DECLARE_METHOD(CLuaItem,getAHCat),
    LUNAR_DECLARE_METHOD(CLuaItem,getQuantity),
    LUNAR_DECLARE_METHOD(CLuaItem,getLocationID),
    LUNAR_DECLARE_METHOD(CLuaItem,getSlotID),
    LUNAR_DECLARE_METHOD(CLuaItem,getWornItem),
    LUNAR_DECLARE_METHOD(CLuaItem,isType),
    LUNAR_DECLARE_METHOD(CLuaItem,isSubType),
    LUNAR_DECLARE_METHOD(CLuaItem,getName),
    LUNAR_DECLARE_METHOD(CLuaItem,getMod),
    LUNAR_DECLARE_METHOD(CLuaItem,addMod),
    LUNAR_DECLARE_METHOD(CLuaItem,delMod),
    LUNAR_DECLARE_METHOD(CLuaItem,getAugment),
    {nullptr,nullptr}
};
