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

#include "range_state.h"
#include "../ai_battle.h"
#include "../../entities/charentity.h"
#include "../../packets/action.h"
#include "../../utils/battleutils.h"
#include "../../mobskill.h"
#include "../../weapon_skill.h"
#include "../../items/item_weapon.h"
#include "../../status_effect_container.h"

CRangeState::CRangeState(CCharEntity* PEntity, uint16 targid) :
    CState(PEntity, targid),
    m_PEntity(PEntity)
{}

bool CRangeState::StartRangedAttack()
{
    auto PTarget = m_PEntity->PAIBattle()->IsValidTarget(m_targid, TARGET_ENEMY, m_errorMsg);
    if (!CanUseRangedAttack(PTarget))
    {
        return false;
    }
    return true;
}

void CRangeState::SpendCost()
{
}

bool CRangeState::CanChangeState()
{
    return IsCompleted();
}

bool CRangeState::Update(time_point tick)
{
    if (tick > m_finishTime && !IsCompleted())
    {
        action_t action;
        //m_PEntity->PAIBattle()->OnWeaponSkillFinished(*this, action);
        m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        Complete();
    }

    if (IsCompleted() && tick > m_finishTime + 2s)
    {
        return true;
    }
    return false;
}

void CRangeState::Cleanup(time_point tick)
{

}

bool CRangeState::CanUseRangedAttack(CBattleEntity* PTarget)
{
    CItemWeapon* PRanged = (CItemWeapon*)m_PEntity->getEquip(SLOT_RANGED);
    CItemWeapon* PAmmo = (CItemWeapon*)m_PEntity->getEquip(SLOT_AMMO);

    if (!(PRanged && PRanged->isType(ITEM_WEAPON) ||
        PAmmo && PAmmo->isThrowing()))
    {
        m_errorMsg = std::make_unique<CMessageBasicPacket>(m_PEntity, m_PEntity, 0, 0, MSGBASIC_NO_RANGED_WEAPON);
        return false;
    }

    auto SkillType = PRanged ? PRanged->getSkillType() : PAmmo->getSkillType();

    switch (SkillType)
    {
        case SKILL_THR:
        {
            // remove barrage, doesn't work here
            m_PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE);
            break;
        }
        case SKILL_ARC:
        case SKILL_MRK:
        {
            PRanged = (CItemWeapon*)m_PEntity->getEquip(SLOT_AMMO);
            if (PRanged != nullptr && PRanged->isType(ITEM_WEAPON))
            {
                break;
            }
        }
        default:
        {
            m_errorMsg = std::make_unique<CMessageBasicPacket>(m_PEntity, m_PEntity, 0, 0, MSGBASIC_NO_RANGED_WEAPON);
            return false;
        }
    }
    return true;
}
