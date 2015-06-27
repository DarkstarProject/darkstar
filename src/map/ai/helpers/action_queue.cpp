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

#include "action_queue.h"
#include "../ai_base.h"

CAIActionQueue::CAIActionQueue(CAIBase& _AIBase) :
    AIBase(_AIBase)
{}

void CAIActionQueue::pushAction(queueAction&& action)
{
    actionQueue.insert(std::move(action));
}

void CAIActionQueue::checkAction(time_point tick)
{
    if (!actionQueue.empty())
    {
        auto it = actionQueue.begin();
        if (tick > it->start_time + it->delay)
        {
            queueAction act = *it;
            AIBase.ActionQueueStateChange(act);
        }
        actionQueue.erase(it);
    }
}