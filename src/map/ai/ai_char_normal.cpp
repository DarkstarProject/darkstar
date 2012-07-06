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

#include "../battleutils.h"
#include "../charutils.h"
#include "../map.h"
#include "../mobutils.h"
#include "../petutils.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../ability.h"
#include "../vana_time.h"
#include "../zone.h"
#include "../charentity.h"
#include "../petentity.h"
#include "../ai/ai_pet_dummy.h"
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

    if((m_ActionType != ACTION_NONE) && (m_PChar->getZone() == 131) && (!(m_PChar->nameflags.flags & FLAG_GM)))
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

    RecastList_t::iterator it = m_PChar->RecastList.begin();

	while(it != m_PChar->RecastList.end())
	{
		Recast_t* recast = *it;
		if (m_Tick >= (recast->TimeStamp + recast->RecastTime))
		{
            m_PChar->RecastList.erase(it++);
            delete recast;
            continue;
		}
		it++;
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
		for (uint8 i = 0; i < m_PChar->PParty->members.size(); ++i)
		{
			if (m_PChar->PParty->members[i]->id == PBattleTarget->m_OwnerID.id)
			{
				return true;
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

    if (m_PChar->animation == ANIMATION_HEALING)
    {
        m_ActionTargetID = 0;
        m_ActionType = ACTION_NONE;
        return;
    }
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
                    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);

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
				}else{
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,78));
				}
			}else{
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
			m_PItemUsable->setLastUseTime(CVanaTime::getInstance()->getSysTime() - 1009810800);
			m_PChar->pushPacket(new CInventoryItemPacket(m_PItemUsable, m_PItemUsable->getLocationID(), m_PItemUsable->getSlotID()));
						
			const int8* fmtQuery = "UPDATE char_inventory \
									SET currCharges = %u, lastUseTime = %u \
									WHERE charid = %u AND location = %u AND slot = %u;";

			Sql_Query(
				SqlHandle,
				fmtQuery,
				m_PItemUsable->getCurrentCharges(),
				m_PItemUsable->getLastUseTime(),
				m_PChar->id,
				m_PItemUsable->getLocationID(),
				m_PItemUsable->getSlotID());

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

		delete m_PItemUsable;

		m_PChar->StatusEffectContainer->SaveStatusEffects();

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
	if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x ||
		m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 218));

        m_LastMeleeTime += (m_Tick - m_LastActionTime);
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
		return;
	}

	if ((m_Tick - m_LastActionTime) > m_PChar->m_rangedDelay) 
	{
		m_LastActionTime = m_Tick;
		uint16 damage = 0;

		apAction_t Action;
        m_PChar->m_ActionList.clear();

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;		//0x10
		Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
		Action.animation  = 0;
		Action.messageID  = 352;
		Action.flag = 0;

	    if (m_PBattleSubTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0)){
            Action.messageID = 32; 
            Action.reaction   = REACTION_EVADE;
            Action.speceffect = SPECEFFECT_NONE;
        }
        else if(rand()%100 < battleutils::GetRangedHitRate(m_PChar,m_PBattleSubTarget)){ //hit!
		    float pdif = battleutils::GetRangedPDIF(m_PChar,m_PBattleSubTarget);
		    if(rand()%100 < battleutils::GetCritHitRate(m_PChar,m_PBattleSubTarget)){
			    pdif *= 1.25; //uncapped
			    Action.speceffect = SPECEFFECT_CRITICAL_HIT;
			    Action.messageID = 353;
		    }

		    CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);
		    CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
		    if(PItem->getSkillType()!=SKILL_THR){
			    if(PAmmo!=NULL){
				    damage = PAmmo->getDamage();
			    }
		    }
		    damage = (damage + PItem->getDamage() + battleutils::GetFSTR(m_PChar,m_PBattleSubTarget,SLOT_RANGED)) * pdif;
		    Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage, false, SLOT_RANGED);

		    if(PItem != NULL){//not a throwing item, check the ammo for dmg/etc
			    battleutils::HandleRangedAdditionalEffect(m_PChar,m_PBattleSubTarget,&Action);
			    charutils::TrySkillUP(m_PChar, (SKILLTYPE)PItem->getSkillType(), m_PBattleSubTarget->GetMLevel());
		    }

		    if(PAmmo!=NULL && rand()%100 > m_PChar->getMod(MOD_RECYCLE)){
			    charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
			    m_PChar->pushPacket(new CInventoryFinishPacket());
		    }
	    }
	    else{//miss
            Action.reaction   = REACTION_EVADE;
            Action.speceffect = SPECEFFECT_NONE;
            Action.messageID  = 354;

            CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
            if(PAmmo!=NULL && rand()%100 > m_PChar->getMod(MOD_RECYCLE)){
			    charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
			    m_PChar->pushPacket(new CInventoryFinishPacket());
		    }
            if(m_PBattleSubTarget->objtype == TYPE_MOB){
			    ((CMobEntity*)m_PBattleSubTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PChar, 0);
			    ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.id = m_PChar->id;
                ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.targid = m_PChar->targid;
		    }
	    }


        m_PChar->m_ActionList.push_back(Action);
		m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

		m_LastMeleeTime += (m_Tick - m_LastActionTime);
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;

		m_PChar->m_rangedDelay = m_Tick; //cooldown between shots        
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
    for(RecastList_t::iterator it = m_PChar->RecastList.begin(); it != m_PChar->RecastList.end(); ++it)
    {
        if ((*it)->Type == RECAST_MAGIC && (*it)->ID == m_PSpell->getID())
        {
            MagicStartError(18);
			return;
        }
    }
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
			if (m_PChar->getStorage(LOC_INVENTORY)->SearchItem(m_PSpell->getMPCost()) == ERROR_SLOTID)
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
	
	if (m_Tick - m_LastActionTime >= (float)m_PSpell->getCastTime()*((100.0f-(float)cap_value(m_PChar->getMod(MOD_FASTCAST),-100,50))/100.0f) ||
        m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL))
	{

		if (battleutils::IsParalised(m_PChar)) 
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
			uint8 SlotID = m_PChar->getStorage(LOC_INVENTORY)->SearchItem(m_PSpell->getMPCost());

			if (SlotID != ERROR_SLOTID)
			{
				if (rand()%100 > m_PChar->getMod(MOD_NINJA_TOOL))
				{
					charutils::UpdateItem(m_PChar, LOC_INVENTORY, SlotID, -1);
					m_PChar->pushPacket(new CInventoryFinishPacket());
				}
			} 
            else 
            {
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,35));

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
	    Recast_t* Recast = new Recast_t;
	
        Recast->Type = RECAST_MAGIC;
	    Recast->ID = m_PSpell->getID();
	    Recast->TimeStamp  = m_Tick;
	    Recast->RecastTime = (float)m_PSpell->getRecastTime() * ((100.0f-cap_value((float)m_PChar->getMod(MOD_FASTCAST)/2.0f,0.0f,25.0f))/100.0f);
		Recast->RecastTime = Recast->RecastTime * ((100.0f-cap_value((float)m_PChar->getMod(MOD_HASTE),0.0f,25.0f))/100.0f);
		//needed so the client knows of the reduced recast time!
		m_PSpell->setModifiedRecast(Recast->RecastTime);

	    m_PChar->RecastList.push_back(Recast);
    }
	else{ //chainspell does have a small delay between casts sadly!
		Recast_t* Recast = new Recast_t;
	
        Recast->Type = RECAST_MAGIC;
	    Recast->ID = m_PSpell->getID();
	    Recast->TimeStamp  = m_Tick;
	    Recast->RecastTime = 2000;
		m_PSpell->setModifiedRecast(Recast->RecastTime);

	    m_PChar->RecastList.push_back(Recast);
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
		    for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin();  it != m_PChar->SpawnMOBList.end() && m_PChar->m_ActionList.size() < 16; ++it)
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

    for(RecastList_t::iterator it = m_PChar->RecastList.begin(); it != m_PChar->RecastList.end(); ++it)
    {
        if ((*it)->Type == RECAST_ABILITY && 
            (*it)->ID == m_PJobAbility->getID())
        {
            m_ActionTargetID = 0;

			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 87));

            m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PJobAbility = NULL;
			m_PBattleSubTarget = NULL;
			return;
        }
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
		if(m_PJobAbility->getID() >= 496){//blood pact
			if(m_PChar->health.mp < m_PJobAbility->getAnimationID()){ //not enough mp for BP
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, 87));
			    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if (m_PJobAbility->getID()==69)//Call Beast, check ammo slot
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
		if (m_PJobAbility->getID()==56){//Sic, check pet TP
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
		}
		if(m_PJobAbility->getID()==45){//call wyvern
			if(m_PChar->PPet!=NULL){
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 315));
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if (m_PJobAbility->getID()==157 || m_PJobAbility->getID()==158){//Hasso/Seigan, check for 2h weapon
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

    Recast_t* Recast = new Recast_t;
    Recast->Type       = RECAST_ABILITY;
	Recast->ID         = m_PJobAbility->getID();
	Recast->RecastTime = m_PJobAbility->getRecastTime() * 1000;
	Recast->RecastID   = m_PJobAbility->getRecastId(); 
    Recast->TimeStamp  = m_Tick;

    if (m_PJobAbility->getLevel() == 0)
    {
		Sql_Query(SqlHandle, "UPDATE char_stats SET 2h = %u WHERE charid = %u", CVanaTime::getInstance()->getSysTime() - 1009810800, m_PChar->id);
    }
    
    m_PChar->RecastList.push_back(Recast);
    m_PChar->pushPacket(new CCharSkillsPacket(m_PChar));

    apAction_t Action;
	m_PChar->m_ActionList.clear();
	if(m_PJobAbility->getID()>=496){//bp
		if(m_PChar->PPet!=NULL){//is a bp - dont display msg and notify pet
			Action.animation  = 94; //assault anim
			Action.ActionTarget = m_PBattleSubTarget;
			Action.reaction   = REACTION_NONE;
			Action.speceffect = SPECEFFECT_RECOIL;
			Action.param      = 0;
			Action.flag       = 0; 
			Action.messageID  = 0;
			m_PChar->addMP(-m_PJobAbility->getAnimationID());
			m_PChar->m_ActionList.push_back(Action);
			m_PChar->PPet->PBattleAI->SetBattleSubTarget(m_PBattleSubTarget);
			((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = m_PJobAbility->getID();
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
				Action.ActionTarget = PTarget;
				Action.reaction   = REACTION_NONE;
				Action.speceffect = SPECEFFECT_NONE;
				Action.animation  = m_PJobAbility->getAnimationID();
				Action.param	  = 0;
				Action.messageID  = 0;
				Action.flag		  = 0;

				m_PChar->m_ActionList.push_back(Action);	
				
				luautils::OnUseAbility(m_PChar, PTarget);	
			}
		}
	}
    else
	{
		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_RECOIL;
		Action.animation  = m_PJobAbility->getAnimationID();
		Action.param      = 0;
		Action.flag       = 0; 
		Action.messageID  = 0;

        m_PChar->m_ActionList.push_back(Action);
        
        luautils::OnUseAbility(m_PChar, m_PBattleSubTarget);	

        if (m_PJobAbility->getValidTarget() & TARGET_ENEMY) 
        {
            // во время pvp целью могут быт персонажи, монстры и их питомцы
			if (m_PBattleSubTarget->objtype == TYPE_MOB && m_PJobAbility->getID()!=72 && m_PJobAbility->getID()!=53) 
				//assault(72)/fight(53) doesnt generate hate directly
            {
                ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.id = m_PChar->id;
                ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID.targid = m_PChar->targid;
                ((CMobEntity*)m_PBattleSubTarget)->PEnmityContainer->UpdateEnmity(m_PChar, m_PJobAbility->getCE(), m_PJobAbility->getVE());
            }
        }
	}

	if(m_PJobAbility->getID()==69){ //Call Beast
		charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
		m_PChar->pushPacket(new CInventoryFinishPacket());
	}
	if(m_PJobAbility->getID()==56 && m_PChar->PPet!=NULL && ((CPetEntity*)m_PChar->PPet)->getPetType()==PETTYPE_JUGPET){//Sic
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_SIC;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	if(m_PJobAbility->getID()<496){
		m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PChar, m_PJobAbility->getID()+16, 0, 100));
	}
	m_PJobAbility = NULL;
    m_PBattleSubTarget = NULL;
    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
}

