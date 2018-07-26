/*
===========================================================================

  Copyright (c) 2010-2018 Darkstar Dev Teams

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

#include "char_health.h"

#include "../entities/battleentity.h"
#include "../entities/charentity.h"

CCharHealthPacket::CCharHealthPacket(CBattleEntity* PEntity)
{
	this->type = 0xDF;
	this->size = 0x12;

	ref<uint32>(0x04) = PEntity->id;

	ref<uint32>(0x08) = PEntity->health.hp;
	ref<uint32>(0x0C) = PEntity->health.mp;
	ref<uint32>(0x10) = PEntity->health.tp;

	ref<uint16>(0x14) = PEntity->targid;

	ref<uint8>(0x16) = PEntity->GetHPP();
	ref<uint8>(0x17) = PEntity->GetMPP();

    if (auto PChar = dynamic_cast<CCharEntity*>(PEntity); !PChar || !(PChar->nameflags.flags & FLAG_ANON))
    {
        ref<uint8>(0x20) = PChar->GetMJob();
        ref<uint8>(0x21) = PChar->GetMLevel();
        ref<uint8>(0x22) = PChar->GetSJob();
        ref<uint8>(0x23) = PChar->GetSLevel();
    }
}
