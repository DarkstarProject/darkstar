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
#include "../../common/utils.h"

#include <string.h>

#include "char_stats.h"

#include "../entities/charentity.h"
#include "../utils/charutils.h"
#include "../modifier.h"


CCharStatsPacket::CCharStatsPacket(CCharEntity * PChar) 
{
	this->type = 0x61;	
	this->size = 0x30;	
	
    WBUFL(data,(0x04)-4) = PChar->GetMaxHP();
    WBUFL(data,(0x08)-4) = PChar->GetMaxMP();

	WBUFB(data,(0x0C)-4) = PChar->GetMJob();
	WBUFB(data,(0x0D)-4) = PChar->GetMLevel();
	WBUFB(data,(0x0E)-4) = PChar->GetSJob();
	WBUFB(data,(0x0F)-4) = PChar->GetSLevel();

	WBUFW(data,(0x10)-4) = PChar->jobs.exp[PChar->GetMJob()];
	WBUFW(data,(0x12)-4) = charutils::GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]);

	memcpy(data+(0x14)-4, &PChar->stats, 14); // TODO: с merits это не прокатит

	WBUFW(data,(0x22)-4) = PChar->getMod(MOD_STR);
	WBUFW(data,(0x24)-4) = PChar->getMod(MOD_DEX);
	WBUFW(data,(0x26)-4) = PChar->getMod(MOD_VIT);
	WBUFW(data,(0x28)-4) = PChar->getMod(MOD_AGI);
	WBUFW(data,(0x2A)-4) = PChar->getMod(MOD_INT);
	WBUFW(data,(0x2C)-4) = PChar->getMod(MOD_MND);
	WBUFW(data,(0x2E)-4) = PChar->getMod(MOD_CHR);

    WBUFW(data,(0x30)-4) = PChar->ATT();
	WBUFW(data,(0x32)-4) = PChar->DEF();

	WBUFW(data,(0x34)-4) = PChar->getMod(MOD_FIRERES);
	WBUFW(data,(0x36)-4) = PChar->getMod(MOD_ICERES);
	WBUFW(data,(0x38)-4) = PChar->getMod(MOD_WINDRES);
	WBUFW(data,(0x3A)-4) = PChar->getMod(MOD_EARTHRES);
	WBUFW(data,(0x3C)-4) = PChar->getMod(MOD_THUNDERRES);
	WBUFW(data,(0x3E)-4) = PChar->getMod(MOD_WATERRES);
	WBUFW(data,(0x40)-4) = PChar->getMod(MOD_LIGHTRES);
	WBUFW(data,(0x42)-4) = PChar->getMod(MOD_DARKRES);

	WBUFW(data,(0x44)-4) = PChar->profile.title;
	WBUFB(data,(0x46)-4) = PChar->profile.rank[PChar->profile.nation];
	WBUFW(data,(0x48)-4) = PChar->profile.rankpoints;
    WBUFW(data,(0x4A)-4) = PChar->profile.home_point.destination;
	WBUFB(data,(0x50)-4) = PChar->profile.nation; 
    //0x54 = maximum item level
    //0x55 = itemlevel over 99
    //0x56 = main weapon item level
}