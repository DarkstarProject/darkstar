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

#include "ability_state.h"
#include "../ai_char.h"
#include "../../ability.h"
#include "../../entities/charentity.h"
#include "../../entities/mobentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"

CAbilityState::CAbilityState(CCharEntity* PEntity, uint16 targid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{

}

bool CAbilityState::StartAbility(uint16 abilityid)
{
    CAbility* PAbility = ability::GetAbility(abilityid);

    if (PAbility)
    {
        m_PAbility = std::make_unique<CAbility>(*PAbility);

        return true;
    }

    return false;
}

CAbility* CAbilityState::GetAbility()
{
    return m_PAbility.get();
}

void CAbilityState::ApplyEnmity()
{
    auto PTarget = GetTarget();
    if (m_PAbility->getValidTarget() & TARGET_ENEMY &&
        PTarget->allegiance != m_PEntity->allegiance)
    {
        if (PTarget->objtype == TYPE_MOB &&
            !(m_PAbility->getCE() == 0 && m_PAbility->getVE() == 0))
        {
            CMobEntity* mob = (CMobEntity*)PTarget;
            mob->m_OwnerID.id = m_PEntity->id;
            mob->m_OwnerID.targid = m_PEntity->targid;
            mob->updatemask |= UPDATE_STATUS;
            mob->PEnmityContainer->UpdateEnmity(m_PEntity, m_PAbility->getCE(), m_PAbility->getVE());
        }
    }
    else if (PTarget->allegiance == m_PEntity->allegiance)
    {
        battleutils::GenerateInRangeEnmity(m_PEntity, m_PAbility->getCE(), m_PAbility->getVE());
    }
}

bool CAbilityState::Update(time_point tick)
{
    action_t action;
    static_cast<CAIChar*>(m_PEntity->PAI.get())->OnAbility(*this, action);
    m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));

    return true;
}
