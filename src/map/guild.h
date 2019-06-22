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

#ifndef _GUILD_H
#define _GUILD_H

#include "../common/cbasetypes.h"
#include <array>
#include <vector>
#include <string>

#define GP_ITEM_RANKS 7

class CItemContainer;
class CItem;
class CCharEntity;

struct GPItem_t
{
    CItem* item;
    uint16 maxpoints;
    uint16 points;

    GPItem_t(CItem* _item, uint16 _maxpoints, uint16 _points)
        : item(_item), maxpoints(_maxpoints), points(_points)
    {};
};

class CGuild
{
public:
    CGuild(uint8 id, const char* pointsName);
    ~CGuild();

    std::vector<CItemContainer*> guildShops;

    uint8 id();

    void updateGuildPointsPattern(uint8 pattern);
    uint8 addGuildPoints(CCharEntity* PChar, CItem* PItem, int16& pointsAdded);
    std::pair<uint16,uint16> getDailyGPItem(CCharEntity* PChar);

private:
    uint8 m_id;
    std::string pointsName;

    std::array<uint8, GP_ITEM_RANKS> m_GPItemsRank;
    std::array<std::vector<GPItem_t>, GP_ITEM_RANKS> m_GPItems;
};

#endif