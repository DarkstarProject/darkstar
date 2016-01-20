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

#include "../common/utils.h"

#include "entities/battleentity.h"
#include "status_effect.h"
#include "status_effect_container.h"


CStatusEffect::CStatusEffect(EFFECT id, uint16 icon, uint16 power, uint32 tick, uint32 duration, uint32 subid, uint16 subPower, uint16 tier)
{
	m_StatusID = id;
    m_Type     = 0;
	m_SubID	   = subid;
    m_Icon     = icon;
	m_Power	   = power;
    m_SubPower = subPower;
    m_Tier     = tier;
	m_Flag	   = EFFECTFLAG_NONE;
	m_TickTime = tick * 1000;
	m_Duration = duration * 1000;
    m_POwner = nullptr;
}

CStatusEffect::~CStatusEffect()
{
	for (uint32 i = 0; i < modList.size(); ++i)
	{
		delete modList.at(i);
	}
}

const int8* CStatusEffect::GetName()
{
	return m_Name.c_str();
}

void CStatusEffect::SetOwner(CBattleEntity* Owner)
{
    m_POwner = Owner;
}

EFFECT CStatusEffect::GetStatusID()
{
	return m_StatusID;
}

CBattleEntity* CStatusEffect::GetOwner()
{
	return m_POwner;
}

uint32 CStatusEffect::GetSubID()
{
	return m_SubID;
}

uint16 CStatusEffect::GetType()
{
    return m_Type;
}

uint16 CStatusEffect::GetIcon()
{
	return m_Icon;
}

uint16 CStatusEffect::GetPower()
{
	return m_Power;
}

uint16 CStatusEffect::GetSubPower()
{
    return m_SubPower;
}

uint16 CStatusEffect::GetTier()
{
    return m_Tier;
}

uint32 CStatusEffect::GetFlag()
{
	return m_Flag;
}

uint32 CStatusEffect::GetTickTime()
{
	return m_TickTime;
}

uint32 CStatusEffect::GetDuration()
{
	return m_Duration;
}

time_point CStatusEffect::GetStartTime()
{
	return m_StartTime;
}

time_point CStatusEffect::GetLastTick()
{
	return m_LastTick;
}

void CStatusEffect::SetFlag(uint32 Flag)
{
    m_Flag |= Flag;
}

void CStatusEffect::UnsetFlag(uint32 flag)
{
    m_Flag &= ~flag;
}

void CStatusEffect::SetIcon(uint16 Icon)
{
    DSP_DEBUG_BREAK_IF(m_POwner == nullptr);

	m_Icon = Icon;
    m_POwner->StatusEffectContainer->UpdateStatusIcons();
}

void CStatusEffect::SetType(uint16 Type)
{
    m_Type = Type;
}

void CStatusEffect::SetPower(uint16 Power)
{
	m_Power = Power;
}

void CStatusEffect::SetSubPower(uint16 subPower)
{
    m_SubPower = subPower;
}

void CStatusEffect::SetTier(uint16 tier)
{
    m_Tier = tier;
}

void CStatusEffect::SetDuration(uint32 Duration)
{
	m_Duration = Duration;
}

void CStatusEffect::SetStartTime(time_point StartTime)
{
	m_LastTick  = StartTime;
	m_StartTime = StartTime;
}

void CStatusEffect::SetLastTick(time_point LastTick)
{
	m_LastTick = LastTick;
}

void CStatusEffect::SetTickTime(uint32 tick)
{
	m_TickTime = tick;
}

void CStatusEffect::SetName(const int8* name)
{
	m_Name.clear();
	m_Name.insert(0,name);
}

void CStatusEffect::SetName(string_t name)
{
	m_Name = name;
}

void CStatusEffect::addMod(uint16 modType, int16 amount)
{
	for (uint32 i = 0; i < modList.size(); ++i)
	{
		if (modList.at(i)->getModID() == modType)
		{
			modList.at(i)->setModAmount(modList.at(i)->getModAmount() + amount);
			return;
		}
	}
	modList.push_back(new CModifier(modType, amount));
}