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

#include "attack_state.h"

#include "../../entities/battleentity.h"

#include "../../utils/battleutils.h"
#include "../../packets/action.h"

CAttackState::CAttackState(CBattleEntity* PEntity):
    CState(PEntity, 0),
    m_PEntity(PEntity),
    m_attackTime(1s)
{
    UpdateTarget();
}

bool CAttackState::Update(time_point tick)
{
    auto PTarget = static_cast<CBattleEntity*>(GetTarget());
    if (!PTarget || PTarget->isDead())
    {
        return true;
    }
    if (CanAttack(PTarget))
    {
        m_attackTime += std::chrono::milliseconds(m_PEntity->GetWeaponDelay(false));

        action_t action;
        m_PEntity->PAIBattle()->Attack(action);

        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
    }
    return false;
}

void CAttackState::Cleanup()
{
    m_PEntity->PAIBattle()->Disengage();
}

void CAttackState::Clear()
{
}

void CAttackState::UpdateTarget(uint16 _)
{
    //#TODO: handle char changing target
    CState::UpdateTarget(m_PEntity->PAIBattle()->GetBattleTargetID());
}

bool CAttackState::CanAttack(CBattleEntity* PTarget)
{
    m_attackTime -= (m_PEntity->PAI->getTick() - m_PEntity->PAI->getPrevTick());

    //#TODO: push the error messages
    //#TODO: message time vs attack time?
    if (m_attackTime < 0ms)
    {
        m_attackTime += std::chrono::milliseconds(m_PEntity->GetWeaponDelay(false));
        auto PEntity = static_cast<CBattleEntity*>(m_PEntity);

        float dist = distance(PEntity->loc.p, PTarget->loc.p);

        if (dist > PTarget->m_ModelSize)
        {
            return false;
        }
        if (!isFaceing(PEntity->loc.p, PTarget->loc.p, 40))
        {
            return false;
        }
        if (battleutils::IsParalyzed(static_cast<CBattleEntity*>(PEntity)))
        {
            return false;
        }
        if (battleutils::IsIntimidated(static_cast<CBattleEntity*>(PEntity), PTarget))
        {
            return true;
        }
        return true;
    }
    return false;
}
