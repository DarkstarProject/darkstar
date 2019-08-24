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

#include "trustweaponskill_state.h"
#include "../ai_container.h"
#include "../../entities/trustentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"
#include "../../trust_weaponskill.h"
#include "../../mobskill.h"
#include "../../status_effect_container.h"

CTrustSkillState::CTrustSkillState(CTrustEntity* PEntity, uint16 targid, uint16 wsid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{
    auto mobskill = battleutils::GetMobSkill(wsid);
    m_PMSkill = std::make_unique<CMobSkill>(*mobskill);
    CBattleEntity* PTarget = (CBattleEntity*)PEntity->GetEntity(targid, TYPE_TRUST | TYPE_MOB);

    action_t action;
    action.id = m_PEntity->id;
    action.actiontype = ACTION_MOBABILITY_START;
    actionList_t& actionList = action.getNewActionList();
    actionList.ActionTargetID = PTarget->id;
    actionTarget_t& actionTarget = actionList.getNewActionTarget();
    actionTarget.reaction = REACTION_NONE;
    actionTarget.speceffect = SPECEFFECT_NONE;
    actionTarget.param = m_PMSkill->getID();
    actionTarget.animation = 0;
    actionTarget.messageID = 43;
    m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));

    m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_ENTER", m_PEntity, m_PMSkill->getID());
    SpendCost();
}

CTrustWeaponSkill* CTrustSkillState::GetSkill()
{
    return m_PSkill.get();
}

CMobSkill* CTrustSkillState::GetMSkill()
{
    return m_PMSkill.get();
}

void CTrustSkillState::SpendCost()
{
    m_spentTP = m_PEntity->health.tp;
    m_PEntity->health.tp = 0;
}

bool CTrustSkillState::Update(time_point tick)
{
    if (!IsCompleted())
    {
        action_t action;
        m_PEntity->OnTrustSkillFinished(*this, action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        duration delay = 0s;
        delay = std::chrono::milliseconds(m_PMSkill->getAnimationTime());
        m_finishTime = tick + delay;

        Complete();
    }

    else if (IsCompleted() && tick > m_finishTime)
    {
        uint16 skillID = 0;

        skillID = m_PMSkill->getID();
        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_EXIT", m_PEntity, skillID);

        return true;
    }
    return false;
}

//bool CTrustSkillState::Update(time_point tick)
//{
//    if (tick > GetEntryTime() + m_castTime && !IsCompleted())
//    {
//        SpendCost();
//        action_t action;
//        m_PEntity->OnTrustSkillFinished(*this, action);
//        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
//
//        auto PTarget{ GetTarget() };
//        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_USE", m_PEntity, PTarget, m_PSkill->getID(), m_spentTP, &action);
//        PTarget->PAI->EventHandler.triggerListener("WEAPONSKILL_TAKE", PTarget, m_PEntity, m_PSkill->getID(), m_spentTP, &action);
//        auto delay = std::chrono::milliseconds(m_PSkill->getAnimationTime());
//        m_finishTime = tick + delay;
//        Complete();
//    }
//    if (IsCompleted() && tick > m_finishTime)
//    {
//        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_EXIT", m_PEntity, m_PSkill->getID());
//        return true;
//    }
//    return false;
//}

void CTrustSkillState::Cleanup(time_point tick)
{
    if (!IsCompleted())
    {
        action_t action;
        action.id = m_PEntity->id;
        action.actiontype = ACTION_MOBABILITY_INTERRUPT;

        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = m_PEntity->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.animation = m_PMSkill->getID();

        m_PEntity->setLastWs(0);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CActionPacket(action));
    }
}
