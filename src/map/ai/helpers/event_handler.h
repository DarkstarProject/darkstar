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

#ifndef _EVENT_HANDLER

#include <map>
#include <vector>
#include <string>
#include <functional>

#include "../../../common/cbasetypes.h"

struct ai_event_t
{
    std::string identifier;
    int lua_func;

    union
    {
        uint32 param;
        struct
        {
            uint32 param;
        } some_event;
    };

    ai_event_t() : lua_func(0), param(0) {}

};

class CAIEventHandler
{
public:
    void addListener(std::string& eventname, ai_event_t& eventparam);
    void removeListener(std::string& eventname, std::string identifier = "");

    // checks function to see if lua callback should be triggered, parameter pack to be passed to lua function
    template<class... Types>
    void triggerListener(std::string& eventname, std::function<bool(ai_event_t&)> checkFunction, Types&&... args);

private:
    std::map<std::string, std::vector<ai_event_t>> eventListeners;

    // push parameters on lua stack
    template<class T>
    void pushArg(T&);
    template<class T, class... Types>
    void pushArg(T&, Types...);
};

#endif