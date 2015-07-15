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

#ifndef _ACTIONQUEUE_H
#define _ACTIONQUEUE_H

#include <queue>
#include "../ai_common.h"
#include "../../../common/cbasetypes.h"

class CAIBase;

struct queueAction
{
    time_point start_time;
    duration delay;
    AIState action;

    union
    {
        uint32 param;
        struct
        {
            uint16 spellid;
            uint16 targid;
        } spell;
        struct
        {
            uint16 skillid;
            uint16 targid;
        } mobskill;
    };

    queueAction() : start_time(server_clock::now()), delay(0), action(AIState::None), param(0){}
};

inline bool operator< (const queueAction& lhs, const queueAction& rhs) { return lhs.start_time + lhs.delay < rhs.start_time + rhs.delay; }

class CAIActionQueue
{
public:
    CAIActionQueue(CAIBase&);

    void pushAction(queueAction&&);
    void checkAction(time_point tick);
private:
    CAIBase& AIBase;
    std::priority_queue<queueAction> actionQueue;
};

#endif
