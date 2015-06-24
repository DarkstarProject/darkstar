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

CAIBase::CAIBase(CBaseEntity* _PEntity) :
    pathfind(nullptr),
    m_Tick(std::chrono::steady_clock::now()),
    PEntity(_PEntity),
    PActionTarget(nullptr),
    m_state(AIState::None)
{
}

CAIBase::CAIBase(CBaseEntity* _PEntity, std::unique_ptr<CPathFind>&& _pathfind) :
    CAIBase(_PEntity)
{
    pathfind = std::move(_pathfind);
}

bool CAIBase::CanChangeState()
{
    return m_transitionable;
}

void CAIBase::ChangeState(AIState state)
{
    m_state = state;
}

void CAIBase::Tick(time_point _tick)
{
    m_Tick = _tick;
    CBaseEntity* PreEntity = PEntity;
    //#TODO: check action queue here (maybe - maybe don't want to interrupt channeling actions) 

    if (pathfind)
    {
        //#TODO: pathfinding 
    }

    switch (m_state)
    {
        case AIState::None:
            ActionNone();
            break;
        case AIState::Dead:
            ActionDead();
            break;
        case AIState::Roaming:
            ActionRoaming();
            break;
        case AIState::Attacking:
            ActionAttacking();
            break;
        case AIState::RangedAttack:
            ActionRangedAttack();
            break;
        case AIState::Casting:
            ActionCasting();
            break;
        case AIState::JobAbility:
            ActionJobAbility();
            break;
        case AIState::Weaponskill:
            ActionWeaponskill();
            break;
        case AIState::Mobskill:
            ActionMobskill();
            break;
        case AIState::Item:
            ActionItem();
            break;
        case AIState::ChangeTarget:
            ActionChangeTarget();
            break;
        case AIState::Trigger:
            ActionTrigger();
            break;
    }

    //make sure this AI hasn't been replaced by another
    //#TODO: reactivate this once PEntity has a member for new AI
    if (PreEntity->updatemask /* && PreEntity->PAI == this */)
    {
        PreEntity->UpdateEntity();
    }
}