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

#include "char_check.h"

#include "../entities/charentity.h"
#include "../utils/itemutils.h"
#include "../vana_time.h"


CCheckPacket::CCheckPacket(CCharEntity* PChar, CCharEntity* PTarget)
{
	this->type = 0xC9;
	this->size = 0x06;

	WBUFL(data,(0x04)) = PTarget->id;
	WBUFW(data,(0x08)) = PTarget->targid;

	WBUFB(data,(0x0A)) = 0x03;

	uint8 count = 0;

	for (int32 i = 0; i < 16; ++i)
	{
		CItem* PItem = PTarget->getEquip((SLOTTYPE)i);

		if (PItem != nullptr)
		{
			WBUFW(data,(size*2+0x00)) = PItem->getID();
			WBUFB(data,(size*2+0x02)) = i;

			if (PItem->isSubType(ITEM_CHARGED))
			{
                uint32 currentTime = CVanaTime::getInstance()->getVanaTime();
				uint32 nextUseTime = ((CItemUsable*)PItem)->getLastUseTime() + ((CItemUsable*)PItem)->getReuseDelay();

				WBUFB(data,(size*2+0x04)) = 0x01;
				WBUFB(data,(size*2+0x05)) = ((CItemUsable*)PItem)->getCurrentCharges();
				WBUFB(data,(size*2+0x07)) = (nextUseTime > currentTime ? 0x90 : 0xD0);

				WBUFL(data,(size*2+0x08)) = nextUseTime;
				WBUFL(data,(size*2+0x0C)) = ((CItemUsable*)PItem)->getUseDelay() + currentTime;
			}

            if (PItem->isSubType(ITEM_AUGMENTED))
            {
                WBUFB(data,(size*2+0x04)) = 0x02;

                WBUFW(data,(size*2+0x06)) = ((CItemArmor*)PItem)->getAugment(0);
                WBUFW(data,(size*2+0x08)) = ((CItemArmor*)PItem)->getAugment(1);
                WBUFW(data,(size*2+0x0A)) = ((CItemArmor*)PItem)->getAugment(2);
                WBUFW(data,(size*2+0x0C)) = ((CItemArmor*)PItem)->getAugment(3);
            }

			memcpy(data+(size*2+0x10), PItem->getSignature(), dsp_cap(strlen(PItem->getSignature()), 0, 12));

			this->size += 0x0E;
			count++;

			if (count == 8)
			{
				WBUFB(data,(0x0B)) = count;

				PChar->pushPacket(new CBasicPacket(*this));

				this->size = 0x06;
				memset(data+(0x0B), 0, PACKET_SIZE - 11);
			}
		}
	}

	if (count == 0)
	{
		this->size = 0x14;
		PChar->pushPacket(new CBasicPacket(*this));
	}
	else if (count != 8)
	{
		WBUFB(data,(0x0B)) = (count > 8 ? count - 8 : count);
		PChar->pushPacket(new CBasicPacket(*this));
	}

	this->size = 0x28;
	memset(data+(0x0B), 0, PACKET_SIZE - 11);

	WBUFB(data,(0x0A)) = 0x01;

    CItemLinkshell* PLinkshell = (CItemLinkshell*)PTarget->getEquip(SLOT_LINK1);

    if ((PLinkshell != nullptr) && PLinkshell->isType(ITEM_LINKSHELL))
	{
        //WBUFW(data,(0x0C)) = PLinkshell->GetLSID();
        WBUFW(data,(0x0E)) = PLinkshell->getID();
        WBUFW(data,(0x10)) = PLinkshell->GetLSRawColor();

        memcpy(data+(0x14), PLinkshell->getSignature(), dsp_cap(strlen(PLinkshell->getSignature()), 0, 15));
    }
	if ((PChar->nameflags.flags & FLAG_GM) || !(PTarget->nameflags.flags & FLAG_ANON))
	{
		WBUFB(data,(0x12)) = PTarget->GetMJob();
		WBUFB(data,(0x13)) = PTarget->GetSJob();
		WBUFB(data,(0x24)) = PTarget->GetMLevel();
		WBUFB(data,(0x25)) = PTarget->GetSLevel();
	}

	//Chevron 32 bit Big Endean, starting at 0x2B
	//WBUFB(data,(0x2C)) = 0x00;	//Ballista Star next to Chevron count
}