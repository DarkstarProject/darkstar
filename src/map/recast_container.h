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

#ifndef _RECASTCONTAINER_H
#define _RECASTCONTAINER_H

#include "../common/cbasetypes.h"

#include <vector>


enum RECASTTYPE
{
    RECAST_ITEM     = 0,
    RECAST_MAGIC    = 1,
    RECAST_ABILITY  = 2
};
#define MAX_RECASTTPE_SIZE   3

struct Recast_t 
{
    uint8      ID;
    uint32     TimeStamp;
    uint32     RecastTime;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CCharEntity;

typedef std::vector<Recast_t*> RecastList_t;

class CRecastContainer
{
    public:

    void Check(uint32 tick);

    void Del(RECASTTYPE type);
    void Del(RECASTTYPE type, uint8 id);
    bool Has(RECASTTYPE type, uint8 id);
    void Add(RECASTTYPE type, uint8 id, uint32 duration);

    RecastList_t* GetRecastList(RECASTTYPE type);

	CRecastContainer(CCharEntity* PChar);
   ~CRecastContainer();

    private:

	CCharEntity* m_PChar;

    RecastList_t RecastItemList;
    RecastList_t RecastMagicList;
    RecastList_t RecastAbilityList;
};

#endif