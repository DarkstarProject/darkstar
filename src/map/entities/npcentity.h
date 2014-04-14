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

#ifndef _NPCENTITY_H
#define _NPCENTITY_H

#include "../../common/cbasetypes.h"
#include "../../common/taskmgr.h"

#include "baseentity.h"

int32 close_door(uint32 tick,CTaskMgr::CTask *PTask); // закрываем дверь
int32 open_door(uint32 tick,CTaskMgr::CTask *PTask);
int32 disappear_npc(uint32 tick,CTaskMgr::CTask *PTask); // Used for showNPC lua function
int32 reappear_npc(uint32 tick,CTaskMgr::CTask *PTask); // used for hideNPC lua function

class CNpcEntity : public CBaseEntity {
public:

	uint32		unknown;
	uint8		name_prefix;

	 CNpcEntity();				// конструктор
	~CNpcEntity();				// деструктор
private:
};

#endif