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

#ifndef _CTRUSTABILITY_STATE_H
#define _CTRUSTABILITY_STATE_H

#include "state.h"
#include "../../ability.h"
#include "../../mobskill.h"

class CTrustEntity;

class CTrustAbilityState : public CState
{
public:
    CTrustAbilityState(CTrustEntity* PEntity, uint16 targid, uint16 abilityid);

    CMobSkill* GetAbility();

    //void ApplyEnmity();

protected:
    virtual bool CanChangeState() override;
    virtual bool CanFollowPath() override { return true; }
    virtual bool CanInterrupt() override { return true; }
    virtual bool Update(time_point tick) override;
    virtual void Cleanup(time_point tick) override;
    void SpendCost();

    bool CanUseAbility();

private:
    duration m_castTime {0s};
    time_point m_finishTime;
    CTrustEntity* const m_PEntity;
    std::unique_ptr<CMobSkill> m_PAbility;
    int16 m_spentTP;
};


#endif
