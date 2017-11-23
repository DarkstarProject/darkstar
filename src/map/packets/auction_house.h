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

#ifndef _CAUCTIONHOUSEPACKET_H_
#define _CAUCTIONHOUSEPACKET_H_

#include "../../common/cbasetypes.h"

#include "basic.h"


#define AUCTION_ID   4                          // Global Auction or AH-Jeuno

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CItem;
class CCharEntity;

class CAuctionHousePacket : public CBasicPacket
{
public:

    CAuctionHousePacket(std::uint8_t action);                                  // Send the auction menu
    CAuctionHousePacket(std::uint8_t action, std::uint8_t slot, CCharEntity * PChar); // Send the list of items sold by a character
    CAuctionHousePacket(std::uint8_t action, std::uint8_t message, std::uint16_t itemid, uint32 price);
    CAuctionHousePacket(std::uint8_t action, std::uint8_t message, CCharEntity* PChar, std::uint8_t slot, bool keepItem);
    CAuctionHousePacket(std::uint8_t action, CItem* PItem, std::uint8_t quantity, uint32 price);
};

#endif
