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

The StatusEffeectContainer manages status effects on battleentities.

When a status effect is gained twice on a player. It can do one or more of the following:

1 Overwrite if equal or higher (protect)
2 Overwrite if higher (blind)
3 Can only have one of type (physical shield, magic shield)
4 Overwrite if equal or stronger than negative (defense boost, defense down)

*/

#include "../common/showmsg.h"
#include "../common/timer.h"

#include <string.h>

#include "lua/luautils.h"

#include "packets/char_health.h"
#include "packets/char_job_extra.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/message_basic.h"

#include "utils/charutils.h"
#include "entities/battleentity.h"
#include "entities/charentity.h"
#include "utils/itemutils.h"
#include "map.h"
#include "status_effect_container.h"
#include "utils/zoneutils.h"
#include "utils/petutils.h"
#include "utils/puppetutils.h"
#include "utils/battleutils.h"

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

    // Default effect of statuses are overwrite if equal or higher
    struct EffectParams_t
    {
        uint32   Flag;
        string_t Name;
        // type will erase all other effects that match
        // example: en- spells, spikes
        uint16   Type;
        // Negative means the new effect can only land if the negative id is weaker
        // example: haste, slow
        EFFECT   NegativeId;
        // only overwrite its self if the new effect is equal or higher / higher than current
        // example: protect, blind
        EFFECTOVERWRITE   Overwrite;
        // If this status effect is on the user, it will not take effect
        // example: lullaby will not take effect with sleep I
        EFFECT   BlockId;
        // Will always remove this effect when landing
        EFFECT   RemoveId;
        // status effect element, used in resistances
        uint8    Element;

        // minimum duration. IE: stun cannot last less than 1 second
        uint32    MinDuration;
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

        int32 ret = Sql_Query(SqlHandle, "SELECT id, name, flags, type, negative_id, overwrite, block_id, remove_id, element, min_duration FROM status_effects WHERE id < %u", MAX_EFFECTID);

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		    {
                uint16 EffectID = (uint16)Sql_GetIntData(SqlHandle,0);

                EffectsParams[EffectID].Name = Sql_GetData(SqlHandle,1);
                EffectsParams[EffectID].Flag = Sql_GetIntData(SqlHandle,2);
                EffectsParams[EffectID].Type = Sql_GetIntData(SqlHandle,3);
                EffectsParams[EffectID].NegativeId = (EFFECT)Sql_GetIntData(SqlHandle,4);
                EffectsParams[EffectID].Overwrite = (EFFECTOVERWRITE)Sql_GetIntData(SqlHandle,5);
                EffectsParams[EffectID].BlockId = (EFFECT)Sql_GetIntData(SqlHandle,6);
                EffectsParams[EffectID].RemoveId = (EFFECT)Sql_GetIntData(SqlHandle,7);

                EffectsParams[EffectID].Element = Sql_GetIntData(SqlHandle,8);
                // convert from second to millisecond
                EffectsParams[EffectID].MinDuration = Sql_GetIntData(SqlHandle,9) * 1000;
            }
        }
    }

    // hacky way to get element from status effect
    uint16 GetEffectElement(uint16 effect)
    {
        return EffectsParams[effect].Element;
    }
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CStatusEffectContainer::CStatusEffectContainer(CBattleEntity* PEntity)
{
    m_POwner = PEntity;
    DSP_DEBUG_BREAK_IF(m_POwner == nullptr);

       m_RegenCheckTime = 0;
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
*  Получаем количество эффектов с указанным id                          *
*                                                                       *
************************************************************************/

uint8 CStatusEffectContainer::GetEffectsCount(EFFECT ID)
{
    uint8 count = 0;

    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == ID)
        {
            count++;
        }
	}
    return count;
}

