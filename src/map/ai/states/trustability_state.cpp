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

#include "trustability_state.h"
#include "../ai_container.h"
#include "../../ability.h"
#include "../../recast_container.h"
#include "../../enmity_container.h"
#include "../../status_effect_container.h"
#include "../../entities/trustentity.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"
#include "../../../common/utils.h"
#include "../../utils/charutils.h"
#include "../../mobskill.h"

CTrustAbilityState::CTrustAbilityState(CTrustEntity* PEntity, uint16 targid, uint16 abilityid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{
    auto PAbility = battleutils::GetMobSkill(abilityid);

    if (!PAbility)
    {
        throw CStateInitException(nullptr);
    }
    auto PTarget = m_PEntity->IsValidTarget(m_targid, PAbility->getValidTargets(), m_errorMsg);

    if (!PTarget || m_errorMsg)
    {
        throw CStateInitException(nullptr);
    }

    //SetTarget(PTarget->targid);
    m_PAbility = std::make_unique<CMobSkill>(*PAbility);
    //m_PEntity->PAI->EventHandler.triggerListener("ABILITY_START", m_PEntity, PAbility);

    //action_t action;
    //action.id = m_PEntity->id;
    //action.actiontype = ACTION_JOBABILITY_START;
    //auto& list = action.getNewActionList();
    //list.ActionTargetID = PTarget->id;
    //auto& actionTarget = list.getNewActionTarget();
    //actionTarget.reaction = (REACTION)24;
    //actionTarget.speceffect = SPECEFFECT_NONE;
    //actionTarget.animation = 121;
    ////actionTarget.messageID = 326;
    //actionTarget.param = PAbility->getID() +16;
    //m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));

    action_t action;
    action.id = m_PEntity->id;
    action.actiontype = ACTION_MOBABILITY_START;

    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;

    actionTarget_t& actionTarget = actionList.getNewActionTarget();

    actionTarget.reaction = REACTION_NONE;
    actionTarget.speceffect = SPECEFFECT_NONE;
    actionTarget.animation = 0;
    actionTarget.param = m_PAbility->getID();
    actionTarget.messageID = 43;
    m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));

    m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_ENTER", m_PEntity, PAbility->getID());

}

CMobSkill* CTrustAbilityState::GetAbility()
{
    return m_PAbility.get();
}

void CTrustAbilityState::SpendCost()
{
    if (m_PAbility->isTpSkill())
    {
        m_spentTP = m_PEntity->health.tp;
        m_PEntity->health.tp = 0;
    }
}

//void CTrustAbilityState::ApplyEnmity()
//{
//    auto PTarget = GetTarget();
//    if (m_PAbility->getValidTargets() & TARGET_ENEMY &&
//        PTarget->allegiance != m_PEntity->allegiance)
//    {
//        if (PTarget->objtype == TYPE_MOB &&
//            !(m_PAbility->getCE() == 0 && m_PAbility->getVE() == 0))
//        {
//            CMobEntity* mob = (CMobEntity*)PTarget;
//            if (!mob->CalledForHelp())
//            {
//                mob->m_OwnerID.id = m_PEntity->PMaster->id;
//                mob->m_OwnerID.targid = m_PEntity->targid;
//            }
//            mob->updatemask |= UPDATE_STATUS;
//            mob->PEnmityContainer->UpdateEnmity(m_PEntity, m_PAbility->getCE(), m_PAbility->getVE(), false, m_PAbility->getID() == ABILITY_CHARM);
//            if (mob->m_HiPCLvl < m_PEntity->GetMLevel())
//                mob->m_HiPCLvl = m_PEntity->GetMLevel();
//        }
//    }
//    else if (PTarget->allegiance == m_PEntity->allegiance)
//    {
//        battleutils::GenerateInRangeEnmity(m_PEntity, m_PAbility->getCE(), m_PAbility->getVE());
//    }
//}

bool CTrustAbilityState::CanChangeState()
{
    return IsCompleted();
}

bool CTrustAbilityState::Update(time_point tick)
{
    if (!IsCompleted())
    {
        action_t action;
        //m_PEntity->OnAbility(*this, action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        auto delay = std::chrono::milliseconds(m_PAbility->getAnimationTime());
        m_finishTime = tick + delay;
        Complete();
    }

    else if (IsCompleted() && tick > m_finishTime)
    {
        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_EXIT", m_PEntity, m_PAbility->getID());
        return true;
    }

    return false;
}

//bool CTrustAbilityState::CanUseAbility()
//{
//    if (m_PEntity->objtype == TYPE_TRUST)
//    {
//        auto PAbility = GetAbility();
//        auto PChar = static_cast<CTrustEntity*>(m_PEntity);
//        if (PChar->PRecastContainer->HasRecast(RECAST_ABILITY, PAbility->getRecastId(), PAbility->getRecastTime()))
//        {
//            return false;
//        }
//        if (PChar->StatusEffectContainer->HasStatusEffect({EFFECT_AMNESIA, EFFECT_IMPAIRMENT}))
//        {
//            return false;
//        }
//        std::unique_ptr<CBasicPacket> errMsg;
//        auto PTarget = GetTarget();
//        if (PChar->IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
//        {
//            if (PChar != PTarget && distance(PChar->loc.p, PTarget->loc.p) > PAbility->getRange())
//            {
//                return false;
//            }
//            if (!m_PEntity->PAI->TargetFind->canSee(&PTarget->loc.p))
//            {
//                m_errorMsg = std::make_unique<CMessageBasicPacket>(m_PEntity, PTarget, PAbility->getID(), 0, MSGBASIC_CANNOT_PERFORM_ACTION);
//                return false;
//            }
//
//            CBaseEntity* PMsgTarget = PChar;
//            int32 errNo = luautils::OnAbilityCheck(PChar, PTarget, PAbility, &PMsgTarget);
//            if (errNo != 0)
//            {
//                return false;
//            }
//            return true;
//        }
//        return false;
//    }
//    return true;
//}

void CTrustAbilityState::Cleanup(time_point tick)
{
    if (!IsCompleted())
    {
        action_t action;
        action.id = m_PEntity->id;
        action.actiontype = ACTION_MOBABILITY_INTERRUPT;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = m_PEntity->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation = m_PAbility->getID();

        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
    }
}
