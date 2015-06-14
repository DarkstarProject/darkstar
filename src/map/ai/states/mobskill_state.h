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

#ifndef _CMOBSKILLSTATE_STATE_H
#define _CMOBSKILLSTATE_STATE_H

#include "state.h"
#include "../../entities/battleentity.h"

class CMobSkill;
class CMobEntity;

enum PICKSKILL {
  PICKSKILL_RANDOM = 0,
  PICKSKILL_AOE = 1,
  PICKSKILL_SINGLE = 2
};

class CMobSkillState : public CState
{
  public:
    CMobSkillState(CBattleEntity* PEntity, CTargetFind* PTargetFind);

    CMobSkill* PickSkill(PICKSKILL pickFlags);

    bool CanUseSkill(CMobSkill* PMobSkill, CBattleEntity* PTarget);

    // defaults to main job 2 hour
    bool CanUseTwoHour(CBattleEntity* PTarget, JOBTYPE job = JOB_NON);
    bool CanUseSpecial(CBattleEntity* PTarget);

    STATESTATUS UseSkill(CMobSkill* PMobSkill, CBattleEntity* PTarget);
    STATESTATUS UseTwoHour(CBattleEntity* PTarget, JOBTYPE job = JOB_NON);
    STATESTATUS UseSpecial(CBattleEntity* PTarget);

    void InterruptSkill();
    void FinishSkill();

    virtual STATESTATUS Update(uint32 tick);
    virtual void Clear();

    CMobSkill* GetSkill();

    bool IsUsing();

  private:
    CMobSkill* m_PMobSkill;
    CMobEntity* m_PMob;

    uint32 m_startTime;
    uint32 m_useTime;

    bool ValidUse();
};

#endif