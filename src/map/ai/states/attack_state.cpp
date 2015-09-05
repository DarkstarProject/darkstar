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

CAttackState::CAttackState(CBattleEntity* PEntity) :
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
        action_t action;
        if (m_PEntity->PAIBattle()->Attack(action))
        {
            m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        }
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

void CAttackState::UpdateTarget(uint16 targid)
{
    auto newTargid = m_PEntity->PAIBattle()->GetBattleTargetID();
    if (targid != newTargid)
    {
        //#TODO: check validity, range, etc
        auto PNewTarget = static_cast<CBattleEntity*>(m_PEntity->GetEntity(newTargid));
        m_PEntity->PAIBattle()->ChangeTarget(true, PNewTarget);
        SetTarget(newTargid);
    }
    CState::UpdateTarget(m_PEntity->PAIBattle()->GetBattleTargetID());
}

bool CAttackState::CanAttack(CBattleEntity* PTarget)
{
    m_attackTime -= (m_PEntity->PAI->getTick() - m_PEntity->PAI->getPrevTick());

    if (m_attackTime < 0ms)
    {
        auto PEntity = static_cast<CBattleEntity*>(m_PEntity);

        float dist = distance(PEntity->loc.p, PTarget->loc.p);

        if (dist > 30)
        {
            m_errorMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_LOSE_SIGHT);
            SetTarget(0);
            return false;
        }
        else if (!isFaceing(PEntity->loc.p, PTarget->loc.p, 40))
        {
            m_errorMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_UNABLE_TO_SEE_TARG);
        }
        else if (dist > PTarget->m_ModelSize)
        {
            m_errorMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE);
        }
        else
        {
            m_errorMsg.reset();
            m_attackTime += std::chrono::milliseconds(m_PEntity->GetWeaponDelay(false));
        }
        return true;
    }
    return false;
}
