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

#include <string.h>

#include "auction_house.h"

#include "../entities/charentity.h"
#include "../vana_time.h"
#include "../utils/itemutils.h"


bool IsAuctionOpen = true;  // торговля на аукционе разрешена 

CAuctionHousePacket::CAuctionHousePacket(uint8 action)
{
	this->type = 0x4C;
	this->size = 0x1E;

	WBUFB(data,(0x04)-4) = action;
    WBUFB(data,(0x05)-4) = 0xFF;       
    WBUFB(data,(0x06)-4) = IsAuctionOpen;

    if (action == 2)
    {
        WBUFB(data,(0x0A)-4) = AUCTION_ID;
    }
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, CItem* PItem, uint8 quantity)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)-4) = action;
    WBUFB(data,(0x05)-4) = 0xFF;
    WBUFB(data,(0x06)-4) = IsAuctionOpen;
    WBUFB(data,(0x07)-4) = 0x02;
    WBUFL(data,(0x08)-4) = 0x00; // AUCTION_FEE(PItem->getCharPrice());

    WBUFL(data,(0x0E)-4) = PItem->getID();
    WBUFB(data,(0x0C)-4) = PItem->getSlotID();
	
    WBUFB(data,(0x10)-4) = quantity;
	WBUFB(data,(0x30)-4) = AUCTION_ID;                                      
}

//e.g. client history, client probes a slot number which you give the correct itemid+price
CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 slot, CCharEntity* PChar) 
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)-4) = action;       
    WBUFB(data,(0x05)-4) = slot;                // порядковый номер предмета
    WBUFB(data,(0x06)-4) = IsAuctionOpen;
    

	if (slot < 7 && slot < PChar->m_ah_history.size())
    {
        WBUFB(data,(0x14)-4) = 0x03;
        WBUFB(data,(0x16)-4) = 0x01;	            // значение меняется, назначение неизвестно UNKNOWN

		WBUFW(data,(0x28)-4) = PChar->m_ah_history.at(slot).itemid;             // id продаваемого предмета  item id
		WBUFB(data,(0x2A)-4) = 1 - PChar->m_ah_history.at(slot).stack;          // количество предметов stack size
		WBUFB(data,(0x2B)-4) = 0x02;											// количество предметов stack size?            
		WBUFL(data,(0x2C)-4) = PChar->m_ah_history.at(slot).price;				// цена продажи price

		WBUFB(data,(0x30)-4) = AUCTION_ID;
    }
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 message, uint16 itemid, uint32 price)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)-4) = action;  
    WBUFB(data,(0x06)-4) = message;
    WBUFL(data,(0x08)-4) = price;
    WBUFW(data,(0x0C)-4) = itemid;
}

CAuctionHousePacket::CAuctionHousePacket(uint8 action, uint8 message, CCharEntity* PChar, uint8 slot, bool keepItem)
{
    this->type = 0x4C;
    this->size = 0x1E;

    WBUFB(data,(0x04)-4) = action;  
	WBUFB(data,(0x05)-4) = slot;
    WBUFB(data,(0x06)-4) = message;

	// we need all this guff so the item stays in the history.
	if (keepItem && slot < 7 && slot < PChar->m_ah_history.size())
    {
		WBUFB(data,(0x14)-4) = 0x03;
        WBUFB(data,(0x16)-4) = 0x01;	            // значение меняется, назначение неизвестно UNKNOWN

		memcpy(data+(0x18)-4, PChar->GetName(), dsp_cap(strlen(PChar->GetName()), 0, 16));

		WBUFW(data,(0x28)-4) = PChar->m_ah_history.at(slot).itemid;             // id продаваемого предмета  item id
		WBUFB(data,(0x2A)-4) = 1 - PChar->m_ah_history.at(slot).stack;          // количество предметов stack size
		WBUFB(data,(0x2B)-4) = 0x02;											// количество предметов stack size?            
		WBUFL(data,(0x2C)-4) = PChar->m_ah_history.at(slot).price;				// цена продажи price

		WBUFB(data,(0x30)-4) = AUCTION_ID;
	}

}