/************************************************************************
*																		*
*		Start the weapon skill											*
*																		*
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
		if(m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218){//ranged WS IDs
			CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
			if(PAmmo==NULL || !(PAmmo->getType() & ITEM_WEAPON)){//incorrect or non-existent ammo
				WeaponSkillStartError(216);
				return;
			}
		}

        m_ActionType = ACTION_WEAPONSKILL_FINISH;
        ActionWeaponSkillFinish();
        return;
    }

	if (m_PBattleSubTarget == m_PChar){
		if(battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID())){
			m_ActionType = ACTION_WEAPONSKILL_FINISH;
			ActionWeaponSkillFinish();
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

    m_LastActionTime = m_Tick;
    
	uint16 damage = luautils::OnUseWeaponSkill(m_PChar, m_PBattleSubTarget);

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

	if(!battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID())){
		uint8 damslot = SLOT_MAIN;
		if(m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218){//ranged WS IDs
			damslot = SLOT_RANGED;
		}
		damage = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage, false, damslot);
		m_PBattleSubTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BOOST); //TODO: REMOVE THIS, BOOST EFFECT IN DB IS WRONG, MISSING EFFECTFLAG_DAMAGE
	}
    //if (m_PBattleSubTarget->objtype == TYPE_MOB && m_PBattleSubTarget->isDead())
    //{
    //    ((CMobEntity*)m_PBattleSubTarget)->m_DropItemTime = m_PWeaponSkill->getAnimationTime();
    //}
	
	if(m_PChar->PPet!=NULL && ((CPetEntity*)m_PChar->PPet)->getPetType()==PETTYPE_WYVERN){
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_ELEMENTAL_BREATH;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation  = m_PWeaponSkill->getAnimationId();
	Action.param	  = damage;
	if(damage==0){
		Action.messageID = 188; //but misses
	}
	else{
		Action.messageID  = 185; //damage ws
	}
	Action.flag = 0;

	if(battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID())){
		Action.speceffect = SPECEFFECT_NONE;
		Action.messageID = 224; //restores mp msg
		m_PChar->addMP(damage);
	}

	if(m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218){//ranged WS IDs
		CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
		if(PAmmo!=NULL && rand()%100 > m_PChar->getMod(MOD_RECYCLE)){
			charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
			m_PChar->pushPacket(new CInventoryFinishPacket());
		}
	}

    // Missed and no-element weapon skills shouldn't trigger skill chains events.
    if((damage != 0) && (m_PWeaponSkill->getElement() != 0)) 
    { 
        uint16 skillChainCount = 0;
        SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, m_PWeaponSkill, &skillChainCount);

        if (effect != SUBEFFECT_NONE) 
        {	
            uint16 skillChainDamage = battleutils::TakeSkillchainDamage(m_PChar, m_PBattleSubTarget, effect, skillChainCount, damage);

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
                    Action.subeffect    = effect;
                    Action.subparam     = skillChainDamage;
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
                    Action.subeffect    = SUBEFFECT(effect - 10);
                    Action.subparam     = skillChainDamage;
                    Action.submessageID = 288;
                }
                break;
            }

            Action.submessageID += Action.subeffect * 2;
        }
    }

	charutils::UpdateHealth(m_PChar);

	m_PChar->m_ActionList.push_back(Action);
	
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

	if (m_PBattleTarget->isDead())
	{
        if (m_PChar->m_hasAutoTarget && m_PBattleTarget->objtype == TYPE_MOB) // Auto-Target
	    {
		    for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin();  it != m_PChar->SpawnMOBList.end() && m_PChar->m_ActionList.size() < 16; ++it)
		    {
			    CBattleEntity* PTarget = (CBattleEntity*)it->second;
            
                if (PTarget->animation == ANIMATION_ATTACK &&
                    isFaceing(m_PChar->loc.p, PTarget->loc.p, 64) &&
                    distance(m_PChar->loc.p, PTarget->loc.p) <= 10)
                {
                    if (m_PChar->PParty != NULL) 
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
	if(m_PChar->m_Weapons[SLOT_SUB]->getDmgType() > 0 && m_PChar->m_Weapons[SLOT_SUB]->getDmgType() < 4){
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
			uint32 numattacksLeftHand = 0;
			uint32 numKickAttacks = 0;

			uint16 subType = m_PChar->m_Weapons[SLOT_SUB]->getDmgType();
			
			if ((subType > 0 && subType < 4))//sub weapon is equipped!
			{ 
				numattacksLeftHand = charutils::checkMultiHits(m_PChar, m_PChar->m_Weapons[SLOT_SUB]->getID());
			}
			else if(m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH){ //h2h equipped!
				numattacksLeftHand = charutils::checkMultiHits(m_PChar, m_PChar->m_Weapons[SLOT_MAIN]->getID());
			}

			uint32 numattacksRightHand = charutils::checkMultiHits(m_PChar, m_PChar->m_Weapons[SLOT_MAIN]->getID());

			//cap it, cannot have >8 hits per attack round!
			if(numattacksRightHand+numattacksLeftHand > 8){
				numattacksRightHand -= numattacksRightHand+numattacksLeftHand - 8;
			}
	
			CItemWeapon* PWeapon = m_PChar->m_Weapons[SLOT_MAIN];
			uint8 fstrslot = SLOT_MAIN;
			for (uint32 i = 0; i < (numattacksLeftHand + numattacksRightHand); ++i) 
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

				//todo: kick attacks
				// во время физической атаки:
				//	0 - правая рука 
				//	1 - левая рука 
				//	2 - правая нога (только H2H) 
				//	3 - левая нога  (только H2H)

				Action.animation  = (i < numattacksRightHand ? 0 : 1);
				Action.flag	= 0;

				// сначала вычисляем вероятность попадания по монстру
				// затем нужно вычислить вероятность нанесения критического удара
				if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0))
				{
					Action.messageID = 32; 
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
				}
				else if ( rand()%100 < battleutils::GetHitRate(m_PChar,m_PBattleTarget) )
				{
					bool isCritical = (rand()%100 < battleutils::GetCritHitRate(m_PChar, m_PBattleTarget)) ;

					float DamageRatio = battleutils::GetDamageRatio(m_PChar,m_PBattleTarget,isCritical); 

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

                    damage = (uint16)(((PWeapon->getDamage() + battleutils::GetFSTR(m_PChar, m_PBattleTarget,fstrslot)) * DamageRatio));

					//TODO: use an alternative to HasStatusEffect. Performance is maximised by the job check FIRST
					//		so the if loop will fail and HasStatusEffect will not execute. Souleater has no effect <10HP.
					if(m_PChar->GetMJob()==JOB_DRK && m_PChar->health.hp>=10 && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SOULEATER)){
						//lost 10% current hp, converted to damage (displayed as just a strong regular hit)
						damage = damage + m_PChar->health.hp*0.1;
						m_PChar->addHP(-0.1*m_PChar->health.hp);
					}
					else if(m_PChar->GetSJob()==JOB_DRK &&m_PChar->health.hp>=10 && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SOULEATER)){
						//lose 10% Current HP, only HALF (5%) converted to damage	
						damage = damage + m_PChar->health.hp*0.05;
						m_PChar->addHP(-0.1*m_PChar->health.hp);
					}

					charutils::TrySkillUP(m_PChar, (SKILLTYPE)PWeapon->getSkillType(), m_PBattleTarget->GetMLevel());
				}
				else
				{
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 15;
				}

				bool isBlocked = (rand()%100 < battleutils::GetBlockRate(m_PChar,m_PBattleTarget));
				if(isBlocked && Action.reaction!=REACTION_EVADE){ Action.reaction = REACTION_BLOCK; }
				
				Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleTarget, damage,isBlocked,fstrslot);

				if (Action.reaction != REACTION_EVADE && m_PChar->getMod(MOD_ENSPELL)>0)
				{
					battleutils::HandleEnspell(m_PChar,m_PBattleTarget,&Action,i);
				}
				m_PChar->m_ActionList.push_back(Action);
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
	DSP_DEBUG_BREAK_IF(m_PChar->m_hasRaise == 0 || m_PChar->m_hasRaise > 3);

    m_PChar->animation = ANIMATION_NONE; 	

    apAction_t Action;
    m_PChar->m_ActionList.clear();

    Action.ActionTarget = m_PChar;
	if(m_PChar->m_hasRaise == 1)
    {
		Action.animation = 511; 
		m_PChar->addHP(m_PChar->GetMaxHP()*0.1); 
	}
	else if(m_PChar->m_hasRaise == 2)
    {
		Action.animation = 512;
		m_PChar->addHP(m_PChar->GetMaxHP()*0.25); 
	}
	else if(m_PChar->m_hasRaise == 3)
    {
		Action.animation = 496;
		m_PChar->addHP(m_PChar->GetMaxHP()*0.5); 
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

	//todo: regain lost EXP

	m_ActionType = ACTION_NONE; 												
}
