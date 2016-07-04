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

#ifndef _CBATTLEFIELDUTILS_H
#define _CBATTLEFIELDUTILS_H

#include "../../common/cbasetypes.h"
#include "../../common/mmo.h"

class CBattlefield;
class CBattlefieldHandler;

enum BATTLEFIELDTYPE {
    BATTLEFIELDTYPE_DYNAMIS,
    BATTLEFIELDTYPE_BCNM
};

namespace battlefieldutils
{
    void getLosePosition(CBattlefield* battlefield, int(&pPosition)[4]);		// returns x y z rot in that order
    void getWinPosition(CBattlefield* battlefield, int(&pPosition)[4]);		// returns x y z rot in that order
    void getStartPosition(uint16 zoneid, int(&pPosition)[4]);			// returns lobby position
    bool meetsWinningConditions(CBattlefield* battlefield, time_point tick);
    bool meetsLosingConditions(CBattlefield* battlefield, time_point tick);
    bool spawnMonstersForBcnm(CBattlefield* battlefield);
    bool spawnTreasureForBcnm(CBattlefield* battlefield);

    uint8 getMaxLootGroups(CBattlefield* battlefield);						// returns maximum number of loot groups for a BCNM battlefield
    uint16 getRollsPerGroup(CBattlefield* battlefield, uint8 groupID);		// returns the maximum number of "rolls" in a given group
    void getChestItems(CBattlefield* battlefield);
    CBattlefield* loadBattlefield(CBattlefieldHandler* hand, uint16 bcnmid, BATTLEFIELDTYPE type);

    bool spawnSecondPartDynamis(CBattlefield* battlefield);
};

#endif