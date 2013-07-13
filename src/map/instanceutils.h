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

#ifndef _CINSTANCEUTILS_H
#define _CINSTANCEUTILS_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"
	
class CInstance;
class CInstanceHandler;

enum INSTANCETYPE {
	INSTANCETYPE_DYNAMIS,
	INSTANCETYPE_BCNM
};

namespace instanceutils
{
	void getLosePosition(CInstance* instance, int (&pPosition)[4]);		// returns x y z rot in that order
	void getWinPosition(CInstance* instance, int (&pPosition)[4]);		// returns x y z rot in that order
	void getStartPosition(uint8 zoneid, int (&pPosition)[4]);			// returns lobby position
	bool meetsWinningConditions(CInstance* instance, uint32 tick);
	bool meetsLosingConditions(CInstance* instance, uint32 tick);
	bool spawnMonstersForBcnm(CInstance* instance);
	bool spawnTreasureForBcnm(CInstance* instance);

	//void getHighestTHforBcnm(CInstance* instance);					// apparently not used in bcnm
	uint8 getMaxLootGroups(CInstance* instance);						// returns maximum number of loot groups for a BCNM instance
	uint16 getRollsPerGroup(CInstance* instance, uint8 groupID);		// returns the maximum number of "rolls" in a given group
	void getChestItems(CInstance* instance);
	CInstance* loadInstance(CInstanceHandler* hand, uint16 bcnmid, INSTANCETYPE type);

	bool spawnSecondPartDynamis(CInstance* instance);
};

#endif