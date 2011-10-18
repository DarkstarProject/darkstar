/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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
		case ACTION_CHANGE_BATTLE_TARGET:	ActionChangeBattleTarget(); break;
		case ACTION_WEAPONSKILL_START:		ActionWeaponSkillStart();	break; 
		case ACTION_WEAPONSKILL_FINISH:		ActionWeaponSkillFinish();	break; 
		case ACTION_JOBABILITY_START:		ActionJobAbilityStart();	break;
		case ACTION_JOBABILITY_FINISH:		ActionJobAbilityFinish();	break;

		default :; //DSP_DEBUG_BREAK_IF(true);
	}

	// слишком частая проверка, достаточно одного раза в секунду

	for (int32 i = (int32)m_PChar->RecastList.size() - 1; i >= 0; --i)
	{
		if (m_Tick >= (m_PChar->RecastList.at(i).TimeStamp + m_PChar->RecastList.at(i).RecastTime))
		{
			m_PChar->RecastList.erase(m_PChar->RecastList.begin() + i);
		}
	}

	for (int32 i = (int32)m_PChar->RecastAbilityList.size() - 1; i >= 0; --i)
	{
		if ((m_Tick - m_PChar->RecastAbilityList.at(i).TimeStamp) / 1000 >= (m_PChar->RecastAbilityList.at(i).RecastTime))
		{
			m_PChar->RecastAbilityList.erase(m_PChar->RecastAbilityList.begin() + i);
		}
	}
}

/************************************************************************
*																		*
*  Устанавливаем любую найденную цель по ее TargID						*
*  Возвращаемое значение: подходит ли найденная цель под ValidTarget	*
*																		*
************************************************************************/

bool CAICharNormal::GetValidTarget(CBattleEntity** PBattleTarget, uint8 ValidTarget)
{
	////DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || *PBattleTarget != NULL);

	// невозможно написать правильные условия, пока не будет решена задача с PvP
	// в нынешних условиях PvP исключено

	// питомцы пока исключены из поиска

	*PBattleTarget = (CBattleEntity*)m_PZone->GetEntity(m_ActionTargetID, TYPE_MOB | TYPE_PC);
	m_ActionTargetID = 0;

	if (*PBattleTarget == NULL)
		return false;

	if (ValidTarget == TARGET_SELF)
	{
		if ((*PBattleTarget)->targid == m_PChar->targid)
		{
			return true;
		}
		return false;
	}

	if (ValidTarget & TARGET_PLAYER)
	{
		if ((*PBattleTarget)->objtype == TYPE_PC)
		{
			if (ValidTarget & TARGET_PLAYER_PARTY)
			{
				/*
				if (((CCharEntity*)*PBattleTarget)->Party->GetPartyID() != m_PChar->Party->GetPartyID())
				{
					return false;
				}
				*/
			}
			if (ValidTarget & TARGET_PLAYER_DEAD)
			{
				if ((*PBattleTarget)->isDead())
				{
					return false;
				}
			}
			return true;
		}
	}
	if (ValidTarget & TARGET_ENEMY)
	{
		if ((*PBattleTarget)->objtype == TYPE_MOB)
		{
			return true;
		}
	}
	return false;
}




bool CAICharNormal::IsMobSubOwner()
{

	if	(m_PBattleSubTarget->m_OwnerID == 0 || 
		 m_PBattleSubTarget->m_OwnerID == m_PChar->id)
	{
		return true;
	}
	
	if (m_PChar->PParty != NULL) 
	{
		for (int i = 0; i < m_PChar->PParty->members.size(); i++)
		{
			if (m_PChar->PParty->members[i]->id == m_PBattleSubTarget->m_OwnerID)
			{
				return true;
			}
		}
	}
	return false;
}

