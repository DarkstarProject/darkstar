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

#include "stop_downloading.h"
#include "../entities/charentity.h"

CStopDownloadingPacket::CStopDownloadingPacket(CCharEntity* PChar, std::vector< std::pair< uint32, string_t > > blacklist)
{
	this->type = 0x41;
	this->size = 0x7C;

	for (int8 x = 0; x < blacklist.size(); x++)
	{
		uint32 offset = (0x04 + (20 * x)) ;
		WBUFL(data, offset) = blacklist[x].first;
		memcpy(data + offset + 4, blacklist[x].second.c_str(), blacklist[x].second.size());
	}

	WBUFB(data, 0xF4 ) = 3; // Unknown but important!
	WBUFB(data, 0xF5 ) = (int8)blacklist.size();
}