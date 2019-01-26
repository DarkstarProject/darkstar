﻿/*
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

#include "../../common/socket.h"
#include "../../common/timer.h"

#include "../entities/baseentity.h"
#include "../treasure_pool.h"

#include "treasure_find_item.h"


CTreasureFindItemPacket::CTreasureFindItemPacket(TreasurePoolItem* PItem , CBaseEntity* PMob, bool isOldItem)
{
	this->type = 0xD2;
	this->size = 0x1E;

	ref<uint32>(0x04) = 1;                   // ItemQuantity, а вожможен размер, отличный от единицы, исключая gil ???
	ref<uint16>(0x10) = PItem->ID;           // ItemID
	ref<uint8>(0x14) = PItem->SlotID;       // TreasurePool slotID
    if (isOldItem)
        ref<uint8>(0x15) = 1;
    ref<uint32>(0x18) = (uint32)std::chrono::duration_cast<std::chrono::milliseconds>(PItem->TimeStamp - get_server_start_time()).count();

	if (PMob != nullptr)
	{
		ref<uint32>(0x08) = PMob->id; 		// ID монстра	
		ref<uint16>(0x12) = PMob->targid; 	// TargID монстра
	}
}