bool CAICharNormal::IsMobOwner()
{
	if (m_PBattleTarget == NULL)
	{
		return true;
	}
	if (m_PBattleTarget->m_OwnerID == 0)
	{
			return true;
	}
		
	if (m_PBattleTarget->m_OwnerID == m_PChar->id) 
	{
		return true;
	}
	
	if (m_PChar->PParty != NULL) 
	{
		for (int i = 0; i < m_PChar->PParty->members.size(); i++)
		{
			if (m_PChar->PParty->members[i]->id == m_PBattleTarget->m_OwnerID)
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
	////DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || m_PBattleTarget != NULL);

	if (GetValidTarget(&m_PBattleTarget, TARGET_ENEMY) && m_PChar->animation != ANIMATION_HEALING)
	{
		if(IsMobOwner())
		{
			if (distance(m_PChar->loc.p, m_PBattleTarget->loc.p) <= 30)
			{
				if ((m_Tick - m_LastActionTime) > m_PChar->m_Weapons[SLOT_MAIN]->getDelay())
				{
					m_ActionType = ACTION_ATTACK;
					m_LastActionTime = m_Tick - m_PChar->m_Weapons[SLOT_MAIN]->getDelay() + 1500;

					m_PChar->status = STATUS_UPDATE;
					m_PChar->animation = ANIMATION_ATTACK;
					m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
					m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
					m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
					return;
				}else{
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,94));
				}
			}else{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,78));
			}
		}else{
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
	//DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || m_PBattleTarget == NULL);

	if (m_PBattleTarget->targid != m_ActionTargetID)
	{
		CBattleEntity* PBattleTarget = NULL;

		if (GetValidTarget(&PBattleTarget, TARGET_ENEMY))
		{
			if (IsMobOwner())
			{
				if (distance(m_PChar->loc.p, PBattleTarget->loc.p) <= 30)
				{
					m_LastActionTime = m_Tick;
					m_PBattleTarget = PBattleTarget;
						
					m_PChar->pushPacket(new CLockOnPacket(m_PChar,PBattleTarget));
				}else{
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,PBattleTarget,0,0,78));
				}
			}else{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,12));
			}
		}
	}

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
*																		*
*  Смерть персонажа еще не реализована									*
*																		*
************************************************************************/

void CAICharNormal::ActionFall() 
{
	if (m_PSpell != NULL)
	{
		ActionMagicInterrupt();
	}

	m_ActionType = ACTION_DEATH;
	m_ActionTargetID = 0;
	m_LastActionTime = m_Tick;

	m_PSpell = NULL;
	m_PBattleTarget = NULL;
	m_PBattleSubTarget = NULL;

	m_PChar->StatusEffectContainer->EraseStatusEffect(true);
	m_PChar->StatusEffectContainer->DispelStatusEffect(true);

	m_PChar->animation = ANIMATION_DEATH;
	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE, new CCharPacket(m_PChar,ENTITY_UPDATE));
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionDeath()
{

}

/************************************************************************
*																		*
*  316 - That action cannot be used in this area (costume)				*
*																		*
************************************************************************/

