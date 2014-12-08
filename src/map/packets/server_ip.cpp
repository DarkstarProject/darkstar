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

#include "server_ip.h"
#include "../entities/charentity.h"
#include "../utils/zoneutils.h"

CServerIPPacket::CServerIPPacket(CCharEntity* PChar, uint8 type)
{
	this->type = 0x0B;
	this->size = 0x0E;

	WBUFB(data,(0x04)-4) = type;
    uint64 ipp = 0;
    if (PChar->loc.destination == 0)
    {
        ipp = zoneutils::GetZoneIPP(PChar->loc.zone->GetID());
    }
    else
    {
        ipp = zoneutils::GetZoneIPP(PChar->loc.destination);
    }
	WBUFL(data,(0x08)-4) = ipp;
	WBUFW(data,(0x0C)-4) = (ipp >> 32);
}
