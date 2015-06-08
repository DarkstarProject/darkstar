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

#include "entities/battleentity.h"

#include "latent_effect.h"
#include "lua/luautils.h"
#include "entities/charentity.h"

CLatentEffect::CLatentEffect(LATENT conditionsId, uint16 conditionsValue, uint8 slot, uint16 modValue, int16 modPower)
{
    m_ConditionsID      = conditionsId;
    m_ConditionsValue   = conditionsValue;
    m_SlotID            = slot;
    m_ModValue          = modValue;
    m_ModPower          = modPower;
    m_Activated         = false;
}

CLatentEffect::~CLatentEffect()
{
}

LATENT CLatentEffect::GetConditionsID()
{
    return m_ConditionsID;
}

uint16 CLatentEffect::GetConditionsValue()
{
    return m_ConditionsValue;
}

uint8 CLatentEffect::GetSlot()
{
    return m_SlotID;
}

uint16 CLatentEffect::GetModValue()
{
    return m_ModValue;
}

int16 CLatentEffect::GetModPower()
{
    return m_ModPower;
}

bool CLatentEffect::IsActivated()
{
    return m_Activated;
}

CBattleEntity* CLatentEffect::GetOwner()
{
    return m_POwner;
}

void CLatentEffect::SetConditionsId(LATENT id)
{
    m_ConditionsID = id;
}

void CLatentEffect::SetConditionsValue(uint16 value)
{
    m_ConditionsValue = value;
}

void CLatentEffect::SetSlot(uint8 slot)
{
    m_SlotID = slot;
}

void CLatentEffect::SetModValue(uint16 value)
{
    m_ModValue = value;
}

void CLatentEffect::SetModPower(int16 power)
{
    m_ModPower = power;
}

void CLatentEffect::Activate()
{
    if( !IsActivated() )
    {
        luautils::ActivateLatent((CCharEntity*)m_POwner, this);
        m_Activated = true;
        //printf("LATENT ACTIVATED: %d, Current value: %d\n", m_ModValue, m_POwner->getMod(m_ModValue));
    }
}

void CLatentEffect::Deactivate()
{
    if( IsActivated() )
    {
        luautils::DeactivateLatent((CCharEntity*)m_POwner, this);
        m_Activated = false;
        //printf("LATENT DEACTIVATED: %d\n", m_ModValue);
    }
}

void CLatentEffect::SetOwner(CBattleEntity* Owner)
{
    m_POwner = Owner;
}
