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

bool aiEventMove::execute(CAIBase* AI)
{
    return AI->MoveAction(this);
}

bool aiEventAttack::execute(CAIBase* AI)
{
    return AI->AttackAction(this);
}

bool aiEventMagicStart::execute(CAIBase* AI)
{
    return AI->MagicStartAction(this);
}

bool aiEventMagicFinish::execute(CAIBase* AI)
{
    return AI->MagicFinishAction(this);
}

bool aiEventRangedStart::execute(CAIBase* AI)
{
    return AI->RangedStartAction(this);
}

bool aiEventRangedFinish::execute(CAIBase* AI)
{
    return AI->RangedFinishAction(this);
}

bool aiEventWeaponskillStart::execute(CAIBase* AI)
{
    return AI->WeaponskillStartAction(this);
}

bool aiEventWeaponskillFinish::execute(CAIBase* AI)
{
    return AI->WeaponskillFinishAction(this);
}

bool aiEventJobAbilityStart::execute(CAIBase* AI)
{
    return AI->JobabilityStartAction(this);
}

bool aiEventJobAbilityFinish::execute(CAIBase* AI)
{
    return AI->JobabilityFinishAction(this);
}

bool aiEventItemStart::execute(CAIBase* AI)
{
    return AI->ItemStartAction(this);
}

bool aiEventItemFinish::execute(CAIBase* AI)
{
    return AI->ItemFinishAction(this);
}

CAIBase::CAIBase(CBaseEntity* PEntity)
{
    m_PEntity = PEntity;
}

void CAIBase::addEvent(aiEvent&& event)
{
    m_eventList.push_back(event);
}

void CAIBase::ProcessEvents(std::chrono::time_point<std::chrono::steady_clock> tick)
{
    for (auto&& event : m_eventList)
    {
        if (event.begin + event.duration > tick)
        {
            event.execute(this);
        }
    }
}