bool CStatusEffectContainer::CanGainStatusEffect(EFFECT statusEffect, uint16 power)
{
    // check for immunities first
    switch(statusEffect){
        case EFFECT_SLEEP:
        case EFFECT_SLEEP_II:
        case EFFECT_LULLABY:
            if(m_POwner->hasImmunity(IMMUNITY_SLEEP)) return false;
        break;
        case EFFECT_WEIGHT:
            if(m_POwner->hasImmunity(IMMUNITY_GRAVITY)) return false;
        break;
        case EFFECT_BIND:
            if(m_POwner->hasImmunity(IMMUNITY_BIND)) return false;
        break;
        case EFFECT_STUN:
            if(m_POwner->hasImmunity(IMMUNITY_STUN)) return false;
        break;
        case EFFECT_SILENCE:
            if(m_POwner->hasImmunity(IMMUNITY_SILENCE)) return false;
        break;
        case EFFECT_PARALYSIS:
            if(m_POwner->hasImmunity(IMMUNITY_PARALYZE)) return false;
        break;
        case EFFECT_BLINDNESS:
            if(m_POwner->hasImmunity(IMMUNITY_BLIND)) return false;
        break;
        case EFFECT_SLOW:
            if(m_POwner->hasImmunity(IMMUNITY_SLOW)) return false;
        break;
        case EFFECT_POISON:
            if(m_POwner->hasImmunity(IMMUNITY_POISON)) return false;
        break;
        case EFFECT_ELEGY:
            if(m_POwner->hasImmunity(IMMUNITY_ELEGY)) return false;
        break;
        case EFFECT_REQUIEM:
            if(m_POwner->hasImmunity(IMMUNITY_REQUIEM)) return false;
        break;
    }

    // make sure pets can't be charmed
    if((statusEffect == EFFECT_CHARM || statusEffect == EFFECT_CHARM_II) && m_POwner->PMaster != nullptr)
    {
        return false;
    }

    CStatusEffect* PStatusEffect;

    // check if a status effect blocks this
    EFFECT blockId = effects::EffectsParams[statusEffect].BlockId;
    if(blockId != 0 && HasStatusEffect(blockId)){
        return false;
    }

    // check if negative is strong enough to stop this
    EFFECT negativeId = effects::EffectsParams[statusEffect].NegativeId;
    if(negativeId != 0){
        PStatusEffect = GetStatusEffect(negativeId);

        if(PStatusEffect != nullptr){

            if(statusEffect == EFFECT_HASTE && PStatusEffect->GetStatusID() == EFFECT_SLOW && PStatusEffect->GetSubPower() == 1)
            {
                // slow i remote
                return true;
            }

            // new status effect must be stronger
            return power >= PStatusEffect->GetPower();
        }
    }

    PStatusEffect = GetStatusEffect(statusEffect);

    // check overwrite
    if(PStatusEffect != nullptr){
        uint16 currentPower = PStatusEffect->GetPower();
        EFFECTOVERWRITE overwrite = effects::EffectsParams[statusEffect].Overwrite;

        if(overwrite == EFFECTOVERWRITE_ALWAYS || overwrite == EFFECTOVERWRITE_IGNORE){
            return true;
        }

        if(overwrite == EFFECTOVERWRITE_NEVER){
            return false;
        }

        if(overwrite == EFFECTOVERWRITE_EQUAL_HIGHER){
            if(power >= currentPower){
                return true;
            }
        } else if(overwrite == EFFECTOVERWRITE_HIGHER){
            // overwrite only if higher
            if(power > currentPower){
                return true;
            }
        }

        return false;
    }

    return true;
}

void CStatusEffectContainer::OverwriteStatusEffect(CStatusEffect* StatusEffect)
{
    uint16 statusEffect = (uint16)StatusEffect->GetStatusID();
    // remove effect
    EFFECTOVERWRITE overwrite = effects::EffectsParams[statusEffect].Overwrite;
    if(overwrite != EFFECTOVERWRITE_IGNORE){
        DelStatusEffectSilent((EFFECT)statusEffect);
    }

    // remove effect by id
    EFFECT removeId = effects::EffectsParams[statusEffect].RemoveId;
    if(removeId > EFFECT_KO){
        DelStatusEffectSilent(removeId);
    }

    // remove negative effect
    EFFECT negativeId = effects::EffectsParams[statusEffect].NegativeId;
    if(negativeId > EFFECT_KO){
        DelStatusEffectSilent(negativeId);
    }
}

/************************************************************************
*																		*
*  Добавляем статус-эффект в контейнер									*
*  Если не ошибаюсь, то максимально-возможное количество эффектов 32 	*
*																		*
************************************************************************/

