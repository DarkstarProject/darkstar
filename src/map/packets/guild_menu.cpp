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
#include "../../common/utils.h"

#include "guild_menu.h"


CGuildMenuPacket::CGuildMenuPacket(GUILDSTATUS status, uint8 open, uint8 close, uint8 holiday)
{
	this->type = 0x86;
	this->size = 0x06;

	//DSP_DEBUG_BREAK_IF(open > close);

	WBUFB(data,(0x04)) = status;

	switch (status)
	{
		case GUILD_OPEN: 
		case GUILD_CLOSE: 
		{
			packBitsBE(data+(0x08), 0xFFFFFF, open, close-open);
		}
		break;
		case GUILD_HOLYDAY:
		{
			WBUFB(data,(0x08)) = holiday;
		}
		break;
	}
}