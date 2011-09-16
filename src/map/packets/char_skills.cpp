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

#include <string.h>

#include "char_skills.h"

#include "../charentity.h"
#include "../battleutils.h"


CCharSkillsPacket::CCharSkillsPacket(CCharEntity * PChar) 
{
	this->type = 0x62;
	this->size = 0x80;

	/*
	int realcount = 0;

	for(unsigned int i = 0; i < schar->recastAbilityList.size(); i++) {
		
		int ttg = (int)(((int)schar->recastAbilityList.at(i).recast + schar->recastAbilityList.at(i).timeStamp) - (int)time(NULL));

		if(schar->recastAbilityList.at(i).recastID != 0) {
			memcpy(this->data+4+((realcount)*4), &ttg, 3);
			memcpy(this->data+7+((realcount)*4), &schar->recastAbilityList.at(i).recastID, 1);
			realcount++;
		} else {
			
			memcpy(this->data, &ttg, 3);
		}

	}
	*/

	memcpy(data+(0x80)-4, &PChar->WorkingSkills, 128);
}