bool CStatusEffectContainer::AddStatusEffect(CStatusEffect* PStatusEffect, bool silent)
{
    if(PStatusEffect == nullptr){
        ShowWarning("status_effect_container::AddStatusEffect Status effect given was nullptr!\n");
        return false;
    }

    uint16 statusId = PStatusEffect->GetStatusID();

    if(statusId >= MAX_EFFECTID){
        ShowWarning("status_effect_container::AddStatusEffect statusId given is OVER limit %d\n", statusId);
        return false;
    }

	if(CanGainStatusEffect((EFFECT)statusId, PStatusEffect->GetPower()))
	{

            // check for minimum duration
            if(PStatusEffect->GetDuration() < effects::EffectsParams[statusId].MinDuration){
                PStatusEffect->SetDuration(effects::EffectsParams[statusId].MinDuration);
            }

        // remove clean up other effects
        OverwriteStatusEffect(PStatusEffect);

        PStatusEffect->SetOwner(m_POwner);

        SetEffectParams(PStatusEffect);

        // remove effects with same type
        DelStatusEffectsByType(PStatusEffect->GetType());

        PStatusEffect->SetStartTime(gettick());

        m_StatusEffectList.push_back(PStatusEffect);

        luautils::OnEffectGain(m_POwner, PStatusEffect);

        m_POwner->addModifiers(&PStatusEffect->modList);

        if (PStatusEffect->GetStatusID() >= EFFECT_FIRE_MANEUVER &&
            PStatusEffect->GetStatusID() <= EFFECT_DARK_MANEUVER &&
            m_POwner->objtype == TYPE_PC)
        {
            puppetutils::CheckAttachmentsForManeuver((CCharEntity*)m_POwner, PStatusEffect->GetStatusID(), true);
        }

        if( m_POwner->health.maxhp != 0) //make sure we're not in the middle of logging in
        {
            m_POwner->UpdateHealth();
        }

        if (m_POwner->objtype == TYPE_PC)
        {
            CCharEntity* PChar = (CCharEntity*)m_POwner;

            if (PStatusEffect->GetIcon() != 0)
            {
                UpdateStatusIcons();
            }

			if( m_POwner->health.maxhp != 0) //make sure we're not in the middle of logging in
			{
				//check for latents
				PChar->PLatentEffectContainer->CheckLatentsFoodEffect();
				PChar->PLatentEffectContainer->CheckLatentsStatusEffect();
                PChar->PLatentEffectContainer->CheckLatentsRollSong(PStatusEffect->GetFlag() & (EFFECTFLAG_SONG | EFFECTFLAG_ROLL));
				PChar->UpdateHealth();

				PChar->pushPacket(new CCharHealthPacket(PChar));
			}
            PChar->pushPacket(new CCharSyncPacket(PChar));
        }
        m_POwner->updatemask |= UPDATE_HP;

        return true;
	}

    return false;
}

/************************************************************************
*																		*
*  Эффекты во всех методах удаляются одинаково, вынес этот код в		*
*  отдельную функцию. Удаляем иконки только у CharEntity.				*
*																		*
************************************************************************/

void CStatusEffectContainer::RemoveStatusEffect(uint32 id, bool silent)
{
    CStatusEffect* PStatusEffect = m_StatusEffectList.at(id);

    if (PStatusEffect->GetStatusID() >= EFFECT_FIRE_MANEUVER &&
        PStatusEffect->GetStatusID() <= EFFECT_DARK_MANEUVER &&
        m_POwner->objtype == TYPE_PC)
    {
        puppetutils::CheckAttachmentsForManeuver((CCharEntity*)m_POwner, PStatusEffect->GetStatusID(), false);
    }

    m_StatusEffectList.erase(m_StatusEffectList.begin() + id);
    luautils::OnEffectLose(m_POwner, PStatusEffect);

    m_POwner->delModifiers(&PStatusEffect->modList);
    m_POwner->UpdateHealth();

    if (m_POwner->objtype == TYPE_PC)
    {
        CCharEntity* PChar = (CCharEntity*)m_POwner;

        if (PStatusEffect->GetIcon() != 0)
        {
            UpdateStatusIcons();
			if (silent == false)
			{
				PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PStatusEffect->GetIcon(), 0, 206));
			}
        }
		//check for latents
		PChar->PLatentEffectContainer->CheckLatentsFoodEffect();
		PChar->PLatentEffectContainer->CheckLatentsStatusEffect();
        PChar->PLatentEffectContainer->CheckLatentsRollSong(HasStatusEffectByFlag(EFFECTFLAG_SONG | EFFECTFLAG_ROLL));
		PChar->UpdateHealth();

        PChar->pushPacket(new CCharHealthPacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }
	else
	{
		if (silent == false && PStatusEffect->GetIcon() != 0 && ((PStatusEffect->GetFlag() & EFFECTFLAG_NO_LOSS_MESSAGE) == 0) && !m_POwner->isDead())
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

bool CStatusEffectContainer::DelStatusEffectSilent(EFFECT StatusID)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID)
		{
			RemoveStatusEffect(i, true);
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

bool CStatusEffectContainer::DelStatusEffectByTier(EFFECT StatusID, uint16 tier)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID &&
		   (m_StatusEffectList.at(i)->GetTier() == tier))
		{
			RemoveStatusEffect(i, true);
			return true;
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Deletes all status effects without sending messages              	*
*																		*
************************************************************************/
void CStatusEffectContainer::KillAllStatusEffect()
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		CStatusEffect* PStatusEffect = m_StatusEffectList.at(i);

        if (PStatusEffect->GetDuration() != 0)
        {

            luautils::OnEffectLose(m_POwner, PStatusEffect);

            m_POwner->delModifiers(&PStatusEffect->modList);

            m_StatusEffectList.erase(m_StatusEffectList.begin() + i);

            delete PStatusEffect;
        }
	}
    m_POwner->UpdateHealth();
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

