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

#include "../../common/socket.h"

#include "char_sync.h"

#include "../entities/charentity.h"
#include "../status_effect_container.h"


CCharSyncPacket::CCharSyncPacket(CCharEntity* PChar)
{
	this->type = 0x67;
	this->size = 0x14;

	WBUFB(data,(0x04)) = 0x02;
	WBUFB(data,(0x05)) = 0x09;
	WBUFW(data,(0x06)) = PChar->targid;
	WBUFL(data,(0x08)) = PChar->id;
	WBUFB(data,(0x10)) = PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC) ? 4 : 0; 	// 0x02 - Campaign Battle, 0x04 - Level Sync
	WBUFB(data,(0x25)) = PChar->jobs.job[PChar->GetMJob()];	// реальный уровень персонажа (при ограничении уровня отличается от m_mlvl)
}
