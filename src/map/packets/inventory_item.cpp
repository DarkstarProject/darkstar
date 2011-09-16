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

#include "../../common/socket.h"
#include "../../common/utils.h"

#include <string.h>

#include "inventory_item.h"

#include "../itemutils.h"
#include "../vana_time.h"


CInventoryItemPacket::CInventoryItemPacket(CItem * item, uint8 LocationID, uint8 slotID) 
{
	this->type = 0x20;
	this->size = 0x16;

	WBUFB(data,(0x0E)-4) = LocationID;
	WBUFB(data,(0x0F)-4) = slotID;	

	if (item != NULL)
	{
		WBUFL(data,(0x04)-4) = item->getQuantity();
		WBUFL(data,(0x08)-4) = item->getBazaarPrice();
		WBUFW(data,(0x0C)-4) = item->getID();

		if (item->getBazaarPrice() != 0)
		{
			WBUFB(data,(0x10)-4) = 0x19;
		}

		if (item->getSubType() & ITEM_CHARGED)
		{
			uint32 currentTime = CVanaTime::getInstance()->getSysTime() - 1009810800;
			uint32 nextUseTime = ((CItemUsable*)item)->getLastUseTime() + ((CItemUsable*)item)->getReuseDelay();

			WBUFB(data,(0x11)-4) = 0x01;													// флаг ITEM_CHARGED
			WBUFB(data,(0x12)-4) = ((CItemUsable*)item)->getCurrentCharges(); 
			WBUFB(data,(0x14)-4) = (nextUseTime > currentTime ? 0x90 : 0xD0); 

		    WBUFL(data,(0x15)-4) = nextUseTime;												// таймер следующего использования
			WBUFL(data,(0x19)-4) = ((CItemUsable*)item)->getUseDelay() + currentTime;		// таймер задержки использования
		}

		switch (item->getType()) 
		{
			case ITEM_FURNISHING:
			{
				if (item->getSubType() & ITEM_LOCKED)
				{
					WBUFB(data,(0x12)-4) = 0x40;

					WBUFB(data,(0x17)-4) = ((CItemFurnishing*)item)->getCol();
					WBUFB(data,(0x18)-4) = ((CItemFurnishing*)item)->getLevel();
					WBUFB(data,(0x19)-4) = ((CItemFurnishing*)item)->getRow();
					WBUFB(data,(0x1A)-4) = ((CItemFurnishing*)item)->getRotation();
				}
			}
				break;
			case ITEM_LINKSHELL:
				break;
		}

		memcpy(data+(0x1D)-4, item->getSignature(), cap_value(strlen(item->getSignature()), 0, 12));
	}
}
