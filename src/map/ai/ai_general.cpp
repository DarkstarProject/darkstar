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

#include "../spell.h"
#include "../weapon_skill.h"
#include "../ability.h"
#include "../mobskill.h"
#include "../utils/battleutils.h"
#include "helpers/targetfind.h"
#include "helpers/pathfind.h"
#include "states/magic_state.h"

#include "ai_general.h"


/************************************************************************
*																		*
*  В конструкторе присваиваем переменным значения по умолчанию			*
*																		*
************************************************************************/

CAIGeneral::CAIGeneral()
{
    m_PTargetFind = nullptr;
    m_PPathFind = nullptr;
    m_PMagicState = nullptr;
	Reset();
}

CAIGeneral::~CAIGeneral()
{
	if(m_PTargetFind != nullptr)
	{
	    delete m_PTargetFind;
	}

	if(m_PPathFind != nullptr)
	{
	    delete m_PPathFind;
	}

	if(m_PMagicState != nullptr)
	{
		delete m_PMagicState;
	}
}

/************************************************************************
*                                                                       *
*  Сбрасываем AI в исходное состояние                                   *
*                                                                       *
************************************************************************/

void CAIGeneral::Reset()
{
    m_Tick = 0;
	m_StartBattle = 0;
	m_ActionType = ACTION_NONE;
	m_ActionTargetID = 0;
	m_LastActionTime = 0;
    m_LastMeleeTime = 0;
    m_LastMagicTime = 0;

    m_WaitTime = 0;
    m_LastWaitTime = 0;
    m_interruptSpell = false;
	m_PSpell = nullptr;
	m_PWeaponSkill = nullptr;
	m_PItemUsable = nullptr;
	m_PBattleTarget = nullptr;
	m_PBattleSubTarget = nullptr;
	m_PJobAbility = nullptr;
	m_PMobSkill = nullptr;
	m_AutoAttackEnabled = true;
	m_MobAbilityEnabled = true;
}

/************************************************************************
*																		*
*  Узнаем текущее действие (состояние) интеллекта						*
*																		*
************************************************************************/

ACTIONTYPE CAIGeneral::GetCurrentAction()
{
	return m_ActionType;
}

/************************************************************************
*                                                                       *
*  Get the time of the battle                                           *
*                                                                       *
************************************************************************/

uint32 CAIGeneral::GetBattleTime()
{
	return ((m_Tick - m_StartBattle) / 1000);
}

/************************************************************************
*																		*
*  Принудительно переводим интеллект в какое-либо состояние				*
*																		*
************************************************************************/

