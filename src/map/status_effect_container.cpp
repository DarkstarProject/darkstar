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

#include "charutils.h"
#include "battleentity.h"
#include "charentity.h"
#include "itemutils.h"
#include "map.h"
#include "status_effect_container.h"
#include "zoneutils.h"
#include "petutils.h"

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
*                                                                       *
*  Получаем количество эффектов с указанным subid                       *
*                                                                       *
************************************************************************/

uint8 CStatusEffectContainer::GetEffectsCount(uint16 SubID)
{
    uint8 count = 0;

    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetSubID() == SubID)
        {
            count++;
        }
	}
    return count;
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
		if( m_POwner->health.maxhp != 0) //make sure we're not in the middle of logging in
		{
			m_POwner->UpdateHealth();
		}

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

			if( m_POwner->health.maxhp != 0) //make sure we're not in the middle of logging in
			{
				PChar->pushPacket(new CCharHealthPacket(PChar));
			}
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
	else
	{
		if (PStatusEffect->GetIcon() != 0 && ((PStatusEffect->GetFlag() & EFFECTFLAG_NO_LOSS_MESSAGE) == 0))
		{
			m_POwner->loc.zone->PushPacket(m_POwner, CHAR_INRANGE, new CMessageBasicPacket(m_POwner, m_POwner, PStatusEffect->GetIcon(), 0, 206));
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

bool CStatusEffectContainer::DelStatusEffectWithPower(EFFECT StatusID, uint16 power)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetPower() == power))
		{
			RemoveStatusEffect(i);
			return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Deletes all non-permanent status effects without sending messages 	*
*																		*
************************************************************************/
void CStatusEffectContainer::KillAllStatusEffect()
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		CStatusEffect* PStatusEffect = m_StatusEffectList.at(i);

		if( PStatusEffect->GetDuration() != 0){

			luautils::OnEffectLose(m_POwner, PStatusEffect);

			m_POwner->delModifiers(&PStatusEffect->modList);
			m_POwner->UpdateHealth();

			m_StatusEffectList.erase(m_StatusEffectList.begin() + i);

			delete PStatusEffect;
		}
	}
}

/************************************************************************
*																		*
*  Удаляем все эффекты с указанными иконками    						*
*																		*
************************************************************************/

void CStatusEffectContainer::DelStatusEffectsByIcon(uint16 IconID)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
        if (m_StatusEffectList.at(i)->GetIcon() == IconID)
		{
			RemoveStatusEffect(i--);
		}
	}
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
        if (m_StatusEffectList.at(i)->GetFlag() & flag)
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

EFFECT CStatusEffectContainer::EraseStatusEffect()
{
    std::vector<uint16> erasableList;
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_ERASABLE &&
            m_StatusEffectList.at(i)->GetDuration() > 0)
        {
            erasableList.push_back(i);
        }
    }
    if (!erasableList.empty())
    {
        uint16 rndIdx = rand() % erasableList.size();
        EFFECT result = m_StatusEffectList.at(erasableList.at(rndIdx))->GetStatusID();
        RemoveStatusEffect(erasableList.at(rndIdx));
        return result;
    }
    return EFFECT_NONE;
}

/*
Erases all negative status effects
returns number of erased effects
*/
uint8 CStatusEffectContainer::EraseAllStatusEffect()
{
    uint8 count = 0;
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_ERASABLE &&
            m_StatusEffectList.at(i)->GetDuration() > 0)
        {
            RemoveStatusEffect(i);
            count++;
        }
    }
    return count;
}

