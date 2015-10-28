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

#include "ai_mob.h"
#include "states/weaponskill_state.h"
#include "../mobskill.h"
#include "../weapon_skill.h"
#include "../entities/mobentity.h"
#include "../packets/entity_update.h"

CAIMob::CAIMob(CBattleEntity* _PEntity, std::unique_ptr<CPathFind>&& _Pathfind, std::unique_ptr<CController>&& _Controller) :
    CAIBattle(_PEntity, std::forward<std::unique_ptr<CPathFind>>(_Pathfind),
        std::forward<std::unique_ptr<CController>>(_Controller))
{}

void CAIMob::Internal_Disengage()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PathFind->Clear();

    if (PMob->getMobMod(MOBMOD_IDLE_DESPAWN))
    {
        PMob->SetDespawnTime(std::chrono::milliseconds(PMob->getMobMod(MOBMOD_IDLE_DESPAWN)));
    }

    PMob->delRageMode();
    PMob->m_OwnerID.clean();
    PMob->updatemask |= (UPDATE_STATUS | UPDATE_HP);
    PMob->CallForHelp(false);
    PMob->animation = ANIMATION_NONE;

    CAIBattle::Internal_Disengage();
}

bool CAIMob::Internal_WeaponSkill(uint16 targid, uint16 wsid)
{
    if (CanChangeState())
    {
        if (ChangeState<CWeaponSkillState>(static_cast<CBattleEntity*>(PEntity), targid))
        {
            if (PEntity->look.size == MODEL_EQUIPED)
            {
                return static_cast<CWeaponSkillState*>(GetCurrentState())->StartWeaponSkill(wsid);
            }
            else
            {
                return static_cast<CWeaponSkillState*>(GetCurrentState())->StartMobSkill(wsid);
            }
        }
    }
    return false;
}

void CAIMob::OnWeaponSkillFinished(CWeaponSkillState&, action_t&)
{
    //#TODO
}

bool CAIMob::IsAutoAttackEnabled()
{
    return m_AutoAttackEnabled;
}

void CAIMob::SetAutoAttackEnabled(bool enabled)
{
    m_AutoAttackEnabled = enabled;
}

bool CAIMob::IsWeaponSkillEnabled()
{
    return m_WeaponSkillEnabled;
}

void CAIMob::SetWeaponSkillEnabled(bool enabled)
{
    m_WeaponSkillEnabled = enabled;
}

void CAIMob::OnDisengage()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PathFind->Clear();
    PMob->PEnmityContainer->Clear();

    if (PMob->getMobMod(MOBMOD_IDLE_DESPAWN))
    {
        PMob->SetDespawnTime(std::chrono::milliseconds(PMob->getMobMod(MOBMOD_IDLE_DESPAWN)));
    }
    // this will let me decide to walk home or despawn
    PMob->m_neutral = true;

    PMob->delRageMode();
    PMob->m_OwnerID.clean();

    CAIBattle::OnDisengage();

    luautils::OnMobDisengage(PMob);
}
