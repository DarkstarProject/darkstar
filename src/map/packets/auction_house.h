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


#define AUCTION_ID   4                          // глобальный аукцион AH-Jeuno 
#define AUCTION_FEE(price) (1 + price / 100)    // расчет налога 

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CItem;
class CCharEntity;

class CAuctionHousePacket : public CBasicPacket
{
public:

    CAuctionHousePacket(uint8 action);                                  // отправляем персонажу меню аукциона
    CAuctionHousePacket(uint8 action, uint8 slot, CCharEntity* PChar);                      // отправляем список продаваемых персонажем предметов
    CAuctionHousePacket(uint8 action, uint8 message, uint16 itemid, uint32 price);
	CAuctionHousePacket(uint8 action, uint8 message, CCharEntity* PChar, uint8 slot, bool keepItem);
    CAuctionHousePacket(uint8 action, CItem* PItem, uint8 quantity);
};

#endif