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

#include <string.h>

#include "guild_menu_sell.h"

#include "../entities/charentity.h"
#include "../item_container.h"

#include "../items/item_shop.h"

CGuildMenuSellPacket::CGuildMenuSellPacket(CCharEntity* PChar, CItemContainer* PGuild)
{
    this->type = 0x85;
    this->size = 0x7C;

    DSP_DEBUG_BREAK_IF(PChar == nullptr);
    DSP_DEBUG_BREAK_IF(PGuild == nullptr);

    uint8 ItemCount = 0;
    uint8 PacketCount = 0;

    for (uint8 SlotID = 1; SlotID <= PGuild->GetSize(); ++SlotID) 
    {
        CItemShop* PItem = (CItemShop*)PGuild->GetItem(SlotID);

        if (ItemCount == 30)
        {
            WBUFB(data,(0xF4)) = ItemCount;
            WBUFB(data,(0xF5)) = (PacketCount == 0 ? 0x40 : PacketCount);

            PChar->pushPacket(new CBasicPacket(*this));

            ItemCount = 0;
            PacketCount++;
						
            memset(data + 4, 0, PACKET_SIZE - 8);
        }
        WBUFW(data,(0x08*ItemCount+0x04)) = PItem->getID();
        WBUFB(data,(0x08*ItemCount+0x06)) = PItem->getQuantity();
        WBUFB(data,(0x08*ItemCount+0x07)) = PItem->getStackSize();
        WBUFL(data,(0x08*ItemCount+0x08)) = PItem->getSellPrice();

        ItemCount++;
    }
    WBUFB(data,(0xF4)) = ItemCount;
    WBUFB(data,(0xF5)) = PacketCount + 0x80;
}