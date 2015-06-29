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

#include "../entities/battleentity.h"
#include "../spell.h"
#include "states/magic_state.h"

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
        actionStateContainer = std::unique_ptr<CState>(new CMagicState(dynamic_cast<CBattleEntity*>(PEntity), targetFind));

        STATESTATUS status = dynamic_cast<CMagicState*>(actionStateContainer.get())->CastSpell(spellid, targetid);

        if (status != STATESTATUS::InProgress)
        {
            //MagicStartError();
        }
    }
}

void CAIBattle::ActionAttacking()
{
}

void CAIBattle::ActionCasting()
{
    STATESTATUS status = actionStateContainer->Update(m_Tick);

    if (status == STATESTATUS::Interrupt)
    {
        //push packet, reset to whatever previous state
    }
    else if (status == STATESTATUS::Error)
    {
        //reset to previous state
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