void CStatusEffectContainer::DelStatusEffectsByType(uint16 Type)
{
    if(Type <= 0) return;

    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetType() == Type)
        {
            RemoveStatusEffect(i--, true);
        }
    }
}

/************************************************************************
*                                                                       *
*  Удаляем все эффекты с указанными флагами                             *
*                                                                       *
************************************************************************/

void CStatusEffectContainer::DelStatusEffectsByFlag(uint32 flag, bool silent)
{
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
        if (m_StatusEffectList.at(i)->GetFlag() & flag)
		{
			RemoveStatusEffect(i--, silent);
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
        uint16 rndIdx = dsprand::GetRandomNumber(erasableList.size());
        EFFECT result = m_StatusEffectList.at(erasableList.at(rndIdx))->GetStatusID();
        RemoveStatusEffect(erasableList.at(rndIdx));
        return result;
    }
    return EFFECT_NONE;
}

EFFECT CStatusEffectContainer::HealingWaltz()
{
   std::vector<uint16> waltzableList;
   for( uint16 i = 0; i < m_StatusEffectList.size(); ++i )
   {
      if( ( m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_WALTZABLE || 
          m_StatusEffectList.at(i)->GetFlag() & EFFECTFLAG_ERASABLE ) &&
          m_StatusEffectList.at(i)->GetDuration() > 0 )
      {
         waltzableList.push_back(i);
      }
   }
   if( !waltzableList.empty() )
   {
       uint16 rndIdx = dsprand::GetRandomNumber(waltzableList.size());
      EFFECT result = m_StatusEffectList.at(waltzableList.at(rndIdx))->GetStatusID();
      RemoveStatusEffect(waltzableList.at(rndIdx));
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

EFFECT CStatusEffectContainer::DispelStatusEffect(EFFECTFLAG flag)
{
	std::vector<uint16>	dispelableList;
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetFlag() & flag &&
			m_StatusEffectList.at(i)->GetDuration() > 0)
		{
			dispelableList.push_back(i);
		}
	}
	if (!dispelableList.empty())
	{
        uint16 rndIdx = dsprand::GetRandomNumber(dispelableList.size());
		EFFECT result = m_StatusEffectList.at(dispelableList.at(rndIdx))->GetStatusID();
		RemoveStatusEffect(dispelableList.at(rndIdx), true);
		return result;
	}
	return EFFECT_NONE;
}

/*
Dispels all positive status effects
returns number of dispelled effects
*/
uint8 CStatusEffectContainer::DispelAllStatusEffect(EFFECTFLAG flag)
{
    uint8 count = 0;
    for (int i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetFlag() & flag &&
            m_StatusEffectList.at(i)->GetDuration() > 0)
        {
            RemoveStatusEffect(i, true);
            i--;
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
        if (m_StatusEffectList.at(i)->GetStatusID() == StatusID)
        {
            return true;
        }
    }
    return false;
}

