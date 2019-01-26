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

#include <string.h>

#include "furniture_interact.h"

#include "../items/item.h"


CFurnitureInteractPacket::CFurnitureInteractPacket(CItem* PItem, uint8 LocationID, uint8 SlotID)
{
    this->type = 0xFA;
    this->size = 0x16;

    ref<uint32>(0x04) = PItem->getID();

    ref<uint8>(0x0C) = SlotID;
    ref<uint8>(0x0D) = LocationID;

    // These entries are unknown and current speculation is that they are junk
    //ref<uint8>(0x0E) = ???;
    //ref<uint8>(0x0F) = ???;
}