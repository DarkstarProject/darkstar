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

#include "event_handler.h"
#include "../../lua/luautils.h"

void CAIEventHandler::addListener(std::string& eventname, ai_event_t& eventparam)
{
    eventparam.lua_func = luautils::register_fp();
    eventListeners[eventname].push_back(eventparam);
}

void CAIEventHandler::removeListener(std::string & eventname, std::string identifier)
{
    std::remove_if(eventListeners[eventname].begin(), eventListeners[eventname].end(), [&identifier](const ai_event_t& event)
    {
        if (identifier == event.identifier || identifier == "")
        {
            luautils::unregister_fp(event.lua_func);
            return true;
        }
        return false;
    });
}

template<class... Types>
void CAIEventHandler::triggerListener(std::string& eventname, std::function<bool(ai_event_t&)> checkFunction, Types&&... args)
{
    for (auto&& event : eventListeners[eventname])
    {
        if (checkFunction(event))
        {
            int nargs = sizeof...(args);
            pushArg(std::forward<Types>(args)...);
            luautils::callFunc(nargs);
        }
    }
}

template<class T>
void CAIEventHandler::pushArg(T& type)
{
    luautils::pushArg(type);
}

template<class T, class... Types>
void CAIEventHandler::pushArg(T& type, Types... args)
{
    pushArg(type);
    pushArg(args...);
}