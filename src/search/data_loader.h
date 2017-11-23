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

#ifndef _CDATALOADER_H_
#define _CDATALOADER_H_

#include "../common/cbasetypes.h"

#include <list>
#include <vector>
#include <stdio.h>
#include <string.h>

struct Sql_t;
struct search_req;

struct ahItem
{
    std::uint16_t ItemID;
    uint32 SinglAmount;
    uint32 StackAmount;
};

struct ahHistory
{
    uint32 Price;
    uint32 Data;
    std::uint8_t  Name1[15];
    std::uint8_t  Name2[15];
};

struct SearchEntity
{
    std::uint8_t  name[16];
    uint32 id;
    std::uint8_t  mjob;
    std::uint8_t  mlvl;
    std::uint8_t  sjob;
    std::uint8_t  slvl;
    std::uint8_t  nation;
    std::uint8_t  rank;
    std::uint8_t  race;
    std::uint16_t zone;
    std::uint16_t prevzone;
    std::uint16_t flags1;
    uint32 flags2;
    uint32 comment;
    uint32 linkshellid1;
    uint32 linkshellid2;
    std::uint8_t  linkshellrank1;
    std::uint8_t  linkshellrank2;
    std::uint16_t languages;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CDataLoader
{
public:

    CDataLoader();
    ~CDataLoader();

    uint32 GetPlayersCount(search_req sr);

    std::vector<ahHistory*>  GetAHItemHystory(std::uint16_t ItemID, bool stack);
    std::list<SearchEntity*> GetPartyList(std::uint16_t PartyID, std::uint16_t AllianceID);
    std::list<SearchEntity*> GetLinkshellList(uint32 LinkshellID);
    std::list<SearchEntity*> GetPlayersList(search_req sr, int* count);
    std::vector<ahItem*>     GetAHItemsToCategory(std::uint8_t AHCategoryID, std::int8_t* OrderByString);
    void					 ExpireAHItems();

private:

    Sql_t* SqlHandle;
};

#endif