bool CStatusEffectContainer::HasStatusEffectByFlag(uint32 flag)
{

    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetFlag() & flag)
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
	//if all match tier/id/effect then overwrite

	//if tier/effect match then overwrite //but id doesn't, NO EFFECT
	//if targ has <2 of your songs on, then just apply
	//if targ has 2 of your songs, remove oldest one and apply this one.

	uint8 numOfEffects = 0;
	CStatusEffect* oldestSong = nullptr;
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_REQUIEM &&
			m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_NOCTURNE) //is a brd effect
		{
            if (m_StatusEffectList.at(i)->GetTier() == PStatusEffect->GetTier() &&
				m_StatusEffectList.at(i)->GetStatusID()==PStatusEffect->GetStatusID()){//same tier/type, overwrite
					//OVERWRITE
                    DelStatusEffectByTier(PStatusEffect->GetStatusID(), PStatusEffect->GetTier());
					AddStatusEffect(PStatusEffect);
					return true;
			}
			if(m_StatusEffectList.at(i)->GetSubID() == PStatusEffect->GetSubID()){//YOUR BRD effect
				numOfEffects++;
				if(!oldestSong){
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
	else if (oldestSong){
		//overwrite oldest
        DelStatusEffectByTier(oldestSong->GetStatusID(), oldestSong->GetTier());
		AddStatusEffect(PStatusEffect);
		return true;
	}

	return false;
}

bool CStatusEffectContainer::ApplyCorsairEffect(CStatusEffect* PStatusEffect, uint8 maxRolls, uint8 bustDuration)
{
	//break if not a COR roll.
	DSP_DEBUG_BREAK_IF(!(PStatusEffect->GetStatusID() >= EFFECT_FIGHTERS_ROLL &&
		PStatusEffect->GetStatusID() <= EFFECT_SCHOLARS_ROLL));

	//if all match tier/id/effect then overwrite

	//if tier/effect match then overwrite //but id doesn't, NO EFFECT
	//if targ has <2 of your rolls on, then just apply
	//if targ has 2 of your rolls, remove oldest one and apply this one.

	uint8 numOfEffects = 0;
	CStatusEffect* oldestRoll = nullptr;
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if ((m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_FIGHTERS_ROLL &&
			m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_SCHOLARS_ROLL) ||
			m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST)//is a cor effect
		{
			if(m_StatusEffectList.at(i)->GetStatusID() == PStatusEffect->GetStatusID() &&
				m_StatusEffectList.at(i)->GetSubID() == PStatusEffect->GetSubID() &&
				m_StatusEffectList.at(i)->GetSubPower() < PStatusEffect->GetSubPower()){//same type, double up
					if( PStatusEffect->GetSubPower() < 12)
					{
						PStatusEffect->SetDuration(m_StatusEffectList.at(i)->GetDuration());
						DelStatusEffectSilent(PStatusEffect->GetStatusID());
						AddStatusEffect(PStatusEffect, true);
						return true;
					} else {
						if (!CheckForElevenRoll())
						{
							uint16 duration = 300;
							duration -= bustDuration;
							CStatusEffect* bustEffect = new CStatusEffect(EFFECT_BUST, EFFECT_BUST, PStatusEffect->GetPower(),
								0, duration, PStatusEffect->GetTier(), PStatusEffect->GetStatusID());
							AddStatusEffect(bustEffect, true);
						}
						DelStatusEffectSilent(PStatusEffect->GetStatusID());

						return true;
					}
			}
			if(m_StatusEffectList.at(i)->GetSubID() == PStatusEffect->GetSubID() ||
				m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST){//YOUR cor effect
				numOfEffects++;
				if(oldestRoll==nullptr){
					oldestRoll = m_StatusEffectList.at(i);
				}
				else if(m_StatusEffectList.at(i)->GetDuration() + m_StatusEffectList.at(i)->GetStartTime() <
					oldestRoll->GetDuration() + oldestRoll->GetStartTime()){
						oldestRoll = m_StatusEffectList.at(i);
				}
			}
		}
	}

	if(numOfEffects<maxRolls){
		AddStatusEffect(PStatusEffect, true);
		return true;
	}
	else{
		//i'm a liar, can overwrite rolls
		DelStatusEffect(oldestRoll->GetStatusID());
		AddStatusEffect(PStatusEffect);
		return true;
	}

	return false;
}

bool CStatusEffectContainer::HasCorsairEffect(uint32 charid)
{
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if ((m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_FIGHTERS_ROLL &&
            m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_SCHOLARS_ROLL) ||
            m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST)//is a cor effect
        {
            if (m_StatusEffectList.at(i)->GetSubID() == charid ||
                m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST)
            {
                return true;
            }
        }
    }
    return false;
}

void CStatusEffectContainer::Fold(uint32 charid)
{
    CStatusEffect* oldestRoll = nullptr;
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if ((m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_FIGHTERS_ROLL &&
            m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_SCHOLARS_ROLL) ||
            m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST)//is a cor effect
        {
            if (m_StatusEffectList.at(i)->GetSubID() == charid ||
                m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST)
            {
                if (oldestRoll == nullptr)
                {
                    oldestRoll = m_StatusEffectList.at(i);
                }
                else if (oldestRoll->GetStatusID() != EFFECT_BUST && m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST)
                {
                    oldestRoll = m_StatusEffectList.at(i);
                }
                else if (m_StatusEffectList.at(i)->GetDuration() + m_StatusEffectList.at(i)->GetStartTime() <
                    oldestRoll->GetDuration() + oldestRoll->GetStartTime())
                {
                    oldestRoll = m_StatusEffectList.at(i);
                }
            }
        }
    }
    if (oldestRoll != nullptr)
    {
        DelStatusEffectSilent(oldestRoll->GetStatusID());
        DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
    }
}

