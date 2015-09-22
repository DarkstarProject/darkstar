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

CWeaponskillState::CWeaponskillState(CCharEntity* PChar, uint16 targid) :
    CWeaponskillState(PChar, targid, 0s)
{}

CWeaponskillState::CWeaponskillState(CMobEntity* PMob, uint16 targid) :
    CWeaponskillState(PMob, targid, 4s)
{}

CWeaponskillState::CWeaponskillState(CBattleEntity* PEntity, uint16 targid, duration casttime) :
    CState(PEntity, targid),
    m_PEntity(PEntity),
    m_finishTime(server_clock::now() + casttime),
    m_PWeaponskill(nullptr)
{}

bool CWeaponskillState::StartWeaponskill(uint16 wsid)
{
    CWeaponSkill* PWeaponskill = battleutils::GetWeaponSkill(wsid);

    if (PWeaponskill)
    {
        m_PWeaponskill = std::make_unique<CWeaponSkill>(*PWeaponskill);
    }

    return false;
}

CWeaponSkill * CWeaponskillState::GetWeaponSkill()
{
    return m_PWeaponskill.get();
}

bool CWeaponskillState::Update(time_point tick)
{
    if (tick > m_finishTime)
    {
        action_t action;
        m_PEntity->PAIBattle()->OnWeaponskillFinished(action);

        return true;
    }
    return false;
}
