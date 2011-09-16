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

#include "delivery_box.h"


CDeliveryBoxPacket::CDeliveryBoxPacket(uint8 action, uint8 count) 
{
	this->type = 0x4B;
	this->size = 0x0A;

	memset(data, 0xFF, 12);

	WBUFB(data,(0x04)-4) = action;

	if (action = 0x05)
	{
		WBUFB(data,(0x05)-4) = 0x01;		// тип почтового ящика (1,2)
		WBUFB(data,(0x0E)-4) = count;		// количество предметов в ящике
	}

	WBUFB(data,(0x0C)-4) = 0x01;
}