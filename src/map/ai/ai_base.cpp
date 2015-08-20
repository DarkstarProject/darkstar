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

#include "ai_base.h"

#include "../entities/baseentity.h"

duration g_GCD = 1500ms;

CAIBase::CAIBase(CBaseEntity* _PEntity) :
    pathfind(nullptr),
    m_Tick(std::chrono::steady_clock::now()),
    PEntity(_PEntity),
    ActionQueue(*this)
{
}

CAIBase::CAIBase(CBaseEntity* _PEntity, std::unique_ptr<CPathFind>&& _pathfind) :
    CAIBase(_PEntity)
{
    pathfind = std::move(_pathfind);
}

void CAIBase::ActionQueueStateChange(const queueAction& action)
{
    //pathfinding maybe
}

CState* CAIBase::GetCurrentState()
{
    if (!m_stateStack.empty())
    {
        return m_stateStack.top().get();
    }
    return nullptr;
}

bool CAIBase::CanChangeState()
{
    return !GetCurrentState() || GetCurrentState()->CanChangeState();
}

void CAIBase::Tick(time_point _tick)
{
    m_Tick = _tick;
    CBaseEntity* PreEntity = PEntity;
    
    // check Action Queue
    if (CanChangeState())
    {
        ActionQueue.checkAction(m_Tick);
    }

    // check pathfinding
    if (pathfind)
    {
        //#TODO: pathfinding 
    }

    if (!m_stateStack.empty())
    {
        if (m_stateStack.top()->Update(_tick))
        {
            m_stateStack.pop();
        }
    }

    //make sure this AI hasn't been replaced by another
    if (PreEntity->updatemask && PreEntity->PAI.get() == this)
    {
        PreEntity->UpdateEntity();
    }
}