void CAICharNormal::ActionItemStart() 
{
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != NULL);
	//DSP_DEBUG_BREAK_IF(m_PChar->UContainer->GetType() != UCONTAINER_USEITEM);
	//DSP_DEBUG_BREAK_IF(m_PChar->UContainer->GetItem(0) == NULL);

	m_PItemUsable = (CItemUsable*)m_PChar->UContainer->GetItem(0);
	m_PChar->UContainer->Clean();

	if (GetValidTarget(&m_PBattleSubTarget, m_PItemUsable->getValidTarget()))
	{
		int32 ErrorID = luautils::OnItemCheck(m_PBattleSubTarget,m_PItemUsable);

		if (ErrorID == 0)
		{
			m_PChar->m_StartActionPos = m_PChar->loc.p;
			
			m_PItemUsable->setSubType(ITEM_LOCKED);

			m_PChar->pushPacket(new CInventoryAssignPacket(
				m_PItemUsable->getID(), 
				m_PItemUsable->getQuantity(), 
				m_PItemUsable->getLocationID(), 
				m_PItemUsable->getSlotID(), 
				INV_NOSELECT));
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

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 0;
	Action.param	  = m_PItemUsable->getID();
	Action.messageID  = 28;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

	m_ActionType = ACTION_ITEM_USING;
}

/************************************************************************
*																		*
*  Процесс использовани предмета										*
*																		*
************************************************************************/

void CAICharNormal::ActionItemUsing()
{
	//DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

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
		m_ActionType = ACTION_ITEM_FINISH;
		m_LastActionTime = m_Tick;

		m_PItemUsable->setSubType(ITEM_UNLOCKED);

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
		else
		{
			m_PItemUsable = new CItemUsable(*m_PItemUsable);

			charutils::UpdateItem(m_PChar, m_PItemUsable->getLocationID(), m_PItemUsable->getSlotID(), -1);
		}
		m_PChar->pushPacket(new CInventoryFinishPacket());

		apAction_t Action;

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_NONE;
		Action.animation  = m_PItemUsable->getAnimationID();
		Action.param	  = 0;
		Action.messageID  = 0;
		Action.flag		  = 0;

		m_PChar->m_ActionList.push_back(Action);

		m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
		m_PChar->m_ActionList.clear();

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
	//DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if ((m_Tick - m_LastActionTime) >= m_PItemUsable->getAnimationTime())
	{
		m_LastActionTime = m_Tick;

		luautils::OnItemUse(m_PBattleSubTarget, m_PItemUsable);

		delete m_PItemUsable;

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
	//DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);

	m_PItemUsable->setSubType(ITEM_UNLOCKED);

	m_PChar->pushPacket(new CInventoryAssignPacket(
		m_PItemUsable->getID(), 
		m_PItemUsable->getQuantity(), 
		m_PItemUsable->getLocationID(), 
		m_PItemUsable->getSlotID(), 
		INV_NORMAL));
	m_PChar->pushPacket(new CInventoryFinishPacket());

	apAction_t Action;

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 54;
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;
		
	m_PChar->m_ActionList.push_back(Action);

	m_PChar->pushPacket(new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

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
	//DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || m_PBattleSubTarget != NULL); 

	CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);

	if (PItem != NULL && 
	   (PItem->getType() & ITEM_WEAPON))
	{
		uint8 SkillType = PItem->getSkillType();

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
		if (!IsMobSubOwner())
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

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 48;
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

	m_ActionType = ACTION_RANGED_FINISH;
}

/************************************************************************
*																		*
*  Окончание дальней атаки												*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedFinish()
{
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (m_PBattleSubTarget->isDead())
	{
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
		return;
	}
	if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x ||
		m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 218));

		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
		return;
	}

	if ((m_Tick - m_LastActionTime) > 4000)		//m_PChar->m_RangedDelay
	{
		m_LastActionTime = m_Tick;

		uint16 damage = 0;

		apAction_t Action;

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;		//0x10
		Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
		Action.animation  = 0;
		Action.messageID  = 352;

		Action.param = battleutils::TakePhysicalDamage(m_PChar,m_PBattleSubTarget, damage,m_PZone);
		//charutils::TrySkillUP(m_PChar, (SKILLTYPE)m_PChar->m_Weapons[SLOT_RANGED]->getSkillType(), m_PBattleTarget->GetMLevel());
		Action.flag = 3;
		Action.subeffect = SUBEFFECT_FIRE_DAMAGE;
		Action.subparam  = 0;
		Action.submessageID = 163;

		m_PChar->m_ActionList.push_back(Action);

		m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
		m_PChar->m_ActionList.clear();

		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
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

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 48;
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;
		
	m_PChar->m_ActionList.push_back(Action);

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

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
	//DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || m_PBattleSubTarget != NULL);

	if (m_PSpell == NULL ||
	   !charutils::hasSpell(m_PChar, m_PSpell->getID()) ||
	   !battleutils::CanUseSpell(m_PChar, m_PSpell->getID()))
	{
		m_ActionTargetID = 0;

		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,49));

		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PSpell = NULL;
		m_PBattleSubTarget = NULL;
		return;
	}

	if ( m_PSpell->getSpellGroup() == SPELLGROUP_SUMMONING &&
		!m_PZone->CanUseMisc(MISC_FELLOW))
	{
		m_ActionTargetID = 0;

		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,40));

		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PSpell = NULL;
		m_PBattleSubTarget = NULL;
		return;
	}

	for (uint32 i = 0; i < m_PChar->RecastList.size(); ++i)
	{
		if (m_PChar->RecastList.at(i).ID == m_PSpell->getID())
		{
			m_ActionTargetID = 0;

			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,18));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PSpell = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}
	}

	if (GetValidTarget(&m_PBattleSubTarget, m_PSpell->getValidTarget()))
	{
		if (m_PBattleSubTarget->isDead() &&
		  !(m_PSpell->getValidTarget() & TARGET_PLAYER_DEAD))
		{
			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PSpell = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}
		if (m_PBattleSubTarget->objtype == TYPE_MOB &&
			!IsMobSubOwner())
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,12));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PSpell = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}
		if (m_PSpell->getSpellGroup() == SPELLGROUP_NINJUTSU)
		{
			if (m_PChar->getStorage(LOC_INVENTORY)->SearchItem(m_PSpell->getMPCost()) == ERROR_SLOTID)
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,35));

				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PSpell = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		} 
		else 
		{
			if (m_PSpell->getMPCost() > m_PChar->health.mp && !m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,34));

				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PSpell = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
	}
	else if (m_PBattleSubTarget != NULL)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,m_PSpell->getID(),0,48));

		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PSpell = NULL;
		m_PBattleSubTarget = NULL;
		return;
	}
	else
	{
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PSpell = NULL;
		return;
	}

	if (m_PBattleSubTarget != m_PChar)
	{
		float Distance = distance(m_PChar->loc.p,m_PBattleSubTarget->loc.p);

		if (Distance > 25)
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,78));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PSpell = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}
		if (Distance > 21.5)
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,m_PSpell->getID(),0,313));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PSpell = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}
	}

	m_PChar->m_StartActionPos = m_PChar->loc.p;

	m_LastActionTime = m_Tick;

	apAction_t Action;

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 0;
	Action.param	  = m_PSpell->getID();
	Action.messageID  = 327;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

	m_ActionType = ACTION_MAGIC_CASTING;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicCasting()
{
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (m_PBattleSubTarget->isDead())
	{
		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}
	if (m_PBattleSubTarget->objtype == TYPE_MOB &&
		!IsMobSubOwner())
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,12));

		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}
	if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x ||
		m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 16)); 

		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}
	
	//Need to factor MOD_FASTCAST     |-----------------------|
	if ((m_Tick - m_LastActionTime) >= m_PSpell->getCastTime() && !m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL))		
	{
		m_LastActionTime = m_Tick;

		if (!charutils::hasSpell(m_PChar, m_PSpell->getID()))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,49));

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
				if (rand()%100 < m_PChar->getMod(MOD_NINJA_TOOL))
				{
					charutils::UpdateItem(m_PChar, LOC_INVENTORY, SlotID, -1);
					m_PChar->pushPacket(new CInventoryFinishPacket());
				}
			} else {
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,35));

				m_ActionType = ACTION_MAGIC_INTERRUPT;
				ActionMagicInterrupt();
				return;
			}
		} else {
			if (m_PSpell->getMPCost() > m_PChar->health.mp && !m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,34));

				m_ActionType = ACTION_MAGIC_INTERRUPT;
				ActionMagicInterrupt();
				return;
			} else {
				if (!m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
				{
					m_PChar->addMP(-(int16)m_PSpell->getMPCost());
					//m_PChar->pushPacket(new CCharHealthPacket(m_PChar));
					m_PZone->PushPacket(m_PChar,CHAR_INRANGE,new CCharHealthPacket(m_PChar));
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
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	Recast_t Recast;

	Recast.ID = m_PSpell->getID();
	Recast.TimeStamp = m_Tick;
	Recast.RecastTime = m_PSpell->getRecastTime() * 1000;

	m_PChar->RecastList.push_back(Recast);

	apAction_t Action;
	
	
	switch(m_PSpell->getSpellType())
	{
		case 2: // magic Damage
		{	
			int32 damage;
			
			Action.ActionTarget = m_PBattleSubTarget;
			Action.reaction   = REACTION_NONE;
			Action.speceffect = SPECEFFECT_NONE;
			Action.animation  = m_PSpell->getAnimationID();
			Action.param	  = battleutils::MagicCalculateDamage(m_PChar, m_PBattleSubTarget, m_PSpell, 1, m_PZone);
			Action.messageID  = m_PSpell->getSpellType();
			Action.flag		  = 0;

			m_PChar->m_ActionList.push_back(Action);

			if (m_PSpell->isAOE() && m_PBattleSubTarget->objtype == TYPE_MOB)
			{
				int16 targetNumber = 1; 
				for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin(); 
					 it != m_PChar->SpawnMOBList.end() && 
					 m_PChar->m_ActionList.size() < 16;
					 ++it)
				{
					targetNumber +=1; 
					CMobEntity* PCurrentMob = (CMobEntity*)it->second;

					if (m_PBattleSubTarget != PCurrentMob &&
						PCurrentMob->status == STATUS_UPDATE &&
						distance(m_PBattleSubTarget->loc.p, PCurrentMob->loc.p) <= 10)
					{
						Action.ActionTarget = PCurrentMob;
						Action.reaction   = REACTION_NONE;
						Action.speceffect = SPECEFFECT_NONE;
						Action.animation  = m_PSpell->getAnimationID();
						Action.param	  = battleutils::MagicCalculateDamage(m_PChar, PCurrentMob, m_PSpell, targetNumber, m_PZone);
						Action.messageID  = m_PSpell->getSpellType();
						Action.flag		  = 0;

						m_PChar->m_ActionList.push_back(Action);	
					}
				}
			}
		}
			break;
		case 7: // cure
		{		
			Action.ActionTarget = m_PBattleSubTarget;
			Action.reaction   = REACTION_NONE;
			Action.speceffect = SPECEFFECT_NONE;
			Action.animation  = m_PSpell->getAnimationID();
			Action.param	  = battleutils::MagicCalculateCure(m_PChar, m_PBattleSubTarget, m_PSpell, 0, m_PZone);
			Action.messageID  = m_PSpell->getSpellType();
			Action.flag		  = 0;

			m_PChar->m_ActionList.push_back(Action);

			if (m_PSpell->isAOE() && m_PChar->PParty != NULL)
			{
				for (int i = 0; i < m_PChar->PParty->members.size(); i++)
				{
					CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];
					if (PTarget != m_PBattleSubTarget && distance(m_PChar->loc.p, PTarget->loc.p) <= 10)
					{
						Action.ActionTarget = m_PChar->PParty->members[i];
						Action.reaction   = REACTION_NONE;
						Action.speceffect = SPECEFFECT_NONE;
						Action.animation  = m_PSpell->getAnimationID();
						Action.param	  = battleutils::MagicCalculateCure(m_PChar, PTarget, m_PSpell, 0, m_PZone);
						Action.messageID  = m_PSpell->getSpellType();
						Action.flag		  = 0;

						m_PChar->m_ActionList.push_back(Action);	
					}
				}
			}
		}

		case 93: //warp
			
			break;
		case 227: // drain
			
			break;
		case 228: // aspir
			
			break;
		case 230: // buff
		
			break;
		case 237: //enfeeble
			
			break;
	};
	
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

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
	//DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	apAction_t Action;

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = m_PSpell->getAnimationID();
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->m_ActionList.clear();

	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;
}


/************************************************************************
*																		*
*		Start the Job Ability											*
*																		*
************************************************************************/

void CAICharNormal::ActionJobAbilityStart()
{
	////DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || m_PBattleSubTarget != NULL);

	for (uint32 i = 0; i < m_PChar->RecastAbilityList.size(); i++)
	{
		if (m_PChar->RecastAbilityList.at(i).ID == m_PJobAbility->getID())
		{
			m_ActionTargetID = 0;

			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,87));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PSpell = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}
	}

	if (m_PJobAbility->getValidTarget() == 4)
	{
		CBattleEntity* PBattleTarget = NULL;
		if 	(GetValidTarget(&PBattleTarget, TARGET_ENEMY))
		{
			m_PBattleTarget = PBattleTarget;
			if (!IsMobOwner())
			{
				return;
			}
		}
					
		if (m_PBattleTarget != m_PChar)
		{
			float Distance = distance(m_PChar->loc.p,m_PBattleTarget->loc.p);

			if (Distance > 25)
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,78));

				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleTarget = NULL;
				return;
			}
		}
	}
		
	
	apAction_t Action;

	if (m_PJobAbility->getValidTarget() == 4) 
	{
		Action.ActionTarget = m_PBattleTarget;
		m_PBattleTarget->m_OwnerID = m_PChar->id; 
	}
	else
	{
		Action.ActionTarget = m_PChar;
	
	}

	Action.reaction   = REACTION_NONE ;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation  = m_PJobAbility->getAnimationID();
	Action.messageID  = 100;
	
	RecastAbility_t Recast;
	Recast.ID = m_PJobAbility->getID();
	Recast.TimeStamp = m_Tick;
	Recast.RecastTime = m_PJobAbility->getRecastTime(); //+ m_Tick;
	Recast.RecastId = m_PJobAbility->getRecastId(); 
	m_PChar->RecastAbilityList.push_back(Recast);
		
	m_PChar->m_ActionList.push_back(Action);
	m_LastActionTime = m_Tick;
	m_ActionType = ACTION_JOBABILITY_FINISH; 
	//m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PJobAbility->getID(),0,100));
	//m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,87));
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->pushPacket(new CCharSkillsPacket(m_PChar));
	
}


