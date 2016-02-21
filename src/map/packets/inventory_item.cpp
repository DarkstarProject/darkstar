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

#include "inventory_item.h"

#include "../utils/itemutils.h"
#include "../vana_time.h"


CInventoryItemPacket::CInventoryItemPacket(CItem* PItem, uint8 LocationID, uint8 SlotID) 
{
	this->type = 0x20;
	this->size = 0x16;

	WBUFB(data,(0x0E)) = LocationID;
	WBUFB(data,(0x0F)) = SlotID;	

	if (PItem != nullptr)
	{
		WBUFL(data,(0x04)) = PItem->getQuantity();
		WBUFL(data,(0x08)) = PItem->getCharPrice();
		WBUFW(data,(0x0C)) = PItem->getID();
        memcpy(data + 0x11 , PItem->m_extra, sizeof(PItem->m_extra));

		if (PItem->isSubType(ITEM_CHARGED))
		{
			WBUFB(data,(0x11)) = 0x01;    // флаг ITEM_CHARGED

            if (((CItemUsable*)PItem)->getCurrentCharges() > 0)
            {
                if (((CItemUsable*)PItem)->getReuseTime() == 0)
                {
                    WBUFB(data,(0x14)) = 0xD0;
                }
                else
                {
                    WBUFB(data,(0x14)) = 0x90;

                    uint32 CurrentTime = CVanaTime::getInstance()->getVanaTime();

                    WBUFL(data,(0x15)) = ((CItemUsable*)PItem)->getNextUseTime();             // таймер следующего использования
                    WBUFL(data,(0x19)) = ((CItemUsable*)PItem)->getUseDelay() + CurrentTime;  // таймер задержки использования
                }
            }
		}

        if (PItem->isType(ITEM_WEAPON) && ((CItemWeapon*)PItem)->isUnlockable())
        {
            WBUFW(data, (0x11) ) = 0;
        }

        if (PItem->getCharPrice() != 0)
        {
            WBUFB(data, (0x10) ) = 0x19;
        }
        else if (PItem->isSubType(ITEM_LOCKED))
        {
            if (PItem->isType(ITEM_LINKSHELL))
            {
                WBUFB(data, (0x10) ) = 0x13;
            }
            else
            {
                WBUFB(data, (0x10) ) = 0x05;
            }
        }
        else
        {
            WBUFB(data, (0x10) ) = 0x00;
        }

        if (PItem->isType(ITEM_LINKSHELL))
        {
            WBUFB(data,(0x19)) = ((CItemLinkshell*)PItem)->GetLSType();
        }
	}
}
