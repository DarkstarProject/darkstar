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

#include <memory>
#include <chrono>

#include "helpers/pathfind.h"
#include "helpers/event_handler.h"

typedef std::chrono::steady_clock::time_point tick;

class CAIBase
{
public:
    CAIBase();
    virtual ~CAIBase();

    // stores all events and their associated lua callbacks
    CAIEventHandler EventHandler;

protected:
    // pathfinder, not guaranteed to be implemented
    std::unique_ptr<CPathFind> pathfind;
    // current synchronized server time (before AI loop execution)
    tick m_Tick;
};

#endif