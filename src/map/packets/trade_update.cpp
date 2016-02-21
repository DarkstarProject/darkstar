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

#include "../../common/socket.h"
#include "../../common/utils.h"

#include <string.h>

#include "../utils/itemutils.h"
#include "../vana_time.h"

#include "trade_update.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CTradeUpdatePacket::CTradeUpdatePacket(CItem* PItem, uint8 SlotID)
{
	this->type = 0x23;
	this->size = 0x14;

	uint32 amount = PItem->getReserve();

    WBUFL(data,(0x04)) = amount;
	WBUFW(data,(0x0A)) = amount == 0 ? 0 : PItem->getID();
	WBUFB(data,(0x0D)) = SlotID;

    if (PItem->isSubType(ITEM_CHARGED))
    {
		WBUFB(data,(0x0E)) = 0x01;

        if (((CItemUsable*)PItem)->getCurrentCharges() > 0)
        {
            WBUFB(data,(0x0F)) = ((CItemUsable*)PItem)->getCurrentCharges(); 
        }
	}
    if (PItem->isType(ITEM_LINKSHELL))
	{	
        WBUFL(data,(0x0E)) = ((CItemLinkshell*)PItem)->GetLSID();
        WBUFW(data,(0x14)) = ((CItemLinkshell*)PItem)->GetLSRawColor();
        WBUFB(data,(0x16)) = ((CItemLinkshell*)PItem)->GetLSType();

        memcpy(data+(0x17), PItem->getSignature(), dsp_min(strlen(PItem->getSignature()),15));
    }
    else
    {
        memcpy(data+(0x15), PItem->getSignature(), dsp_min(strlen(PItem->getSignature()),12));
    }
}