/************************************************************************
*																		*
*  Удаляем первый добавленный положительный эффект с флагом dispel.     *
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

EFFECT CStatusEffectContainer::DispelStatusEffect()
{
	std::vector<uint16>	dispelableList;
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_DISPELABLE &&
			m_StatusEffectList.at(i)->GetDuration() > 0)
		{
			dispelableList.push_back(i);
		}
	}
	if (!dispelableList.empty())
	{
		uint16 rndIdx = rand() % dispelableList.size();
		EFFECT result = m_StatusEffectList.at(dispelableList.at(rndIdx))->GetStatusID();
		RemoveStatusEffect(dispelableList.at(rndIdx));
		return result;
	}
	return EFFECT_NONE;
}

/*
Dispels all positive status effects
returns number of dispelled effects
*/
uint8 CStatusEffectContainer::DispelAllStatusEffect()
{
    uint8 count = 0;
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_DISPELABLE &&
            m_StatusEffectList.at(i)->GetDuration() > 0)
        {
            RemoveStatusEffect(i);
            count++;
        }
    }
    return count;
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
		Applies a bard song effect (after checking restrictions)
		Returns true if the effect is applied, false otherwise.
*************************************************************************/

bool CStatusEffectContainer::ApplyBardEffect(CStatusEffect* PStatusEffect, uint8 maxSongs)
{
	//break if not a BRD song.
	DSP_DEBUG_BREAK_IF(!(PStatusEffect->GetStatusID() >= EFFECT_REQUIEM &&
			PStatusEffect->GetStatusID() <= EFFECT_NOCTURNE));

	//if all match tier/id/effect then overwrite

	//if tier/effect match then overwrite //but id doesn't, NO EFFECT
	//if targ has <2 of your songs on, then just apply
	//if targ has 2 of your songs, remove oldest one and apply this one.

	uint8 numOfEffects = 0;
	CStatusEffect* oldestSong = NULL;
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_REQUIEM &&
			m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_NOCTURNE) //is a brd effect
		{
			if(m_StatusEffectList.at(i)->GetPower() == PStatusEffect->GetPower() &&
				m_StatusEffectList.at(i)->GetStatusID()==PStatusEffect->GetStatusID()){//same tier/type, overwrite
					//OVERWRITE
					DelStatusEffectWithPower(PStatusEffect->GetStatusID(),PStatusEffect->GetPower());
					AddStatusEffect(PStatusEffect);
					return true;
			}
			if(m_StatusEffectList.at(i)->GetSubID() == PStatusEffect->GetSubID()){//YOUR BRD effect
				numOfEffects++;
				if(oldestSong==NULL){
					oldestSong = m_StatusEffectList.at(i);
				}
				else if(m_StatusEffectList.at(i)->GetDuration() + m_StatusEffectList.at(i)->GetStartTime() <
					oldestSong->GetDuration() + oldestSong->GetStartTime()){
						oldestSong = m_StatusEffectList.at(i);
				}
			}
		}
	}

	if(numOfEffects<maxSongs){
		AddStatusEffect(PStatusEffect);
		return true;
	}
	else{
		//overwrite oldest
		DelStatusEffectWithPower(oldestSong->GetStatusID(),oldestSong->GetPower());
		AddStatusEffect(PStatusEffect);
		return true;
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
* Dispels one effect and returns it.
* Used in mob abilities
************************************************************************/

CStatusEffect* CStatusEffectContainer::StealStatusEffect()
{

    std::vector<uint16> dispelableList;
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_DISPELABLE &&
            m_StatusEffectList.at(i)->GetDuration() > 0)
        {
            dispelableList.push_back(i);
        }
	}
    if (!dispelableList.empty())
    {
        uint16 rndIdx = rand() % dispelableList.size();

        CStatusEffect* oldEffect = m_StatusEffectList.at(dispelableList.at(rndIdx));

        //make a copy
        CStatusEffect* whatever = new CStatusEffect(oldEffect->GetStatusID(), oldEffect->GetIcon(), oldEffect->GetPower(), oldEffect->GetTickTime(), oldEffect->GetDuration());

        RemoveStatusEffect(dispelableList.at(rndIdx));

        return whatever;
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
            if (icon >= 256)
            {
                m_Flags |= 1LL << (count * 2);
            }
            if (icon >= 512)
            {
                m_Flags |= 1LL << (count * 2 + 1);
            }
            m_StatusIcons[count] = icon;

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

	if (StatusEffect->GetSubID() == 0 || StatusEffect->GetSubID() > 20000 ||
		StatusEffect->GetStatusID()>=EFFECT_REQUIEM && StatusEffect->GetStatusID() <= EFFECT_NOCTURNE)
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

    // Calculate resist rates

	//todo: find a better place to put this?
	if(StatusEffect->GetStatusID() == EFFECT_SLEEP || StatusEffect->GetStatusID() == EFFECT_SLEEP_II ||
		StatusEffect->GetStatusID() == EFFECT_STUN || StatusEffect->GetStatusID() == EFFECT_PETRIFICATION || StatusEffect->GetStatusID() == EFFECT_LULLABY)
    {
		if(m_POwner->objtype == TYPE_PC || m_POwner->objtype == TYPE_MOB)
        {
			m_POwner->PBattleAI->SetCurrentAction(ACTION_SLEEP);
		}
	}
}

