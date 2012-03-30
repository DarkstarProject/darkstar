/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../common/showmsg.h"
#include "../common/timer.h"

#include <string.h>

#include "lua/luautils.h"

#include "packets/char_health.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/message_basic.h"

#include "battleentity.h" 
#include "charentity.h"
#include "mobentity.h"
#include "itemutils.h"
#include "map.h"
#include "status_effect_container.h"
#include "zoneutils.h"

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

namespace effects
{
    /************************************************************************
    *                                                                       *
    *  Контейнер параметров эффектов                                        *
    *                                                                       *
    ************************************************************************/

    struct EffectParams_t
    {
        uint16   Flag;
        string_t Name;
    };

    EffectParams_t EffectsParams[MAX_EFFECTID];

    /************************************************************************
    *                                                                       *
    *                                                                       *
    *                                                                       *
    ************************************************************************/

    void LoadEffectsParameters()
    {
        for (uint16 i = 0; i < MAX_EFFECTID; ++i)
        {
            EffectsParams[i].Flag = 0;
        }

        int32 ret = Sql_Query(SqlHandle, "SELECT id, name, flags FROM status_effects WHERE id < %u", MAX_EFFECTID);

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		    {
                uint16 EffectID = (uint16)Sql_GetIntData(SqlHandle,0);

                EffectsParams[EffectID].Name = Sql_GetData(SqlHandle,1);
                EffectsParams[EffectID].Flag = Sql_GetIntData(SqlHandle,2);
            }
        }
    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CStatusEffectContainer::CStatusEffectContainer(CBattleEntity* PEntity) 
	: m_POwner(PEntity)
{
    DSP_DEBUG_BREAK_IF(m_POwner == NULL);

	m_Flags = 0;
	m_EffectCheckTime = gettick();
	m_StatusEffectList.reserve(32);

	memset(m_StatusIcons, EFFECT_NONE, sizeof(m_StatusIcons));
}

CStatusEffectContainer::~CStatusEffectContainer()
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		delete m_StatusEffectList.at(i);
	}
}

/************************************************************************
*																		*
*  Добавляем статус-эффект в контейнер									*
*  Если не ошибаюсь, то максимально-возможное количество эффектов 32 	*
*																		*
************************************************************************/

void CStatusEffectContainer::AddStatusEffect(CStatusEffect* PStatusEffect)
{
	if(PStatusEffect != NULL) 
	{
		SetEffectParams(PStatusEffect);

        PStatusEffect->SetOwner(m_POwner);
		PStatusEffect->SetStartTime(gettick());

        luautils::OnEffectGain(m_POwner, PStatusEffect);

        m_POwner->addModifiers(&PStatusEffect->modList);
        m_POwner->UpdateHealth();

		m_StatusEffectList.push_back(PStatusEffect);

		if (m_POwner->objtype == TYPE_PC)
        {
            CCharEntity* PChar = (CCharEntity*)m_POwner;

            if (PStatusEffect->GetIcon() != 0)
            {
                UpdateStatusIcons();
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PStatusEffect->GetIcon(), 0, 205));
            }
            if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

            PChar->pushPacket(new CCharHealthPacket(PChar));
            PChar->pushPacket(new CCharSyncPacket(PChar));
        }
	}
}

/************************************************************************
*																		*
*  Эффекты во всех методах удаляются одинаково, вынес этот код в		*
*  отдельную функцию. Удаляем иконки только у CharEntity.				*
*																		*
************************************************************************/

void CStatusEffectContainer::RemoveStatusEffect(uint32 id)
{
    CStatusEffect* PStatusEffect = m_StatusEffectList.at(id);

    luautils::OnEffectLose(m_POwner, PStatusEffect);

    m_POwner->delModifiers(&PStatusEffect->modList);
    m_POwner->UpdateHealth();

    m_StatusEffectList.erase(m_StatusEffectList.begin() + id);

    if (m_POwner->objtype == TYPE_PC)
    {
        CCharEntity* PChar = (CCharEntity*)m_POwner;

        if (PStatusEffect->GetIcon() != 0)
        {
            UpdateStatusIcons();
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PStatusEffect->GetIcon(), 0, 206));
        }
        if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

        PChar->pushPacket(new CCharHealthPacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }
	else if(m_POwner->objtype == TYPE_MOB)
	{
		CMobEntity* PMob = (CMobEntity*)m_POwner;
		if (PStatusEffect->GetIcon() != 0)
		{
			PMob->loc.zone->PushPacket(PMob,CHAR_INRANGE,new CMessageBasicPacket(PMob, PMob, PStatusEffect->GetIcon(), 0, 206));
		}
	}
    delete PStatusEffect;
}

