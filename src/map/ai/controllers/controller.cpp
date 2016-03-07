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

#include "controller.h"

#include "../ai_container.h"
#include "../../entities/battleentity.h"

CController::CController(CBattleEntity* _POwner) :
    POwner(_POwner),
    m_Tick(server_clock::now())
{}

void CController::Despawn()
{
    if (POwner)
    {
        POwner->PAI->Internal_Despawn(0s);
    }
}

void CController::Reset()
{
}

void CController::Cast(uint16 targid, uint16 spellid)
{
    if (POwner)
    {
        POwner->PAI->Internal_Cast(targid, spellid);
    }
}

bool CController::Engage(uint16 targid)
{
    if (POwner)
    {
        return POwner->PAI->Internal_Engage(targid);
    }
    return false;
}

void CController::ChangeTarget(uint16 targid)
{
    if (POwner)
    {
        POwner->PAI->Internal_ChangeTarget(targid);
    }
}

void CController::Disengage()
{
    if (POwner)
    {
        POwner->PAI->Internal_Disengage();
    }
}

void CController::WeaponSkill(uint16 targid, uint16 wsid)
{
    if (POwner)
    {
        POwner->PAI->Internal_WeaponSkill(targid, wsid);
    }
}

bool CController::IsAutoAttackEnabled()
{
    return m_AutoAttackEnabled;
}

void CController::SetAutoAttackEnabled(bool enabled)
{
    m_AutoAttackEnabled = enabled;
}

bool CController::IsWeaponSkillEnabled()
{
    return m_WeaponSkillEnabled;
}

void CController::SetWeaponSkillEnabled(bool enabled)
{
    m_WeaponSkillEnabled = enabled;
}

bool CController::IsMagicCastingEnabled()
{
    return m_MagicCastingEnabled;
}

void CController::SetMagicCastingEnabled(bool enabled)
{
    m_MagicCastingEnabled = enabled;
}
