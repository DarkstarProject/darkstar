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

#ifndef _NPCENTITY_H
#define _NPCENTITY_H

#include "../../common/cbasetypes.h"
#include "../../common/taskmgr.h"

#include "baseentity.h"

int32 close_door(time_point tick,CTaskMgr::CTask *PTask); // закрываем дверь
int32 open_door(time_point tick,CTaskMgr::CTask *PTask);
int32 disappear_npc(time_point tick,CTaskMgr::CTask *PTask); // Used for showNPC lua function
int32 reappear_npc(time_point tick,CTaskMgr::CTask *PTask); // used for hideNPC lua function

class CNpcEntity : public CBaseEntity {
public:

    uint32      m_flags;
    uint8       name_prefix;
    uint8       widescan;
    uint32      getEntityFlags();                        // Returns the current value in m_flags
    void        setEntityFlags(uint32 EntityFlags);      // Change the current value in m_flags
    void        HideModel(bool hide);                    // hide / show model
    bool        IsModelHidden();
    void        HideHP(bool hide);
    bool        IsHPHidden();
    void        Untargetable(bool untargetable);
    bool        IsUntargetable();
    virtual void PostTick() override;
    virtual void Tick(time_point) override {}

	 CNpcEntity();				// конструктор
	~CNpcEntity();				// деструктор


private:
};

#endif
