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

#include "weaponskill_state.h"
#include "../../entities/charentity.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"
#include "../../mobskill.h"
#include "../../weapon_skill.h"

CWeaponSkillState::CWeaponSkillState(CBattleEntity* PEntity, uint16 targid) :
    CState(PEntity, targid),
    m_PEntity(PEntity),
    m_PWeaponSkill(nullptr),
    m_PMobSkill(nullptr)
{}

bool CWeaponSkillState::StartWeaponSkill(uint16 wsid)
{
    CWeaponSkill* PWeaponskill = battleutils::GetWeaponSkill(wsid);

    if (PWeaponskill)
    {
        m_PWeaponSkill = std::make_unique<CWeaponSkill>(*PWeaponskill);
        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_START", m_PEntity, wsid); //TODO: weaponskill lua object
        return true;
    }

    return false;
}

bool CWeaponSkillState::StartMobSkill(uint16 mobskillid)
{
    CMobSkill* PMobskill {battleutils::GetMobSkill(mobskillid)};

    if (PMobskill)
    {
        m_PMobSkill = std::make_unique<CMobSkill>(*PMobskill);
        m_PMobSkill->setTP(m_PEntity->health.tp);
        SpendCost();
        auto activationTime {PMobskill->getActivationTime()};
        if (activationTime > 0)
        {
            action_t action;
            action.id = m_PEntity->id;
            action.actiontype = ACTION_WEAPONSKILL_START;

            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = m_targid;

            actionTarget_t& actionTarget = actionList.getNewActionTarget();

            actionTarget.reaction = REACTION_HIT;
            actionTarget.speceffect = SPECEFFECT_HIT;
            actionTarget.animation = 0;
            actionTarget.param = PMobskill->getID();
            actionTarget.messageID = PMobskill->getMsg() == 0 ? 0 : 43;

            m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
            m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_START", m_PEntity, mobskillid); //TODO: weaponskill lua object
        }
        m_finishTime = server_clock::now() + std::chrono::milliseconds(activationTime);
        return true;
    }

    return false;
}

CWeaponSkill* CWeaponSkillState::GetWeaponSkill()
{
    return m_PWeaponSkill.get();
}

CMobSkill* CWeaponSkillState::GetMobSkill()
{
    return m_PMobSkill.get();
}

void CWeaponSkillState::SpendCost()
{
    if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
    {
        m_PEntity->addTP(-1000);
    }
    else if (m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI))
    {
        m_PEntity->addTP(-1000);
        m_PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
    }
    else
    {
        m_PEntity->health.tp = 0;
    }
}

bool CWeaponSkillState::Update(time_point tick)
{
    if (tick > m_finishTime && !IsCompleted())
    {
        action_t action;
        m_PEntity->PAIBattle()->OnWeaponSkillFinished(*this, action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        Complete();
    }
    auto delay = (m_PWeaponSkill ? m_PWeaponSkill->getAnimationTime() : 0ms) + 
        std::chrono::milliseconds((m_PMobSkill ? m_PMobSkill->getAnimationTime() : 0));
    if (IsCompleted() && tick > m_finishTime + delay)
    {
        m_PEntity->PAI->EventHandler.triggerListener("WEAPONSKILL_STATE_EXIT", m_PEntity);
        return true;
    }
    return false;
}

void CWeaponSkillState::Cleanup(time_point tick)
{
    //#TODO: interrupt an in progress ws
}
