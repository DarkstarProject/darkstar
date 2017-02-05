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

#include "automaton_controller.h"
#include "../../entities/automatonentity.h"
#include "../../utils/battleutils.h"
#include "../../lua/luautils.h"
#include "../../mobskill.h"

CAutomatonController::CAutomatonController(CAutomatonEntity* PPet) : CPetController(PPet),
    PAutomaton(PPet)
{
    PPet->setInitialBurden();
    if (PPet->getFrame() == FRAME_SHARPSHOT)
    {
        PPet->m_Behaviour |= BEHAVIOUR_STANDBACK;
        switch (PPet->getHead())
        {
            case HEAD_SHARPSHOT:
                m_rangedCooldown = 20s;
                break;
            case HEAD_HARLEQUIN:
                m_rangedCooldown = 25s;
                break;
            default:
                m_rangedCooldown = 36s;
        }
    }
}

void CAutomatonController::DoCombatTick(time_point tick)
{
    PTarget = static_cast<CBattleEntity*>(PAutomaton->GetEntity(PAutomaton->GetBattleTargetID()));

    if (TryDeaggro())
    {
        Disengage();
        return;
    }
    if (TrySpellcast())
    {
        return;
    }
    else if (TryTPMove())
    {
        //TODO: check if automaton WS have activation times (don't think so)
        return;
    }
    else if (TryRangedAttack())
    {
        //TODO: set ID to ranged attack
        m_LastRangedTime = m_Tick;
        return;
    }
    Move();
}

bool CAutomatonController::TrySpellcast()
{
    return false;
}

bool CAutomatonController::TryTPMove()
{
    //TODO: range checks
    if (PAutomaton->health.tp > 1000)
    {
        const auto& FamilySkills = battleutils::GetMobSkillList(PAutomaton->m_Family);

        std::vector<CMobSkill*> validSkills;

        //load the skills that the automaton has access to with it's skill
        SKILLTYPE skilltype = SKILL_AME;

        if (PAutomaton->getFrame() == FRAME_SHARPSHOT)
        {
            skilltype = SKILL_ARA;
        }

        for (auto skillid : FamilySkills)
        {
            auto PSkill = battleutils::GetMobSkill(skillid);
            if (PSkill && PAutomaton->PMaster && PAutomaton->PMaster->GetSkill(skilltype) > PSkill->getParam() && PSkill->getParam() != -1)
            {
                validSkills.push_back(PSkill);
            }
        }

        uint16 currentSkill = 0;
        int8 currentManeuvers = -1;
        for (auto PSkill : validSkills)
        {
            int8 maneuvers = luautils::OnMobAutomatonSkillCheck(PTarget, PAutomaton, PSkill);
            if ( maneuvers > -1 && (maneuvers > currentManeuvers || (maneuvers == currentManeuvers && PSkill->getParam() > currentSkill)))
            {
                currentManeuvers = maneuvers;
                currentSkill = PSkill->getParam();
            }
        }

        // No WS was chosen (waiting on master's TP to skillchain probably)
        if (currentManeuvers == -1)
        {
            return false;
        }
        MobSkill(PTarget->targid, currentSkill);

        return true;
    }
    return false;
}

bool CAutomatonController::TryRangedAttack()
{
    if (m_rangedCooldown > 0s && m_Tick > m_LastRangedTime + (m_rangedCooldown - std::chrono::seconds(PAutomaton->getMod(Mod::SNAP_SHOT))))
    {
        MobSkill(PTarget->targid, m_RangedAbility);
        return true;
    }
    return false;
}

