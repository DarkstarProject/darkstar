/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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
#include "../../common/utils.h"

#include <string.h>

#include "../charentity.h"

#include "char_skills.h"


CCharSkillsPacket::CCharSkillsPacket(CCharEntity* PChar) 
{
	this->type = 0x62;
	this->size = 0x80;

	uint8 count = 0; 

    for (RecastList_t::iterator it = PChar->RecastList.begin(); it != PChar->RecastList.end(); ++it)
    {
        Recast_t* recast = *it;
        if (recast->Type == RECAST_ABILITY)
        {
		    uint32 time = (recast->RecastTime - (gettick() - recast->TimeStamp)) / 1000;

		    if(recast->RecastID != 0) 
		    {
                WBUFL(data,(0x08 + count*4)-4) = time;
                WBUFB(data,(0x0B + count*4)-4) = recast->RecastID;
			    count++;
		    } 
		    else
		    {
                WBUFL(data,(0x04)-4) = time;  // 2h ability (recast id is 0)
		    }
        }
    }
	memcpy(data+(0x80)-4, &PChar->WorkingSkills, 128);
}