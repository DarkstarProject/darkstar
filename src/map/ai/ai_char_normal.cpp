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

#include "../../common/utils.h"

#include "../ability.h"
#include "../alliance.h"
#include "../battleutils.h"
#include "../charutils.h"
#include "../conquest_system.h"
#include "../jailutils.h"
#include "../map.h"
#include "../mobutils.h"
#include "../petutils.h"
#include "../spell.h"
#include "../vana_time.h"
#include "../weapon_skill.h"
#include "../zone.h"

#include "../lua/luautils.h"

#include "../packets/action.h"
#include "../packets/char.h"
#include "../packets/char_abilities.h"
#include "../packets/char_health.h"
#include "../packets/char_skills.h"
#include "../packets/char_update.h"
#include "../packets/inventory_assign.h"
#include "../packets/inventory_finish.h"
#include "../packets/inventory_item.h"
#include "../packets/lock_on.h"
#include "../packets/message_basic.h"
#include "../packets/menu_raisetractor.h"

#include "ai_char_normal.h"
#include "ai_pet_dummy.h"

/************************************************************************
*																		*
*  Инициализируем владельца интеллекта (может добавить проверку на		*
*  пустой указатель с выводом FatalError ?)								*
*																		*
************************************************************************/

CAICharNormal::CAICharNormal(CCharEntity* PChar)
{
	m_PChar = PChar;
	m_AttackMessageTime = 0;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAICharNormal::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;

    if((m_ActionType != ACTION_NONE) && jailutils::InPrison(m_PChar))
    {
        Reset();
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 316));
    }

	switch (m_ActionType)
	{
		case ACTION_NONE:			  									break;
		case ACTION_ATTACK:					ActionAttack();				break;
		case ACTION_MAGIC_START:			ActionMagicStart();			break;
		case ACTION_MAGIC_CASTING:			ActionMagicCasting();		break;
		case ACTION_MAGIC_FINISH:			ActionMagicFinish();		break;
		case ACTION_MAGIC_INTERRUPT:		ActionMagicInterrupt();		break;
		case ACTION_ENGAGE:					ActionEngage();				break;
		case ACTION_DISENGAGE:				ActionDisengage();	 		break;
		case ACTION_FALL:					ActionFall();				break;
		case ACTION_DEATH:					ActionDeath();				break;
		case ACTION_RANGED_START:			ActionRangedStart();		break;
		case ACTION_RANGED_FINISH:			ActionRangedFinish();		break;
		case ACTION_RANGED_INTERRUPT:		ActionRangedInterrupt();	break;
		case ACTION_ITEM_START:				ActionItemStart();			break;
		case ACTION_ITEM_USING:				ActionItemUsing();			break;
		case ACTION_ITEM_FINISH:			ActionItemFinish();			break;
		case ACTION_ITEM_INTERRUPT:			ActionItemInterrupt();		break;
		case ACTION_CHANGE_TARGET:	        ActionChangeBattleTarget(); break;
		case ACTION_WEAPONSKILL_START:		ActionWeaponSkillStart();	break; 
		case ACTION_WEAPONSKILL_FINISH:		ActionWeaponSkillFinish();	break; 
		case ACTION_JOBABILITY_START:		ActionJobAbilityStart();	break;
		case ACTION_JOBABILITY_FINISH:		ActionJobAbilityFinish();	break;
		case ACTION_RAISE_MENU_SELECTION:	ActionRaiseMenuSelection(); break;

		default : DSP_DEBUG_BREAK_IF(true);
	}
}

/************************************************************************
* Checks to see if the action can be cast on self/player/party/dead		*
* or mobs.																*
************************************************************************/

bool CAICharNormal::GetValidTarget(CBattleEntity** PBattleTarget, uint8 ValidTarget)
{
	DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);

    CBattleEntity* PTarget = (CBattleEntity*)m_PChar->loc.zone->GetEntity(m_ActionTargetID, TYPE_MOB | TYPE_PC | TYPE_PET);
	*PBattleTarget = PTarget; 

    m_ActionTargetID = 0;

	if (PTarget == NULL)
	{
		*PBattleTarget = m_PChar; //this prevents a null crash when message is sent
		return false;
	}
    if (ValidTarget & TARGET_ENEMY)
	{
        if (!PTarget->isDead())
        {
		    if (PTarget->objtype == TYPE_MOB || 
               (PTarget->objtype == TYPE_PC && ((CCharEntity*)PTarget)->m_PVPFlag))
		    {
			    return true;
		    }
        }
	}
	if (PTarget->objtype == TYPE_PC)
	{
		if ((ValidTarget & TARGET_SELF) &&
             PTarget->targid == m_PChar->targid)
		{
			return true;
		}
		if (ValidTarget & TARGET_PLAYER)
		{
			return true;
		}
		if ((ValidTarget & TARGET_PLAYER_PARTY) && 
            (m_PChar->PParty != NULL && m_PChar->PParty == PTarget->PParty))
		{
			return true;
		}
		if ((ValidTarget & TARGET_PLAYER_DEAD) && PTarget->isDead())
		{
			return true;
		}
		return false;
	}
	return false;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

bool CAICharNormal::IsMobOwner(CBattleEntity* PBattleTarget)
{
    DSP_DEBUG_BREAK_IF(PBattleTarget == NULL);

	if (PBattleTarget->m_OwnerID.id == 0 || PBattleTarget->m_OwnerID.id == m_PChar->id) 
	{
		return true;
	}
	if (m_PChar->PParty != NULL) 
	{
		if (m_PChar->PParty->m_PAlliance != NULL) 
		{
			for (uint8 a = 0; a < m_PChar->PParty->m_PAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < m_PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
				{
					if (m_PChar->PParty->m_PAlliance->partyList.at(a)->members[i]->id == PBattleTarget->m_OwnerID.id)
					{
						return true;
					}
				}
			}
		}
        else //no alliance
        {
			for (uint8 i = 0; i < m_PChar->PParty->members.size(); ++i)
			{
				if (m_PChar->PParty->members[i]->id == PBattleTarget->m_OwnerID.id)
				{
					return true;
				}
			}
		}
	}
	return false;
}

/************************************************************************
*																		*
*  Персонаж переходит в боевую стойку, включается прежим атаки			*
*																		*
************************************************************************/

void CAICharNormal::ActionEngage() 
{
	DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0)
    DSP_DEBUG_BREAK_IF(m_PBattleTarget != NULL);

	if (GetValidTarget(&m_PBattleTarget, TARGET_ENEMY))
	{
		if(IsMobOwner(m_PBattleTarget))
		{
			if (distance(m_PChar->loc.p, m_PBattleTarget->loc.p) <= 30)
			{
				if ((m_Tick - m_LastMeleeTime) > m_PChar->m_Weapons[SLOT_MAIN]->getDelay())
				{
                    if (m_PChar->animation == ANIMATION_CHOCOBO)
                    {
                        m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CHOCOBO);
                    }
                    else if (m_PChar->animation == ANIMATION_HEALING)
                    {
                        m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
                    }

					m_ActionType = ACTION_ATTACK;
					m_LastMeleeTime = m_Tick - m_PChar->m_Weapons[SLOT_MAIN]->getDelay() + 1500;

					m_PChar->status = STATUS_UPDATE;
					m_PChar->animation = ANIMATION_ATTACK;
					m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
					m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
					return;
				}
                else
                {
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,94));
				}
			}
            else
            {
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,78));
			}
		}
        else
        {
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,12));
		}
	}
	else if (m_PBattleTarget != NULL)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,446));
	}
	m_PBattleTarget = NULL;
	m_ActionType = ACTION_NONE;
}

/************************************************************************
*																		*
*  Персонаж меняет основную цель атаки									*
*																		*
************************************************************************/

void CAICharNormal::ActionChangeBattleTarget()
{
	DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

	if (m_PBattleTarget->targid != m_ActionTargetID)
	{
		CBattleEntity* PBattleTarget = NULL;

		if (GetValidTarget(&PBattleTarget, TARGET_ENEMY))
		{
			if (IsMobOwner(PBattleTarget))
			{
				if (distance(m_PChar->loc.p, PBattleTarget->loc.p) <= 30)
				{
					m_LastActionTime = m_Tick;
					m_PBattleTarget = PBattleTarget;
						
					m_PChar->pushPacket(new CLockOnPacket(m_PChar,m_PBattleTarget));
				}
                else
                {
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,78));
				}
			}
            else
            {
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,12));
			}
		}
	}
    m_ActionTargetID = 0;
	m_ActionType = ACTION_ATTACK;
}

/************************************************************************
*																		*
*  Персонаж выходит из режима атаки по каким-либо причинам				*
*																		*
************************************************************************/

void CAICharNormal::ActionDisengage() 
{
	m_ActionType = ACTION_NONE;
	m_LastActionTime = m_Tick;
	m_PBattleTarget = NULL;

	m_PChar->status = STATUS_UPDATE;
	m_PChar->animation = ANIMATION_NONE;
	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
}

