/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "mobskill_state.h"
#include "../../mobskill.h"
#include "../../entities/mobentity.h"

CMobSkillState::CMobSkillState(CBattleEntity* PEntity, CTargetFind* PTargetFind)
: CState(PEntity, PTargetFind)
{
  m_PMob = (CMobEntity*)PEntity;

  m_PMobSkill = NULL;
  m_startTime = 0;
  m_useTime = 0;
}

CMobSkill* CMobSkillState::PickSkill(PICKSKILL pickFlags = PICKSKILL_RANDOM)
{
  // pick and return a random skill
  return NULL;
}

bool CMobSkillState::CanUseSkill(CMobSkill* PMobSkill, CBattleEntity* PTarget)
{
  return false;
}

bool CMobSkillState::CanUseTwoHour(CBattleEntity* PTarget, JOBTYPE job)
{
  return false;
}

STATESTATUS CMobSkillState::UseSkill(CMobSkill* PMobSkill, CBattleEntity* PTarget)
{
  return STATESTATUS_ERROR;
}

STATESTATUS CMobSkillState::UseTwoHour(CBattleEntity* PTarget, JOBTYPE job)
{
  return STATESTATUS_ERROR;
}

void CMobSkillState::InterruptSkill()
{

}

void CMobSkillState::FinishSkill()
{

}

STATESTATUS CMobSkillState::Update(uint32 tick)
{
  if(CState::Update(tick) == STATESTATUS_ERROR || !CheckValidTarget(m_PTarget))
  {
    return STATESTATUS_ERROR;
  }

  if(m_startTime == 0) m_startTime = tick;

  if(tick - m_startTime >= m_useTime)
  {
    if(CheckInterrupt())
    {
      return STATESTATUS_INTERRUPT;
    }
    else
    {
      return STATESTATUS_FINISH;
    }
  }

  return STATESTATUS_TICK;
}

void CMobSkillState::Clear()
{
  CState::Clear();

  m_PMobSkill = NULL;
}

CMobSkill* CMobSkillState::GetSkill()
{
  return m_PMobSkill;
}

bool CMobSkillState::IsUsing()
{
  return m_PMobSkill != NULL;
}

bool CMobSkillState::CheckInterrupt()
{
  return !ValidUse();
}

bool CMobSkillState::ValidUse()
{
  return true;
}