/************************************************************************
*																		*
*			End the Job Ability											*
*																		*
************************************************************************/

void CAICharNormal::ActionJobAbilityFinish()
{
	////DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);
	if (m_Tick - m_LastActionTime < 100)
	{
		return;
	}

	m_PChar->pushPacket(new CCharAbilitiesPacket(m_PChar));

	apAction_t Action;
	
	switch(m_PJobAbility->getID())
	{
	case 2:
		//Benediction
		if (m_PChar->PParty == NULL) 
		{
			battleutils::AbilityBenediction(m_PChar,m_PChar);
		}
		else
		{
			for (int i = 0; i < m_PChar->PParty->members.size(); i++)
			{
				CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];
				if (distance(m_PChar->loc.p, PTarget->loc.p) <= 10)
				{
					battleutils::AbilityBenediction(m_PChar,PTarget);
				}
			}
		}

		break;
	case 3:
		//Eagle Eye Shot

		break;
	case 4:
		//MIJIN GAKURE

		break;
	case 5:
		
		break;
	};

	if (m_PJobAbility->getAOE() == 1 && m_PChar->PParty != NULL)
	{
		for (int i = 0; i < m_PChar->PParty->members.size(); i++)
		{
			CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];
			if (PTarget != m_PChar && distance(m_PChar->loc.p, PTarget->loc.p) <= 20)
			{
				Action.ActionTarget = PTarget;
				Action.reaction   = REACTION_NONE;
				Action.speceffect = SPECEFFECT_NONE;
				Action.animation  = m_PJobAbility->getAnimationID();
				Action.param	  = 0;
				Action.messageID  = 0;
				Action.flag		  = 0;

				m_PChar->m_ActionList.push_back(Action);	
				m_PChar->m_ActionList.clear();
				luautils::OnUseAbility(m_PChar, PTarget);	
			}
		}
	}
	else
	{
		Action.ActionTarget = m_PChar;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_NONE;
		Action.animation  = m_PJobAbility->getAnimationID();
		Action.param	  = 0;
		Action.messageID  = 0;
		Action.flag		  = 0;
		m_PChar->m_ActionList.push_back(Action);	
		luautils::OnUseAbility(m_PChar,m_PChar);
	}	
	
	
	m_ActionTargetID = 0; 
	m_PJobAbility = NULL;
	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	
	m_PChar->pushPacket(new CCharHealthPacket(m_PChar)); 

}


