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

#ifndef _AIBASE_H
#define _AIBASE_H

#include <memory>
#include <chrono>

#include "helpers/pathfind.h"
#include "helpers/event_handler.h"

enum class AIState
{
    None,
    Dead,
    Roaming,
    Attacking,
    RangedAttack,
    Casting,
    JobAbility,
    Weaponskill,
    Mobskill,
    Item,
    ChangeTarget,
    Trigger
};

typedef std::chrono::steady_clock::time_point tick;
typedef std::chrono::steady_clock::duration timer;

class CBaseEntity;

class CAIBase
{
public:
    CAIBase(CBaseEntity*);
    CAIBase(CBaseEntity*, std::unique_ptr<CPathFind>&&);
    //no copy construct/assign (only move)
    CAIBase(const CAIBase&) = delete;
    CAIBase& operator=(const CAIBase&) = delete;

    // stores all events and their associated lua callbacks
    CAIEventHandler EventHandler;

protected:
    // pathfinder, not guaranteed to be implemented
    std::unique_ptr<CPathFind> pathfind;
    // current synchronized server time (before AI loop execution)
    tick m_Tick;
    //entity who holds this AI
    CBaseEntity* PEntity;
    CBaseEntity* PActionTarget;
    AIState m_state;
    //whether AI is currently able to change state from external means
    bool m_transitionable;

    //State handlers
    virtual void ActionNone() {}
    virtual void ActionDead() {}
    virtual void ActionRoaming() {}
    virtual void ActionAttacking() {}
    virtual void ActionRangedAttack() {}
    virtual void ActionCasting() {}
    virtual void ActionJobAbility() {}
    virtual void ActionWeaponskill() {}
    virtual void ActionMobskill() {}
    virtual void ActionItem() {}
    virtual void ActionChangeTarget() {}
    virtual void ActionTrigger() {}

private:
    void Tick(tick _tick);
};

#endif