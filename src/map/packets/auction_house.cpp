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

#include "auction_house.h"

#include "../map.h"
#include "../entities/charentity.h"
#include "../vana_time.h"
#include "../utils/itemutils.h"


bool IsAuctionOpen = true; // Trading is allowed at the auction

CAuctionHousePacket::CAuctionHousePacket(uint8 action)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)) = action;
    WBUFB(data,(0x05)) = 0xFF;
    WBUFB(data,(0x06)) = IsAuctionOpen;

    if (action == 2)
    {
        WBUFB(data,(0x0A)) = AUCTION_ID;
    }
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, CItem* PItem, uint8 quantity, uint32 price)
{
    this->type = 0x4C;
    this->size = 0x1E;

    uint32 auctionFee = 0;
    if (quantity == 0) // This is a stack..Yes, zero for stacks.. Why is this being called quantity?
    {
        auctionFee = (uint32)(map_config.ah_base_fee_stacks + (price * map_config.ah_tax_rate_stacks / 100));
    }
    else // This is a single item.
    {
        auctionFee = (uint32)(map_config.ah_base_fee_single  + (price * map_config.ah_tax_rate_single / 100));
    }

    auctionFee = dsp_cap(auctionFee, 0, map_config.ah_max_fee);

    WBUFB(data,(0x04)) = action;
    WBUFB(data,(0x05)) = 0xFF;
    WBUFB(data,(0x06)) = IsAuctionOpen;
    WBUFB(data,(0x07)) = 0x02;
    WBUFL(data,(0x08)) = auctionFee;

    WBUFL(data,(0x0E)) = PItem->getID();
    WBUFB(data,(0x0C)) = PItem->getSlotID();

    WBUFB(data,(0x10)) = quantity;
    WBUFB(data,(0x30)) = AUCTION_ID;
}

//e.g. client history, client probes a slot number which you give the correct itemId+price
CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 slot, CCharEntity* PChar)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)) = action;
    WBUFB(data,(0x05)) = slot;          // Serial number of the subject
    WBUFB(data,(0x06)) = IsAuctionOpen;

    if (slot < 7 && slot < PChar->m_ah_history.size())
    {
        WBUFB(data,(0x14)) = 0x03;
        WBUFB(data,(0x16)) = 0x01;                                   // Value is changed, the purpose is unknown UNKNOWN

        WBUFW(data,(0x28)) = PChar->m_ah_history.at(slot).itemid;    // Item ID of item in slot
        WBUFB(data,(0x2A)) = 1 - PChar->m_ah_history.at(slot).stack; // Number of items stack size
        WBUFB(data,(0x2B)) = 0x02;                                   // Number of items stack size?
        WBUFL(data,(0x2C)) = PChar->m_ah_history.at(slot).price;     // Selling price

        WBUFB(data,(0x30)) = AUCTION_ID;
    }
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 message, uint16 itemid, uint32 price)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)) = action;
    WBUFB(data,(0x06)) = message;
    WBUFL(data,(0x08)) = price;
    WBUFW(data,(0x0C)) = itemid;
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 message, CCharEntity* PChar, uint8 slot, bool keepItem)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)) = action;
    WBUFB(data,(0x05)) = slot;
    WBUFB(data,(0x06)) = message;

    // we need all this guff so the item stays in the history.
    if (keepItem && slot < 7 && slot < PChar->m_ah_history.size())
    {
        WBUFB(data,(0x14)) = 0x03;
        WBUFB(data,(0x16)) = 0x01; // Value is changed, the purpose is unknown UNKNOWN

        memcpy(data+(0x18), PChar->GetName(), dsp_cap(strlen(PChar->GetName()), 0, 16));

        WBUFW(data,(0x28)) = PChar->m_ah_history.at(slot).itemid;    // Id sell items item id
        WBUFB(data,(0x2A)) = 1 - PChar->m_ah_history.at(slot).stack; // Number of items stack size
        WBUFB(data,(0x2B)) = 0x02;                                   // Number of items stack size?
        WBUFL(data,(0x2C)) = PChar->m_ah_history.at(slot).price;     // Price selling price

        WBUFB(data,(0x30)) = AUCTION_ID;
    }
}
