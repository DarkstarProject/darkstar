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

#include "../../common/socket.h"
#include "../../common/utils.h"

#include <string.h>

#include "bazaar_item.h"

#include "../itemutils.h"
#include "../vana_time.h"

CBazaarItemPacket::CBazaarItemPacket(CItem* PItem, uint8 SlotID, uint16 Tax) 
{
	this->type = 0x05;	// 0x105
	this->size = 0x17;

    WBUFB(data,(0x10)-4) = SlotID;

    if (PItem != NULL)
    {
	    WBUFL(data,(0x04)-4) = PItem->getCharPrice();
	    WBUFL(data,(0x08)-4) = PItem->getQuantity();
	    WBUFW(data,(0x0C)-4) = Tax;
	    WBUFW(data,(0x0E)-4) = PItem->getID();

	    if (PItem->getSubType() & ITEM_CHARGED)
	    {
            uint32 currentTime = CVanaTime::getInstance()->getVanaTime();
		    uint32 nextUseTime = ((CItemUsable*)PItem)->getLastUseTime() + ((CItemUsable*)PItem)->getReuseDelay();

		    WBUFB(data,(0x11)-4) = 0x01;													    // флаг ITEM_CHARGED
		    WBUFB(data,(0x12)-4) = ((CItemUsable*)PItem)->getCurrentCharges(); 
		    WBUFB(data,(0x14)-4) = (nextUseTime > currentTime ? 0x90 : 0xD0); 

	        WBUFL(data,(0x15)-4) = nextUseTime;												// таймер следующего использования
		    WBUFL(data,(0x19)-4) = ((CItemUsable*)PItem)->getUseDelay() + currentTime;		// таймер задержки использования
	    }
	    memcpy(data+(0x1D)-4, PItem->getSignature(), dsp_min(strlen(PItem->getSignature()), 12));
    }
}