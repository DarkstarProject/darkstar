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

    CBattleEntity* PTarget = (CBattleEntity*)m_PZone->GetEntity(m_ActionTargetID, TYPE_MOB | TYPE_PC);
	*PBattleTarget = PTarget; 

    m_ActionTargetID = 0;

	if (PTarget == NULL)
	{
		return false;
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
            m_PChar->PParty != NULL &&
            m_PChar->PParty == ((CCharEntity*)PTarget)->PParty)
		{
			return true;
		}
		if ((ValidTarget & TARGET_PLAYER_DEAD) && PTarget->isDead())
		{
			return true;
		}
		return false;
	}
	if (ValidTarget & TARGET_ENEMY)
	{
		if (PTarget->objtype == TYPE_MOB && !PTarget->isDead())
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

bool CAICharNormal::IsMobOwner(CBattleEntity* PBattleTarget)
{
    DSP_DEBUG_BREAK_IF(PBattleTarget == NULL);

	if (PBattleTarget->m_OwnerID == 0 || PBattleTarget->m_OwnerID == m_PChar->id) 
	{
		return true;
	}
	if (m_PChar->PParty != NULL) 
	{
		for (uint8 i = 0; i < m_PChar->PParty->members.size(); ++i)
		{
			if (m_PChar->PParty->members[i]->id == PBattleTarget->m_OwnerID)
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
				if ((m_Tick - m_LastActionTime) > m_PChar->m_Weapons[SLOT_MAIN]->getDelay())
				{
                    if (m_PChar->animation == ANIMATION_CHOCOBO)
                    {
                        m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CHOCOBO);
                    }
                    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);

					m_ActionType = ACTION_ATTACK;
					m_LastActionTime = m_Tick - m_PChar->m_Weapons[SLOT_MAIN]->getDelay() + 1500;

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
*																		*
*  Смерть персонажа еще не реализована									*
*																		*
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

	m_PChar->StatusEffectContainer->EraseStatusEffect(true);
	m_PChar->StatusEffectContainer->DispelStatusEffect(true);

	m_PChar->animation = ANIMATION_DEATH;
	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
    m_PChar->pushPacket(new CRaiseTractorMenuPacket(m_PChar,TYPE_HOMEPOINT));
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
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 0;
	Action.param	  = m_PItemUsable->getID();
	Action.messageID  = 28;
	Action.flag		  = 0;

	m_PChar->m_ActionList.push_back(Action);
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

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

		m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

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
	DSP_DEBUG_BREAK_IF(m_PItemUsable == NULL);

	m_PItemUsable->setSubType(ITEM_UNLOCKED);

	m_PChar->pushPacket(new CInventoryAssignPacket(
		m_PItemUsable->getID(), 
		m_PItemUsable->getQuantity(), 
		m_PItemUsable->getLocationID(), 
		m_PItemUsable->getSlotID(), 
		INV_NORMAL));
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

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

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
        m_PChar->m_ActionList.clear();

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;		//0x10
		Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
		Action.animation  = 0;
		Action.messageID  = 352;

		Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage);
		Action.flag = 3;
		Action.subeffect = SUBEFFECT_FIRE_DAMAGE;
		Action.subparam  = 0;
		Action.submessageID = 163;

		m_PChar->m_ActionList.push_back(Action);

		m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;

        //charutils::TrySkillUP(m_PChar, (SKILLTYPE)m_PChar->m_Weapons[SLOT_RANGED]->getSkillType(), m_PBattleTarget->GetMLevel());
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

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

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

	if (!charutils::hasSpell(m_PChar, m_PSpell->getID()) ||
	    !battleutils::CanUseSpell(m_PChar, m_PSpell->getID()))
	{
        MagicStartError(49);
		return;
	}
	if (m_PSpell->getSpellGroup() == SPELLGROUP_SUMMONING)
	{
        if (m_PChar->PPet != NULL)
        {
            MagicStartError(315);
		    return;
        } 
        else if (!m_PZone->CanUseMisc(MISC_PET))
        {
            MagicStartError(40);
		    return;
        }
	}
    for(RecastList_t::iterator it = m_PChar->RecastList.begin(); it != m_PChar->RecastList.end(); ++it)
    {
        if ((*it)->Type == RECAST_MAGIC && (*it)->ID == m_PSpell->getID())
        {
            MagicStartError(18);
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

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

    m_ActionType = m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL) ? ACTION_MAGIC_FINISH : ACTION_MAGIC_CASTING;
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

    if (m_PBattleSubTarget->isDead())
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
	if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x ||
		m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 16)); 

		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}
	
	if ((m_Tick - m_LastActionTime) >= m_PSpell->getCastTime()) // TODO: need MOD_FASTCAST
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

	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_INVISIBLE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HIDE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CAMOUFLAGE);

	Recast_t* Recast = new Recast_t;
	
    Recast->Type = RECAST_MAGIC;
	Recast->ID = m_PSpell->getID();
	Recast->TimeStamp  = m_Tick;
	Recast->RecastTime = m_PSpell->getRecastTime() * (100 + m_PChar->getMod(MOD_HASTE)) / 100;

	m_PChar->RecastList.push_back(Recast);

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = m_PSpell->getAnimationID();
	Action.param      = 0; 
	Action.messageID  = 0;
	Action.flag		  = 0;

	if (!m_PSpell->isAOE())
	{
		m_PChar->m_ActionList.push_back(Action);
	}
	else if (m_PBattleSubTarget->objtype = TYPE_PC) 
	{
		CCharEntity* Target = (CCharEntity*)m_PBattleSubTarget;

		if (Target->PParty != NULL)
		{
			for (uint32 i = 0; i < Target->PParty->members.size(); i++)
			{
				CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

				if (!PTarget->isDead() && distance(Target->loc.p, PTarget->loc.p) <= 10)
				{
					Action.ActionTarget = m_PChar->PParty->members[i];
					m_PChar->m_ActionList.push_back(Action);	
				}
			}
		}
		else
		{
			m_PChar->m_ActionList.push_back(Action);
		}
	}
	else if (m_PBattleSubTarget->objtype = TYPE_MOB)
	{
		m_PChar->m_ActionList.push_back(Action);
        ((CMobEntity*)m_PBattleSubTarget)->PEnmityContainer->UpdateEnmity(m_PChar, m_PSpell->getCE(), m_PSpell->getVE());

		for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin();  it != m_PChar->SpawnMOBList.end() && m_PChar->m_ActionList.size() < 16; ++it)
		{
			CMobEntity* PCurrentMob = (CMobEntity*)it->second;
            
			if (m_PBattleSubTarget != PCurrentMob &&
                !PCurrentMob->isDead()  &&
                IsMobOwner(PCurrentMob) &&
				distance(m_PBattleSubTarget->loc.p, PCurrentMob->loc.p) <= 10)
			{
				Action.ActionTarget = PCurrentMob;
			    m_PChar->m_ActionList.push_back(Action);
                PCurrentMob->PEnmityContainer->UpdateEnmity(m_PChar, m_PSpell->getCE(), m_PSpell->getVE());
			}
		}
	}

    for (uint32 i = 0; i < m_PChar->m_ActionList.size(); ++i)
	{
        m_PChar->m_ActionList.at(i).param = luautils::OnSpellCast(m_PChar, m_PChar->m_ActionList.at(i).ActionTarget);
        m_PChar->m_ActionList.at(i).messageID = m_PSpell->getMessage();
    }

	charutils::UpdateHealth(m_PChar);
	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

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

	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

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
            ShowWarning(CL_YELLOW"%s want to use <%s> but recast is %u\n"CL_RESET, m_PChar->GetName(), m_PJobAbility->getName(), (*it)->TimeStamp + (*it)->RecastTime - m_Tick);

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
        m_ActionType = ACTION_JOBABILITY_FINISH;
        ActionJobAbilityFinish();
        return;
	}
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
    m_LastActionTime = m_Tick;

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
    
    m_PChar->RecastList.push_back(Recast);
    m_PChar->pushPacket(new CCharSkillsPacket(m_PChar));

    apAction_t Action;
	m_PChar->m_ActionList.clear();

	if (m_PJobAbility->getAOE() == 1 && m_PChar->PParty != NULL)
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
            DSP_DEBUG_BREAK_IF(m_PBattleSubTarget->objtype != TYPE_MOB);

            ((CMobEntity*)m_PBattleSubTarget)->m_OwnerID = m_PChar->id;
            ((CMobEntity*)m_PBattleSubTarget)->PEnmityContainer->UpdateEnmity(m_PChar, m_PJobAbility->getCE(), m_PJobAbility->getVE());
        }
	}
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
    m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PChar, m_PJobAbility->getID()+16, 0, 100));
		
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

	    if (Distance > m_PWeaponSkill->getRange())
	    {
            WeaponSkillStartError(36);
		    return;
	    }
	    if (!isFaceing(m_PChar->loc.p, m_PBattleSubTarget->loc.p, 40))
	    {
            WeaponSkillStartError(5);
		    return;
	    }
        m_ActionType = ACTION_WEAPONSKILL_FINISH;
        ActionWeaponSkillFinish();
        return;
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

    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_INVISIBLE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HIDE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CAMOUFLAGE);
	m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SNEAK);
	
	uint16 damage = luautils::OnUseWeaponSkill(m_PChar, m_PBattleSubTarget);

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
    m_PChar->m_ActionList.clear();

	damage = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage);

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation  = m_PWeaponSkill->getAnimationId();
	Action.param	  = damage;
	Action.messageID  = 185;
	Action.flag		  = 0;

	SUBEFFECT effect = SUBEFFECT_NONE; //CAICharNormal::GetSkillChainEffect(m_PBattleSubTarget,m_PWeaponSkill);
	if (effect != SUBEFFECT_NONE) 
	{	
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
                Action.subparam     = 0;
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
                Action.subparam     = 0;
                Action.submessageID = 288;
            }
			break;
        }
        Action.submessageID += Action.subeffect * 2;
    }
	charutils::UpdateHealth(m_PChar);

	m_PChar->m_ActionList.push_back(Action);
	
	m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
	
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
	
	if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS))
	{
		WeaponDelay = 1700;
	}

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

        m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_INVISIBLE);
	    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HIDE);
	    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CAMOUFLAGE);

        m_LastActionTime = (m_LastActionTime > m_AttackMessageTime) ? m_LastActionTime + WeaponDelay : m_Tick;

		if (battleutils::IsParalised(m_PChar)) 
		{
			m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,29));
		}
		else if (battleutils::IsIntimidated(m_PChar, m_PBattleTarget)) 
		{
			m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,106));
		}
		else
		{
			apAction_t Action;
            m_PChar->m_ActionList.clear();

			Action.ActionTarget = m_PBattleTarget;
			uint32 numattacksRightHand = ((rand()%100 < m_PChar->getMod(MOD_DOUBLE_ATTACK) / 10) ? 2 : 1);
			uint32 numattacksLeftHand = 0;
			uint32 numKickAttacks = 0;

			uint16 subType = m_PChar->m_Weapons[SLOT_SUB]->getDmgType();
			
			if ((subType > 0 && subType < 4) || (m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH))
			{ 
				numattacksLeftHand = ((rand()%100 < m_PChar->getMod(MOD_DOUBLE_ATTACK) / 10) ? 2 : 1);
			}
	
			CItemWeapon* PWeapon = m_PChar->m_Weapons[SLOT_MAIN];
			for (uint32 i = 0; i < (numattacksLeftHand + numattacksRightHand); ++i) 
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

				Action.animation  = (i < numattacksRightHand ? 0 : 1);
				Action.flag	= 0;

				// сначала вычисляем вероятность попадания по монстру
				// затем нужно вычислить вероятность нанесения критического удара

				if ( rand()%100 < battleutils::GetHitRate(m_PChar,m_PBattleTarget) )
				{
					float DamageRatio = battleutils::GetDamageRatio(m_PChar,m_PBattleTarget); 

					if ( rand()%100 < battleutils::GetCritHitRate(m_PChar, m_PBattleTarget) )
					{
						DamageRatio += 1;
						DamageRatio = (DamageRatio > 3 ? 3 : DamageRatio);

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
                    damage = (uint16)(((PWeapon->getDamage() + battleutils::GetFSTR(m_PChar, m_PBattleTarget)) * DamageRatio));

					charutils::TrySkillUP(m_PChar, (SKILLTYPE)PWeapon->getSkillType(), m_PBattleTarget->GetMLevel());
				}
				else
				{
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 15;
				}
				Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleTarget, damage);

				if (Action.reaction != REACTION_EVADE &&
                    m_PBattleTarget->m_EcoSystem != SYSTEM_UNDEAD &&
                    m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BLOOD_WEAPON))
				{
					Action.flag = 1;
					Action.subeffect = SUBEFFECT_BLOOD_WEAPON;
					Action.submessageID = 167;
					Action.subparam = m_PChar->addHP(Action.param);

					charutils::UpdateHealth(m_PChar);
				}
				m_PChar->m_ActionList.push_back(Action);
			}
			m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SNEAK);
			m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
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
	// TODO: что-то сложное здесь замутили, особенно с SIGNET ^^

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

void CAICharNormal::ActionRaiseMenuSelection() 
{	
    //m_PChar->animation = ANIMATION_NONE; 
			
    //m_PChar->addHP(500); 
    //UpdateHealth();
    //m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));			
				//
    //apAction_t Action;
    //m_PChar->m_ActionList.clear();

    //Action.ActionTarget = m_PChar;
    ////Action.subeffect = 511;
    //Action.animation = 511;
    //Action.reaction = REACTION_NONE;
    //Action.speceffect = SPECEFFECT_RAISE;
    ////Action.subeffect = SUBEFFECT_NONE;
				//
    ////Action.subparam = 4; 
			
    //m_PChar->m_ActionList.push_back(Action);

    //m_PZone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
    //m_ActionType = ACTION_NONE; 												
}
