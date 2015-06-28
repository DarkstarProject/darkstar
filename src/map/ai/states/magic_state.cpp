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

#include "../../spell.h"

CMagicState::CMagicState(CBattleEntity* PEntity, CTargetFind& PTargetFind) :
    CState(PEntity, PTargetFind),
    m_PSpell(nullptr)
{
}

STATESTATUS CMagicState::Update(time_point tick)
{
    if (m_State == STATESTATUS::InProgress && 
        tick > m_startTime + m_castTime)
    {
        //complete cast
        m_State = STATESTATUS::Finish;
    }
    return m_State;
}

void CMagicState::Clear()
{
    if (m_State == STATESTATUS::InProgress)
    {
        //clean up (interrupt packet, etc)
    }
}

bool CMagicState::CanChangeState()
{
    return m_State != STATESTATUS::InProgress;
}

void CMagicState::Interrupt()
{
    m_State = m_State == STATESTATUS::InProgress ? STATESTATUS::Interrupt : m_State;
}

STATESTATUS CMagicState::CastSpell(uint16 spellid, uint16 targetid)
{
    m_PSpell = spell::GetSpell(spellid);

    if (m_PSpell)
    {
        m_PTarget = m_PTargetFind.getValidTarget(targetid, m_PSpell->getValidTarget());

        //calculate cast time

        m_State = STATESTATUS::InProgress;
    }
    else
    {
        m_State = STATESTATUS::Error;
    }
    return m_State;
}