/************************************************************************
*																		*
*		Start the weapon skill											*
*																		*
************************************************************************/

void CAICharNormal::ActionWeaponSkillStart()
{
	//DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

	if (m_PBattleTarget->isDead())
	{
		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}
	if (!IsMobOwner())
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,12));

		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}
	
	float Distance = distance(m_PChar->loc.p,m_PBattleTarget->loc.p);

	if (Distance > m_PWeaponSkill->getRange())
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,36));

		m_ActionType = ACTION_ATTACK;
		ActionAttack();
		return;
	}

	if (!isFaceing(m_PChar->loc.p, m_PBattleTarget->loc.p, 40))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,5));
			m_ActionType = ACTION_ATTACK;
			ActionAttack();
			return;
		}
	
	uint16 damage = luautils::OnUseWeaponSkill(m_PChar,m_PBattleTarget);
	if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
	{
		m_PChar->health.tp -= 100;
	}
	else
	{
		m_PChar->health.tp = 8; 
	}

	m_LastActionTime = m_Tick; 
	apAction_t Action;

	Action.ActionTarget = m_PBattleTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation  = m_PWeaponSkill->getAnimationId();
	Action.param	  = battleutils::TakePhysicalDamage(m_PChar, m_PBattleTarget, damage, m_PZone);
	Action.messageID  = 185;
	Action.flag		  = 0;
	
	SUBEFFECT effect =  CAICharNormal::GetSkillChainEffect(m_PBattleTarget,m_PWeaponSkill);
	if (effect != SUBEFFECT_NONE) 
	{	
		Action.subeffect = effect;
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
			}
			break;
		}
		if (Action.flag == 0)
		{
			switch(effect)
			{
				case SUBEFFECT_LIGHT:
				case SUBEFFECT_GRAVITATION:
				case SUBEFFECT_DISTORTION:
				case SUBEFFECT_COMPRESSION:
				case SUBEFFECT_INDURATION:
				case SUBEFFECT_TRANSFIXION:
				case SUBEFFECT_DETONATION:
				{
					Action.flag = 3;
				}
				break;
			};
		}
	}
	
	m_PChar->m_ActionList.push_back(Action);
	m_ActionType = ACTION_WEAPONSKILL_FINISH; 
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	m_PChar->pushPacket(new CCharHealthPacket(m_PChar));
}

