/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

struct Sql_t;

struct ahItem 
{
    uint16 ItemID;
    uint32 SinglAmount;
    uint32 StackAmount;
};

struct ahHistory
{
    uint32 Price;
    uint32 Data;
    uint8  Name1[15];
    uint8  Name2[15];
};

struct SearchEntity
{
    uint8  name[16];
    uint32 id;
	uint8  mjob;
	uint8  mlvl;
	uint8  sjob;
	uint8  slvl;
	uint8  nation;
	uint8  rank;
	uint8  race;
	uint8  zone;
	uint16 flags1;
	uint32 flags2;
	uint32 comment;
	uint8  linkshell;
	uint16 languages;
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

    uint32 GetPlayersCount();

    std::vector<ahHistory*>  GetAHItemHystory(uint16 ItemID, bool stack);
    std::list<SearchEntity*> GetPartyList(uint32 PartyID);
    std::list<SearchEntity*> GetPlayersList();
	std::vector<ahItem*>     GetAHItemsToCategry(uint8 AHCategoryID);

private:

	Sql_t* SqlHandle;
};

#endif
