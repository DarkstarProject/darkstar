/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CTREASUREPOOL_H
#define _CTREASUREPOOL_H

#include "../common/cbasetypes.h"

#include <vector>

enum TREASUREPOOLTYPE
{
	TREASUREPOOL_SOLO		= 1,
	TREASUREPOOL_PARTY		= 6,
	TREASUREPOOL_ALLIANCE	= 18,
	TREASUREPOOL_ZONE		= 128
};

#define TREASUREPOOL_SIZE	10

/************************************************************************
*																		*
*  Для совместимости с кластерной системой, персонаж получает новый		*
*  TreasurePool при переходе между зонами								*
*																		*
************************************************************************/

class CCharEntity;
class CMobEntity;

class CTreasurePool
{
public:

	CTreasurePool(TREASUREPOOLTYPE PoolType);

	TREASUREPOOLTYPE GetPoolType();

	uint8 AddItem(uint16 ItemID);
	void LotItem(uint8 SlotID, uint16 Lot);

	void AddMember(CCharEntity* PChar);
	void DelMember(CCharEntity* PChar);
	void UpdatePool(CCharEntity* PChar);

	void CheckItems(uint32 tick);

private:

	struct TeasurePoolItem 
	{
		uint16 ItemID;
		uint32 timestamp;

		std::vector<int>ItemLotters;
	};

	uint32 m_Tick;

	TREASUREPOOLTYPE m_TreasurePoolType;

	void CheckItem(uint8 SlotID);

	TeasurePoolItem m_PoolItems[TREASUREPOOL_SIZE];

	std::vector<CCharEntity*> members;
};

#endif