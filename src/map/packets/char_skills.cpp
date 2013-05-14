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
#include "../../common/timer.h"

#include <string.h>

#include "../charentity.h"

#include "char_skills.h"


CCharSkillsPacket::CCharSkillsPacket(CCharEntity* PChar) 
{
	this->type = 0x62;
	this->size = 0x80;

	uint8 count = 0; 

    RecastList_t* RecastList = PChar->PRecastContainer->GetRecastList(RECAST_ABILITY);

    for (uint16 i = 0; i < RecastList->size(); ++i) 
	{
        Recast_t* recast = RecastList->at(i);

		uint32 time = (recast->RecastTime == 0 ? 0 : ((recast->RecastTime - (gettick() - recast->TimeStamp)) / 1000));

		if(recast->ID != 0) 
		{
            WBUFL(data,(0x08 + count*4)-4) = time;
            WBUFB(data,(0x0B + count*4)-4) = recast->ID;
			count++;
		} 
		else
		{
            WBUFL(data,(0x04)-4) = time;  // 2h ability (recast id is 0)
		}
    }
	memcpy(data+(0x80)-4, &PChar->WorkingSkills, 128);
}