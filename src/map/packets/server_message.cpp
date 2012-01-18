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

#include <string.h>

#include "server_message.h"

// максимальный размер сообщения - 230 байт
// переход на новую строку - \r\n

CServerMessagePacket::CServerMessagePacket(const int8* message) 
{
	this->type = 0x4D;
	this->size = 0x0E;

	WBUFB(data,(0x04)-4) = 0x01;
	WBUFB(data,(0x05)-4) = 0x01;
	WBUFB(data,(0x06)-4) = 0x01;
	WBUFB(data,(0x07)-4) = 0x02;
	WBUFB(data,(0x08)-4) = 0x6A;
	WBUFB(data,(0x09)-4) = 0x21;
	WBUFB(data,(0x0A)-4) = 0x24;
	WBUFB(data,(0x0B)-4) = 0x4A;

	if (message)
	{
		uint8 length = (strlen(message) > 230 ? 230 : strlen(message));

		WBUFL(data,(0x0C)-4) = length;
		WBUFL(data,(0x14)-4) = length;
		
		this->size += (length >> 1) & 0xFE;

		memcpy(data+(0x18)-4, message, length);
	}
}