/************************************************************************
*																		*
*  Удаляем статус-эффект по его основному и дополнительному типам.		*
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

bool CStatusEffectContainer::DelStatusEffect(EFFECT StatusID) 
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID)
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

bool CStatusEffectContainer::DelStatusEffect(EFFECT StatusID, uint16 SubID) 
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetSubID() == SubID))
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

/************************************************************************
*                                                                       *
*  Удаляем все эффекты с указанными флагами                             *
*                                                                       *
************************************************************************/

void CStatusEffectContainer::DelStatusEffectsByFlag(uint16 flag)
{
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
        if ((m_StatusEffectList.at(i)->GetFlag() & flag) == flag)
		{
			RemoveStatusEffect(i--);
		}
	}
}

/************************************************************************
*																		*
*  Удаляем первый добавленный отрицательный эффект с флагом	erase.      *
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

bool CStatusEffectContainer::EraseStatusEffect()
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetFlag() == EFFECTFLAG_ERASABLE)
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Удаляем первый добавленный положительный эффект с флагом dispel.     *
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

bool CStatusEffectContainer::DispelStatusEffect()
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetFlag() == EFFECTFLAG_DISPELABLE)
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Проверяем наличие статус-эффекта	в контейнере						*
*																		*
************************************************************************/

bool CStatusEffectContainer::HasStatusEffect(EFFECT StatusID)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
        if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
            m_StatusEffectList.at(i)->GetIcon() != 0)
		{
			return true;
		}
	}
	return false;
}

/************************************************************************
*                                                                       *
*  Проверяем наличие статус-эффекта	в контейнере с уникальным subid     *
*                                                                       *
************************************************************************/

bool CStatusEffectContainer::HasStatusEffect(EFFECT StatusID, uint16 SubID)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetSubID() == SubID))
		{
			return true;
		}
	}
	return false;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CStatusEffect* CStatusEffectContainer::GetStatusEffect(EFFECT StatusID, uint16 SubID)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetSubID() == SubID))
		{
			return m_StatusEffectList[i];
		}
	}
	return 0;
}

/************************************************************************
*                                                                       *
*  Пересчитываем иконки всех эфффектов                                  *
*                                                                       *
************************************************************************/

void CStatusEffectContainer::UpdateStatusIcons()
{
    if (m_POwner->objtype != TYPE_PC) return;

    m_Flags = 0;
    memset(m_StatusIcons, EFFECT_NONE, sizeof(m_StatusIcons));
 
    uint8 count = 0;

    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
        uint16 icon = m_StatusEffectList.at(i)->GetIcon();

        if (icon != 0)
        {
            m_Flags |= ((icon >= 256) << count);
            m_StatusIcons[count] = icon & 255;

            if (++count == 32) break;
        }
	}
    ((CCharEntity*)m_POwner)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_POwner));
}

/************************************************************************
*                                                                       *
*  Устанавливаем имя эффекта для работы со скриптами                    *
*                                                                       *
************************************************************************/

void CStatusEffectContainer::SetEffectParams(CStatusEffect* StatusEffect)
{
    DSP_DEBUG_BREAK_IF(StatusEffect->GetStatusID() >= MAX_EFFECTID);
    DSP_DEBUG_BREAK_IF(StatusEffect->GetStatusID() == EFFECT_FOOD && StatusEffect->GetSubID() == 0);
    DSP_DEBUG_BREAK_IF(StatusEffect->GetStatusID() == EFFECT_NONE && StatusEffect->GetSubID() == 0);

    string_t name;

	if (StatusEffect->GetSubID() == 0 || StatusEffect->GetSubID() > 20000)
	{
		name.insert(0, "globals/effects/");
        name.insert(name.size(), effects::EffectsParams[StatusEffect->GetStatusID()].Name);
	} else {
		CItem* Ptem = itemutils::GetItemPointer(StatusEffect->GetSubID());
		if (Ptem != NULL)
		{
            name.insert(0, "globals/items/");
			name.insert(name.size(), Ptem->getName());
		}
	}
    StatusEffect->SetName(name);
    StatusEffect->SetFlag(effects::EffectsParams[StatusEffect->GetStatusID()].Flag);
}

