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

#include "char_stats.h"

#include "../entities/charentity.h"
#include "../utils/charutils.h"
#include "../modifier.h"


CCharStatsPacket::CCharStatsPacket(CCharEntity * PChar) 
{
	this->type = 0x61;	
	this->size = 0x30;	
	
    WBUFL(data,(0x04)) = PChar->GetMaxHP();
    WBUFL(data,(0x08)) = PChar->GetMaxMP();

	WBUFB(data,(0x0C)) = PChar->GetMJob();
	WBUFB(data,(0x0D)) = PChar->GetMLevel();
	WBUFB(data,(0x0E)) = PChar->GetSJob();
	WBUFB(data,(0x0F)) = PChar->GetSLevel();

	WBUFW(data,(0x10)) = PChar->jobs.exp[PChar->GetMJob()];
	WBUFW(data,(0x12)) = charutils::GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]);

	memcpy(data+(0x14), &PChar->stats, 14); // TODO: с merits это не прокатит

	WBUFW(data,(0x22)) = dsp_cap(PChar->getMod(MOD_STR), -999 + PChar->stats.STR, 999 - PChar->stats.STR);
	WBUFW(data,(0x24)) = dsp_cap(PChar->getMod(MOD_DEX), -999 + PChar->stats.DEX, 999 - PChar->stats.DEX);
	WBUFW(data,(0x26)) = dsp_cap(PChar->getMod(MOD_VIT), -999 + PChar->stats.VIT, 999 - PChar->stats.VIT);
	WBUFW(data,(0x28)) = dsp_cap(PChar->getMod(MOD_AGI), -999 + PChar->stats.AGI, 999 - PChar->stats.AGI);
	WBUFW(data,(0x2A)) = dsp_cap(PChar->getMod(MOD_INT), -999 + PChar->stats.INT, 999 - PChar->stats.INT);
	WBUFW(data,(0x2C)) = dsp_cap(PChar->getMod(MOD_MND), -999 + PChar->stats.MND, 999 - PChar->stats.MND);
	WBUFW(data,(0x2E)) = dsp_cap(PChar->getMod(MOD_CHR), -999 + PChar->stats.CHR, 999 - PChar->stats.CHR);

    WBUFW(data,(0x30)) = PChar->ATT();
	WBUFW(data,(0x32)) = PChar->DEF();

	WBUFW(data,(0x34)) = PChar->getMod(MOD_FIRERES);
	WBUFW(data,(0x36)) = PChar->getMod(MOD_ICERES);
	WBUFW(data,(0x38)) = PChar->getMod(MOD_WINDRES);
	WBUFW(data,(0x3A)) = PChar->getMod(MOD_EARTHRES);
	WBUFW(data,(0x3C)) = PChar->getMod(MOD_THUNDERRES);
	WBUFW(data,(0x3E)) = PChar->getMod(MOD_WATERRES);
	WBUFW(data,(0x40)) = PChar->getMod(MOD_LIGHTRES);
	WBUFW(data,(0x42)) = PChar->getMod(MOD_DARKRES);

	WBUFW(data,(0x44)) = PChar->profile.title;
	WBUFB(data,(0x46)) = PChar->profile.rank[PChar->profile.nation];
	WBUFW(data,(0x48)) = PChar->profile.rankpoints;
    WBUFW(data,(0x4A)) = PChar->profile.home_point.destination;
	WBUFB(data,(0x50)) = PChar->profile.nation; 
    //0x54 = maximum item level
    //0x55 = itemlevel over 99
    //0x56 = main weapon item level
}