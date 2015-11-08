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

#include "death_state.h"

#include "../../entities/battleentity.h"

CDeathState::CDeathState(CBattleEntity* PEntity, duration death_time) :
    CState(PEntity, PEntity->targid),
    m_PEntity(PEntity),
    m_deathTime(death_time)
{

}

bool CDeathState::Update(time_point tick)
{
    if (tick > GetEntryTime() + m_deathTime)
    {
        Complete();
    }
    else if (IsCompleted())
    {
        return true;
    }
    return false;
}

void CDeathState::Cleanup(time_point tick)
{

}
