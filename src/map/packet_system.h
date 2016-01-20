﻿/*
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

#ifndef _PACKETSYSTEM_H
#define _PACKETSYSTEM_H

#include "../common/cbasetypes.h"
#include "packets/basic.h"

#include "entities/charentity.h"

struct map_session_data_t;

extern uint8 PacketSize[512];

extern void(*PacketParser[512])(map_session_data_t*, CCharEntity*, CBasicPacket);

void PrintPacket(CBasicPacket data);
void PacketParserInitialize();

#endif