/************************************************************************
*																		*
*  Загружаем эффекты персонажа											*
*																		*
************************************************************************/

void CStatusEffectContainer::LoadStatusEffects()
{
    DSP_DEBUG_BREAK_IF(m_POwner->objtype != TYPE_PC);

	const int8* Query =
        "SELECT "
          "effectid,"
          "icon,"
          "power,"
          "tick,"
          "duration,"
          "subid,"
          "subpower,"
          "tier "
        "FROM char_effects "
        "WHERE charid = %u;";

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
				(uint16)Sql_GetUIntData(SqlHandle,5),
                (uint16)Sql_GetUIntData(SqlHandle,6),
                (uint16)Sql_GetUIntData(SqlHandle,7));

			AddStatusEffect(PStatusEffect);
		}
	}
    m_POwner->UpdateHealth(); // после загрузки эффектов пересчитываем максимальное количество HP/MP
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
			const int8* Query = "INSERT INTO char_effects (charid, effectid, icon, power, tick, duration, subid, subpower, tier) VALUES(%u,%u,%u,%u,%u,%u,%u,%u,%u);";

			Sql_Query(SqlHandle, Query,
				m_POwner->id,
				m_StatusEffectList.at(i)->GetStatusID(),
                m_StatusEffectList.at(i)->GetIcon(),
				m_StatusEffectList.at(i)->GetPower(),
				m_StatusEffectList.at(i)->GetTickTime() / 1000,
			   (m_StatusEffectList.at(i)->GetDuration() + m_StatusEffectList.at(i)->GetStartTime() - gettick()) / 1000,
				m_StatusEffectList.at(i)->GetSubID(),
                m_StatusEffectList.at(i)->GetSubPower(),
                m_StatusEffectList.at(i)->GetTier());
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

/************************************************************************
*																		*
*  Tick regen/refresh/regain effects									*
*																		*
************************************************************************/

void CStatusEffectContainer::CheckRegen(uint32 tick)
{
	DSP_DEBUG_BREAK_IF(m_POwner == NULL);

	if (!m_POwner->isDead())
	{
		if ((tick - m_RegenCheckTime) < 3000 )
		{
			return;
		}

		m_RegenCheckTime = tick;
		m_POwner->addHP(m_POwner->getMod(MOD_REGEN));


		if (m_POwner->getMod(MOD_AVATAR_PERPETUATION) > 0)
		{
			int8 perpetuation = m_POwner->getMod(MOD_AVATAR_PERPETUATION);

			if (m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_ASTRAL_FLOW))
				perpetuation = 0;
			else
			{
				if (m_POwner->PPet != NULL)
				{
					perpetuation -= charutils::AvatarPerpetuationReduction((CCharEntity*)m_POwner);

					if( perpetuation < 1 )
						perpetuation = 1;
				}
			}

			m_POwner->addMP(m_POwner->getMod(MOD_REFRESH) - perpetuation);

			if( m_POwner->health.mp == 0 )
			{
				petutils::DespawnPet(m_POwner);
			}

		}
		else
		{
			m_POwner->addMP(m_POwner->getMod(MOD_REFRESH));
		}

		m_POwner->addTP(m_POwner->getMod(MOD_REGAIN)/10.0);

		if( m_POwner->status !=  STATUS_DISAPPEAR)
		{
			charutils::UpdateHealth((CCharEntity*)m_POwner);
		}
    }


}