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
#include "../../common/timer.h"

#include <string.h>

#include "../entities/charentity.h"

#include "char_skills.h"


CCharSkillsPacket::CCharSkillsPacket(CCharEntity* PChar) 
{
	this->type = 0x62;
	this->size = 0x80;
	memcpy(data+(0x80), &PChar->WorkingSkills, 128);
    //remove automaton skills from this menu (they are in another packet)
    WBUFW(data, (0xAC) ) = 0x8000;
    WBUFW(data, (0xAE) ) = 0x8000;
    WBUFW(data, (0xB0) ) = 0x8000;
}