/************************************************************************
*                                                                       *
*  Смерть персонажа                                                     *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionFall() 
{
	m_ActionType = ACTION_DEATH;
	m_ActionTargetID = 0;
	m_LastActionTime = m_Tick;

	m_PSpell           = NULL;
    m_PJobAbility      = NULL;
	m_PWeaponSkill     = NULL;
	m_PItemUsable      = NULL;
	m_PBattleTarget    = NULL;
	m_PBattleSubTarget = NULL;

    m_PChar->UContainer->Clean();

	m_PChar->animation = ANIMATION_DEATH;
	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
    m_PChar->pushPacket(new CRaiseTractorMenuPacket(m_PChar,TYPE_HOMEPOINT));

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE, new CCharPacket(m_PChar,ENTITY_UPDATE));
	charutils::DelExperiencePoints(m_PChar,map_config.exp_retain);
}

/************************************************************************
*                                                                       *
*  Удаляем соответствующие эффекты с ожиданием в одну секунду           *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionDeath()
{
    // без задержки удаление эффектов не всегда правильно обрабатывается клиентом
    if ((m_Tick - m_LastActionTime) >= 1000)
    {
        m_ActionType = ACTION_NONE;
	    m_LastActionTime = m_Tick;

        m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH);
    }
}

/************************************************************************
*																		*
*  316 - That action cannot be used in this area (costume)				*
*																		*
************************************************************************/

// TODO: нет проверки на наличие зарядов у предмета (в случае использования экипировки)

void CAICharNormal::ActionItemStart() 
{
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != NULL);

	DSP_DEBUG_BREAK_IF(m_PChar->UContainer->GetType() != UCONTAINER_USEITEM);
	DSP_DEBUG_BREAK_IF(m_PChar->UContainer->GetItem(0) == NULL);

	m_PItemUsable = (CItemUsable*)m_PChar->UContainer->GetItem(0);
	m_PChar->UContainer->Clean();

	if (GetValidTarget(&m_PBattleSubTarget, m_PItemUsable->getValidTarget()))
	{
		int32 ErrorID = luautils::OnItemCheck(m_PBattleSubTarget,m_PItemUsable);

		if (ErrorID == 0)
		{
			m_PChar->m_StartActionPos = m_PChar->loc.p;
			
			m_PItemUsable->setSubType(ITEM_LOCKED);

			m_PChar->pushPacket(new CInventoryAssignPacket(m_PItemUsable, INV_NOSELECT));
			m_PChar->pushPacket(new CInventoryFinishPacket());
		}
		else
		{
			m_ActionType = ACTION_ITEM_INTERRUPT;

			uint16 param = (m_PItemUsable->getFlag() & ITEM_FLAG_SCROLL ? m_PItemUsable->getSubID() : m_PItemUsable->getID());

			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, param, 0, ErrorID));
			ActionItemInterrupt();
			return;
		}
	}
	else if (m_PBattleSubTarget != NULL)
	{
		m_ActionType = ACTION_ITEM_INTERRUPT;
		
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,m_PItemUsable->getID(),0,92));
		ActionItemInterrupt();
		return;
	}
	else
	{
		m_ActionType = ACTION_ITEM_INTERRUPT;
		ActionItemInterrupt();
		return;
	}

	m_LastActionTime = m_Tick;

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 0;
	Action.param	  = m_PItemUsable->getID();
	Action.messageID  = 28;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);
	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	m_ActionType = ACTION_ITEM_USING;
}

/************************************************************************
*																		*
*  Процесс использовани предмета										*
*																		*
************************************************************************/

void CAICharNormal::ActionItemUsing()
{
	DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x ||
		m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
	{
		m_ActionType = ACTION_ITEM_INTERRUPT;
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, m_PItemUsable->getID(), 0, 62));
		ActionItemInterrupt();
		return;
	}

	if ((m_Tick - m_LastActionTime) >= m_PItemUsable->getActivationTime())
	{
        // обновление времени необходимо для правильной работы задержки анимации
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        m_LastActionTime = m_Tick;
		m_ActionType = ACTION_ITEM_FINISH;

		if (m_PItemUsable->getType() & ITEM_ARMOR)
		{
			if (m_PItemUsable->getMaxCharges() > 1)
			{
				m_PItemUsable->setCurrentCharges(m_PItemUsable->getCurrentCharges() - 1);
			}
            m_PItemUsable->setLastUseTime(CVanaTime::getInstance()->getVanaTime());
			m_PChar->pushPacket(new CInventoryItemPacket(m_PItemUsable, m_PItemUsable->getLocationID(), m_PItemUsable->getSlotID()));
						
			const int8* Query = 
                "UPDATE char_inventory "
                "SET currCharges = %u, lastUseTime = %u "
                "WHERE charid = %u AND location = %u AND slot = %u;";

			Sql_Query(
				SqlHandle,
				Query,
				m_PItemUsable->getCurrentCharges(),
				m_PItemUsable->getLastUseTime(),
				m_PChar->id,
				m_PItemUsable->getLocationID(),
				m_PItemUsable->getSlotID());

            if (m_PItemUsable->getCurrentCharges() != 0)
            {
                m_PChar->PRecastContainer->Add(RECAST_ITEM, m_PItemUsable->getSlotID(), m_PItemUsable->getReuseTime());
            }
			m_PItemUsable = new CItemUsable(*m_PItemUsable);
		}
		else // разблокируем все предметы, кроме экипирвоки
		{
            m_PItemUsable->setSubType(ITEM_UNLOCKED);
			m_PItemUsable = new CItemUsable(*m_PItemUsable);

			charutils::UpdateItem(m_PChar, m_PItemUsable->getLocationID(), m_PItemUsable->getSlotID(), -1);
		}
		m_PChar->pushPacket(new CInventoryFinishPacket());
	
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_INVISIBLE);
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HIDE);
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CAMOUFLAGE);
	
		apAction_t Action;
        m_PChar->m_ActionList.clear();

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_NONE;
		Action.animation  = m_PItemUsable->getAnimationID();
		Action.param	  = 0;
		Action.messageID  = 0;
		Action.flag		  = 0;

		m_PChar->m_ActionList.push_back(Action);

		m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

		ActionItemFinish();
	}
}

/************************************************************************
*																		*
*  Окончание использования предмета.									*
*  Сюда попадает копия предмета, которую нужно удалить.					*
*																		*
************************************************************************/

