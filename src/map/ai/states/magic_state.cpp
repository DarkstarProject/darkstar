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

#include "magic_state.h"

#include "../ai_battle.h"
#include "../../spell.h"
#include "../../lua/luautils.h"
#include "../../utils/battleutils.h"

CMagicState::CMagicState(CBattleEntity* PEntity, CTargetFind& PTargetFind) :
    CState(PEntity, PTargetFind),
    m_PSpell(nullptr)
{
}

STATESTATUS CMagicState::Update(time_point tick)
{
    if (tick > m_startTime + m_castTime)
    {
        if (m_State == STATESTATUS::InProgress)
        {
            //complete cast
            m_State = STATESTATUS::Finish;
        }
        return m_State;
    }
    return STATESTATUS::InProgress;
}

void CMagicState::Clear()
{
    if (m_State == STATESTATUS::InProgress)
    {
        dynamic_cast<CAIBattle*>(m_PEntity->PAI.get())->CastInterrupted();
    }
}

bool CMagicState::CanChangeState()
{
    return m_State != STATESTATUS::InProgress;
}

int16 CMagicState::GetErrorMsg()
{
    return m_errorMsg;
}

CSpell* CMagicState::GetSpell()
{
    return m_PSpell;
}

bool CMagicState::CanCastSpell()
{
    //TODO - check permissions, requirements (level, learned, correct buff, etc)
    return true;
}

bool CMagicState::ValidTarget()
{
    //TODO - check target type vs valid targets
    return true;
}

//TODO: TryInterrupt 
void CMagicState::Interrupt()
{
    m_State = m_State == STATESTATUS::InProgress ? STATESTATUS::Interrupt : m_State;
}

STATESTATUS CMagicState::CastSpell(uint16 spellid, uint16 targetid)
{
    m_PSpell = spell::GetSpell(spellid);

    if (m_PSpell)
    {
        if (!CanCastSpell())
        {
            return STATESTATUS::ErrorNotUsable;
        }

        m_PTarget = m_PTargetFind.getValidTarget(targetid, m_PSpell->getValidTarget());

        if (!ValidTarget())
        {
            return STATESTATUS::ErrorInvalidTarget;
        }

        if (distance(m_PEntity->loc.p, m_PTarget->loc.p) > m_PSpell->getMaxRange())
        {
            return STATESTATUS::ErrorRange;
        }

        m_errorMsg = luautils::OnMagicCastingCheck(m_PEntity, m_PTarget, m_PSpell);
        if (m_errorMsg)
        {
            return STATESTATUS::ErrorScripted;
        }

        m_startTime = server_clock::now();
        m_castTime = std::chrono::milliseconds(battleutils::CalculateSpellCastTime(m_PEntity, m_PSpell));

        m_State = STATESTATUS::InProgress;
    }
    else
    {
        m_State = STATESTATUS::ErrorUnknown;
    }
    return m_State;
}