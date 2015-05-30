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

#ifndef _AI_BASE
#define _AI_BASE

#include <chrono>
#include <vector>

#include "states/magic_state.h"
#include "helpers/pathfind.h"
#include "helpers/targetfind.h"

typedef std::chrono::time_point<std::chrono::steady_clock> tick_time;

enum class aiEventAction
{
    MOVE,
    ATTACK,
    MAGIC_START,
    MAGIC_FINISH,
    RANGED_START,
    RANGED_FINISH,
    WEAPONSKILL_START,
    WEAPONSKILL_FINISH,
    JOBABILITY_START,
    JOBABILITY_FINISH,
    ITEM_START,
    ITEM_FINISH
};

struct aiEvent
{
    std::chrono::time_point<std::chrono::steady_clock> begin;
    std::chrono::milliseconds duration;
    uint32 targetID;

    virtual bool execute(CAIBase*) = 0;
};

struct aiEventMove : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventAttack : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventMagicStart : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
    uint16 spellid;
};

struct aiEventMagicFinish : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventRangedStart : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventRangedFinish : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventWeaponskillStart : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventWeaponskillFinish : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventJobAbilityStart : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventJobAbilityFinish : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventItemStart : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

struct aiEventItemFinish : aiEvent
{
    virtual bool execute(CAIBase* AI) override;
};

class CAIBase
{
    friend struct aiEventMove;
    friend struct aiEventAttack;
    friend struct aiEventMagicStart;
    friend struct aiEventMagicFinish;
    friend struct aiEventRangedStart;
    friend struct aiEventRangedFinish;
    friend struct aiEventWeaponskillStart;
    friend struct aiEventWeaponskillFinish;
    friend struct aiEventJobAbilityStart;
    friend struct aiEventJobAbilityFinish;
    friend struct aiEventItemStart;
    friend struct aiEventItemFinish;
public:
    CAIBase(CBaseEntity*);
    virtual ~CAIBase();

    void addEvent(aiEvent&& event);

protected:
    tick_time m_tick;
    CBaseEntity* m_PEntity;

    virtual bool MoveAction(aiEventMove*) = 0;
    virtual bool AttackAction(aiEventAttack*) = 0;
    virtual bool MagicStartAction(aiEventMagicStart*) = 0;
    virtual bool MagicFinishAction(aiEventMagicFinish*) = 0;
    virtual bool RangedStartAction(aiEventRangedStart*) = 0;
    virtual bool RangedFinishAction(aiEventRangedFinish*) = 0;
    virtual bool WeaponskillStartAction(aiEventWeaponskillStart*) = 0;
    virtual bool WeaponskillFinishAction(aiEventWeaponskillFinish*) = 0;
    virtual bool JobabilityStartAction(aiEventJobAbilityStart*) = 0;
    virtual bool JobabilityFinishAction(aiEventJobAbilityFinish*) = 0;
    virtual bool ItemStartAction(aiEventItemStart*) = 0;
    virtual bool ItemFinishAction(aiEventItemFinish*) = 0;

private:
    void ProcessEvents(tick_time);
    std::vector<aiEvent> m_eventList;
};

#endif