void CAICharNormal::ActionItemFinish() 
{
	DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if ((m_Tick - m_LastActionTime) >= m_PItemUsable->getAnimationTime())
	{
        luautils::OnItemUse(m_PBattleSubTarget, m_PItemUsable);

        // party AoE effect
        if (m_PItemUsable->getAoE() == 1 && m_PBattleSubTarget->PParty != NULL) 
        {
            for (uint8 i = 0; i < m_PBattleSubTarget->PParty->members.size(); ++i)
            {
                CBattleEntity* PTarget = m_PBattleSubTarget->PParty->members.at(i);

                if (m_PBattleSubTarget != PTarget && !PTarget->isDead() && distance(m_PBattleSubTarget->loc.p, PTarget->loc.p) <= 10)
                {
                    luautils::OnItemUse(PTarget, m_PItemUsable);
                }
            }
        }
		delete m_PItemUsable;

		m_LastMeleeTime += (m_Tick - m_LastActionTime);
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PItemUsable = NULL;
		m_PBattleSubTarget = NULL;
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionItemInterrupt()
{
	DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);

	m_PItemUsable->setSubType(ITEM_UNLOCKED);

	m_PChar->pushPacket(new CInventoryAssignPacket(m_PItemUsable, INV_NORMAL));
	m_PChar->pushPacket(new CInventoryFinishPacket());

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 54;
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;
		
	m_PChar->m_ActionList.push_back(Action);

	m_PChar->pushPacket(new CActionPacket(m_PChar));

	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	m_PItemUsable = NULL;
	m_PBattleSubTarget = NULL;
}

/************************************************************************
*																		*
*  Начало дальней атаки. Логика:										*
*  - если цель мертва, то атака не начинается. никаких сообщений 		*
*  - проверяем видимость цели (если не видим, то не можем определить 	*
*    дистанцию до цели или узнать, в бою ли цель)						*
*  - определяем в бою ли цель (нет смысла определять дистанцию, если 	*
*    цель атакует другой персонаж)										*
*  - и наконец определяем дистанцию до цели								*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedStart()
{
	DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != NULL);

	if( (m_Tick - m_PChar->m_rangedDelay) < 2400){ //cooldown between shots
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,94));
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_ActionTargetID = 0;
		m_PBattleSubTarget = NULL;
		return;
	}

	CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);

	if (PItem != NULL && 
	   (PItem->getType() & ITEM_WEAPON))
	{
		uint8 SkillType = PItem->getSkillType();
		//ranged weapon delay is stored in the db as offset from 240 for some reason. Also, getDelay incorrectly
		//returns the delay /60 - for ranged weapons it is /110 hence the calculation below.

		m_PChar->m_rangedDelay = ((240+((PItem->getDelay()*60)/1000))*1000)/110; //literal time in ms until shot fired

		if (charutils::hasTrait(m_PChar, TRAIT_RAPID_SHOT))
		{
			uint16 chance = (m_PChar->getMod(MOD_RAPID_SHOT) + m_PChar->PMeritPoints->GetMeritValue(MERIT_RAPID_SHOT_RATE,m_PChar->GetMLevel()));
			if (rand()%100 < chance)
				m_PChar->m_rangedDelay = 0;
		}



		switch (SkillType)
		{
			case SKILL_THR: break;
			case SKILL_ARC:
			case SKILL_MRK:
			{
				PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
				
				if (PItem != NULL && 
				   (PItem->getType() & ITEM_WEAPON))
				{
					break;
				}
			}
			default:
			{
				m_ActionTargetID = 0;
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,216));
				return;
			}
		}
	}else{
		PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

		if (PItem == NULL || 
		  !(PItem->getType() & ITEM_WEAPON) ||
		   (PItem->getSkillType() != SKILL_THR))
		{
			m_ActionTargetID = 0;
			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,216));
			return;
		}

		//todo: remove this and actually handle ammo thrown items (e.g. pebbles)
		m_ActionTargetID = 0;
			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,216));
			return;
	}

	if (GetValidTarget(&m_PBattleSubTarget, TARGET_ENEMY))
	{
		if (m_PBattleSubTarget->isDead())
		{
			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PBattleSubTarget = NULL;
			return;
		}
		if (!isFaceing(m_PChar->loc.p, m_PBattleSubTarget->loc.p, 40))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,217));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PBattleSubTarget = NULL;
			return;
		}
		if (!IsMobOwner(m_PBattleSubTarget))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,12));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PBattleSubTarget = NULL;
			return;
		}
		if (distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p) > 25)
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,78));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PBattleSubTarget = NULL;
			return;
		}
	}
	else
	{
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
		return;
	}

	// TODO: скорее всего m_LastActionTime нужно выставлять лишь при ANIMATION_ATTACK, иначе использовать LastRangedTime для 

	m_LastActionTime = m_Tick;
	m_PChar->m_StartActionPos = m_PChar->loc.p;

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 48;
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	m_ActionType = ACTION_RANGED_FINISH;
}

/************************************************************************
*																		*
*  Окончание дальней атаки												*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedFinish()
{
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (m_PBattleSubTarget->isDead())
	{
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
        m_PBattleSubTarget = NULL;
        return;
	}

	// check if player moved during Range attack wait
	if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x || m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 218)); // "You move and interrupt your aim."
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
		return;
	}


	if ((m_Tick - m_LastActionTime) > m_PChar->m_rangedDelay) 
	{
		m_LastActionTime = m_Tick;
		uint16 damage = 0;
		uint16 totalDamage = 0;

		apAction_t Action;
        m_PChar->m_ActionList.clear();

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;		//0x10
		Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
		Action.animation  = 0;
		Action.messageID  = 352;
		Action.flag = 0;



		uint8 hitCount = 1;			// 1 hit by default
		uint8 realHits = 0;			// to store the real number of hit for tp multipler
		bool hitOccured = false;	// track if player hit mob at all


		// if barrage is detected, getBarrageShotCount also checks for ammo count
		if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE,0))
			hitCount += battleutils::getBarrageShotCount(m_PChar);

		// loop for barrage hits, if a miss occurs, the loop will end
		for (uint8 i = 0; i < hitCount; ++i)
		{
				if (m_PBattleSubTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0))
				{
					Action.messageID = 32; 
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					i = hitCount; // end barrage, shot missed
				}
				else if(rand()%100 < battleutils::GetRangedHitRate(m_PChar,m_PBattleSubTarget)) // hit!
				{
					float pdif = battleutils::GetRangedPDIF(m_PChar,m_PBattleSubTarget);

					if(rand()%100 < battleutils::GetCritHitRate(m_PChar,m_PBattleSubTarget, true))
					{
						pdif *= 1.25; //uncapped
						Action.speceffect = SPECEFFECT_CRITICAL_HIT;
						Action.messageID = 353;
					}

					CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);
					CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

					if(PItem->getSkillType()!=SKILL_THR)
					{
						if(PAmmo!=NULL)
							damage = PAmmo->getDamage();
					}
					
					// at least 1 hit occured
					hitOccured = true;
					realHits ++;

					damage = (damage + PItem->getDamage() + battleutils::GetFSTR(m_PChar,m_PBattleSubTarget,SLOT_RANGED)) * pdif;
					damage = battleutils::CheckForDamageMultiplier(PItem,damage, 0);


					if(PItem != NULL)
					{
						//not a throwing item, check the ammo for dmg/etc
						battleutils::HandleRangedAdditionalEffect(m_PChar,m_PBattleSubTarget,&Action);
						charutils::TrySkillUP(m_PChar, (SKILLTYPE)PItem->getSkillType(), m_PBattleSubTarget->GetMLevel());
					}

				}
				else //miss
				{
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 354;

					if(m_PBattleSubTarget->objtype == TYPE_MOB)
					{
						((CMobEntity*)m_PBattleSubTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PChar, 0);
						((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.id = m_PChar->id;
						((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.targid = m_PChar->targid;
					}

					i = hitCount; // end barrage, shot missed
				}


				// check for recycle chance
				CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
				uint8 recycleChance = m_PChar->getMod(MOD_RECYCLE);

				if (charutils::hasTrait(m_PChar,TRAIT_RECYCLE))
					recycleChance += m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE,m_PChar->GetMLevel());

				if(PAmmo!=NULL && rand()%100 > recycleChance)
				{
					// TODO: charutils написать метод для обновления AMMO, чтобы корректно снимать предмет перед удалением
					charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1); 
					m_PChar->pushPacket(new CInventoryFinishPacket());
				}

				totalDamage += damage;
		}

		// if a hit did occur (even without barrage)
		if (hitOccured == true)
		{
			// any misses with barrage cause remaing shots to miss, meaning we must check Action.reaction
			if (Action.reaction == REACTION_EVADE && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE))
			{
				Action.messageID  = 352;
				Action.reaction   = REACTION_HIT;
				Action.speceffect = SPECEFFECT_CRITICAL_HIT;
			}

			Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, totalDamage, false, SLOT_RANGED, realHits, NULL, true);			
		}

        m_PChar->m_ActionList.push_back(Action);
		m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));


		m_LastMeleeTime += (m_Tick - m_LastActionTime);
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);

        // TODO: что это ? ....
        // если не ошибаюсь, то TREASURE_HUNTER работает лишь при последнем ударе

		CMobEntity* Monster = (CMobEntity*)m_PBattleSubTarget;
		if (Monster->m_HiPCLvl < m_PChar->GetMLevel()) 
		{
			Monster->m_HiPCLvl = m_PChar->GetMLevel();
		}


		if (charutils::hasTrait(m_PChar, TRAIT_TREASURE_HUNTER))
		{
			if (Monster->m_THLvl == 0) 
			{
				Monster->m_THLvl = m_PChar->getMod(MOD_TREASURE_HUNTER);
				Monster->m_THPCID = m_PChar->id;
			}
			else if ((Monster->m_THPCID != m_PChar->id) && (Monster->m_THLvl < m_PChar->getMod(MOD_TREASURE_HUNTER))) Monster->m_THLvl = m_PChar->getMod(MOD_TREASURE_HUNTER)+1;
			else if ((Monster->m_THPCID == m_PChar->id) && (Monster->m_THLvl < m_PChar->getMod(MOD_TREASURE_HUNTER))) Monster->m_THLvl = m_PChar->getMod(MOD_TREASURE_HUNTER);
			
			if (Monster->m_THLvl > 12) 
				Monster->m_THLvl = 12;
		}

		// to catch high damage bugs
		if (damage > 8000)
			ShowError(CL_RED"Warning: %s did 8000+ ranged damage, job = %u \n" CL_RESET, m_PChar->GetName(), m_PChar->GetMJob());

		m_PBattleSubTarget = NULL;
		m_PChar->m_rangedDelay = m_Tick; //cooldown between shots


		// remove barrage effect if present
		if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE,0))
			m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE,0);
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedInterrupt()
{
	m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 216));

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 48;
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;
		
	m_PChar->m_ActionList.push_back(Action);

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	m_PBattleSubTarget = NULL;
}

/************************************************************************
*																		*
*  Inoshishinofuda														*
*  Shikanofuda															*
*  Chonofuda															*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicStart()
{
    DSP_DEBUG_BREAK_IF(m_PSpell == NULL);
	DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != NULL);

    // mute 049 
	if (!charutils::hasSpell(m_PChar, m_PSpell->getID()) ||
	    !spell::CanUseSpell(m_PChar, m_PSpell->getID()) ||
		m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE))
	{
        MagicStartError(49);
		return;
	}
    if (m_PChar->PRecastContainer->Has(RECAST_MAGIC, m_PSpell->getID()))
    {
        MagicStartError(18);
        return;
    }
    
    DSP_DEBUG_BREAK_IF(m_PChar->loc.zone == NULL);

	if(m_PChar->loc.zone==NULL){ //crash occured on the next if (CanUseMisc) because zone was null.
		//Can't really explain how that's possible, possibly timing the spell as you zone..?
		//Either way, this check is required now.
		m_ActionTargetID = 0;
		m_PSpell = NULL;
		m_PBattleSubTarget = NULL;
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		return;
	}
    if (!m_PChar->loc.zone->CanUseMisc(m_PSpell->getZoneMisc()))
    {
        MagicStartError(40);
		return;
    }
    if (m_PSpell->getSpellGroup() == SPELLGROUP_SUMMONING)
	{
        if (m_PChar->PPet != NULL)
        {
            MagicStartError(315);
		    return;
        } 
	}
	if (GetValidTarget(&m_PBattleSubTarget, m_PSpell->getValidTarget()))
	{
		if (m_PBattleSubTarget->isDead() && !(m_PSpell->getValidTarget() & TARGET_PLAYER_DEAD))
		{
			MagicStartError(0); // TODO: узнать сообщение
			return;
		}
		if (m_PBattleSubTarget->objtype == TYPE_MOB && !IsMobOwner(m_PBattleSubTarget))
		{
            MagicStartError(12);
			return;
		}
		if (m_PSpell->getSpellGroup() == SPELLGROUP_NINJUTSU)
		{
            if(!battleutils::HasNinjaTool(m_PChar, m_PSpell, false))
            {
                MagicStartError(35);
                return;
            }
		} 
		else 
		{
			if (m_PSpell->getMPCost() > m_PChar->health.mp && !m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
			{
                MagicStartError(34);
				return;
			}
		}
	}
	else if (m_PBattleSubTarget != NULL)
	{
        MagicStartError(48);
		return;
	}
	else
	{
        MagicStartError(0);
		return;
	}

	if (m_PBattleSubTarget != m_PChar)
	{
		float Distance = distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p);

		if (Distance > 25)
		{
            MagicStartError(78);
			return;
		}
		if (Distance > 21.5)
		{
            MagicStartError(313);
			return;
		}
	}

	m_PChar->m_StartActionPos = m_PChar->loc.p;

	m_LastActionTime = m_Tick;

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 0;
	Action.param	  = m_PSpell->getID();
	Action.messageID  = 327;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
    m_ActionType = ACTION_MAGIC_CASTING;
}

/************************************************************************
*                                                                       *
*  Невозможно начать читать заклинание                                  *
*                                                                       *
************************************************************************/

void CAICharNormal::MagicStartError(uint16 error)
{
    DSP_DEBUG_BREAK_IF(m_ActionType != ACTION_MAGIC_START);

    if (error != 0)
    {
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, (m_PBattleSubTarget != NULL ? m_PBattleSubTarget : m_PChar), m_PSpell->getID(), 0, error));
    }
    m_ActionTargetID = 0;

	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;

    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicCasting()
{
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

    if (m_PBattleSubTarget->isDead() && !(m_PSpell->getValidTarget() & TARGET_PLAYER_DEAD))
	{
		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}
	if (m_PBattleSubTarget->objtype == TYPE_MOB && !IsMobOwner(m_PBattleSubTarget))
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,12));

		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}
	
	if (m_Tick - m_LastActionTime >= (float)m_PSpell->getCastTime()*((100.0f-(float)dsp_cap(m_PChar->getMod(MOD_FASTCAST),-100,50))/100.0f) ||
        m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL))
	{
		if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE))
        {
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,18));
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		else if (battleutils::IsParalised(m_PChar)) 
		{
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,29));
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		else if (battleutils::IsIntimidated(m_PChar, m_PBattleSubTarget)) 
		{
		    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,106));
		    m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}

		if (!charutils::hasSpell(m_PChar, m_PSpell->getID()))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,49));

			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		//the check for player position only occurs AFTER the cast time is up, you can move so long as x/z is the same on finish.
		//furthermore, it's actually quite lenient, hence the rounding to 1 dp
		if (floorf(m_PChar->m_StartActionPos.x * 10 + 0.5) / 10 != floorf(m_PChar->loc.p.x * 10 + 0.5) / 10 ||
		floorf(m_PChar->m_StartActionPos.z * 10 + 0.5) / 10 != floorf(m_PChar->loc.p.z * 10 + 0.5) / 10)
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 16)); 

			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		if ((m_PBattleSubTarget != m_PChar) &&
			(distance(m_PChar->loc.p,m_PBattleSubTarget->loc.p) > 21.5))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,78));

			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}

		if (m_PSpell->getSpellGroup() == SPELLGROUP_NINJUTSU)
		{
            if(!battleutils::HasNinjaTool(m_PChar, m_PSpell, true))
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, m_PSpell->getID(), 0, 35));

                m_ActionType = ACTION_MAGIC_INTERRUPT;
                ActionMagicInterrupt();
                return;
            }
		} 
        else 
        {
			if (m_PSpell->getMPCost() > m_PChar->health.mp && !m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,34));

				m_ActionType = ACTION_MAGIC_INTERRUPT;
				ActionMagicInterrupt();
				return;
			} 
            else 
            {
				if (!m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
				{
					m_PChar->addMP(-(int16)m_PSpell->getMPCost());
				}
			}
		}
		m_ActionType = ACTION_MAGIC_FINISH;
		ActionMagicFinish();
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicFinish()
{
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

    m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_BEGIN);

    if (!m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL))
    {
	    uint32 RecastTime = (float)m_PSpell->getRecastTime() * ((100.0f-dsp_cap((float)m_PChar->getMod(MOD_FASTCAST)/2.0f,0.0f,25.0f))/100.0f);
		RecastTime = RecastTime * ((100.0f-dsp_cap((float)m_PChar->getMod(MOD_HASTE),0.0f,25.0f))/100.0f);
		//needed so the client knows of the reduced recast time!
		m_PSpell->setModifiedRecast(RecastTime);

        m_PChar->PRecastContainer->Add(RECAST_MAGIC, m_PSpell->getID(), RecastTime);
    }
	else //chainspell does have a small delay between casts sadly!
    {
		m_PSpell->setModifiedRecast(2000);
        m_PChar->PRecastContainer->Add(RECAST_MAGIC, m_PSpell->getID(), 2000);
	}

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = m_PSpell->getAnimationID();
	Action.param      = 0; 
	Action.messageID  = 0;
	Action.flag		  = 0;

    m_PChar->m_ActionList.push_back(Action);

	if (m_PSpell->isAOE())
    {
	    if (m_PBattleSubTarget->objtype == TYPE_PC)
	    {
		    if (m_PBattleSubTarget->PParty != NULL)
		    {
			    for (uint8 i = 0; i < m_PBattleSubTarget->PParty->members.size(); ++i)
			    {
				    CBattleEntity* PTarget = m_PChar->PParty->members[i];

				    if (m_PBattleSubTarget != PTarget &&
                       !PTarget->isDead() && 
                       distance(m_PBattleSubTarget->loc.p, PTarget->loc.p) <= 10)
				    {
					    Action.ActionTarget = PTarget;
					    m_PChar->m_ActionList.push_back(Action);	
				    }
			    }
		    }
	    }
	    else if (m_PBattleSubTarget->objtype == TYPE_MOB)
	    {
		    for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin();  it != m_PChar->SpawnMOBList.end() && m_PChar->m_ActionList.size() < 15; ++it)
		    {
			    CBattleEntity* PTarget = (CBattleEntity*)it->second;
            
			    if (m_PBattleSubTarget != PTarget &&
                    !PTarget->isDead()  &&
                    IsMobOwner(PTarget) &&
				    distance(m_PBattleSubTarget->loc.p, PTarget->loc.p) <= 10)
			    {
				    Action.ActionTarget = PTarget;
			        m_PChar->m_ActionList.push_back(Action);
			    }
		    }
	    }
    }
    for (uint32 i = 0; i < m_PChar->m_ActionList.size(); ++i)
	{
        CBattleEntity* PTarget = m_PChar->m_ActionList.at(i).ActionTarget;

        m_PSpell->setMessage(m_PSpell->getDefaultMessage());
        m_PChar->m_ActionList.at(i).param = luautils::OnSpellCast(m_PChar, PTarget);
        m_PChar->m_ActionList.at(i).messageID = m_PSpell->getMessage();

		if(m_PChar->m_ActionList.at(i).param>0){ //damage spell which dealt damage, TODO: use a better identifier!
			if(m_PSpell->getMessage()==2 || m_PSpell->getMessage()==227){//damage or drain hp
				PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
			}
		}

		if(i>0 && m_PSpell->getMessage() == 2){ //if its a damage spell msg and is hitting the 2nd+ target
			m_PChar->m_ActionList.at(i).messageID = 264; //change the id to "xxx takes ### damage." only
		}
		if(i>0 && m_PSpell->getMessage() == 237){ //if its a damage spell msg and is hitting the 2nd+ target
			m_PChar->m_ActionList.at(i).messageID = 278; //change the id to "xxx receives the effect of xxx." only
		}

        if (PTarget->objtype == TYPE_MOB)
        {
            if (PTarget->isDead())
            {
                ((CMobEntity*)PTarget)->m_DropItemTime = m_PSpell->getAnimationTime();
            }
            ((CMobEntity*)PTarget)->m_OwnerID.id = m_PChar->id;
            ((CMobEntity*)PTarget)->m_OwnerID.targid = m_PChar->targid;
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmity(m_PChar, m_PSpell->getCE(), m_PSpell->getVE());
        }
    }
    // если заклинание атакующее, то дополнительно удаляем эффекты с флагом атаки
    m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END | ((m_PSpell->getValidTarget() & TARGET_ENEMY) ? EFFECTFLAG_ATTACK : EFFECTFLAG_NONE));

	charutils::UpdateHealth(m_PChar);
    charutils::TrySkillUP(m_PChar, (SKILLTYPE)m_PSpell->getSkillType(), m_PBattleSubTarget->GetMLevel());

	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	
	if(m_PChar->PPet!=NULL && ((CPetEntity*)m_PChar->PPet)->getPetType()==PETTYPE_WYVERN){
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_HEALING_BREATH;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	m_LastMeleeTime += (m_Tick - m_LastActionTime);
	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	CMobEntity* Monster = (CMobEntity*)m_PBattleSubTarget;
	if (Monster->m_HiPCLvl < m_PChar->GetMLevel()) Monster->m_HiPCLvl = m_PChar->GetMLevel();
	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicInterrupt()
{
	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = m_PSpell->getAnimationID();
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	m_LastMeleeTime += (m_Tick - m_LastActionTime);
	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;
}

/************************************************************************
*                                                                       *
*  Start the Job Ability                                                *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionJobAbilityStart()
{
	DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PJobAbility == NULL);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != NULL);

    if (m_PChar->PRecastContainer->Has(RECAST_ABILITY, m_PJobAbility->getRecastId()))
    {
        m_ActionTargetID = 0;

		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 87));

        m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PJobAbility = NULL;
		m_PBattleSubTarget = NULL;
		return;
    }
    if (GetValidTarget(&m_PBattleSubTarget, m_PJobAbility->getValidTarget()))
	{
	    if (m_PJobAbility->getValidTarget() == TARGET_ENEMY)
	    {
            if (!IsMobOwner(m_PBattleSubTarget))
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 12));

                m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
                m_PJobAbility = NULL;
			    m_PBattleSubTarget = NULL;
				return;
			}
		}
        if (m_PBattleSubTarget != m_PChar)
        {
            if (distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p) > m_PJobAbility->getRange())
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, 78));

                m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if(m_PJobAbility->getID() >= ABILITY_HEALING_RUBY){//blood pact
			if(m_PChar->health.mp < m_PJobAbility->getAnimationID()){ //not enough mp for BP
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, 87));
			    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if (m_PJobAbility->getID() == ABILITY_CALL_BEAST)//Call Beast, check ammo slot
		{
			if(charutils::hasInvalidJugPetAmmo(m_PChar)){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 337));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
			if(m_PChar->PPet!=NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 315));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if (m_PJobAbility->getID() == ABILITY_SIC){//Sic, check pet TP
			if(m_PChar->PPet!=NULL && m_PChar->PPet->health.tp<100){ 
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 575));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
			else if(m_PChar->PPet==NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 215));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
			else if(m_PChar->PPet->GetHPP() == 0){//prevent player having an undead pet
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, 87));
			    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
			else if(m_PChar->PPet->PBattleAI->GetBattleTarget() == NULL){//Crash fix, prevent pet using ability with no target
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 574));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}

			else if(m_PChar->PPet->objtype == TYPE_MOB){//crash fix, dont use sic if pet(charmed) has no tp moves
				std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(((CMobEntity*)m_PChar->PPet)->m_Family);
				if(MobSkills.size() == 0){
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 336));
					m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
					m_PJobAbility = NULL;
					m_PBattleSubTarget = NULL;
					return;
				}
			}

		}
		if(m_PJobAbility->getID() == ABILITY_SPIRIT_LINK){ 
			if(m_PChar->PPet == NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 215));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}else if(m_PChar->PPet->health.hp == m_PChar->PPet->health.maxhp && !m_PChar->PPet->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP) && !m_PChar->PPet->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP_II)){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 87));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if(m_PJobAbility->getID() == ABILITY_CALL_WYVERN){
			if(m_PChar->PPet!=NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 315));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}

		if(m_PJobAbility->getID() == ABILITY_CHARM){
			
			// player already has a pet
			if(m_PChar->PPet!=NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 315));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
			// Pet already has a master
			if(m_PBattleSubTarget->PMaster != NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 235));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}

		if(m_PJobAbility->getID() == ABILITY_FIGHT){
			//cannot use fight on your own or pet or another players pet
			if(m_PBattleSubTarget == m_PChar->PPet || (m_PBattleSubTarget->PMaster != NULL && m_PBattleSubTarget->PMaster->objtype == TYPE_PC) ){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 446));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}	
		}

		// enmity transfer abilities
		if (m_PJobAbility->getID() == ABILITY_ACCOMPLICE || m_PJobAbility->getID() == ABILITY_COLLABORATOR){
			if(m_PBattleSubTarget == m_PChar ||							// if target is self
				m_PBattleSubTarget->objtype != TYPE_PC ||				// if target is not a player)	
				m_PBattleSubTarget == NULL)								// if target is null											
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 155)); // must specify valid target to use.....
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
			if(m_PBattleSubTarget->PBattleAI->GetBattleTarget() == NULL)	// if party member is not engaged to any mob	
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 88)); // unable to use ability
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		

		if (m_PJobAbility->getID() == ABILITY_HASSO || m_PJobAbility->getID() == ABILITY_SEIGAN){
			if(!m_PChar->m_Weapons[SLOT_MAIN]->isTwoHanded()){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 307));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
        m_ActionType = ACTION_JOBABILITY_FINISH;
        ActionJobAbilityFinish();
        return;
	}
    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,88));

    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
    m_PJobAbility = NULL;
    m_PBattleSubTarget = NULL;
    return;
}

/************************************************************************
*                                                                       *
*  End the Job Ability                                                  *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionJobAbilityFinish()
{
    DSP_DEBUG_BREAK_IF(m_PJobAbility == NULL);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

    if (m_PChar->animation == ANIMATION_ATTACK) m_LastActionTime = m_Tick;

    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_INVISIBLE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HIDE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CAMOUFLAGE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SNEAK);

    if (m_PJobAbility->getLevel() == 0)
    {
		Sql_Query(SqlHandle, "UPDATE char_stats SET 2h = %u WHERE charid = %u", m_Tick, m_PChar->id);
    }

    uint32 RecastTime = m_PJobAbility->getRecastTime() * 1000;

	if (m_PJobAbility->getID() == ABILITY_THIRD_EYE && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SEIGAN))
	{
		RecastTime /= 2;
	}
	if(m_PJobAbility->getID() >= ABILITY_HEALING_RUBY){
		if(m_PChar->getMod(MOD_BP_DELAY) > 15){
			RecastTime -= 15000;
		}else{
			RecastTime -= m_PChar->getMod(MOD_BP_DELAY) * 1000;
		}
	}
    m_PChar->PRecastContainer->Add(RECAST_ABILITY, m_PJobAbility->getRecastId(), RecastTime);
    m_PChar->pushPacket(new CCharSkillsPacket(m_PChar));

    apAction_t Action;
	m_PChar->m_ActionList.clear();

    // TODO: бардак. тоже выкинуть отсюда

	if (m_PJobAbility->getID() >= ABILITY_HEALING_RUBY)
    {
		if (m_PChar->PPet!=NULL) //is a bp - dont display msg and notify pet
        {
			Action.animation  = 94; //assault anim
			Action.ActionTarget = m_PBattleSubTarget;
			Action.reaction   = REACTION_NONE;
			Action.speceffect = SPECEFFECT_RECOIL;
			Action.param      = 0;
			Action.flag       = 0; 
			Action.messageID  = 0;

			if(m_PJobAbility->getID() == ABILITY_SEARING_LIGHT || m_PJobAbility->getID() == ABILITY_AERIAL_BLAST || m_PJobAbility->getID() == ABILITY_EARTHEN_FURY){
				if(m_PChar->health.mp >= m_PChar->GetMLevel() * 2){
					m_PChar->addMP(-m_PChar->GetMLevel() * 2);
				}
			} else {
				m_PChar->addMP(-m_PJobAbility->getAnimationID()); // TODO: ...
			}
			m_PChar->m_ActionList.push_back(Action);
			m_PChar->PPet->PBattleAI->SetBattleSubTarget(m_PBattleSubTarget);

			((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = m_PJobAbility->getID(); // TODO: не допустимый подход

			m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
			charutils::UpdateHealth(m_PChar);
		}
	}
	else if (m_PJobAbility->getAOE() == 1 && m_PChar->PParty != NULL)
	{
		for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
		{
			CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

            if(!PTarget->isDead() &&
                PTarget->getZone() == m_PChar->getZone() &&
                distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
			{
                uint16 value = luautils::OnUseAbility(m_PChar, PTarget, m_PJobAbility);

				Action.ActionTarget = PTarget;
				Action.reaction   = REACTION_NONE;
				Action.speceffect = SPECEFFECT_NONE;
				Action.animation  = m_PJobAbility->getAnimationID();
				Action.param	  = value;
                Action.messageID  = m_PJobAbility->getMessage();
				Action.flag		  = 0;

				m_PChar->m_ActionList.push_back(Action);		
			}
		}
	}
    else
	{
        uint16 value = luautils::OnUseAbility(m_PChar, m_PBattleSubTarget, m_PJobAbility);

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_RECOIL;
		Action.animation  = m_PJobAbility->getAnimationID();
		Action.param      = value; 
        Action.messageID  = m_PJobAbility->getMessage();
        Action.flag       = 0;



		// handle jump abilities---

		// Jump
		if(m_PJobAbility->getID() == ABILITY_JUMP)
		{
			Action.param = battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 1);
			if (Action.param == 0)
			{
				Action.messageID = 0;
				m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, 324));
			}
		}
		// High Jump
		else if(m_PJobAbility->getID() == ABILITY_HIGH_JUMP)
		{
			Action.param = battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 2);
			if (Action.param == 0)
			{
				Action.messageID = 0;
				m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, 324));
			}
		}
		// Super Jump
		else if(m_PJobAbility->getID() == ABILITY_SUPER_JUMP)
		{
			battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 3);
			Action.messageID = 0;
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, 100));
		}


		// handle enmity transfer abilities
		if (m_PJobAbility->getID() == ABILITY_ACCOMPLICE)
			battleutils::TransferEnmity(m_PChar, m_PBattleSubTarget, (CMobEntity*)m_PBattleSubTarget->PBattleAI->GetBattleTarget(), 50);
		else if (m_PJobAbility->getID() == ABILITY_COLLABORATOR)
			battleutils::TransferEnmity(m_PChar, m_PBattleSubTarget, (CMobEntity*)m_PBattleSubTarget->PBattleAI->GetBattleTarget(), 25);


		m_PChar->m_ActionList.push_back(Action);


        if (m_PJobAbility->getValidTarget() & TARGET_ENEMY) 
        {
            // во время pvp целью могут быт персонажи, монстры и их питомцы
			if (m_PBattleSubTarget->objtype == TYPE_MOB && m_PJobAbility->getID() != ABILITY_ASSAULT && m_PJobAbility->getID() != ABILITY_FIGHT) 
				//assault(72)/fight(53) doesnt generate hate directly
            {
                ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.id = m_PChar->id;
                ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.targid = m_PChar->targid;
                ((CMobEntity*)m_PBattleSubTarget)->PEnmityContainer->UpdateEnmity(m_PChar, m_PJobAbility->getCE(), m_PJobAbility->getVE());
            }
        }
	}



    // TODO: все перенести в скрипты, т.к. система позволяет получать указатель на питомца

	if(m_PJobAbility->getID() == ABILITY_CALL_BEAST){
		charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
		m_PChar->pushPacket(new CInventoryFinishPacket());
	}
	if(m_PJobAbility->getID() == ABILITY_SIC && m_PChar->PPet != NULL && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_JUGPET){//Sic
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_SIC;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	if(m_PJobAbility->getID() == ABILITY_SIC && m_PChar->PPet != NULL && m_PChar->PPet->objtype == TYPE_MOB){//Sic charmed mob
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_SIC;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}


	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	// Message "player uses..."  for most abilities
	if(m_PJobAbility->getID() < ABILITY_HEALING_RUBY && 
		m_PJobAbility->getID() != ABILITY_JUMP && m_PJobAbility->getID() != ABILITY_HIGH_JUMP && m_PJobAbility->getID() != ABILITY_SUPER_JUMP)
	{
		m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PChar, m_PJobAbility->getID()+16, 0, 100));
	}

	m_PJobAbility = NULL;
    m_PBattleSubTarget = NULL;
    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
}

/************************************************************************
*                                                                       *
*  Start the weapon skill                                               *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionWeaponSkillStart()
{
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PWeaponSkill == NULL);
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != NULL);

    if (!charutils::hasWeaponSkill(m_PChar, m_PWeaponSkill->getID()))
    {
        WeaponSkillStartError(190);
        return;
    }
    if (m_PChar->health.tp < 100)
    {
        WeaponSkillStartError(192);
        return;
    }

    if (GetValidTarget(&m_PBattleSubTarget, TARGET_ENEMY))
    {
        if (!IsMobOwner(m_PBattleSubTarget))
	    {
            WeaponSkillStartError(12);
		    return;
	    }

	    float Distance = distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p);

	    if ((Distance - m_PBattleSubTarget->m_ModelSize) > m_PWeaponSkill->getRange())
	    {
            WeaponSkillStartError(36);
		    return;
	    }
	    if (!isFaceing(m_PChar->loc.p, m_PBattleSubTarget->loc.p, 40))
	    {
            WeaponSkillStartError(5);
		    return;
	    }
        if( 218 >= m_PWeaponSkill->getID() && m_PWeaponSkill->getID() >= 192 ) // ranged WS IDs
        {
			CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

			// before allowing ranged weapon skill...
			if (PItem == NULL ||								// check item is not null
			  !(PItem->getType() & ITEM_WEAPON) ||				
			  !m_PChar->m_Weapons[SLOT_AMMO]->isRanged() ||		// make sure ammo item is a ranged item
              !m_PChar->m_Weapons[SLOT_RANGED]->isRanged() ||	// make sure range weapon is a range weapon
			  m_PChar->equip[SLOT_AMMO] == 0)					// make sure ammo is equiped (the ammo qty checks the inventory slot and not the ammo slot)
			{
				WeaponSkillStartError(216); // You do not have an appropriate ranged weapon equipped
				return;
			}

		}
        m_ActionType = ACTION_WEAPONSKILL_FINISH;
        return;
    }

	if (m_PBattleSubTarget == m_PChar)
    {
		if(battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID()))
        {
			m_ActionType = ACTION_WEAPONSKILL_FINISH;
			return;
		}
	}
    WeaponSkillStartError(446);
}

/************************************************************************
*                                                                       *
*  Невозможно начать weapon skill                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::WeaponSkillStartError(uint16 error)
{
    DSP_DEBUG_BREAK_IF(m_ActionType != ACTION_WEAPONSKILL_START);

    if (error != 0)
    {
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, (m_PBattleSubTarget != NULL ? m_PBattleSubTarget : m_PChar), 0, 0, error));
    }
    m_ActionTargetID = 0;

    m_PWeaponSkill = NULL;
    m_PBattleSubTarget = NULL;

    m_ActionType = ACTION_ATTACK;
    ActionAttack();
}

/************************************************************************
*																		*
*			End the weapon skill										*
*																		*
************************************************************************/

void CAICharNormal::ActionWeaponSkillFinish()
{
	DSP_DEBUG_BREAK_IF(m_PWeaponSkill == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (m_PBattleSubTarget->isDead())
	{
	        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	        m_PBattleSubTarget = NULL;
        	return;
	}
	//apply TP Bonus
	float bonusTp = m_PChar->getMod(MOD_TP_BONUS);
	//remove TP Bonus from offhand weapon
	if(m_PChar->equip[SLOT_SUB] != 0){
		std::vector<CModifier*>::iterator modIterator;
		std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_SUB]))->modList;
		for(modIterator = modList.begin(); modIterator != modList.end(); modIterator++){
			if((*modIterator)->getModID() == MOD_TP_BONUS){
				bonusTp = bonusTp - (*modIterator)->getModAmount();
			}
		}
	}
	//if ranged WS, remove TP bonus from mainhand weapon
	if(m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218){
		if(m_PChar->equip[SLOT_MAIN] != 0){
			std::vector<CModifier*>::iterator modIterator;
			std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_MAIN]))->modList;
			for(modIterator = modList.begin(); modIterator != modList.end(); modIterator++){
				if((*modIterator)->getModID() == MOD_TP_BONUS){
					bonusTp = bonusTp - (*modIterator)->getModAmount();
				}
			}
		}
	} else {
	//if melee WS, remove TP bonus from ranged weapon
		if(m_PChar->equip[SLOT_RANGED] != 0){
			std::vector<CModifier*>::iterator modIterator;
			std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]))->modList;
			for(modIterator = modList.begin(); modIterator != modList.end(); modIterator++){
				if((*modIterator)->getModID() == MOD_TP_BONUS){
					bonusTp = bonusTp - (*modIterator)->getModAmount();
				}
			}
		}
	}
	if(bonusTp+m_PChar->health.tp > 300){
		bonusTp = 300 - m_PChar->health.tp;
		m_PChar->health.tp = 300;
	} else {
		m_PChar->addTP(bonusTp);
	}
	float wsTP = m_PChar->health.tp;
	m_LastActionTime = m_Tick;
	uint16 tpHitsLanded = 0;
	uint16 extraHitsLanded = 0;
	uint16 damage = 0;
	damage = luautils::OnUseWeaponSkill(m_PChar, m_PBattleSubTarget, &tpHitsLanded, &extraHitsLanded);
	m_PChar->addTP(-bonusTp);
	if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI)){
		m_PChar->addTP(-100);
	}
	else if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI)){
		m_PChar->addTP(-100);
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
	}
	else{
		m_PChar->health.tp = 0;
	}


	//incase a TA party member is available
	CBattleEntity* taChar = NULL;

	//trick attack agi bonus for thf main job
	if(m_PChar->GetMJob() == JOB_THF &&	m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
	{
		taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);
		if(taChar != NULL) damage += m_PChar->AGI();
	}

	//check if other jobs have trick attack active to change enmity lateron
	if(taChar == NULL && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
		taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);


	if(!battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID())){
		uint8 damslot = SLOT_MAIN;
		if(m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218){//ranged WS IDs
			damslot = SLOT_RANGED;
		}
		damage = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage, false, damslot, tpHitsLanded, taChar, true);
		m_PBattleSubTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BOOST); //TODO: REMOVE THIS, BOOST EFFECT IN DB IS WRONG, MISSING EFFECTFLAG_DAMAGE
	}

	m_PChar->addTP(extraHitsLanded);
	float afterWsTP = m_PChar->health.tp;
	if(m_PChar->PPet!=NULL && ((CPetEntity*)m_PChar->PPet)->getPetType()==PETTYPE_WYVERN){
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_ELEMENTAL_BREATH;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	apAction_t Action;
	m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction = REACTION_HIT;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation = m_PWeaponSkill->getAnimationId();
	Action.param = damage;
	Action.flag = 0;

	if(damage==0)
	{
		Action.reaction = REACTION_EVADE;
		Action.messageID = 188; //but misses
	}
	else
	{
		Action.messageID = 185; //damage ws
	}

	if(battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID())){
		Action.speceffect = SPECEFFECT_NONE;
		Action.messageID = 224; //restores mp msg
		m_PChar->addMP(damage);
	}

	if(m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218)
	{
		//ranged WS IDs
		CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

		if(PAmmo!=NULL && rand()%100 > (m_PChar->getMod(MOD_RECYCLE) + m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE,m_PChar->GetMLevel())) )
		{
			if ( (PAmmo->getQuantity()-1) < 1) // ammo will run out after this shot, make sure we remove it from equip
			{
				charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
				charutils::UnequipItem(m_PChar,SLOT_AMMO);
			}
			else
			{
				charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
			}
			m_PChar->pushPacket(new CInventoryFinishPacket());
		}
	}

    // DO NOT REMOVE!  This is here for a reason...
    // Skill chains should not be affected by MISSED weapon skills or non-elemental 
    // weapon skills such as: Spirits Within, Spirit Taker, Energy Steal, Energy Drain, Starlight, and Moonlight.
    if((Action.param > 0) && (m_PWeaponSkill->getPrimarySkillchain() != 0)) 
    {
        // NOTE: GetSkillChainEffect is INSIDE this if statement because it 
        //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
        SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, m_PWeaponSkill);
        if (effect != SUBEFFECT_NONE)
        {
	        uint16 skillChainDamage = battleutils::TakeSkillchainDamage(m_PChar, m_PBattleSubTarget, damage);

	        switch(effect)
	        {
		        case SUBEFFECT_DARKNESS:
		        case SUBEFFECT_FRAGMENTATION:
		        case SUBEFFECT_FUSION:
		        case SUBEFFECT_LIQUEFACATION:
		        case SUBEFFECT_REVERBERATION:
		        case SUBEFFECT_SCISSION:
		        case SUBEFFECT_IMPACTION:
		        {
			        Action.flag = 1;
			        Action.subeffect = effect;
			        Action.subparam = skillChainDamage;
			        Action.submessageID = 287;
		        }
		        break;

		        case SUBEFFECT_LIGHT:
		        case SUBEFFECT_GRAVITATION:
		        case SUBEFFECT_DISTORTION:
		        case SUBEFFECT_COMPRESSION:
		        case SUBEFFECT_INDURATION:
		        case SUBEFFECT_TRANSFIXION:
		        case SUBEFFECT_DETONATION:
		        {
			        Action.flag = 3;
			        Action.subeffect = SUBEFFECT(effect - 10);
			        Action.subparam = skillChainDamage;
			        Action.submessageID = 288;
		        }
		        break;
	        }
	        Action.submessageID += Action.subeffect * 2;
        }
    }
	
	m_PChar->m_ActionList.push_back(Action);
	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	m_PChar->m_ActionList.clear();
	//2 == AoE on Target
	//4 == Cone on Target (Not supported?)
	if ( m_PWeaponSkill->getAoe() == 2 || m_PWeaponSkill->getAoe() == 4)
	{
		apAction_t AoEAction;
		
		AoEAction.reaction = REACTION_HIT;
		AoEAction.speceffect = SPECEFFECT_RECOIL;
		AoEAction.animation = m_PWeaponSkill->getAnimationId();
		AoEAction.flag = 0;

		if (m_PBattleSubTarget->objtype == TYPE_MOB)
		{
			for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin(); it != m_PChar->SpawnMOBList.end() && m_PChar->m_ActionList.size() < 15; ++it)
			{
				CBattleEntity* PTarget = (CBattleEntity*)it->second;

				if (m_PBattleSubTarget != PTarget &&
					!PTarget->isDead() &&
					IsMobOwner(PTarget) &&					
					distance(m_PBattleSubTarget->loc.p, PTarget->loc.p) <= 10)
				{
					if(m_PWeaponSkill->getAoe() == 4)
					{
						if(getangle(m_PBattleSubTarget->loc.p, PTarget->loc.p) >= 45)
						{
							continue;
						}
					}
					m_PChar->health.tp = wsTP;
					damage = luautils::OnUseWeaponSkill(m_PChar, m_PBattleSubTarget, &tpHitsLanded, &extraHitsLanded);
					m_PChar->health.tp = afterWsTP;
					AoEAction.param = battleutils::TakePhysicalDamage(m_PChar, PTarget, damage, false, SLOT_MAIN, 0, taChar, true);
					if(damage==0)
					{
						AoEAction.reaction = REACTION_EVADE;
						AoEAction.messageID = 188; //but misses
					}
					else
					{
						AoEAction.messageID = 264; // "xxx takes ### damage." only
					}
					((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PChar, 0);					
					AoEAction.ActionTarget = PTarget;
					m_PChar->m_ActionList.push_back(AoEAction);
				}
			}
		}
	}


	// to catch high damage bugs
	if (damage > 8000)
		ShowError(CL_RED"Warning: %s did 8000+ weaponskill damage, job = %u \n" CL_RESET, m_PChar->GetName(), m_PChar->GetMJob());

	charutils::UpdateHealth(m_PChar);
	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	m_PWeaponSkill = NULL;
    m_PBattleSubTarget = NULL;
	m_ActionType = ACTION_ATTACK;
}

