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

#include "linkshell_equip.h"

#include "../entities/charentity.h"
#include "../linkshell.h"


CLinkshellEquipPacket::CLinkshellEquipPacket(CCharEntity* PChar, uint8 number)
{
	this->type = 0xE0;
	this->size = 0x04;

    WBUFB(data,(0x04)) = number;
    if (number == 1)
        WBUFB(data,(0x05)) = PChar->equip[SLOT_LINK1];
    else
        WBUFB(data,(0x05)) = PChar->equip[SLOT_LINK2];
}