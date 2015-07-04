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

#include "ai_battle.h"

#include "states/magic_state.h"
#include "../spell.h"
#include "../entities/battleentity.h"
#include "../packets/action.h"
#include "../utils/battleutils.h"

CAIBattle::CAIBattle(CBattleEntity* _PEntity) :
    CAIBase(_PEntity, std::unique_ptr<CPathFind>(new CPathFind(_PEntity))),
    targetFind(_PEntity),
    actionStateContainer(nullptr),
    m_AttackTime(0)
{
}

void CAIBattle::ActionQueueStateChange(queueAction& action)
{
    switch(action.action)
    {
        case AIState::Casting:
            Cast(action.spell.spellid, action.spell.targid);
            break;
        default:
            break;
    }
}

void CAIBattle::Cast(uint16 targetid, uint16 spellid)
{
    if (CanChangeState())
    {
        if (m_Tick < m_LastActionTime + g_GCD)
        {
            //MagicStartError();
            return;
        }
        ChangeState(AIState::Casting);
        actionStateContainer = std::unique_ptr<CState>(new CMagicState(static_cast<CBattleEntity*>(PEntity), targetFind));

        STATESTATUS status = static_cast<CMagicState*>(actionStateContainer.get())->CastSpell(spellid, targetid);

        if (status != STATESTATUS::InProgress)
        {
            //MagicStartError();
        }
    }
}

void CAIBattle::ActionAttacking()
{
    switch(CanAttack())
    {
        case STATESTATUS::ErrorRange:
        case STATESTATUS::ErrorInvalidTarget:
        case STATESTATUS::ErrorFacing:
        case STATESTATUS::ErrorParalyzed:
        case STATESTATUS::ErrorIntimidated:
        case STATESTATUS::ErrorUnknown:
            break; //todo: error handling
        case STATESTATUS::Finish:
            //attack
            break;
        default:
            break;
    }
}

void CAIBattle::ActionCasting()
{
    STATESTATUS status = actionStateContainer->Update(m_Tick);

    switch (status)
    {
        case STATESTATUS::Finish:
            CastFinished();
            break;
        case STATESTATUS::Interrupt:
            CastInterrupted();
            break;
        case STATESTATUS::ErrorRange:
        case STATESTATUS::ErrorInvalidTarget:
        case STATESTATUS::ErrorUnknown:
            TransitionBack();
            break;
        default:
            break;
    }
}

bool CAIBattle::CanChangeState()
{
    return CAIBase::CanChangeState() && (!actionStateContainer ||
        (actionStateContainer && actionStateContainer->CanChangeState()));
}

void CAIBattle::ChangeState(AIState state)
{
    actionStateContainer->Clear();
    actionStateContainer.reset();
    CAIBase::ChangeState(state);
}

void CAIBattle::TransitionBack()
{
    if (PEntity->animation == ANIMATION_ATTACK)
    {
        ChangeState(AIState::Attacking);
    }
    else
    {
        ChangeState(AIState::None);
    }
}

STATESTATUS CAIBattle::CanAttack()
{
    if (m_AttackTime < std::chrono::milliseconds(0))
    {
        float dist = distance(PEntity->loc.p, PBattleTarget->loc.p);

        if (dist > PBattleTarget->m_ModelSize)
        {
            return STATESTATUS::ErrorRange;
        }
        if (!isFaceing(PEntity->loc.p, PBattleTarget->loc.p, 40))
        {
            return STATESTATUS::ErrorFacing;
        }
        if (battleutils::IsParalyzed(static_cast<CBattleEntity*>(PEntity)))
        {
            return STATESTATUS::ErrorParalyzed;
        }
        if (battleutils::IsIntimidated(static_cast<CBattleEntity*>(PEntity), PBattleTarget))
        {
            return STATESTATUS::ErrorIntimidated;
        }
        return STATESTATUS::Finish;
    }
    return STATESTATUS::InProgress;
}

void CAIBattle::CastFinished()
{
    //create action, pass to luautils
    TransitionBack();
}

void CAIBattle::CastInterrupted()
{
    //TODO: push interrupt action packet
    action_t action;
    //PEntity->loc.zone->PushPacket(PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
    TransitionBack();
}

bool CAIBattle::ShouldDisengage()
{
    return PBattleTarget->isDead();
}