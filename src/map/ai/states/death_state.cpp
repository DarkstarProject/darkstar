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
#include "../../entities/charentity.h"
#include "../../packets/menu_raisetractor.h"
#include "../ai_container.h"

CDeathState::CDeathState(CBattleEntity* PEntity, duration death_time) :
    CState(PEntity, PEntity->targid),
    m_PEntity(PEntity),
    m_deathTime(death_time),
    m_raiseTime(GetEntryTime())
{
    m_PEntity->animation = ANIMATION_DEATH;
    m_PEntity->updatemask |= UPDATE_HP;
    if (m_PEntity->PAI->PathFind)
    {
        m_PEntity->PAI->PathFind->Clear();
    }
}

bool CDeathState::Update(time_point tick)
{
    if (tick > GetEntryTime() + m_deathTime && !IsCompleted())
    {
        Complete();
        m_PEntity->OnDeathTimer();
    }
    else if (m_PEntity->objtype == TYPE_PC && tick > GetEntryTime() + 8s && !IsCompleted() && 
        !m_raiseSent && m_PEntity->isDead())
    {
        auto PChar = static_cast<CCharEntity*>(m_PEntity);
        if (PChar->m_hasRaise)
        {
            PChar->pushPacket(new CRaiseTractorMenuPacket(PChar, TYPE_RAISE));
            m_raiseSent = true;
        }
    }
    else if (IsCompleted() || !m_PEntity->isDead())
    {
        return true;
    }
    return false;
}