void CAIGeneral::SetCurrentAction(ACTIONTYPE Action, uint16 TargetID)
{
	if (m_ActionTargetID != 0)
		return;

	switch (Action)
	{
		case ACTION_ITEM_START:
        case ACTION_MAGIC_START:
        case ACTION_RANGED_START:
        case ACTION_JOBABILITY_START:
		case ACTION_DISENGAGE:
		{
			if (m_ActionType == ACTION_NONE ||
				m_ActionType == ACTION_ATTACK)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
	    break;
		case ACTION_WEAPONSKILL_START:
		{
			if (m_ActionType == ACTION_ATTACK)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
		case ACTION_ITEM_INTERRUPT:
		{
			if (m_ActionType == ACTION_ITEM_USING)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
		case ACTION_MAGIC_INTERRUPT:
		{
			if (m_ActionType == ACTION_MAGIC_CASTING)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
		case ACTION_RANGED_INTERRUPT:
		{
			if (m_ActionType == ACTION_RANGED_FINISH)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
		case ACTION_ENGAGE:
		{
			if (m_ActionType == ACTION_NONE)
			{
                m_StartBattle = m_Tick;

				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
		case ACTION_SPAWN:
		{
			if (m_ActionType == ACTION_NONE)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
		case ACTION_CHANGE_TARGET:
		{
			if (m_ActionType == ACTION_ATTACK)
			{
				m_ActionType = Action;
				m_ActionTargetID = TargetID;
			}
		}
		break;
        case ACTION_FALL:
        {
            switch (m_ActionType)
            {
                case ACTION_ITEM_USING:    m_ActionType = ACTION_ITEM_INTERRUPT;  CheckCurrentAction(m_Tick); break;
                case ACTION_MAGIC_CASTING: m_ActionType = ACTION_MAGIC_INTERRUPT; CheckCurrentAction(m_Tick); break;
            }
            m_ActionType = Action;
			m_ActionTargetID = TargetID;
        }
        break;
		case ACTION_SLEEP:
        {
            switch (m_ActionType)
            {
                case ACTION_ITEM_USING:    m_ActionType = ACTION_ITEM_INTERRUPT;  CheckCurrentAction(m_Tick); break;
                case ACTION_MAGIC_CASTING: m_ActionType = ACTION_MAGIC_INTERRUPT; CheckCurrentAction(m_Tick); break;
				case ACTION_MOBABILITY_START: m_ActionType = ACTION_MOBABILITY_INTERRUPT; CheckCurrentAction(m_Tick); break;
                case ACTION_MOBABILITY_USING: m_ActionType = ACTION_MOBABILITY_INTERRUPT; CheckCurrentAction(m_Tick); break;
            }
            m_ActionType = Action;
			m_ActionTargetID = TargetID;
        }
		break;
		default:
		{
			m_ActionType = Action;
			m_ActionTargetID = TargetID;
		}
	}
}

/************************************************************************
*																		*
*  Устанавливаем время последнего действия в обход системы AI			*
*  (использовать с осторожностью и при полной уверенности в результате)	*
*																		*
************************************************************************/

void CAIGeneral::SetLastActionTime(uint32 time)
{
	m_LastActionTime = time;
}

void CAIGeneral::SetLastMagicTime(uint32 time)
{
	m_LastMagicTime = time;
}

void CAIGeneral::SetBattleTarget(CBattleEntity* PEntity)
{
	m_PBattleTarget = PEntity;
}

void CAIGeneral::SetBattleSubTarget(CBattleEntity* PEntity)
{
	m_PBattleSubTarget = PEntity;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIGeneral::SetCurrentSpell(uint16 SpellID)
{
	if (m_ActionType != ACTION_MAGIC_START   &&
		m_ActionType != ACTION_MAGIC_CASTING &&
		m_ActionType != ACTION_MAGIC_FINISH  &&
		m_ActionType != ACTION_MAGIC_INTERRUPT)
	{
        CSpell* spell = spell::GetSpell(SpellID);
        if (spell)
        {
            if (spell->getSpellGroup() == SPELLGROUP_BLUE)
            {
                m_PSpell = std::make_unique<CBlueSpell>(*static_cast<CBlueSpell*>(spell));
            }
            else
            {
                m_PSpell = std::make_unique<CSpell>(*spell);
            }
        }
        else
        {
            m_PSpell = nullptr;
        }
	}
}

/************************************************************************
*																		*
*	Gets Current Spell													*
*																		*
************************************************************************/

CSpell* CAIGeneral::GetCurrentSpell()
{
    // TODO: refactor this to only need magic state
	/*if (m_PMagicState != nullptr && m_PMagicState->GetSpell() != nullptr)
    {
        return m_PMagicState->GetSpell();
    }*/

	DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);

	return m_PSpell.get();
}

/************************************************************************
*																		*
*	Set Weapon Skill													*
*																		*
************************************************************************/

void CAIGeneral::SetCurrentWeaponSkill(uint16 WSkillID)
{
	if (m_ActionType != ACTION_WEAPONSKILL_START   &&
		m_ActionType != ACTION_WEAPONSKILL_FINISH)
	{
		m_PWeaponSkill = std::unique_ptr<CWeaponSkill>(new CWeaponSkill(*battleutils::GetWeaponSkill(WSkillID)));
	}
}

/************************************************************************
*																		*
*	Gets Current Weapon Skill											*
*																		*
************************************************************************/

CWeaponSkill* CAIGeneral::GetCurrentWeaponSkill()
{
	DSP_DEBUG_BREAK_IF(m_PWeaponSkill == nullptr);

	return m_PWeaponSkill.get();
}

/************************************************************************
*																		*
*	Set Job Ability														*
*																		*
************************************************************************/

void CAIGeneral::SetCurrentJobAbility(uint16 JobAbilityID)
{
	if (m_ActionType != ACTION_JOBABILITY_START   &&
		m_ActionType != ACTION_JOBABILITY_FINISH)
	{
		m_PJobAbility = std::unique_ptr<CAbility>(new CAbility(*ability::GetAbility(JobAbilityID)));
	}
}

/************************************************************************
*																		*
*	Gets Current Job Ability											*
*																		*
************************************************************************/

CAbility* CAIGeneral::GetCurrentJobAbility()
{
	DSP_DEBUG_BREAK_IF(m_PJobAbility == nullptr);

	return m_PJobAbility.get();
}

/************************************************************************
*																		*
*  Получаем текущую цель физической атаки								*
*																		*
************************************************************************/

CBattleEntity* CAIGeneral::GetBattleTarget()
{
	//DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);

	return m_PBattleTarget;
}


/************************************************************************
*																		*
*  get battle sub target												*
*																		*
************************************************************************/

CBattleEntity* CAIGeneral::GetBattleSubTarget()
{
	return m_PBattleSubTarget;
}

/************************************************************************
*                                                                       *
*	Gets Mob Skill														*
*                                                                       *
************************************************************************/

CMobSkill* CAIGeneral::GetCurrentMobSkill()
{
	return m_PMobSkill.get();
}

/************************************************************************
*                                                                       *
*	Sets Mob Skill														*
*                                                                       *
************************************************************************/

void CAIGeneral::SetCurrentMobSkill(CMobSkill* skill)
{
    if (skill == nullptr)
    {
        m_PMobSkill = nullptr;
    }
    else
    {
        m_PMobSkill = std::unique_ptr<CMobSkill>(new CMobSkill(*skill));
    }
}

/************************************************************************
*                                                                       *
*	Gets/sets last used corsair roll									*
*                                                                       *
************************************************************************/

uint16 CAIGeneral::GetLastCorsairRoll()
{
	return m_CorsairDoubleUp;
}

void CAIGeneral::SetLastCorsairRoll(uint16 ability)
{
	m_CorsairDoubleUp = ability;
}

/************************************************************************
*                                                                       *
*	Gets/sets ability/attack behaviour									*
*                                                                       *
************************************************************************/

void CAIGeneral::SetAutoAttackEnabled(bool enabled)
{
	m_AutoAttackEnabled = enabled;
}
void CAIGeneral::SetMagicCastingEnabled(bool enabled)
{
    if(m_PMagicState != nullptr)
    {
        m_PMagicState->m_enableCasting = enabled;
    }
}
void CAIGeneral::SetMobAbilityEnabled(bool enabled)
{
	m_MobAbilityEnabled = enabled;
}

bool CAIGeneral::MoveTo(position_t* pos)
{
    if(m_PPathFind != nullptr && m_ActionType == ACTION_ROAMING){
        m_PPathFind->StepTo(pos);
        return true;
    }
    return false;
}

bool CAIGeneral::CanSeePoint(position_t pos)
{
    if(m_PPathFind != nullptr){
      return m_PPathFind->CanSeePoint(pos);
    }

    return true;
}

void CAIGeneral::Wait(int32 waitTime)
{
	if(waitTime == -1)
	{
		// wait forever
		m_WaitTime = 99999999;
	}
	else
	{
		m_WaitTime = waitTime;
	}

    m_LastWaitTime = m_Tick;
}
