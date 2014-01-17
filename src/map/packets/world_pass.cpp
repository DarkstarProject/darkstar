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

#include "world_pass.h"


CWorldPassPacket::CWorldPassPacket(uint32 WorldPass)
{
	this->type = 0x59;
	this->size = 0x12; 

    WBUFL(data,(0x0C)-4) = 10000;       // price

    WBUFB(data,(0x1C)-4) = 0xD0;
    WBUFB(data,(0x1D)-4) = 0x19;
    WBUFB(data,(0x20)-4) = 0x03;
    WBUFB(data,(0x21)-4) = 0x01;

    if (WorldPass != 0)
    {
        WBUFB(data,(0x04)-4) =   1;     // number of uses left
        WBUFB(data,(0x08)-4) = 167;     // pass becomes invalid in (hours)

        WBUFB(data,(0x20)-4) = 0x06;
        snprintf((int8*)data+(0x10)-4, 10, "%u", WorldPass);
    }
}