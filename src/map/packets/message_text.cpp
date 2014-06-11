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

#include "message_text.h"
#include "../entities/baseentity.h"


CMessageTextPacket::CMessageTextPacket(CBaseEntity* PEntity, uint16 messageID, bool showName)
{
	this->type = 0x36;
	this->size = 0x08;

	// если в качестве объекта передается персонаж,
	// то не будем отображать имя

	if (PEntity->objtype == TYPE_PC || showName == false)
	{
		messageID += 0x8000;
	}

	WBUFL(data,(0x04)-4) = PEntity->id;
	WBUFW(data,(0x08)-4) = PEntity->targid;
	WBUFW(data,(0x0A)-4) = messageID;
}