uint8 CStatusEffectContainer::GetActiveManeuvers()
{
    uint8 count = 0;
    for (auto PStatusEffect : m_StatusEffectList)
    {
        if (PStatusEffect->GetStatusID() >= EFFECT_FIRE_MANEUVER &&
            PStatusEffect->GetStatusID() <= EFFECT_DARK_MANEUVER)
        {
            count++;
        }
    }
    return count;
}

void CStatusEffectContainer::RemoveOldestManeuver()
{
    CStatusEffect* oldest = nullptr;
    int index = 0;
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        CStatusEffect* PStatusEffect = m_StatusEffectList.at(i);
        if (PStatusEffect->GetStatusID() >= EFFECT_FIRE_MANEUVER &&
            PStatusEffect->GetStatusID() <= EFFECT_DARK_MANEUVER)
        {
            if (!oldest || PStatusEffect->GetStartTime() < oldest->GetStartTime())
            {
                oldest = PStatusEffect;
                index = i;
            }
        }
    }
    if (oldest)
    {
        RemoveStatusEffect(index, true);
    }
}

void CStatusEffectContainer::RemoveAllManeuvers()
{
    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        if (m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_FIRE_MANEUVER && 
            m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_DARK_MANEUVER)
        {
            RemoveStatusEffect(i--, true);
        }
    }
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


CStatusEffect* CStatusEffectContainer::GetStatusEffect(EFFECT StatusID)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
		if (m_StatusEffectList.at(i)->GetStatusID() == StatusID)
		{
			return m_StatusEffectList[i];
		}
	}
	return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CStatusEffect* CStatusEffectContainer::GetStatusEffect(EFFECT StatusID, uint32 SubID)
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
        uint16 rndIdx = dsprand::GetRandomNumber(dispelableList.size());
        uint16 effectIndex = dispelableList.at(rndIdx);

        CStatusEffect* oldEffect = m_StatusEffectList.at(effectIndex);

        //make a copy
        CStatusEffect* EffectCopy = new CStatusEffect(oldEffect->GetStatusID(), oldEffect->GetIcon(), oldEffect->GetPower(), oldEffect->GetTickTime()/1000, oldEffect->GetDuration()/1000);

        RemoveStatusEffect(effectIndex);

        return EffectCopy;
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
            if (icon >= 256 && icon < 512)
            {
                m_Flags |= 1LL << (count * 2);
            }
            if (icon >= 512)
            {
                m_Flags |= 1LL << (count * 2 + 1);
            }
			//Note: it may be possible that having both bits set is for effects over 768, but there aren't
			// that many effects as of this writing
            m_StatusIcons[count] = icon;

            if (++count == 32) break;
        }
	}
    ((CCharEntity*)m_POwner)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_POwner));
    ((CCharEntity*)m_POwner)->pushPacket(new CCharJobExtraPacket((CCharEntity*)m_POwner, true));
    ((CCharEntity*)m_POwner)->pushPacket(new CCharJobExtraPacket((CCharEntity*)m_POwner, false));
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
    EFFECT effect = StatusEffect->GetStatusID();

	if (StatusEffect->GetSubID() == 0 || StatusEffect->GetSubID() > 20000 ||
		(effect>=EFFECT_REQUIEM && effect <= EFFECT_NOCTURNE) ||
		(effect == EFFECT_DOUBLE_UP_CHANCE) || effect == EFFECT_BUST)
	{
		name.insert(0, "globals/effects/");
        name.insert(name.size(), effects::EffectsParams[effect].Name);
	} else {
		CItem* Ptem = itemutils::GetItemPointer(StatusEffect->GetSubID());
		if (Ptem != nullptr)
		{
            name.insert(0, "globals/items/");
			name.insert(name.size(), Ptem->getName());
		}
	}
    StatusEffect->SetName(name);
    StatusEffect->SetFlag(effects::EffectsParams[effect].Flag);
    StatusEffect->SetType(effects::EffectsParams[effect].Type);


    //todo: find a better place to put this?
    if(!m_POwner->isDead())
    {
        // this should actually go into a char charm AI
        if(m_POwner->PPet != nullptr && m_POwner->objtype == TYPE_PC)
        {
            if(effect == EFFECT_CHARM || effect == EFFECT_CHARM_II)
            {
                petutils::DespawnPet(m_POwner);
            }
        }

    	if(effect == EFFECT_SLEEP || effect == EFFECT_SLEEP_II ||
			effect == EFFECT_STUN || effect == EFFECT_PETRIFICATION || 
			effect == EFFECT_TERROR || effect == EFFECT_LULLABY || 
			effect == EFFECT_CHARM || effect == EFFECT_CHARM_II || effect == EFFECT_PENALTY)
        {

            // change icon of sleep II and lullaby. Apparently they don't stop player movement.
            if(effect == EFFECT_SLEEP_II || effect == EFFECT_LULLABY)
            {
                StatusEffect->SetIcon(EFFECT_SLEEP);
            }

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

    std::vector<CStatusEffect*> PEffectList;

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

			PEffectList.push_back(PStatusEffect);

            // load shadows left
            if(PStatusEffect->GetStatusID() == EFFECT_COPY_IMAGE){
                m_POwner->setModifier(MOD_UTSUSEMI, PStatusEffect->GetPower());
            } else if(PStatusEffect->GetStatusID() == EFFECT_BLINK){
                m_POwner->setModifier(MOD_BLINK, PStatusEffect->GetPower());
            }
		}
	}

    for (auto&& PStatusEffect : PEffectList)
    {
        AddStatusEffect(PStatusEffect);
    }

    m_POwner->UpdateHealth(); // после загрузки эффектов пересчитываем максимальное количество HP/MP
}

