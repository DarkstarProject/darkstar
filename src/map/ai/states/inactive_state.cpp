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

#include "inactive_state.h"
#include "../ai_container.h"
#include "../../entities/battleentity.h"
#include "../../status_effect_container.h"

CInactiveState::CInactiveState(CBaseEntity* PEntity, duration _duration, bool canChangeState) :
    CState(PEntity, 0),
    m_duration(_duration),
    m_canChangeState(canChangeState)
{
    if (!canChangeState) PEntity->PAI->InterruptStates();
    m_couldUpdate = m_PEntity->PAI->GetController() && m_PEntity->PAI->GetController()->canUpdate;
    if (m_PEntity->PAI->GetController()) m_PEntity->PAI->GetController()->canUpdate = false;
}

bool CInactiveState::Update(time_point tick)
{
    auto PBattleEntity {dynamic_cast<CBattleEntity*>(m_PEntity)};
    if (PBattleEntity && m_duration == 0ms)
    {
        if (PBattleEntity->isDead())
        {
            return true;
        }

        if (!PBattleEntity->StatusEffectContainer->HasPreventActionEffect())
        {
            return true;
        }
    }

    if (m_duration > 0ms && tick > GetEntryTime() + m_duration)
    {
        return true;
    }

    return false;
}

void CInactiveState::Cleanup(time_point tick)
{
    if (m_PEntity->PAI->GetController()) m_PEntity->PAI->GetController()->canUpdate = m_couldUpdate;
}
