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

#include <set>
#include "../ai_common.h"

class CAIBase;

struct queueAction
{
    time_point start_time;
    duration delay;

    bool operator<(const queueAction& o) { return start_time + delay < o.start_time + o.delay; }
};

class CAIActionQueue
{
public:
    CAIActionQueue(CAIBase&);

    void pushAction(queueAction&&);
private:
    CAIBase& AIBase;
    std::set<queueAction> actionQueue;
};

#endif
