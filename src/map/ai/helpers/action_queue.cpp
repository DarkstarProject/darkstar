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
#include "../ai_container.h"
#include "../../entities/baseentity.h"
#include "../../lua/luautils.h"
#include "../../lua/lua_baseentity.h"

CAIActionQueue::CAIActionQueue(CBaseEntity* _PEntity) :
    PEntity(_PEntity)
{}

void CAIActionQueue::pushAction(queueAction_t&& action)
{
    actionQueue.push(std::move(action));
}

void CAIActionQueue::checkAction(time_point tick)
{
    while (!actionQueue.empty())
    {
        auto& action = actionQueue.top();
        if (tick > action.start_time + action.delay && 
            (!action.checkState || PEntity->PAI->CanChangeState()))
        {
            if (action.lua_func)
            {
                luautils::pushFunc(action.lua_func);
                //CLuaBaseEntity luaEntity(PEntity);
                luautils::pushArg<CBaseEntity*>(PEntity);
                luautils::callFunc(1);
                luautils::unregister_fp(action.lua_func);
            }
            if (action.func)
            {
                action.func(PEntity);
            }
            actionQueue.pop();
        }
        else break;
    }
}