/************************************************************************
*																		*
*  Загружаем эффекты персонажа											*
*																		*
************************************************************************/

void CStatusEffectContainer::LoadStatusEffects()
{
    DSP_DEBUG_BREAK_IF(m_POwner->objtype != TYPE_PC);

	const int8* Query = "SELECT effectid, icon, power, tick, duration, subid \
						 FROM char_effects \
						 WHERE charid = %u;";

	int32 ret = Sql_Query(SqlHandle, Query, m_POwner->id);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			CStatusEffect* PStatusEffect = new CStatusEffect(
				(EFFECT)Sql_GetUIntData(SqlHandle,0),
                (uint16)Sql_GetUIntData(SqlHandle,1),
				(uint16)Sql_GetUIntData(SqlHandle,2),
				(uint32)Sql_GetUIntData(SqlHandle,3),
				(uint32)Sql_GetUIntData(SqlHandle,4),
				(uint16)Sql_GetUIntData(SqlHandle,5));

			AddStatusEffect(PStatusEffect);
		}
	}
}

/************************************************************************
*																		*
*  Сохраняем временные эффекты персонажа								*								
*																		*
************************************************************************/

void CStatusEffectContainer::SaveStatusEffects()
{
    DSP_DEBUG_BREAK_IF(m_POwner->objtype != TYPE_PC);

	Sql_Query(SqlHandle,"DELETE FROM char_effects WHERE charid = %u", m_POwner->id);

	for (uint32 i = 0; i < m_StatusEffectList.size(); ++i) 
	{
		if (m_StatusEffectList.at(i)->GetDuration() != 0)
		{
			const int8* Query = "INSERT INTO char_effects (charid, effectid, icon, power, tick, duration, subid) VALUES(%u,%u,%u,%u,%u,%u,%u);";

			Sql_Query(SqlHandle, Query,
				m_POwner->id,
				m_StatusEffectList.at(i)->GetStatusID(),
                m_StatusEffectList.at(i)->GetIcon(),
				m_StatusEffectList.at(i)->GetPower(),
				m_StatusEffectList.at(i)->GetTickTime() / 1000,
			   (m_StatusEffectList.at(i)->GetDuration() + m_StatusEffectList.at(i)->GetStartTime() - gettick()) / 1000,
				m_StatusEffectList.at(i)->GetSubID());
		}
	}
}

/************************************************************************
*																		*
*  Проверяем все эффекты на необходимость удаление, если их срок		*
*  действия истек.														*
*																		*
************************************************************************/

void CStatusEffectContainer::CheckEffects(uint32 tick)
{
	DSP_DEBUG_BREAK_IF(m_POwner == NULL);
	
	if (!m_POwner->isDead()) 
	{
		if ((tick - m_EffectCheckTime) < 1000 )
		{
			return;
		}

		m_EffectCheckTime = tick;

		for (uint16 i = 0; i < m_StatusEffectList.size(); ++i) 
		{
			CStatusEffect* PStatusEffect = m_StatusEffectList.at(i);

			if (PStatusEffect->GetTickTime() != 0 &&
				PStatusEffect->GetLastTick() + PStatusEffect->GetTickTime() <= tick) 
			{
				PStatusEffect->SetLastTick(tick);
				luautils::OnEffectTick(m_POwner,PStatusEffect);
			}

			if (PStatusEffect->GetDuration() != 0 &&
				PStatusEffect->GetDuration() + PStatusEffect->GetStartTime() <= tick) 
			{	
				RemoveStatusEffect(i--);
			}
		}
    }
}