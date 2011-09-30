/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "../charentity.h"


CAuctionHousePacket::CAuctionHousePacket(CCharEntity * PChar)
{
	this->type = 0x4c;
	this->size = 0x1e;

	memset(this->data,0,(0x1e-2)*2);
	// Dummy data, just to open the AH menu
	*(unsigned char*) this->data = 0x02;
	*(unsigned char*) (this->data+1) = 0xFF;
	*(unsigned char*) (this->data+2) = 0x01;

	*(unsigned char*) (this->data+32) = 0x98;
}


//
//CAHMenuPacket::CAHMenuPacket(CBaseEntity * pChar) {
//
//	this->type			= 0x4c;
//	this->size			= 0x1e;
//	
//	memset(this->data,0,(0x1e-2)*2);
//	// Dummy data, just to open the AH menu
//	*(unsigned char*) this->data = 0x02;
//	*(unsigned char*) (this->data+1) = 0xFF;
//	*(unsigned char*) (this->data+2) = 0x01;
//
//	*(unsigned char*) (this->data+32) = 0x98;