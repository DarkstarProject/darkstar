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
#include "../packets/message_basic.h"
#include "../../common/timer.h"
#include "message_debug.h"

#include "../charutils.h"
#include "../map.h"
#include "../mobutils.h"
#include "../petutils.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../ability.h"
#include "../vana_time.h"
#include "../zone.h"
#include "../lua/luautils.h"


CCharSkillsPacket::CCharSkillsPacket(CCharEntity * PChar) 
{
	this->type = 0x62;
	this->size = 0x80;

	
	int realcount = 0;

	for (int32 i = (int32)PChar->RecastAbilityList.size() - 1; i >= 0;i--)
	{
	
		int32 ttg = (PChar->RecastAbilityList.at(i).RecastTime  + PChar->RecastAbilityList.at(i).TimeStamp) - gettick(); 
		ShowDebug(CL_YELLOW"RecastTime: %u TimeStamp: %u TickCount: %u \n"CL_RESET,ttg, PChar->RecastAbilityList.at(i).TimeStamp, gettick()); 
		if(PChar->RecastAbilityList.at(i).RecastId != 0) {
			memcpy(this->data+4+((realcount)*4), &ttg, 3);
			memcpy(this->data+7+((realcount)*4), &PChar->RecastAbilityList.at(i).RecastId , 1);
			realcount++;
	
		} 
		else {
			
			memcpy(this->data, &ttg, 3);
		}

	}
	

	memcpy(data+(0x80)-4, &PChar->WorkingSkills, 128);
}