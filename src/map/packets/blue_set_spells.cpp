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

#include "blue_set_spells.h"

#include "../charentity.h"

/* 
SPELL SETTING PACKETS = 0x102

unknown:
abs 0x08 is always 0x10.

only set for add:
abs 0x04 with the byte.

always set for add/rem:
abs offset 0x1C is the spell (shifted by 0x200) e.g. spellid 0x02A6 becomes 0xA6

*/

CBlueSetSpellsPacket::CBlueSetSpellsPacket(CCharEntity* PChar)
{
	this->type = 0x44;
	this->size = 0x4E;

	WBUFL(data,(0x04)-4) = JOB_BLU;

	// TODO: This should be loaded from PChar :)
	uint8 setSpellIds[] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x10, 0x01, 0x02, 0x03, 0x04, 0x05, 0x00, 0x00, 0xFF, 0x00, 0x00 };

	memcpy(data+(0x08)-4, &setSpellIds, 20);

}
