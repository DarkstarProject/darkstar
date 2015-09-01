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
    m_PrevTick(std::chrono::steady_clock::now()),
    PEntity(_PEntity),
    ActionQueue(_PEntity)
{
}

CAIBase::CAIBase(CBaseEntity* _PEntity, std::unique_ptr<CPathFind>&& _pathfind) :
    CAIBase(_PEntity)
{
    pathfind = std::move(_pathfind);
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
    m_PrevTick = m_Tick;
    m_Tick = _tick;
    CBaseEntity* PreEntity = PEntity;
    
    ActionQueue.checkAction(_tick);

    // check pathfinding
    if (pathfind)
    {
        pathfind->FollowPath();
    }

    if (!m_stateStack.empty())
    {
        if (m_stateStack.top()->DoUpdate(_tick))
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

bool CAIBase::IsStateStackEmpty()
{
    return m_stateStack.empty();
}

time_point CAIBase::getTick()
{
    return m_Tick;
}

time_point CAIBase::getPrevTick()
{
    return m_PrevTick;
}

void CAIBase::queueAction(queueAction_t&& action)
{
    ActionQueue.pushAction(std::move(action));
}
