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
#include <functional>
#include "../../../common/cbasetypes.h"
#include "../../../common/mmo.h"

class CBaseEntity;

struct queueAction_t
{
    time_point start_time {server_clock::now()};
    duration delay {0ms};
    bool checkState {false};
    int lua_func {0};
    std::function<void(CBaseEntity*)> func {};

    queueAction_t(int _ms, bool _checkstate, int _lua_func) :
        delay(std::chrono::milliseconds(_ms)), 
        lua_func(_lua_func), 
        checkState(_checkstate) {}
    queueAction_t(duration _ms, bool _checkstate, std::function<void(CBaseEntity*)> _func) :
        delay(_ms),
        func(_func),
        checkState(_checkstate) {}

    queueAction_t(const queueAction_t&) = delete;
    queueAction_t& operator=(const queueAction_t&) = delete;
    queueAction_t(queueAction_t&&) = default;
    queueAction_t& operator=(queueAction_t&&) = default;
};

inline bool operator< (const queueAction_t& lhs, const queueAction_t& rhs) { return lhs.start_time + lhs.delay < rhs.start_time + rhs.delay; }

class CAIActionQueue
{
public:
    CAIActionQueue(CBaseEntity*);

    void pushAction(queueAction_t&&);
    void checkAction(time_point tick);
private:
    CBaseEntity* PEntity;
    std::priority_queue<queueAction_t> actionQueue;
};

#endif