/************************************************************************
*																		*
*			End the weapon skill										*
*																		*
************************************************************************/

void CAICharNormal::ActionWeaponSkillFinish()
{
	////DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);
	m_LastActionTime = m_Tick;
	m_ActionTargetID = 0; 
	m_PWeaponSkill = NULL;
	m_ActionType = ACTION_ATTACK; 
	m_PChar->m_ActionList.clear();

}

/************************************************************************
*																		*
*  Стандартная атака оружием											*
*																		*
************************************************************************/

void CAICharNormal::ActionAttack() 
{
	//DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);
	if (m_PBattleTarget->isDead())
	{
		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}
	if (!IsMobOwner())
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

	uint16 WeaponDelay = (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS) ? 1700 : m_PChar->m_Weapons[SLOT_MAIN] ->getDelay());
		//uint16 WeaponDelay = m_PChar->m_Weapons[SLOT_MAIN] ->getDelay();

	if ((m_Tick - m_LastActionTime) > WeaponDelay)
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

		m_LastActionTime = m_Tick - (m_Tick - m_LastActionTime) % WeaponDelay;

		if (battleutils::IsParalised(m_PChar)) 
		{
			m_PZone->PushPacket(m_PChar,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,29));
		}
		else if (battleutils::IsIntimidated(m_PChar, m_PBattleTarget)) 
		{
			m_PZone->PushPacket(m_PChar,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,106));
		}
		else
		{
			apAction_t Action;

			Action.ActionTarget = m_PBattleTarget;

			uint32 numattacks = (m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH ? 2 : 1);
			CItemWeapon* PWeapon = m_PChar->m_Weapons[SLOT_MAIN];
			for (uint32 i = 0; i < numattacks; ++i) 
			{
			
				if (i != 0)
				{
					if (m_PBattleTarget->isDead())
					{
						break;
					}
					Action.ActionTarget = NULL;
					if (m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() != DAMAGE_HTH)
					{
						PWeapon = m_PChar->m_Weapons[SLOT_SUB];
					}
				}

				uint16 damage = 0;

				// во время физической атаки:
				//	0 - правая рука 
				//	1 - левая рука 
				//	2 - правая нога (только H2H) 
				//	3 - левая нога  (только H2H)

				Action.animation  = i;
				Action.flag	= 0;

				// сначала вычисляем вероятность попадания по монстру
				// затем нужно вычислить вероятность нанесения критического удара

				if ( rand()%100 < battleutils::GetHitRate(m_PChar,m_PBattleTarget) )
				{
					float DamageRatio = battleutils::GetDamageRatio(m_PChar,m_PBattleTarget); 

					if ( rand()%100 < battleutils::GetCritHitRate(m_PChar,m_PBattleTarget) )
					{
						DamageRatio += 1;
						DamageRatio = (DamageRatio > 3 ? 3 : DamageRatio);

						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_CRITICAL_HIT;
						Action.messageID  = 67;
						Action.flag = 0;
					}else{
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_HIT;
						Action.messageID  = 1;
					}

					charutils::TrySkillUP(m_PChar, (SKILLTYPE)PWeapon->getSkillType(), m_PBattleTarget->GetMLevel());
					m_PChar->addTP(12);
					m_PChar->pushPacket(new CCharHealthPacket(m_PChar));

					damage = (uint16)(((PWeapon->getDamage() + battleutils::GetFSTR(m_PChar,m_PBattleTarget)) * DamageRatio));
				}
				else{
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 15;
				}

					Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleTarget, damage, m_PZone);

				if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BLOOD_WEAPON))
				{
					Action.flag = 1;
					Action.subeffect = SUBEFFECT_BLOOD_WEAPON;
					Action.submessageID = 167;
					Action.subparam = damage;
					m_PChar->addHP(damage);
					m_PChar->pushPacket(new CCharHealthPacket(m_PChar));
				}


				m_PChar->m_ActionList.push_back(Action);
			}

			m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
			m_PChar->m_ActionList.clear();
		}
	}
}

