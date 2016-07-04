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

#include "trigger_state.h"

#include "../ai_container.h"
#include "../../lua/luautils.h"
#include "../../entities/charentity.h"
#include "../../entities/npcentity.h"
#include "../../packets/entity_update.h"

CTriggerState::CTriggerState(CBaseEntity* PEntity, uint16 targid) :
    CState(PEntity, targid)
{
}

bool CTriggerState::Update(time_point tick)
{
    if (!IsCompleted())
    {
        auto PChar = static_cast<CCharEntity*>(GetTarget());
        if (PChar && luautils::OnTrigger(PChar, m_PEntity) == -1 && m_PEntity->animation == ANIMATION_CLOSE_DOOR)
        {
            close = true;
            m_PEntity->animation = ANIMATION_OPEN_DOOR;
            m_PEntity->updatemask |= UPDATE_HP;
        }
        Complete();
    }
    else if (close)
    {
        if (tick > GetEntryTime() + 7s)
        {
            m_PEntity->animation = ANIMATION_CLOSE_DOOR;
            m_PEntity->updatemask |= UPDATE_HP;
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return true;
    }
    return false;
}

bool CTriggerState::CanChangeState()
{
    return false;
}

bool CTriggerState::CanFollowPath()
{
    return false;
}
