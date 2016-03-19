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

#ifndef _RECASTCONTAINER_H
#define _RECASTCONTAINER_H

#include "../common/cbasetypes.h"

#include <vector>


enum RECASTTYPE
{
    RECAST_ITEM     = 0,
    RECAST_MAGIC    = 1,
    RECAST_ABILITY  = 2,
	RECAST_LOOT     = 3
};
#define MAX_RECASTTPE_SIZE   4

struct Recast_t
{
    uint16     ID;
    time_t     TimeStamp;
    uint32     RecastTime;
    uint32     chargeTime;
    uint8      maxCharges;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CCharEntity;

typedef std::vector<Recast_t> RecastList_t;

class CRecastContainer
{
    public:

    void Check();

    void Del(RECASTTYPE type);
    void Del(RECASTTYPE type, uint16 id);
	void DeleteByIndex(RECASTTYPE type, uint8 index);
    bool Has(RECASTTYPE type, uint16 id);
    bool HasRecast(RECASTTYPE type, uint16 id, uint32 recast);
    void Add(RECASTTYPE type, uint16 id, uint32 duration, uint32 chargeTime = 0, uint8 maxCharges = 0);
    Recast_t* Load(RECASTTYPE type, uint16 id, uint32 duration, uint32 chargeTime = 0, uint8 maxCharges = 0);
    void ResetAbilities();
    void ChangeJob();

    RecastList_t* GetRecastList(RECASTTYPE type);
    Recast_t*     GetRecast(RECASTTYPE type, uint16 id);

	CRecastContainer(CCharEntity* PChar);
   ~CRecastContainer();

    private:

	CCharEntity* m_PChar;

    RecastList_t RecastItemList;
    RecastList_t RecastMagicList;
    RecastList_t RecastAbilityList;
	RecastList_t RecastLootList;
};

#endif