/************************************************************************
*																		*
*  Gets SkillChain Effect												*
*																		*
************************************************************************/
SUBEFFECT CAICharNormal::GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill)
{
	if (!PDefender->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET, 1))
	{
		CStatusEffect* NewEffect = new CStatusEffect(EFFECT_SIGNET, PWeaponSkill->getID(),1,9999,0,1);
		PDefender->StatusEffectContainer->AddStatusEffect(NewEffect);
		
		return SUBEFFECT_NONE;
	}

	CStatusEffect* PEffect = PDefender->StatusEffectContainer->GetStatusEffect(EFFECT_SIGNET, 1);
	

	if (PEffect->modList.size() == 2) 
	{	
		if  (PEffect->modList[0]->getModID() == MOD_LIGHTRES && PEffect->modList[1]->getModID() == MOD_FIRERES)
		{
		
				return SUBEFFECT_FUSION;			  
		}
		else if (PEffect->modList[0]->getModID() == MOD_DARKRES && PEffect->modList[1]->getModID() == MOD_EARTHRES)
		{
				//gravitation	  
				return SUBEFFECT_GRAVITATION;
		}
		else if (PEffect->modList[0]->getModID() == MOD_THUNDERRES && PEffect->modList[1]->getModID() == MOD_WINDRES)
		{
				//fragmentation
				return SUBEFFECT_FRAGMENTATION;
		}
		else if (PEffect->modList[0]->getModID() == MOD_WATERRES && PEffect->modList[1]->getModID() == MOD_ICERES)
		{
				//distortion
				return SUBEFFECT_DISTORTION;
		}
	}
	CWeaponSkill* LastWeaponSkill = battleutils::GetWeaponSkill(PEffect->GetPower());
	CStatusEffect* NewEffect = new CStatusEffect(EFFECT_SIGNET, PWeaponSkill->getID(),0,5);
	SUBEFFECT effect = SUBEFFECT_NONE; 
	
	if (LastWeaponSkill->hasElement(LIGHT))
	{
		if (PWeaponSkill->hasElement(EARTH)) 
		{
			NewEffect->addMod(MOD_WATERRES,0);
			NewEffect->addMod(MOD_ICERES,0);
			effect = SUBEFFECT_DISTORTION;
		}
		else if (PWeaponSkill->hasElement(DARK)) 
		{
			effect = SUBEFFECT_COMPRESSION;
		}
		else if	(PWeaponSkill->hasElement(WATER)) 
		{
			effect = SUBEFFECT_REVERBERATION;
		}
	}
	else if (LastWeaponSkill->hasElement(DARK))
	{
		if (PWeaponSkill->hasElement(WIND)) 
		{
			effect = SUBEFFECT_DETONATION;
		}
		else if	(PWeaponSkill->hasElement(LIGHT)) 
		{
			effect = SUBEFFECT_TRANSFIXION;
		}
	}
	else if (LastWeaponSkill->hasElement(FIRE))
	{
		if (PWeaponSkill->hasElement(THUNDER)) 
		{
			NewEffect->addMod(MOD_LIGHTRES,0);
			NewEffect->addMod(MOD_FIRERES,0);
			effect = SUBEFFECT_FUSION;
		}
		else if (PWeaponSkill->hasElement(EARTH)) 
		{
			effect = SUBEFFECT_SCISSION;
		}
	}
	else if (LastWeaponSkill->hasElement(EARTH))
	{
		if (PWeaponSkill->hasElement(WIND)) 
		{
			effect = SUBEFFECT_DETONATION;
		}
		else if	(PWeaponSkill->hasElement(WATER)) 
		{
			effect = SUBEFFECT_REVERBERATION;
		}
		else if	(PWeaponSkill->hasElement(FIRE)) 
		{
			effect = SUBEFFECT_LIQUEFACATION;
		}
	}
	else if (LastWeaponSkill->hasElement(THUNDER))
	{
		if (PWeaponSkill->hasElement(WIND)) 
		{
			effect = SUBEFFECT_DETONATION;
		}
		else if	(PWeaponSkill->hasElement(FIRE)) 
		{
			effect = SUBEFFECT_LIQUEFACATION;
		}
	}
	else if (LastWeaponSkill->hasElement(WATER))
	{
		if (PWeaponSkill->hasElement(ICE)) 
		{
			effect = SUBEFFECT_INDURATION;
		}
		else if	(PWeaponSkill->hasElement(THUNDER)) 
		{
			effect = SUBEFFECT_IMPACTION;
		}
	}
	else if (LastWeaponSkill->hasElement(WIND))
	{

		if (PWeaponSkill->hasElement(DARK) & 1) 
		{
			NewEffect->addMod(MOD_DARKRES,0);
			NewEffect->addMod(MOD_EARTHRES,0);
			effect = SUBEFFECT_GRAVITATION;
		}
		else if (PWeaponSkill->hasElement(EARTH)) 
		{
			effect = SUBEFFECT_SCISSION;
		}
	}
	else if (LastWeaponSkill->hasElement(ICE))
	{
		if (PWeaponSkill->hasElement(WATER)) 
		{
			NewEffect->addMod(MOD_WATERRES,0);
			NewEffect->addMod(MOD_ICERES,0);
			effect = SUBEFFECT_DISTORTION;
		}
		else if (PWeaponSkill->hasElement(DARK)) 
		{
			effect = SUBEFFECT_COMPRESSION;
		}
		else if (PWeaponSkill->hasElement(THUNDER)) 
		{
			effect = SUBEFFECT_IMPACTION;
		}
	}
	PDefender->StatusEffectContainer->DelStatusEffect(EFFECT_SIGNET,1);
	PDefender->StatusEffectContainer->AddStatusEffect(NewEffect);
	return effect;
}