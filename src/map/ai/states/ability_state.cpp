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

#include "ability_state.h"
#include "../ai_char.h"
#include "../../ability.h"
#include "../../entities/charentity.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"

CAbilityState::CAbilityState(CCharEntity* PEntity, uint16 targid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{

}

bool CAbilityState::StartAbility(uint16 abilityid)
{
    CAbility* PAbility = ability::GetAbility(abilityid);

    if (PAbility)
    {
        m_PAbility = std::make_unique<CAbility>(*PAbility);
        m_PEntity->PAI->EventHandler.triggerListener("ABILITY_START", m_PEntity, PAbility);
        return true;
    }
    return false;
}

CAbility* CAbilityState::GetAbility()
{
    return m_PAbility.get();
}

void CAbilityState::ApplyEnmity()
{
    auto PTarget = GetTarget();
    if (m_PAbility->getValidTarget() & TARGET_ENEMY &&
        PTarget->allegiance != m_PEntity->allegiance)
    {
        if (PTarget->objtype == TYPE_MOB &&
            !(m_PAbility->getCE() == 0 && m_PAbility->getVE() == 0))
        {
            CMobEntity* mob = (CMobEntity*)PTarget;
            mob->m_OwnerID.id = m_PEntity->id;
            mob->m_OwnerID.targid = m_PEntity->targid;
            mob->updatemask |= UPDATE_STATUS;
            mob->PEnmityContainer->UpdateEnmity(m_PEntity, m_PAbility->getCE(), m_PAbility->getVE());
        }
    }
    else if (PTarget->allegiance == m_PEntity->allegiance)
    {
        battleutils::GenerateInRangeEnmity(m_PEntity, m_PAbility->getCE(), m_PAbility->getVE());
    }
}

bool CAbilityState::CanChangeState()
{
    return IsCompleted();
}

bool CAbilityState::Update(time_point tick)
{
    if (CanUseAbility())
    {
        action_t action;
        static_cast<CAIChar*>(m_PEntity->PAI.get())->OnAbility(*this, action);
        m_PEntity->PAI->EventHandler.triggerListener("ABILITY_USE", m_PEntity, m_PAbility.get(), &action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        Complete();
    }

    if (IsCompleted() && tick > GetEntryTime() + m_PAbility->getAnimationTime())
    {
        m_PEntity->PAI->EventHandler.triggerListener("ABILITY_STATE_EXIT", m_PEntity, m_PAbility.get());
        return true;
    }

    return false;
}

bool CAbilityState::CanUseAbility()
{
    auto PAbility = GetAbility();
    if (m_PEntity->PRecastContainer->HasRecast(RECAST_ABILITY, PAbility->getRecastId()))
    {
        m_PEntity->pushPacket(new CMessageBasicPacket(m_PEntity, m_PEntity, 0, 0, MSGBASIC_WAIT_LONGER));
        return false;
    }
    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)) {
        m_PEntity->pushPacket(new CMessageBasicPacket(m_PEntity, m_PEntity, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));
        return false;
    }
    std::unique_ptr<CMessageBasicPacket> errMsg;
    auto PTarget = GetTarget();
    if (m_PEntity->PAIBattle()->IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (m_PEntity != PTarget && distance(m_PEntity->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            m_PEntity->pushPacket(new CMessageBasicPacket(m_PEntity, PTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
            return false;
        }
        if (PAbility->getID() >= ABILITY_HEALING_RUBY)
        {
            // Blood pact MP costs are stored under animation ID
            if (m_PEntity->health.mp < PAbility->getAnimationID())
            {
                m_PEntity->pushPacket(new CMessageBasicPacket(m_PEntity, PTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA));
                return false;
            }
        }
        CBaseEntity* PMsgTarget = m_PEntity;
        int32 errNo = luautils::OnAbilityCheck(m_PEntity, PTarget, PAbility, &PMsgTarget);
        if (errNo != 0)
        {
            m_PEntity->pushPacket(new CMessageBasicPacket(m_PEntity, PMsgTarget, PAbility->getID() + 16, PAbility->getID(), errNo));
            return false;
        }
        // #TODO: needed??
        //if (PAbility->getValidTarget() == TARGET_ENEMY)
        //{
        //    if (!IsMobOwner(PTarget))
        //    {
        //        m_PEntity->pushPacket(new CMessageBasicPacket(m_PEntity, m_PEntity, 0, 0, MSGBASIC_ALREADY_CLAIMED));

        //        TransitionBack();
        //        PAbility = nullptr;
        //        return;
        //    }
        //}
        return true;
    }
    return false;
}
