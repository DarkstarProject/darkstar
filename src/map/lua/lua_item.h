/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTItem or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _LUAITEM_H
#define _LUAITEM_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CItem;
class CLuaItem
{
    CItem* m_PLuaItem;

public:

    static const int8 className[];
    static Lunar<CLuaItem>::Register_t methods[];

    CLuaItem(lua_State*);
    CLuaItem(CItem*);

    CItem* GetItem() const
    {
        return m_PLuaItem;
    }

    int32 getID(lua_State*);                // get the item's id
    int32 getSubID(lua_State*);             // get the item's subid

    int32 getFlag(lua_State*);              // get the item flag
    int32 getAHCat(lua_State*);             // get the ah category

    int32 getQuantity(lua_State*);          // get the quantity of item

    int32 getLocationID(lua_State*);        // get the location id (container id)
    int32 getSlotID(lua_State*);            // get the slot id
    int32 getWornItem(lua_State*);          // check if the item has been used

    int32 isType(lua_State*);               // check the item type
    int32 isSubType(lua_State*);            // check the item's sub type

    int32 getName(lua_State*);              // get the item's name

    int32 getMod(lua_State*);               // get the power of a mod
    int32 addMod(lua_State*);               // add mod to item (or add to a mod already applied on item)
    int32 delMod(lua_State*);               // remove power from mod

    int32 getAugment(lua_State*);           // get the augment id and power in slot
    //int32 setAugment(lua_State*);           // set the augment id and power in slot

    int32 getSkillType(lua_State*);         // get skill type
};

#endif