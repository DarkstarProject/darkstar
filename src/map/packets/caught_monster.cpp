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

#include <string.h>

#include "caught_monster.h"

#include "../entities/charentity.h"


CCaughtMonsterPacket::CCaughtMonsterPacket(CCharEntity * PChar,  uint16 messageID)
{
	this->type = 0x43;
	this->size = 0x20;

    ref<uint32>(0x04) = PChar->id;
    ref<uint32>(0x08) = PChar->targid;

    ref<uint16>(0x0A) = messageID + 0x8000;

    memcpy(data + (0x10), PChar->GetName(), PChar->name.size());
}