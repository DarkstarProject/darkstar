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
#include "../../common/utils.h"


#include <string.h>
#include "char_skills.h"
#include "../charentity.h"
#include "../battleutils.h"
#include "../../common/timer.h"


CCharSkillsPacket::CCharSkillsPacket(CCharEntity * PChar) 
{
	this->type = 0x62;
	this->size = 0x80;

	int realcount = 0; 
	for(unsigned int i = 0; i < PChar->RecastAbilityList.size(); i++) {
		int diff = (gettick() - PChar->RecastAbilityList[i].TimeStamp) / 1000;
		int ttg = PChar->RecastAbilityList[i].RecastTime - diff;

		if(PChar->RecastAbilityList[i].RecastId != 0) 
		{
			memcpy(data+(0x08)-4 +((realcount)*4), &ttg,4);
			memcpy(data+(0x0B)-4 +((realcount)*4), &PChar->RecastAbilityList[i].RecastId,1);
			realcount++;
		} 
		else
		{
			memcpy(this->data, &ttg, 3);
		}
	}
}