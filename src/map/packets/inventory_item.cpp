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
#include "../../common/utils.h"

#include <string.h>

#include "inventory_item.h"

#include "../utils/itemutils.h"
#include "../vana_time.h"


CInventoryItemPacket::CInventoryItemPacket(CItem* PItem, uint8 LocationID, uint8 SlotID) 
{
	this->type = 0x20;
	this->size = 0x16;

	WBUFB(data,(0x0E)-4) = LocationID;
	WBUFB(data,(0x0F)-4) = SlotID;	

	if (PItem != NULL)
	{
		WBUFL(data,(0x04)-4) = PItem->getQuantity();
		WBUFL(data,(0x08)-4) = PItem->getCharPrice();
		WBUFW(data,(0x0C)-4) = PItem->getID();

		if (PItem->isSubType(ITEM_CHARGED))
		{
            if (PItem->isSubType(ITEM_LOCKED))
            {
                WBUFB(data,(0x10)-4) = 0x05;
            }
			WBUFB(data,(0x11)-4) = 0x01;    // флаг ITEM_CHARGED

            if (((CItemUsable*)PItem)->getCurrentCharges() > 0)
            {
			    WBUFB(data,(0x12)-4) = ((CItemUsable*)PItem)->getCurrentCharges();              // количество оставшихся зарядов

                if (((CItemUsable*)PItem)->getReuseTime() == 0)
                {
                    WBUFB(data,(0x14)-4) = 0xD0;
                }
                else
                {
                    WBUFB(data,(0x14)-4) = 0x90;

                    uint32 CurrentTime = CVanaTime::getInstance()->getVanaTime();

                    WBUFL(data,(0x15)-4) = ((CItemUsable*)PItem)->getNextUseTime();             // таймер следующего использования
                    WBUFL(data,(0x19)-4) = ((CItemUsable*)PItem)->getUseDelay() + CurrentTime;  // таймер задержки использования
                }
            }
		}
        if (PItem->getCharPrice() != 0)
		{
			WBUFB(data,(0x10)-4) = 0x19;
		}
        memcpy(data+(0x1D)-4, PItem->getSignature(), dsp_cap(strlen(PItem->getSignature()), 0, 12));

        if (PItem->isType(ITEM_ARMOR))
        {
            if (PItem->isSubType(ITEM_AUGMENTED))
		    {
			    WBUFB(data,(0x11)-4) = 0x02;
                WBUFB(data,(0x12)-4) = 0x03;

			    if (((CItemArmor*)PItem) != 0)
			    {
				    WBUFB(data,(0x12)-4) = 0x43;
				    WBUFW(data,(0x1B)-4) = ((CItemArmor*)PItem)->getTrialNumber();
			    }
                WBUFW(data,(0x13)-4) = ((CItemArmor*)PItem)->getAugment(0);
                WBUFW(data,(0x15)-4) = ((CItemArmor*)PItem)->getAugment(1);
                WBUFW(data,(0x17)-4) = ((CItemArmor*)PItem)->getAugment(2);
                WBUFW(data,(0x19)-4) = ((CItemArmor*)PItem)->getAugment(3);
		    }
            return;
        }
		if (PItem->isType(ITEM_FURNISHING))
		{
			if (PItem->isSubType(ITEM_LOCKED))
			{
				WBUFB(data,(0x12)-4) = 0x40;

				WBUFB(data,(0x17)-4) = ((CItemFurnishing*)PItem)->getCol();
				WBUFB(data,(0x18)-4) = ((CItemFurnishing*)PItem)->getLevel();
				WBUFB(data,(0x19)-4) = ((CItemFurnishing*)PItem)->getRow();
				WBUFB(data,(0x1A)-4) = ((CItemFurnishing*)PItem)->getRotation();
			}
            return;
		}
        if (PItem->isType(ITEM_LINKSHELL))
        {
            if (PItem->isSubType(ITEM_LOCKED))
            {
                WBUFB(data,(0x10)-4) = 0x13;
            }
            WBUFL(data,(0x11)-4) = ((CItemLinkshell*)PItem)->GetLSID();
            WBUFW(data,(0x17)-4) = ((CItemLinkshell*)PItem)->GetLSRawColor();
            WBUFB(data,(0x19)-4) = ((CItemLinkshell*)PItem)->GetLSType();

            memset(data+(0x1A)-4, 0, 15);
            memcpy(data+(0x1A)-4, PItem->getSignature(), dsp_cap(strlen(PItem->getSignature()), 0, 15));
            return;
        }
	}
}
