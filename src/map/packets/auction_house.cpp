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

    ref<uint8>(0x04) = action;
    ref<uint8>(0x05) = 0xFF;
    ref<uint8>(0x06) = IsAuctionOpen;

    if (action == 2)
    {
        ref<uint8>(0x0A) = AUCTION_ID;
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

    auctionFee = std::clamp<uint32>(auctionFee, 0, map_config.ah_max_fee);

    ref<uint8>(0x04) = action;
    ref<uint8>(0x05) = 0xFF;
    ref<uint8>(0x06) = IsAuctionOpen;
    ref<uint8>(0x07) = 0x02;
    ref<uint32>(0x08) = auctionFee;

    ref<uint32>(0x0E) = PItem->getID();
    ref<uint8>(0x0C) = PItem->getSlotID();

    ref<uint8>(0x10) = quantity;
    ref<uint8>(0x30) = AUCTION_ID;
}

//e.g. client history, client probes a slot number which you give the correct itemId+price
CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 slot, CCharEntity* PChar)
{
    this->type = 0x4C;
    this->size = 0x1E;

    ref<uint8>(0x04) = action;
    ref<uint8>(0x05) = slot;          // Serial number of the subject
    ref<uint8>(0x06) = IsAuctionOpen;

    if (slot < 7 && slot < PChar->m_ah_history.size())
    {
        ref<uint8>(0x14) = 0x03;
        ref<uint8>(0x16) = 0x01;                                   // Value is changed, the purpose is unknown UNKNOWN

        ref<uint16>(0x28) = PChar->m_ah_history.at(slot).itemid;    // Item ID of item in slot
        ref<uint8>(0x2A) = 1 - PChar->m_ah_history.at(slot).stack; // Number of items stack size
        ref<uint8>(0x2B) = 0x02;                                   // Number of items stack size?
        ref<uint32>(0x2C) = PChar->m_ah_history.at(slot).price;     // Selling price

        ref<uint8>(0x30) = AUCTION_ID;
    }
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 message, uint16 itemid, uint32 price)
{
    this->type = 0x4C;
    this->size = 0x1E;

    ref<uint8>(0x04) = action;
    ref<uint8>(0x06) = message;
    ref<uint32>(0x08) = price;
    ref<uint16>(0x0C) = itemid;
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 message, CCharEntity* PChar, uint8 slot, bool keepItem)
{
    this->type = 0x4C;
    this->size = 0x1E;

    ref<uint8>(0x04) = action;
    ref<uint8>(0x05) = slot;
    ref<uint8>(0x06) = message;

    // we need all this guff so the item stays in the history.
    if (keepItem && slot < 7 && slot < PChar->m_ah_history.size())
    {
        ref<uint8>(0x14) = 0x03;
        ref<uint8>(0x16) = 0x01; // Value is changed, the purpose is unknown UNKNOWN

        memcpy(data+(0x18), PChar->GetName(), PChar->name.size());

        ref<uint16>(0x28) = PChar->m_ah_history.at(slot).itemid;    // Id sell items item id
        ref<uint8>(0x2A) = 1 - PChar->m_ah_history.at(slot).stack; // Number of items stack size
        ref<uint8>(0x2B) = 0x02;                                   // Number of items stack size?
        ref<uint32>(0x2C) = PChar->m_ah_history.at(slot).price;     // Price selling price

        ref<uint8>(0x30) = AUCTION_ID;
    }
}
