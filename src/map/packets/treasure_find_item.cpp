/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "../../common/socket.h"

#include "../entities/baseentity.h"
#include "../treasure_pool.h"

#include "treasure_find_item.h"


CTreasureFindItemPacket::CTreasureFindItemPacket(TreasurePoolItem* PItem , CBaseEntity* PMob) 
{
	this->type = 0xD2;
	this->size = 0x1E;

	WBUFL(data,(0x04)-4) = 1;                   // ItemQuantity, а вожможен размер, отличный от единицы, исключая gil ???
	WBUFW(data,(0x10)-4) = PItem->ID;           // ItemID
	WBUFB(data,(0x14)-4) = PItem->SlotID;       // TreasurePool slotID
	WBUFL(data,(0x18)-4) = PItem->TimeStamp;    // TimeStamp

	if (PMob != NULL)
	{
		WBUFL(data,(0x08)-4) = PMob->id; 		// ID монстра	
		WBUFW(data,(0x12)-4) = PMob->targid; 	// TargID монстра
	}
}