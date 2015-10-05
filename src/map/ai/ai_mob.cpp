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
#include "../entities/mobentity.h"

void CAIMob::Internal_Disengage()
{
    auto PMob = static_cast<CMobEntity*>(PEntity);
    PathFind->Clear();

    if (PMob->getMobMod(MOBMOD_IDLE_DESPAWN))
    {
        PMob->SetDespawnTimer(PMob->getMobMod(MOBMOD_IDLE_DESPAWN));
    }

    PMob->delRageMode();
    PMob->m_OwnerID.clean();
    PMob->updatemask |= (UPDATE_STATUS | UPDATE_HP);
    PMob->CallForHelp(false);
    PMob->animation = ANIMATION_NONE;

    CAIBattle::Disengage();
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