/************************************************************************
*																		*
*  Auto Attack															*
*																		*
************************************************************************/

void CAICharNormal::ActionAttack() 
{
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);
	
	//disengage if player has charmed the mob
	if (m_PChar->PPet != NULL && m_PChar->PPet == m_PBattleTarget)
	{
		m_PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
		return;
	}

	//disengage if another player has charmed the mob
	if (m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->PMaster != NULL && m_PBattleTarget->PMaster->objtype == TYPE_PC)
	{
		m_PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
		return;
	}


	CMobEntity* Monster = (CMobEntity*)m_PBattleTarget;
	if (Monster->m_HiPCLvl < m_PChar->GetMLevel()) Monster->m_HiPCLvl = m_PChar->GetMLevel();
	if (charutils::hasTrait(m_PChar, TRAIT_TREASURE_HUNTER))
	{
		if (Monster->m_THLvl == 0) 
			{
				Monster->m_THLvl = m_PChar->getMod(MOD_TREASURE_HUNTER);
				Monster->m_THPCID = m_PChar->id;
			}
			else if ((Monster->m_THPCID != m_PChar->id) && (Monster->m_THLvl < m_PChar->getMod(MOD_TREASURE_HUNTER))) Monster->m_THLvl = m_PChar->getMod(MOD_TREASURE_HUNTER)+1;
			else if ((Monster->m_THPCID == m_PChar->id) && (Monster->m_THLvl < m_PChar->getMod(MOD_TREASURE_HUNTER))) Monster->m_THLvl = m_PChar->getMod(MOD_TREASURE_HUNTER);
			if (Monster->m_THLvl > 12) Monster->m_THLvl = 12;
	}
	if (m_PBattleTarget->isDead())
	{
        if (m_PChar->m_hasAutoTarget && m_PBattleTarget->objtype == TYPE_MOB) // Auto-Target
	    {
		    for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin();  it != m_PChar->SpawnMOBList.end(); ++it)
		    {
			    CBattleEntity* PTarget = (CBattleEntity*)it->second;
            
                if (PTarget->animation == ANIMATION_ATTACK &&
                    isFaceing(m_PChar->loc.p, PTarget->loc.p, 64) &&
                    distance(m_PChar->loc.p, PTarget->loc.p) <= 10)
                {
                    if (m_PChar->PParty != NULL) 
	                {
						if (m_PChar->PParty->m_PAlliance != NULL)
						{
							for (uint8 a = 0; a < m_PChar->PParty->m_PAlliance->partyList.size(); ++a)
							{
								for (uint8 i = 0; i < m_PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
								{
									if (PTarget->m_OwnerID.id == m_PChar->PParty->m_PAlliance->partyList.at(a)->members[i]->id ||
										(PTarget->m_OwnerID.id == 0 && PTarget->PBattleAI->GetBattleTarget() == m_PChar->PParty->m_PAlliance->partyList.at(a)->members[i]))
									{
										m_PBattleTarget = PTarget;
										m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
										return;
									}
								}
							}
						}
                        else
                        {
		                    for (uint8 i = 0; i < m_PChar->PParty->members.size(); ++i)
		                    {
			                    if (PTarget->m_OwnerID.id == m_PChar->PParty->members[i]->id ||
                                   (PTarget->m_OwnerID.id == 0 && PTarget->PBattleAI->GetBattleTarget() == m_PChar->PParty->members[i]))
			                    {
                                    m_PBattleTarget = PTarget;
				                    m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                                    return;
			                    }
		                    }
                        }
	                }
                    else if (PTarget->m_OwnerID.id == m_PChar->id ||
                            (PTarget->m_OwnerID.id == 0 && PTarget->PBattleAI->GetBattleTarget() == m_PChar))
                    {
                        m_PBattleTarget = PTarget;
                        m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                        return;
                    }
                }
		    }
	    }
		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}

	if (!IsMobOwner(m_PBattleTarget))
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,12));

		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}

	float Distance = distance(m_PChar->loc.p,m_PBattleTarget->loc.p);

	if (Distance > 30)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,36));

		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}


	uint16 WeaponDelay = (m_PChar->m_Weapons[SLOT_MAIN]->getDelay() * (100 - m_PChar->getMod(MOD_HASTE))) / 100;

	if (m_PChar->m_Weapons[SLOT_SUB]->getDmgType() > 0 && 
		m_PChar->m_Weapons[SLOT_SUB]->getDmgType() < 4 &&
		m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() != DAMAGE_HTH)
	{
		WeaponDelay += (m_PChar->m_Weapons[SLOT_SUB]->getDelay() * (100 - m_PChar->getMod(MOD_HASTE))) / 100;
		//apply dual wield delay reduction
		WeaponDelay = WeaponDelay * ((100.0f - (float)m_PChar->getMod(MOD_DUAL_WIELD))/100.0f);
	}
	

	if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS))
	{
		WeaponDelay = 1700;
	}
    else if (m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH)
	{
		WeaponDelay -= m_PChar->getMod(MOD_MARTIAL_ARTS) * 1000 / 60;
	}

	if ((m_Tick - m_LastMeleeTime) > WeaponDelay)
	{
		if (!isFaceing(m_PChar->loc.p, m_PBattleTarget->loc.p, 40))
		{
			if ((m_Tick - m_AttackMessageTime) > WeaponDelay)
			{
				m_AttackMessageTime = m_Tick;
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,5));
			}
			return;
		}
		if (Distance > m_PBattleTarget->m_ModelSize)
		{
			if ((m_Tick - m_AttackMessageTime) > WeaponDelay)
			{
				m_AttackMessageTime = m_Tick;
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,4));
			}
			return;
		}
        m_LastMeleeTime = (m_LastMeleeTime >= m_AttackMessageTime) ? m_LastMeleeTime + WeaponDelay : m_Tick;
		if (battleutils::IsParalised(m_PChar)) 
		{
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,29));
		}
		else if (battleutils::IsIntimidated(m_PChar, m_PBattleTarget)) 
		{
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,106));
		}
		else
		{
			apAction_t Action;
            m_PChar->m_ActionList.clear();

			Action.ActionTarget = m_PBattleTarget;
			uint8 numattacksLeftHand = 0;
			uint8 numKickAttacks = 0;

			CBattleEntity* taChar = NULL;

			uint16 subType = m_PChar->m_Weapons[SLOT_SUB]->getDmgType();
			
			if ((subType > 0 && subType < 4))//sub weapon is equipped!
			{ 
				numattacksLeftHand = battleutils::CheckMultiHits(m_PChar, m_PChar->m_Weapons[SLOT_SUB]);
			}
			if(m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH){ //h2h equipped!
				numattacksLeftHand = battleutils::CheckMultiHits(m_PChar, m_PChar->m_Weapons[SLOT_MAIN]);
				if(m_PChar->GetMJob() == JOB_MNK)
				{
					uint8 kickAttackChance = m_PChar->getMod(MOD_KICK_ATTACK);
					kickAttackChance += m_PChar->PMeritPoints->GetMeritValue(MERIT_KICK_ATTACK_RATE,m_PChar->GetMLevel());
					numKickAttacks = ((rand()%100 <= kickAttackChance) ? 1 : 0);
				}
			}

			uint8 numattacksRightHand = battleutils::CheckMultiHits(m_PChar, m_PChar->m_Weapons[SLOT_MAIN]);

			CItemWeapon* PWeapon = m_PChar->m_Weapons[SLOT_MAIN];
			uint8 fstrslot = SLOT_MAIN;
			bool zanshin = false;

			for (uint8 i = 0; i < (numattacksLeftHand + numattacksRightHand + numKickAttacks); ++i) 
			{
				if (i != 0)
				{
					if (m_PBattleTarget->isDead())
					{
						break;
					}
					Action.ActionTarget = NULL;
					
					if (m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() != DAMAGE_HTH && i>=numattacksRightHand)
					{
						PWeapon = m_PChar->m_Weapons[SLOT_SUB];
						fstrslot = SLOT_SUB;
					}
				}
				uint16 damage = 0;

				if(m_PChar->GetMJob() == JOB_MNK && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_FOOTWORK)){
					//TODO: footwork changes dmg and weapoin delay - for now just change animation
						if(i < numattacksRightHand){
							Action.animation = 2;//kick right leg
						}else if(i >= numattacksLeftHand + numattacksRightHand){
							Action.animation = 2;//kick right leg
						}else{
							Action.animation = 3;//kick left leg
						}			
				}else{
						if(i < numattacksRightHand){
							Action.animation = 0;//attack right hand
						}else if(i >= numattacksLeftHand + numattacksRightHand){
							Action.animation = 2;//kick right leg
						}else{
							Action.animation = 1;//attack left hand
						}				
				}


				Action.flag	= 0;

				uint8 hitRate = 0;
				if (zanshin)
				{
					hitRate = battleutils::GetHitRateAccOffset(m_PChar,m_PBattleTarget, 34);
				}
				else 
				{
					hitRate = battleutils::GetHitRate(m_PChar,m_PBattleTarget);
				}
				// сначала вычисляем вероятность попадания по монстру
				// затем нужно вычислить вероятность нанесения критического удара
				if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0))
				{
					Action.messageID = 32; 
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
				}
				else if ( rand()%100 < hitRate)
				{
                    bool ignoreSneakAttack = (i != 0); // Sneak attack critical effect should only be given on the first swing.
					bool ignoreTrickAttack = (i != 0);
					bool isCritical = (rand()%100 < battleutils::GetCritHitRate(m_PChar, m_PBattleTarget, ignoreSneakAttack));

					float DamageRatio = battleutils::GetDamageRatio(m_PChar, m_PBattleTarget, isCritical, 0); 

					if (isCritical)
					{
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_CRITICAL_HIT;
						Action.messageID  = 67;
						Action.flag = 0;
					}
                    else
                    {
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_HIT;
						Action.messageID  = 1;
					}

					uint16 bonusDMG = 0;

					if(m_PChar->GetMJob() == JOB_THF && (!ignoreSneakAttack) &&
						m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK) &&
						abs(m_PBattleTarget->loc.p.rotation - m_PChar->loc.p.rotation) < 23)
						{
							bonusDMG = m_PChar->DEX();
							if(rand()%100 < 4) Monster->m_THLvl +=1;
						}



					//trick attack agi bonus for thf main job
					if(m_PChar->GetMJob() == JOB_THF && (!ignoreTrickAttack) &&	m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
					{
						taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);
						if(taChar != NULL) bonusDMG += m_PChar->AGI();
					}

					//check if other jobs have trick attack active to change enmity lateron
					if(taChar == NULL && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK) && (!ignoreTrickAttack))
						taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);


					damage = (uint16)(((PWeapon->getDamage() + bonusDMG + 
						battleutils::GetFSTR(m_PChar, m_PBattleTarget,fstrslot)) * DamageRatio));


					// do soul eater effect
					damage = battleutils::doSoulEaterEffect(m_PChar, damage);

					charutils::TrySkillUP(m_PChar, (SKILLTYPE)PWeapon->getSkillType(), m_PBattleTarget->GetMLevel());
					zanshin = false;
				}
				else
				{
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 15;
					if ( !zanshin && rand()%100 < m_PChar->getMod(MOD_ZANSHIN) && (( i == 0 && numattacksRightHand == 1 ) || (i == numattacksRightHand && numattacksLeftHand == 1)) )
					{
						zanshin = true;
						if ( i > numattacksRightHand ) {numattacksLeftHand++;}
						else {numattacksRightHand++;}
					}
					else
					{
						zanshin = false;
					}
				}

                bool isBlocked = battleutils::IsBlocked(m_PChar, m_PBattleTarget);
				if(isBlocked && Action.reaction!=REACTION_EVADE){ Action.reaction = REACTION_BLOCK; }
				
				if (Action.reaction == REACTION_HIT)
				{
					damage = battleutils::CheckForDamageMultiplier(PWeapon,damage,i);
					Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleTarget, damage, isBlocked, fstrslot, 1, taChar, true);
				}
				else
				{
					Action.param = 0;
					((CMobEntity*)m_PBattleTarget)->PEnmityContainer->UpdateEnmity(m_PChar, 0, 0);
				}
				
				if (Action.reaction != REACTION_EVADE)
				{
					battleutils::HandleEnspell(m_PChar,m_PBattleTarget,&Action,i);
				}
				m_PChar->m_ActionList.push_back(Action);


				// to catch high damage bugs
				if (damage > 8000)
					ShowError(CL_RED"Warning: %s did 8000+ melee damage, job = %u \n" CL_RESET, m_PChar->GetName(), m_PChar->GetMJob());


                if (m_PChar->m_ActionList.size() == 8) break;
			}
            
			m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK);
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
		}
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionRaiseMenuSelection() 
{	
    // TODO: Moghancement Experience needs to be factored in here somewhere.
	DSP_DEBUG_BREAK_IF(m_PChar->m_hasRaise == 0 || m_PChar->m_hasRaise > 3);

    m_PChar->animation = ANIMATION_NONE; 	

    double ratioReturned = 0.0f;

    apAction_t Action;
    m_PChar->m_ActionList.clear();

    Action.ActionTarget = m_PChar;
	if(m_PChar->m_hasRaise == 1)
    {
		Action.animation = 511; 
		m_PChar->addHP(m_PChar->GetMaxHP()*0.1); 
        ratioReturned = 0.50f * (1 - map_config.exp_retain);
	}
	else if(m_PChar->m_hasRaise == 2)
    {
		Action.animation = 512;
		m_PChar->addHP(m_PChar->GetMaxHP()*0.25); 
        ratioReturned = ((m_PChar->GetMLevel() <= 50) ? 0.50f : 0.75f) * (1 - map_config.exp_retain);
	}
	else if(m_PChar->m_hasRaise == 3)
    {
		Action.animation = 496;
		m_PChar->addHP(m_PChar->GetMaxHP()*0.5); 
        ratioReturned = ((m_PChar->GetMLevel() <= 50) ? 0.50f : 0.90f) * (1 - map_config.exp_retain);
	}
    Action.reaction   = REACTION_NONE;
    Action.speceffect = SPECEFFECT_RAISE;
	Action.messageID  = 0;
    Action.flag = 0;

    m_PChar->m_ActionList.push_back(Action);
    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_WEAKNESS))
    {
		//double weakness! Calculate stuff here
	    ShowDebug("ActionRaiseMenuSelection : todo: handle double-weakness.\n");
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_WEAKNESS);
	}
	//add weakness effect (75% reduction in HP/MP)
	CStatusEffect* PWeaknessEffect = new CStatusEffect(EFFECT_WEAKNESS,EFFECT_WEAKNESS,75,0,300);
	m_PChar->StatusEffectContainer->AddStatusEffect(PWeaknessEffect);

	charutils::UpdateHealth(m_PChar);
    m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));	

    uint16 expLost = m_PChar->GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()]) * 8 ) / 100 : 2400;
    uint16 xpNeededToLevel = charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()]) - m_PChar->jobs.exp[m_PChar->GetMJob()];

    if(xpNeededToLevel < expLost)
    {
        // Player probably leveled down when they died.  Give they xp for the next level.
        expLost = m_PChar->GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()] + 1) * 8 ) / 100 : 2400;
    }

    uint16 xpReturned = expLost * ratioReturned;

    charutils::AddExperiencePoints(true, m_PChar, m_PChar, xpReturned);

	m_ActionType = ACTION_NONE;
}
