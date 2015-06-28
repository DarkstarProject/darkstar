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

#ifndef _AICOMMON_H
#define _AICOMMON_H

#include <chrono>

enum class AIState
{
    None,
    Dead,
    Roaming,
    Attacking,
    RangedAttack,
    Casting,
    JobAbility,
    Weaponskill,
    Mobskill,
    Item,
    ChangeTarget,
    Trigger
};

typedef std::chrono::steady_clock server_clock;
typedef server_clock::time_point time_point;
typedef server_clock::duration duration;

duration g_GCD = std::chrono::milliseconds(1500);

#endif