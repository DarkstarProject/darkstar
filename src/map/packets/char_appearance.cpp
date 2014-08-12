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

#include "char_appearance.h"
#include "../entities/charentity.h"

CCharAppearancePacket::CCharAppearancePacket(CCharEntity* PChar)
{
	this->type = 0x51;
	this->size = 0x0C;

	WBUFB(data,(0x04)-4) = PChar->look.face;
	WBUFB(data,(0x05)-4) = PChar->look.race;
	WBUFW(data,(0x06)-4) = PChar->look.head   + 0x1000;
	WBUFW(data,(0x08)-4) = PChar->look.body   + 0x2000;
	WBUFW(data,(0x0A)-4) = PChar->look.hands  + 0x3000;
	WBUFW(data,(0x0C)-4) = PChar->look.legs   + 0x4000;
	WBUFW(data,(0x0E)-4) = PChar->look.feet   + 0x5000;
	WBUFW(data,(0x10)-4) = PChar->look.main   + 0x6000;
	WBUFW(data,(0x12)-4) = PChar->look.sub    + 0x7000;
	WBUFW(data,(0x14)-4) = PChar->look.ranged + 0x8000;

	if (PChar->m_Monstrosity != 0)
	{
		WBUFW(data,(0x04)-4) = PChar->m_Monstrosity;
		WBUFW(data, (0x14)-4) = 0xFFFF;
	}
}
