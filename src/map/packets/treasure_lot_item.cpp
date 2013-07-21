/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "treasure_lot_item.h"

#include "../entities/baseentity.h"


CTreasureLotItemPacket::CTreasureLotItemPacket(uint8 slotID, ITEMLOTTYPE MessageType) 
{
	this->type = 0xD3;
	this->size = 0x1E;
	
	WBUFB(data,(0x14)-4) = slotID;	
	WBUFB(data,(0x15)-4) = MessageType;
	
}

CTreasureLotItemPacket::CTreasureLotItemPacket(CBaseEntity* PWinner, uint8 slotID, uint16 Lot, ITEMLOTTYPE MessageType)
{
	this->type = 0xD3;
	this->size = 0x1E;

	WBUFL(data,(0x04)-4) = PWinner->id;
	WBUFW(data,(0x0C)-4) = PWinner->targid;
	WBUFW(data,(0x0E)-4) = Lot;

	WBUFB(data,(0x14)-4) = slotID;	
	WBUFB(data,(0x15)-4) = MessageType;

	memcpy(data+(0x16)-4, PWinner->GetName(), PWinner->name.size());
}

CTreasureLotItemPacket::CTreasureLotItemPacket(CBaseEntity* PChar, uint8 slotID, uint16 Lot) 
{
	
	this->type = 0xD3;
	this->size = 0x1E;

	WBUFL(data,(0x08)-4) = PChar->id;
	WBUFW(data,(0x10)-4) = PChar->targid;	
	packBitsBE(data, Lot, 112, 16);  //this fixes an offset problem with lot numbers
	//WBUFB(data,(0x12)-4) = Lot;
	WBUFB(data,(0x14)-4) = slotID; 
	
	memcpy(data+0x26-0x04, PChar->GetName(), 16);
	
}