/************************************************************************
*																		*
*  Сохраняем временные эффекты персонажа								*
*																		*
************************************************************************/

void CStatusEffectContainer::SaveStatusEffects(bool logout)
{
    DSP_DEBUG_BREAK_IF(m_POwner->objtype != TYPE_PC);

	Sql_Query(SqlHandle,"DELETE FROM char_effects WHERE charid = %u", m_POwner->id);

    for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
    {
        CStatusEffect* PStatusEffect = m_StatusEffectList.at(i);

        if (logout && PStatusEffect->GetFlag() & EFFECTFLAG_LOGOUT)
            continue;

        uint32 realduration = (PStatusEffect->GetDuration() + PStatusEffect->GetStartTime() - gettick()) / 1000;

        if (realduration > 0)
        {
            const int8* Query = "INSERT INTO char_effects (charid, effectid, icon, power, tick, duration, subid, subpower, tier) VALUES(%u,%u,%u,%u,%u,%u,%u,%u,%u);";

            // save power of utsusemi and blink
            if (PStatusEffect->GetStatusID() == EFFECT_COPY_IMAGE) {
                PStatusEffect->SetPower(m_POwner->getMod(MOD_UTSUSEMI));
            }
            else if (PStatusEffect->GetStatusID() == EFFECT_BLINK) {
                PStatusEffect->SetPower(m_POwner->getMod(MOD_BLINK));
            }
            else if (PStatusEffect->GetStatusID() == EFFECT_STONESKIN) {
                PStatusEffect->SetPower(m_POwner->getMod(MOD_STONESKIN));
            }

            uint32 tick = PStatusEffect->GetTickTime() == 0 ? 0 : PStatusEffect->GetTickTime() / 1000;
            uint32 duration = PStatusEffect->GetDuration() == 0 ? 0 : realduration;

            Sql_Query(SqlHandle, Query,
                m_POwner->id,
                PStatusEffect->GetStatusID(),
                PStatusEffect->GetIcon(),
                PStatusEffect->GetPower(),
                tick,
                duration,
                PStatusEffect->GetSubID(),
                PStatusEffect->GetSubPower(),
                PStatusEffect->GetTier());
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
	DSP_DEBUG_BREAK_IF(m_POwner == nullptr);

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
				PStatusEffect->GetDuration() + PStatusEffect->GetStartTime() <= tick && i <m_StatusEffectList.size())
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
	DSP_DEBUG_BREAK_IF(m_POwner == nullptr);

	if (!m_POwner->isDead())
	{
		if ((tick - m_RegenCheckTime) < 3000 )
		{
			return;
		}

        CCharEntity* PChar = nullptr;
        if(m_POwner->objtype == TYPE_PC)
        {
            PChar = (CCharEntity*)m_POwner;
        }

		m_RegenCheckTime = tick;

        int16 regen = m_POwner->getMod(MOD_REGEN);
        int16 poison = m_POwner->getMod(MOD_REGEN_DOWN);
        int16 refresh = m_POwner->getMod(MOD_REFRESH) - m_POwner->getMod(MOD_REFRESH_DOWN);
        int16 regain = m_POwner->getMod(MOD_REGAIN) - m_POwner->getMod(MOD_REGAIN_DOWN);
        bool update = false;
        if (m_POwner->addHP(regen))
            update = true;

        if(poison)
        {
            int16 damage = battleutils::HandleStoneskin(m_POwner, poison);

            if(damage > 0)
            {
                DelStatusEffectSilent(EFFECT_HEALING);
                m_POwner->addHP(-damage);
                WakeUp();
                update = true;
            }
        }

		if (m_POwner->getMod(MOD_AVATAR_PERPETUATION) > 0 && (m_POwner->objtype == TYPE_PC))
		{
			int16 perpetuation = m_POwner->getMod(MOD_AVATAR_PERPETUATION);

			if (m_POwner->StatusEffectContainer->HasStatusEffect(EFFECT_ASTRAL_FLOW))
				perpetuation = 0;
			else
			{
				if (m_POwner->PPet != nullptr && PChar != nullptr)
				{

                    if(m_POwner->PPet->objtype == TYPE_PET)
                    {

                        CPetEntity* PPet = (CPetEntity*)m_POwner->PPet;
    					CItem* hands = PChar->getEquip(SLOT_HANDS);

                        // carbuncle mitts only work on carbuncle
    					if (hands && hands->getID() == 14062 && PPet->name == "Carbuncle"){
    						perpetuation /= 2;
    					}
                    }


					perpetuation -= charutils::AvatarPerpetuationReduction(PChar);

					if( perpetuation < 1 )
						perpetuation = 1;
				}
			}

            if (m_POwner->addMP(refresh - perpetuation))
                update = true;

			if( m_POwner->health.mp == 0 && m_POwner->PPet != nullptr && m_POwner->PPet->objtype == TYPE_PET)
			{
				CPetEntity* PPet = (CPetEntity*)m_POwner->PPet;
				if (PPet->getPetType() == PETTYPE_AVATAR) {
					petutils::DespawnPet(m_POwner);
				}
			}
		}
		else
		{
            if (m_POwner->addMP(refresh))
                update = true;
		}

        if (m_POwner->addTP(regain))
            update = true;

        if (m_POwner->PPet && ((CPetEntity*)(m_POwner->PPet))->getPetType() == PETTYPE_AUTOMATON)
        {
            ((CAutomatonEntity*)(m_POwner->PPet))->burdenTick();
        }

		if( m_POwner->status != STATUS_DISAPPEAR && (m_POwner->objtype == TYPE_PC) && update)
		{
			charutils::UpdateHealth((CCharEntity*)m_POwner);
		}
    }
}

bool CStatusEffectContainer::HasPreventActionEffect()
{
    return HasStatusEffect(EFFECT_SLEEP) ||
        HasStatusEffect(EFFECT_SLEEP_II) ||
        HasStatusEffect(EFFECT_PETRIFICATION) ||
        HasStatusEffect(EFFECT_LULLABY) ||
        HasStatusEffect(EFFECT_CHARM) ||
        HasStatusEffect(EFFECT_CHARM_II) ||
        HasStatusEffect(EFFECT_PENALTY) ||
        HasStatusEffect(EFFECT_STUN) ||
		HasStatusEffect(EFFECT_TERROR);
}

uint16 CStatusEffectContainer::GetConfrontationEffect()
{
    for (auto PEffect : m_StatusEffectList)
    {
        if (PEffect->GetFlag() & EFFECTFLAG_CONFRONTATION)
        {
            return PEffect->GetPower();
        }
    }
    return 0;
}

void CStatusEffectContainer::CopyConfrontationEffect(CBattleEntity* PEntity)
{
    for (auto PEffect : m_StatusEffectList)
    {
        if (PEffect->GetFlag() & EFFECTFLAG_CONFRONTATION)
        {
            PEntity->StatusEffectContainer->AddStatusEffect(new CStatusEffect(*PEffect));
        }
    }
}

bool CStatusEffectContainer::CheckForElevenRoll()
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
        if (m_StatusEffectList.at(i)->GetStatusID() >= EFFECT_FIGHTERS_ROLL &&
            m_StatusEffectList.at(i)->GetStatusID() <= EFFECT_SCHOLARS_ROLL &&
			m_StatusEffectList.at(i)->GetSubPower() == 11)
		{
			return true;
		}
	}
	return false;
}

bool CStatusEffectContainer::IsAsleep()
{
    return HasStatusEffect(EFFECT_SLEEP) ||
        HasStatusEffect(EFFECT_SLEEP_II) ||
        HasStatusEffect(EFFECT_LULLABY);
}

void CStatusEffectContainer::WakeUp()
{
    DelStatusEffect(EFFECT_SLEEP);
    DelStatusEffect(EFFECT_SLEEP_II);
    DelStatusEffect(EFFECT_LULLABY);
}

bool CStatusEffectContainer::HasBustEffect(uint16 id)
{
	for (uint16 i = 0; i < m_StatusEffectList.size(); ++i)
	{
        if (m_StatusEffectList.at(i)->GetStatusID() == EFFECT_BUST &&
			m_StatusEffectList.at(i)->GetSubPower() == id)
		{
			return true;
		}
	}
	return false;
}
