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
#include "../targetfinder.h"

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
#include "../packets/char_appearance.h"

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
    m_PTargetFinder = new CTargetFinder(PChar);
	m_AttackMessageTime = 0;
    m_LastCoolDown = 0;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAICharNormal::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;

    if(m_PChar->m_EquipSwap == true)
    {
        m_PChar->pushPacket(new CCharAppearancePacket(m_PChar));
        m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
        charutils::BuildingCharSkillsTable(m_PChar);
        charutils::CalculateStats(m_PChar);

        m_PChar->UpdateHealth();
        m_PChar->pushPacket(new CCharHealthPacket(m_PChar));
        m_PChar->m_EquipSwap = false;
    }

    if((m_ActionType != ACTION_NONE) && jailutils::InPrison(m_PChar))
    {
        Reset();
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_CANT_BE_USED_IN_AREA));
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
		case ACTION_SLEEP:					ActionSleep();				break;

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
                        m_PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHOCOBO);
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
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_WAIT_LONGER));
				}
			}
            else
            {
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_TOO_FAR_AWAY));
			}
		}
        else
        {
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_ALREADY_CLAIMED));
		}
	}
	else if (m_PBattleTarget != NULL)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_CANNOT_ATTACK_TARGET));
	}
    m_PBattleTarget = NULL;
	m_PBattleSubTarget = NULL;
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
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_TOO_FAR_AWAY));
				}
			}
            else
            {
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_ALREADY_CLAIMED));
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
	m_PBattleSubTarget = NULL;

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

	//influence for conquest system
	conquest::LoseInfluencePoints(m_PChar);

	charutils::DelExperiencePoints(m_PChar,map_config.exp_retain);
	charutils::SaveDeathTime(m_PChar);

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
        m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH);

        // has reraise, don't stop timer
        // this must be after deleting status effects
        if(m_PChar->m_hasRaise == 0){
            m_LastActionTime = m_Tick;
            m_ActionType = ACTION_NONE;
        }
    }

    // show reraise menu after sometime
    // this also prevents the menu from appearing before you're totally dead
    if (m_PChar->m_hasRaise && (m_Tick - m_LastActionTime) >= 8000)
    {
        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_NONE;
        m_PChar->pushPacket(new CRaiseTractorMenuPacket(m_PChar, TYPE_RAISE));
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

		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,m_PItemUsable->getID(),0,MSGBASIC_CANNOT_USE_ITEM_ON));
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
		m_PChar->m_StartActionPos.z != m_PChar->loc.p.z ||
        m_PChar->StatusEffectContainer->HasPreventActionEffect())
	{
		m_ActionType = ACTION_ITEM_INTERRUPT;
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, m_PItemUsable->getID(), 0, MSGBASIC_ITEM_FAILS_TO_ACTIVATE));
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
        if(battleutils::IsParalised(m_PChar)){
            m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_IS_PARALYZED));
        } else {

            m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);

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
        }
		delete m_PItemUsable;

		m_LastMeleeTime += (m_Tick - m_LastActionTime);
		//we may have modified the action via item use! (e.g. sleeping potion)
		if (m_ActionType == ACTION_ITEM_FINISH)
		{
			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		}
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

	if( (m_Tick - m_PChar->m_rangedDelay) < m_PChar->GetAmmoDelay(false)){ //cooldown between shots
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_WAIT_LONGER));
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_ActionTargetID = 0;
		m_PBattleSubTarget = NULL;
		return;
	}

	CItemWeapon* PRanged = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);


    CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

	if (PRanged != NULL &&
	   (PRanged->getType() & ITEM_WEAPON) || PAmmo != NULL && PAmmo->isThrowing())
	{
		uint8 SkillType = 0;

        if(PAmmo != NULL && PAmmo->isThrowing()){
            SkillType = PAmmo->getSkillType();
        } else {
            SkillType = PRanged->getSkillType();
        }

		//ranged weapon delay is stored in the db as offset from 240 for some reason.

		m_PChar->m_rangedDelay = m_PChar->GetRangedWeaponDelay(false);

		// apply snapshot reduction
		uint32 SnapShotReductionPercent = 0;

		if (charutils::hasTrait(m_PChar, TRAIT_SNAPSHOT))
		{
			// reduction from merits should only apply if the user has the trait
			SnapShotReductionPercent = m_PChar->PMeritPoints->GetMeritValue(MERIT_SNAPSHOT, m_PChar->GetMLevel());
		}

		// get any snapshotreduction from gear
		SnapShotReductionPercent += m_PChar->getMod(MOD_SNAP_SHOT);

		if (SnapShotReductionPercent > 0)
			m_PChar->m_rangedDelay -= (float)(m_PChar->m_rangedDelay * ( (float)SnapShotReductionPercent / 100));


		// do chance for rapid shot
		if (charutils::hasTrait(m_PChar, TRAIT_RAPID_SHOT))
		{
			uint16 chance = (m_PChar->getMod(MOD_RAPID_SHOT) + m_PChar->PMeritPoints->GetMeritValue(MERIT_RAPID_SHOT_RATE, m_PChar->GetMLevel()));
			if (rand()%100 < chance)
				m_PChar->m_rangedDelay = 0;
		}

        if(m_PChar->m_rangedDelay <= 0){
            ShowError("ai_char_normal::ActionRangedStart ranged delay is lower than 1!\n");
            m_PChar->m_rangedDelay = 1;
        }

		switch (SkillType)
		{
			case SKILL_THR:
            {

                // remove barrage, doesn't work here
                m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE);
            }
            break;
			case SKILL_ARC:
			case SKILL_MRK:
			{

                PRanged = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
				if (PRanged != NULL &&
				   (PRanged->getType() & ITEM_WEAPON))
				{

					break;
				}
			}
			default:
			{
				m_ActionTargetID = 0;
				m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_NO_RANGED_WEAPON));
				return;
			}
		}

	}else{

		m_ActionTargetID = 0;
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_NO_RANGED_WEAPON));
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
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_CANNOT_SEE));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PBattleSubTarget = NULL;
			return;
		}
		if (!IsMobOwner(m_PBattleSubTarget))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_ALREADY_CLAIMED));

			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PBattleSubTarget = NULL;
			return;
		}
		if (distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p) > 25)
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_TOO_FAR_AWAY));

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
	Action.animation  = ANIMATION_RANGED;
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
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_MOVE_AND_INTERRUPT));
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PBattleSubTarget = NULL;
		return;
	}


	if ((m_Tick - m_LastActionTime) > m_PChar->m_rangedDelay)
	{
		m_LastMeleeTime += (m_Tick - m_LastActionTime);
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

        CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);

        CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

        bool isThrowing = PAmmo->isThrowing();
        uint8 slot = SLOT_RANGED;

        if(isThrowing)
        {
            slot = SLOT_AMMO;
            PItem = NULL;
        }

        uint8 shadowsTaken = 0;
		uint8 hitCount = 1;			// 1 hit by default
		uint8 realHits = 0;			// to store the real number of hit for tp multipler
		bool hitOccured = false;	// track if player hit mob at all
        bool isSange = false;


        // if barrage is detected, getBarrageShotCount also checks for ammo count
        if (!isThrowing && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE,0))
        {
            hitCount += battleutils::getBarrageShotCount(m_PChar);
        }
        else if(isThrowing && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SANGE))
        {
            isSange = true;
            hitCount += m_PChar->getMod(MOD_UTSUSEMI);
        }

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
                    // absorbed by shadow
                    if (battleutils::IsAbsorbByShadow(m_PBattleSubTarget))
                    {
                        shadowsTaken++;

                    } else {
    					float pdif = battleutils::GetRangedPDIF(m_PChar,m_PBattleSubTarget);

    					if(rand()%100 < battleutils::GetCritHitRate(m_PChar,m_PBattleSubTarget, true))
    					{
    						pdif *= 1.25; //uncapped
    						Action.speceffect = SPECEFFECT_CRITICAL_HIT;
    						Action.messageID = 353;
    					}

    					// at least 1 hit occured
    					hitOccured = true;
    					realHits ++;

                        if(isSange){
                            // change message to sange
                            Action.messageID = 77;
                        }

    					damage = (m_PChar->GetRangedWeaponDmg() + battleutils::GetFSTR(m_PChar,m_PBattleSubTarget,slot)) * pdif;

                        if(slot == SLOT_RANGED)
                        {
        					damage = battleutils::CheckForDamageMultiplier(PItem,damage, 0);

                            if(PItem != NULL)
                            {
                                charutils::TrySkillUP(m_PChar, (SKILLTYPE)PItem->getSkillType(), m_PBattleSubTarget->GetMLevel());
                            }
                        }
                        else if(slot == SLOT_AMMO && PAmmo != NULL)
                        {
    						charutils::TrySkillUP(m_PChar, (SKILLTYPE)PAmmo->getSkillType(), m_PBattleSubTarget->GetMLevel());
                        }

                    }

				}
				else //miss
				{
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 354;

                    battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);

					i = hitCount; // end barrage, shot missed
				}


				// check for recycle chance

				uint8 recycleChance = m_PChar->getMod(MOD_RECYCLE);

				if (charutils::hasTrait(m_PChar,TRAIT_RECYCLE))
					recycleChance += m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE,m_PChar->GetMLevel());

                // only remove on hit
                if(hitOccured && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
                {
                    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
                    recycleChance = 100;
                }

				if(PAmmo != NULL && rand()%100 > recycleChance)
				{

					if ( (PAmmo->getQuantity()-1) < 1) // ammo will run out after this shot, make sure we remove it from equip
					{
						uint8 slot = m_PChar->equip[SLOT_AMMO];
						charutils::UnequipItem(m_PChar,SLOT_AMMO);
						charutils::UpdateItem(m_PChar, LOC_INVENTORY, slot, -1);
						i = hitCount; // end loop (if barrage), player is out of ammo
					}
					else
					{
						charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
					}

					m_PChar->pushPacket(new CInventoryFinishPacket());
				}

                damage = battleutils::RangedDmgTaken(m_PBattleSubTarget, damage);

				totalDamage += damage;
		}

		// if a hit did occur (even without barrage)
		if (hitOccured == true)
		{
			// any misses with barrage cause remaing shots to miss, meaning we must check Action.reaction
			if (Action.reaction == REACTION_EVADE && (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE) || isSange))
			{
				Action.messageID  = 352;
				Action.reaction   = REACTION_HIT;
				Action.speceffect = SPECEFFECT_CRITICAL_HIT;
			}

			Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, totalDamage, false, slot, realHits, NULL, true);

            // lower damage based on shadows taken
            if(shadowsTaken){
                Action.param = Action.param * (1 - ((float)shadowsTaken / realHits));
            }

            //add additional effects
            //this should go AFTER damage taken
            //or else sleep effect won't work
            for(uint8 i=0; i<realHits; i++){
                battleutils::HandleRangedAdditionalEffect(m_PChar,m_PBattleSubTarget,&Action);
            }
		}
        else if(shadowsTaken > 0)
        {
            // shadows took damage
            Action.messageID  = 0;
            Action.reaction   = REACTION_EVADE;
            m_PBattleSubTarget->loc.zone->PushPacket(m_PBattleSubTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleSubTarget,m_PBattleSubTarget,0,shadowsTaken, MSGBASIC_SHADOW_ABSORB));

            battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);
        }

        m_PChar->m_ActionList.push_back(Action);
		m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));


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

		// remove barrage effect if present
		if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE,0)){
			m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE,0);
        }
        else if(isSange)
        {

            uint16 power = m_PChar->StatusEffectContainer->GetStatusEffect(EFFECT_SANGE)->GetPower();

            // remove shadows
            while(realHits-- && rand()%100 <= power && battleutils::IsAbsorbByShadow(m_PChar));

            m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SANGE);
        }

        // only remove detectables
        m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

        m_PBattleSubTarget = NULL;
        m_PChar->m_rangedDelay = m_Tick; //cooldown between shots

        m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedInterrupt()
{
	m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_NO_RANGED_WEAPON));

	apAction_t Action;
    m_PChar->m_ActionList.clear();

	Action.ActionTarget = m_PChar;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = ANIMATION_RANGED;
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

    if(m_Tick - m_LastCoolDown < COOL_DOWN_TIME){
        MagicStartError(94);
        return;
    }

    // mute 049
	if (!charutils::hasSpell(m_PChar, m_PSpell->getID()) ||
	    !spell::CanUseSpell(m_PChar, m_PSpell->getID()) ||
		m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ||
        m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE))
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
	// TODO: Sift through these core checks and see what can be moved to scripts
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
	// End of core checks, so pass it along to the script checking function
	int32 errNo = luautils::OnMagicCastingCheck(m_PBattleSubTarget, m_PChar, m_PSpell);

	if(errNo != 0)
	{
		MagicStartError(errNo);
		return;
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
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_ALREADY_CLAIMED));

		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}

    uint32 totalCastTime = (float)m_PSpell->getCastTime()*((100.0f-(float)dsp_cap(m_PChar->getMod(MOD_FASTCAST),-100,50))/100.0f);

	if (m_Tick - m_LastActionTime >= totalCastTime ||
        m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL))
	{
		if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE)
           || m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE))
        {
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_UNABLE_TO_CAST));
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		else if (battleutils::IsParalised(m_PChar))
		{
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_IS_PARALYZED));
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		else if (battleutils::IsIntimidated(m_PChar, m_PBattleSubTarget))
		{
		    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_IS_INTIMIDATED));
		    m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}

		if (!charutils::hasSpell(m_PChar, m_PSpell->getID()))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0, MSGBASIC_UNABLE_TO_CAST_SPELLS));

			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		//the check for player position only occurs AFTER the cast time is up, you can move so long as x/z is the same on finish.
		//furthermore, it's actually quite lenient, hence the rounding to 1 dp
		if (floorf(m_PChar->m_StartActionPos.x * 10 + 0.5) / 10 != floorf(m_PChar->loc.p.x * 10 + 0.5) / 10 ||
		floorf(m_PChar->m_StartActionPos.z * 10 + 0.5) / 10 != floorf(m_PChar->loc.p.z * 10 + 0.5) / 10 ||
        m_PChar->StatusEffectContainer->HasPreventActionEffect())
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_IS_INTERRUPTED));

			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		if ((m_PBattleSubTarget != m_PChar) &&
			(distance(m_PChar->loc.p,m_PBattleSubTarget->loc.p) > 21.5))
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_TOO_FAR_AWAY));

			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}

		if (m_PSpell->getSpellGroup() == SPELLGROUP_NINJUTSU)
		{
            if(!battleutils::HasNinjaTool(m_PChar, m_PSpell, true))
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, m_PSpell->getID(), 0, MSGBASIC_NO_NINJA_TOOLS));

                m_ActionType = ACTION_MAGIC_INTERRUPT;
                ActionMagicInterrupt();
                return;
            }
		}
        else
        {
			if (m_PSpell->getMPCost() > m_PChar->health.mp && !m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT))
			{
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,m_PSpell->getID(),0,MSGBASIC_NOT_ENOUGH_MP));

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
		// Only haste from spells or equipment is counted; ignore MOD_HASTE_ABILITY and cap at 25% (256/1024)
		int16 Haste = m_PChar->getMod(MOD_HASTE_MAGIC) + m_PChar->getMod(MOD_HASTE_GEAR);
		RecastTime = RecastTime * ((float)(1024-dsp_cap(Haste,-1024,256))/1024);

		//needed so the client knows of the reduced recast time!
		m_PSpell->setModifiedRecast(RecastTime);

        m_PChar->PRecastContainer->Add(RECAST_MAGIC, m_PSpell->getID(), RecastTime);
    }
	else //chainspell does have a small delay between casts sadly!
    {
		m_PSpell->setModifiedRecast(2000);
        m_PChar->PRecastContainer->Add(RECAST_MAGIC, m_PSpell->getID(), 2000);
	}

    m_PTargetFinder->reset();
    m_PChar->m_ActionList.clear();

    // can this spell target the dead?
    m_PTargetFinder->m_targetDead = (m_PSpell->getValidTarget() & TARGET_PLAYER_DEAD);

    if (m_PSpell->isAOE())
    {
        float radius = spell::GetSpellRadius(m_PSpell, m_PChar);

        m_PTargetFinder->findWithinArea(m_PBattleSubTarget, AOERADIUS_TARGET, radius);
    }
    else
    {
        m_PTargetFinder->findSingleTarget(m_PBattleSubTarget);
    }

    uint16 totalTargets = m_PTargetFinder->m_targets.size();

    m_PSpell->setTotalTargets(totalTargets);

    apAction_t Action;
    Action.ActionTarget = m_PBattleSubTarget;
    Action.reaction   = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation  = m_PSpell->getAnimationID();
    Action.param      = 0;
    Action.messageID  = 0;
    Action.flag       = 0;

    uint16 msg = 0;
    int16 ce = 0;
    int16 ve = 0;
    for (std::vector<CBattleEntity*>::iterator it = m_PTargetFinder->m_targets.begin() ; it != m_PTargetFinder->m_targets.end(); ++it)
    {
        CBattleEntity* PTarget = *it;

        Action.ActionTarget = PTarget;

        m_PSpell->resetMessage();

        ce = m_PSpell->getCE();
        ve = m_PSpell->getVE();

        // take all shadows
        if(m_PSpell->canTargetEnemy() && m_PSpell->isAOE())
        {
            PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
            PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
        }

        // TODO: this is really hacky and should eventually be moved into lua
        if(m_PSpell->canTargetEnemy() && !m_PSpell->isAOE() && battleutils::IsAbsorbByShadow(PTarget))
        {
            // take shadow
            msg = 31;
            Action.param = 1;
            ve = 0;
            ce = 0;
        }
        else
        {
            Action.param = luautils::OnSpellCast(m_PChar, PTarget);

            // remove effects from damage
            if (m_PSpell->canTargetEnemy() && Action.param > 0 && m_PSpell->dealsDamage())
            {
                PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
            }

            if(msg == 0)
            {
                msg = m_PSpell->getMessage();
            }
            else
            {
                msg = m_PSpell->getAoEMessage();
            }

        }

        Action.messageID = msg;

        if (m_PSpell->canTargetEnemy()) {
            // wipe shadows if needed
            if (!m_PSpell->isAOE() && battleutils::IsAbsorbByShadow(PTarget))
            {
                Action.param = 1;
                Action.messageID = 31;

                // handle hate
                ve = 0;
                ce = 0;
            }
            else if(Action.param > 0 && m_PSpell->dealsDamage())
            {
                PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
            }
        }

        if(Action.param >= 2000){
            ShowDebug("Super high magic damage warning: %d\n", Action.param);
        }

        if (PTarget->objtype == TYPE_MOB)
        {
            if (PTarget->isDead())
            {
                ((CMobEntity*)PTarget)->m_DropItemTime = m_PSpell->getAnimationTime();
            }

            ((CMobEntity*)PTarget)->m_OwnerID.id = m_PChar->id;
            ((CMobEntity*)PTarget)->m_OwnerID.targid = m_PChar->targid;
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmity(m_PChar, ce, ve);
        }

        m_PChar->m_ActionList.push_back(Action);
    }
    // если заклинание атакующее, то дополнительно удаляем эффекты с флагом атаки
    m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END | ((m_PSpell->getValidTarget() & TARGET_ENEMY) ? EFFECTFLAG_DETECTABLE : EFFECTFLAG_NONE));

	charutils::UpdateHealth(m_PChar);

    // only skill up if the effect landed
    if(m_PSpell->tookEffect()){
        charutils::TrySkillUP(m_PChar, (SKILLTYPE)m_PSpell->getSkillType(), m_PBattleSubTarget->GetMLevel());
    }

	m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));

	m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

	if(m_PChar->PPet!=NULL && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
    {
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_HEALING_BREATH;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	m_LastMeleeTime += (m_Tick - m_LastActionTime);

    m_LastCoolDown = m_Tick;

	m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);

    if(m_PBattleSubTarget->objtype == TYPE_MOB)
    {
    	CMobEntity* Monster = (CMobEntity*)m_PBattleSubTarget;
    	if (Monster->m_HiPCLvl < m_PChar->GetMLevel())
        {
            Monster->m_HiPCLvl = m_PChar->GetMLevel();
        }
    }

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

    m_LastCoolDown = m_Tick;

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

    if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)){
        // can't use abilities
        m_ActionTargetID = 0;
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));

        m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
        m_PJobAbility = NULL;
        m_PBattleSubTarget = NULL;
        return;
    }

    if (m_PChar->PRecastContainer->Has(RECAST_ABILITY, m_PJobAbility->getRecastId()))
    {
        m_ActionTargetID = 0;

		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_WAIT_LONGER));

        m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
		m_PJobAbility = NULL;
		m_PBattleSubTarget = NULL;
		return;
    }
    if (GetValidTarget(&m_PBattleSubTarget, m_PJobAbility->getValidTarget()))
	{
        if (m_PBattleSubTarget != m_PChar)
        {
            if (distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p) > m_PJobAbility->getRange())
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));

                m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}
		if(m_PJobAbility->getID() >= ABILITY_HEALING_RUBY){//blood pact
			if(m_PChar->health.mp < m_PJobAbility->getAnimationID()){ //not enough mp for BP
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA));
			    m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
				m_PJobAbility = NULL;
				m_PBattleSubTarget = NULL;
				return;
			}
		}

		//TODO: Remove all these ability-specific checks and put them into their appropriate scripts

		if (m_PJobAbility->getID() == ABILITY_EAGLE_EYE_SHOT || m_PJobAbility->getID() == ABILITY_SHADOWBIND){
			CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);

			if (PItem != NULL &&
			   (PItem->getType() & ITEM_WEAPON))
			{
				switch (PItem->getSkillType())
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
						m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_NO_RANGED_WEAPON));
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
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_NO_RANGED_WEAPON));
					return;
				}

				m_ActionTargetID = 0;
					m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PChar,0,0,MSGBASIC_NO_RANGED_WEAPON));
					return;
			}
		}

		// End of core checks, so call script checks
		CBaseEntity* PMsgTarget = (CBaseEntity*)m_PChar;
		int32 errNo = luautils::OnAbilityCheck(m_PChar, m_PBattleSubTarget, m_PJobAbility, &PMsgTarget);
		if(errNo != 0)
		{
			m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, PMsgTarget, 0, 0, errNo));
			m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
			m_PJobAbility = NULL;
			m_PBattleSubTarget = NULL;
			return;
		}

		// After script check, because some scripts overwrite this check (Charm)
		if (m_PJobAbility->getValidTarget() == TARGET_ENEMY)
	    {
            if (!IsMobOwner(m_PBattleSubTarget))
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_ALREADY_CLAIMED));

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
    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_UNABLE_TO_USE_JA2));

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


    if (m_PJobAbility->getLevel() == 0)
    {
        Sql_Query(SqlHandle, "UPDATE char_stats SET 2h = %u WHERE charid = %u", m_Tick, m_PChar->id);
    }

	m_PJobAbility->setMessage(m_PJobAbility->getDefaultMessage());
	// get any available merit recast reduction
	uint8 meritRecastReduction = 0;

	if (((CAbility*)m_PJobAbility)->getMeritModID() > 0)
	{
		meritRecastReduction = m_PChar->PMeritPoints->GetMeritValue((Merit_t*)m_PChar->PMeritPoints->GetMerit((MERIT_TYPE)m_PJobAbility->getMeritModID()), m_PChar->GetMLevel());
	}

    uint32 RecastTime = (m_PJobAbility->getRecastTime() - meritRecastReduction) * 1000;

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

    // check paralysis
    if(battleutils::IsParalised(m_PChar)){
        // display paralyzed
        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0,MSGBASIC_IS_PARALYZED));
    } else {

        // remove invisible if aggresive
        if(m_PBattleSubTarget != NULL && m_PBattleSubTarget->objtype == TYPE_MOB){
            // aggresive action
            m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
        } else {
            // remove invisible only
            m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);
        }

    	if(m_PJobAbility->getID() == ABILITY_REWARD){
    		CItem* PItem = m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_HEAD]);
    		if(PItem->getID() == 15157 || PItem->getID() == 16104){
    			//TODO: Transform this into an item MOD_REWARD_RECAST perhaps ?
    			//The Bison Warbonnet & Khimaira Bonnet reduces recast time by 10 seconds.
    			RecastTime -= (10 *1000);   // remove 10 seconds
    		}
    	}

        apAction_t Action;
    	m_PChar->m_ActionList.clear();

    	if (m_PJobAbility->getID() >= ABILITY_FIGHTERS_ROLL && m_PJobAbility->getID() <= ABILITY_SCHOLARS_ROLL)
    	{
    		m_PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
    		uint8 roll = (rand() % 6) + 1;
    		m_PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(
    			EFFECT_DOUBLE_UP_CHANCE,
    			EFFECT_DOUBLE_UP_CHANCE,
    			roll,
    			0,
    			45,
    			m_PJobAbility->getID(),
    			m_PJobAbility->getAnimationID(),
    			battleutils::getCorsairRollEffect(m_PJobAbility->getID())
    		), true);

    		m_CorsairDoubleUp = m_PJobAbility->getID();

    		if (m_PChar->StatusEffectContainer->CheckForElevenRoll())
    		{
    			RecastTime /= 2;
    		}

    		Action.reaction   = REACTION_NONE;
    		Action.speceffect = (SPECEFFECT)roll;
    		Action.animation  = m_PJobAbility->getAnimationID();
    		Action.param	  = roll;
    		Action.flag		  = 0;

    		if (m_PChar->PParty != NULL)
    		{
    			for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
    			{
    				CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

    				if(!PTarget->isDead() &&
    					PTarget->getZone() == m_PChar->getZone() &&
    					distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
    				{
    					Action.ActionTarget = PTarget;
    					luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, m_PJobAbility, roll);
    					if (PTarget->id == m_PChar->id){
    						if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
    							Action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
    						} else {
    							Action.messageID = m_PJobAbility->getMessage();
    						}
    					} else if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
    						Action.messageID  = MSGBASIC_ROLL_SUB_FAIL;
    					} else {
    						Action.messageID  = MSGBASIC_ROLL_SUB;
    					}
    					m_PChar->m_ActionList.push_back(Action);
    				}
    			}
    		} else {
    			Action.ActionTarget = m_PBattleSubTarget;
    			luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, m_PJobAbility, roll);
    			if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
    				Action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
    			} else {
    				Action.messageID = m_PJobAbility->getMessage();
    			}

    			m_PChar->m_ActionList.push_back(Action);
    		}
    		m_PChar->PRecastContainer->Add(RECAST_ABILITY, 194, 8000); //double up
    	}

    	else if (m_PJobAbility->getID() == ABILITY_DOUBLE_UP )
    	{
    		uint8 roll = (rand() % 6) + 1;
    		CStatusEffect* doubleUpEffect = m_PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DOUBLE_UP_CHANCE);
    		uint8 total = doubleUpEffect->GetPower() + roll;
    		if (total > 12)
    		{
    			total = 12;
    		}
    		doubleUpEffect->SetPower(total);

    		CAbility* rollAbility =  ability::GetAbility(m_CorsairDoubleUp);

    		Action.animation	= doubleUpEffect->GetSubPower();
    		Action.reaction		= REACTION_NONE;
    		Action.speceffect	= (SPECEFFECT)roll;
    		Action.param		= total;
    		Action.flag			= 0;

    		if (total == 12) //bust!
    		{
    			if (m_PChar->PParty != NULL)
    			{
    				for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
    				{
    					CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

    					if(!PTarget->isDead() &&
    						PTarget->getZone() == m_PChar->getZone() &&
    						distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
    					{
    						Action.ActionTarget = PTarget;
    						if (PTarget->id == m_PChar->id){
    							Action.messageID = MSGBASIC_DOUBLEUP_BUST;
    							luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
    						} else {
    							Action.messageID = MSGBASIC_DOUBLEUP_BUST_SUB;
    						}
    						PTarget->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
    						m_PChar->m_ActionList.push_back(Action);
    					}
    				}
    			} else {
    				Action.ActionTarget = m_PBattleSubTarget;
    				luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
    				Action.messageID	= MSGBASIC_DOUBLEUP_BUST;
    				m_PChar->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
    				m_PChar->m_ActionList.push_back(Action);
    			}
    			m_PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
    		} else {
    			if (total == 11)
    			{
    				m_PChar->PRecastContainer->Del(RECAST_ABILITY, 193); //phantom roll
    			}
    			if (m_PChar->PParty != NULL)
    			{
    				for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
    				{
    					CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

    					if(!PTarget->isDead() &&
    						PTarget->getZone() == m_PChar->getZone() &&
    						distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
    					{
    						Action.ActionTarget = PTarget;
    						luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
    					if (PTarget->id == m_PChar->id){
    						if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
    							Action.messageID = MSGBASIC_DOUBLEUP_FAIL;
    						} else {
    							Action.messageID = m_PJobAbility->getMessage();
    						}
    					} else if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
    						Action.messageID  = MSGBASIC_ROLL_SUB_FAIL;
    					} else {
    						Action.messageID  = MSGBASIC_ROLL_SUB;
    					}
    						m_PChar->m_ActionList.push_back(Action);
    					}
    				}
    			} else {
    				Action.ActionTarget = m_PBattleSubTarget;
    				luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
    				if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
    					Action.messageID = MSGBASIC_DOUBLEUP_FAIL;
    				} else {
    					Action.messageID = m_PJobAbility->getMessage();
    				}
    				m_PChar->m_ActionList.push_back(Action);
    			}
    		}
    	}

        // TODO: бардак. тоже выкинуть отсюда
    	else if (m_PJobAbility->isAvatarAbility())
        {
    		if (m_PChar->PPet != NULL) //is a bp - dont display msg and notify pet
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
    	else if (m_PJobAbility->isAoE() && m_PChar->PParty != NULL)
    	{
            Action.ActionTarget = NULL;
            Action.reaction   = REACTION_NONE;
            Action.speceffect = SPECEFFECT_NONE;
            Action.animation  = m_PJobAbility->getAnimationID();
            Action.messageID  = m_PJobAbility->getMessage();
            Action.flag       = 0;

            m_PTargetFinder->reset();
            m_PChar->m_ActionList.clear();

            float distance = m_PJobAbility->getRange();

            m_PTargetFinder->findWithinArea(m_PChar, AOERADIUS_ATTACKER, distance);

            uint16 actionsLength = m_PTargetFinder->m_targets.size();

            uint16 msg = 0;
            for (std::vector<CBattleEntity*>::iterator it = m_PTargetFinder->m_targets.begin() ; it != m_PTargetFinder->m_targets.end(); ++it)
            {
                CCharEntity* PTarget = (CCharEntity*)*it;

                Action.ActionTarget = PTarget;

                m_PJobAbility->resetMsg();

                Action.param = luautils::OnUseAbility(m_PChar, PTarget, m_PJobAbility);

                if(msg == 0){
                    msg = m_PJobAbility->getMessage();
                } else {
                    msg = m_PJobAbility->getAoEMsg();
                }

                Action.messageID = msg;

                m_PChar->m_ActionList.push_back(Action);
    		}
    	}
    	else if (m_PJobAbility->getID() == ABILITY_EAGLE_EYE_SHOT )
    	{
    		uint16 damage = 0;

    		Action.ActionTarget = m_PBattleSubTarget;
    		Action.reaction   = REACTION_HIT;		//0x10
    		Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
    		Action.animation  = m_PJobAbility->getAnimationID();;
    		Action.messageID  = MSGBASIC_USES_JA_TAKE_DAMAGE;
    		Action.flag = 0;

    		bool hitOccured = false;	// track if player hit mob at all
    		if (m_PBattleSubTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0))
    		{
    			Action.messageID = 32;
    			Action.reaction   = REACTION_EVADE;
    			Action.speceffect = SPECEFFECT_NONE;
    		}
    		else if(rand()%100 < battleutils::GetRangedHitRate(m_PChar,m_PBattleSubTarget)) // hit!
    		{

                //check for shadow absorb
                if (battleutils::IsAbsorbByShadow(m_PBattleSubTarget)) {
                    Action.messageID = 0;
                    Action.param = 1;
                    Action.reaction   = REACTION_EVADE;
                    m_PBattleSubTarget->loc.zone->PushPacket(m_PBattleSubTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleSubTarget,m_PBattleSubTarget,0,1, MSGBASIC_SHADOW_ABSORB));

                    battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);
                } else {

        			float pdif = battleutils::GetRangedPDIF(m_PChar,m_PBattleSubTarget);

        			if(rand()%100 < battleutils::GetCritHitRate(m_PChar,m_PBattleSubTarget, true))
        			{
        				pdif *= 1.25; //uncapped
        				Action.speceffect = SPECEFFECT_CRITICAL_HIT;
        			}

        			CItemWeapon* PItem = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]);
        			CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);


        			// at least 1 hit occured
        			hitOccured = true;

        			damage = (damage + m_PChar->GetRangedWeaponDmg() + battleutils::GetFSTR(m_PChar,m_PBattleSubTarget,SLOT_RANGED)) * pdif * 5;
        			damage = battleutils::CheckForDamageMultiplier(PItem,damage, 0);

                    damage = battleutils::RangedDmgTaken(m_PBattleSubTarget, damage);
                }
    		}
    		else //miss
    		{
    			Action.reaction   = REACTION_EVADE;
    			Action.speceffect = SPECEFFECT_NONE;
    			Action.messageID  = MSGBASIC_USES_BUT_MISSES;

                battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);
    		}


    		// check for recycle chance
    		CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);
    		uint8 recycleChance = m_PChar->getMod(MOD_RECYCLE);

    		if (charutils::hasTrait(m_PChar,TRAIT_RECYCLE))
    			recycleChance += m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE,m_PChar->GetMLevel());

            if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
            {
                m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
                recycleChance = 100;
            }

    		if(PAmmo != NULL && rand()%100 > recycleChance)
    		{

    			if ( (PAmmo->getQuantity()-1) < 1) // ammo will run out after this shot, make sure we remove it from equip
    			{
    				uint8 slot = m_PChar->equip[SLOT_AMMO];
    				charutils::UnequipItem(m_PChar,SLOT_AMMO);
    				charutils::UpdateItem(m_PChar, LOC_INVENTORY, slot, -1);
    			}
    			else
    			{
    				charutils::UpdateItem(m_PChar, LOC_INVENTORY, m_PChar->equip[SLOT_AMMO], -1);
    			}

    			m_PChar->pushPacket(new CInventoryFinishPacket());
    		}

    		// if a hit did occur (even without barrage)
    		if (hitOccured == true)
    		{
    			Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage, false, SLOT_RANGED, 0, NULL, true);
    		}
    		m_PChar->m_ActionList.push_back(Action);
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

    		if( m_PJobAbility->getID() == ABILITY_SHADOWBIND )
    		{
    			//Action.flag = 3;
    		}

    		// handle jump abilities---

    		// Jump
    		if(m_PJobAbility->getID() == ABILITY_JUMP)
    		{
    			Action.param = battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 1);
    			if (Action.param == 0)
    			{
    				Action.messageID = 0;
    				m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, MSGBASIC_USES_BUT_MISSES));
    			}
    		}
    		// High Jump
    		else if(m_PJobAbility->getID() == ABILITY_HIGH_JUMP)
    		{
    			Action.param = battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 2);
    			if (Action.param == 0)
    			{
    				Action.messageID = 0;
    				m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, MSGBASIC_USES_BUT_MISSES));
    			}
    		}
    		// Super Jump
    		else if(m_PJobAbility->getID() == ABILITY_SUPER_JUMP)
    		{
    			battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 3);
    			Action.messageID = 0;
    			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, MSGBASIC_USES_JA));
    		}

    		// handle enmity transfer abilities
    		if (m_PJobAbility->getID() == ABILITY_ACCOMPLICE)
    			battleutils::TransferEnmity(m_PChar, m_PBattleSubTarget, (CMobEntity*)m_PBattleSubTarget->PBattleAI->GetBattleTarget(), 50);
    		else if (m_PJobAbility->getID() == ABILITY_COLLABORATOR)
    			battleutils::TransferEnmity(m_PChar, m_PBattleSubTarget, (CMobEntity*)m_PBattleSubTarget->PBattleAI->GetBattleTarget(), 25);


    		m_PChar->m_ActionList.push_back(Action);



    		if (m_PJobAbility->getID() == ABILITY_SNARL)
    		{
    			//Snarl
    			CBattleEntity* PTarget = (CBattleEntity*)m_PBattleSubTarget->PBattleAI->GetBattleTarget();

    			if (PTarget != NULL)
    			{
    				switch (PTarget->objtype)
    				{
    				case TYPE_MOB:
    					((CMobEntity*)PTarget)->PEnmityContainer->LowerEnmityByPercent(m_PChar, 100, m_PBattleSubTarget);
    					m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, 0, 528));  //528 - The <player> uses .. Enmity is transferred to the <player>'s pet.
    					break;

    				case TYPE_PET:
    					// pets have no emnity container
    					break;

    				case TYPE_PC:
    					PTarget->PBattleAI->SetBattleTarget(m_PBattleSubTarget); //Change target. in prevision of future PvP
    					break;
    				}
    			}
    		}
    		if(m_PJobAbility->getID() == ABILITY_GAUGE){
    			if(m_PBattleSubTarget != NULL && m_PBattleSubTarget->objtype == TYPE_MOB){
    				if(((CMobEntity*)m_PBattleSubTarget)->m_Type == MOBTYPE_NOTORIOUS ||
    					m_PBattleSubTarget->m_EcoSystem == SYSTEM_BEASTMEN ||
    					m_PBattleSubTarget->m_EcoSystem == SYSTEM_ARCANA)
    				{
    					//NM, Beastman or Arcana, cannot charm at all !
    					m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_CANNOT_CHARM));
    				}else{
    					uint16 baseExp = charutils::GetRealExp(m_PChar->GetMLevel(),m_PBattleSubTarget->GetMLevel());

    					if(baseExp >= 400) {//IT
    						m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_VERY_DIFFICULT_CHARM));
    					} else if(baseExp >= 240) {//VT
    						m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_DIFFICULT_TO_CHARM));
    					} else if(baseExp >= 120) {//T
    						m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_MIGHT_BE_ABLE_CHARM));
    					} else if(baseExp >= 100) {//EM
    						m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
    					} else {
    						m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleSubTarget,0,0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
    					}
    				}
    			}
    		}
    		if(m_PJobAbility->getID() == ABILITY_REWARD)
    		{
    			m_PChar->PPet->UpdateHealth();
    			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID()+16, value, MSGBASIC_USES_RECOVERS_HP));

    			//Reward gives enmity to the pet and not the Beastmaster.
    			CBattleEntity* PTarget = m_PChar->PPet->PBattleAI->GetBattleTarget();
    			if(PTarget != NULL && PTarget->objtype == TYPE_MOB)
    			{
    				((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromCure(m_PChar->PPet,m_PChar->PPet->GetMLevel(), value, false);
    			}
    		}


            if (m_PJobAbility->getValidTarget() & TARGET_ENEMY)
            {
                // во время pvp целью могут быт персонажи, монстры и их питомцы
    			if (m_PBattleSubTarget->objtype == TYPE_MOB &&
    				m_PJobAbility->getID() != ABILITY_ASSAULT &&
    				m_PJobAbility->getID() != ABILITY_FIGHT &&
    				m_PJobAbility->getID() != ABILITY_GAUGE)
    				//assault(72)/fight(53) doesnt generate hate directly
                {
                    CMobEntity* mob = (CMobEntity*)m_PBattleSubTarget;
                    mob->m_OwnerID.id = m_PChar->id;
                    mob->m_OwnerID.targid = m_PChar->targid;
                    mob->PEnmityContainer->UpdateEnmity(m_PChar, m_PJobAbility->getCE(), m_PJobAbility->getVE());
                }
            }
    	}

        // TODO: все перенести в скрипты, т.к. система позволяет получать указатель на питомца

    	if(m_PJobAbility->getID() == ABILITY_CALL_BEAST || m_PJobAbility->getID() == ABILITY_REWARD){
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
        // TODO: all abilities should display their own messages!
    	if(m_PJobAbility->getID() < ABILITY_HEALING_RUBY &&
    		m_PJobAbility->getID() != ABILITY_JUMP &&
    		m_PJobAbility->getID() != ABILITY_HIGH_JUMP &&
    		m_PJobAbility->getID() != ABILITY_SUPER_JUMP &&
    		m_PJobAbility->getID() != ABILITY_REWARD &&
    		m_PJobAbility->getID() != ABILITY_SNARL &&
    		m_PJobAbility->getID() != ABILITY_GAUGE)
    	{
    		if (m_PJobAbility->getMessage() == 0)
    			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PChar, m_PJobAbility->getID()+16, 0, MSGBASIC_USES_JA));
    	}

    } // end paralysis if

    m_PChar->PRecastContainer->Add(RECAST_ABILITY, m_PJobAbility->getRecastId(), RecastTime);
    m_PChar->pushPacket(new CCharSkillsPacket(m_PChar));

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

    if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA))
    {
        WeaponSkillStartError(89);
        return;
    }

    if (!charutils::hasWeaponSkill(m_PChar, m_PWeaponSkill->getID()))
    {
        WeaponSkillStartError(MSGBASIC_CANNOT_USE_WS);
        return;
    }

    if (m_PChar->health.tp < 100)
    {
        WeaponSkillStartError(MSGBASIC_NOT_ENOUGH_TP);
        return;
    }

    if (GetValidTarget(&m_PBattleSubTarget, TARGET_ENEMY))
    {
        if (!IsMobOwner(m_PBattleSubTarget))
	    {
            WeaponSkillStartError(MSGBASIC_ALREADY_CLAIMED);
		    return;
	    }

	    float Distance = distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p);

	    if ((Distance - m_PBattleSubTarget->m_ModelSize) > m_PWeaponSkill->getRange())
	    {
            WeaponSkillStartError(MSGBASIC_TOO_FAR_AWAY);
		    return;
	    }
	    if (!isFaceing(m_PChar->loc.p, m_PBattleSubTarget->loc.p, 40))
	    {
            WeaponSkillStartError(MSGBASIC_UNABLE_TO_SEE_TARG);
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
				WeaponSkillStartError(MSGBASIC_NO_RANGED_WEAPON); // You do not have an appropriate ranged weapon equipped
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
    WeaponSkillStartError(MSGBASIC_CANNOT_ATTACK_TARGET);
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
	if (m_PChar->equip[SLOT_SUB] != 0)
	{
		std::vector<CModifier*>::iterator modIterator;
		std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_SUB]))->modList;

		for(modIterator = modList.begin(); modIterator != modList.end(); modIterator++)
		{
			if((*modIterator)->getModID() == MOD_TP_BONUS){
				bonusTp = bonusTp - (*modIterator)->getModAmount();
			}
		}
	}

	//if ranged WS, remove TP bonus from mainhand weapon
	if (m_PWeaponSkill->getID() >= 192 && m_PWeaponSkill->getID() <= 221)
	{
		if(m_PChar->equip[SLOT_MAIN] != 0)
		{
			std::vector<CModifier*>::iterator modIterator;
			std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_MAIN]))->modList;

			for(modIterator = modList.begin(); modIterator != modList.end(); modIterator++)
			{
				if((*modIterator)->getModID() == MOD_TP_BONUS)
				{
					bonusTp = bonusTp - (*modIterator)->getModAmount();
				}
			}
		}
	}
	else
	{
		//if melee WS, remove TP bonus from ranged weapon
		if(m_PChar->equip[SLOT_RANGED] != 0)
		{
			std::vector<CModifier*>::iterator modIterator;
			std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_RANGED]))->modList;

			for(modIterator = modList.begin(); modIterator != modList.end(); modIterator++)
			{
				if((*modIterator)->getModID() == MOD_TP_BONUS)
				{
					bonusTp = bonusTp - (*modIterator)->getModAmount();
				}
			}
		}
	}

	if(bonusTp + m_PChar->health.tp > 300)
	{
		bonusTp = 300 - m_PChar->health.tp;
		m_PChar->health.tp = 300;
	}
	else
	{
		m_PChar->addTP(bonusTp);
	}


	float wsTP = m_PChar->health.tp;
	m_LastActionTime = m_Tick;
	uint16 tpHitsLanded = 0;
	uint16 extraHitsLanded = 0;
	uint16 damage = 0;
	m_PChar->PLatentEffectContainer->CheckLatentsTP(0);

	damage = luautils::OnUseWeaponSkill(m_PChar, m_PBattleSubTarget, &tpHitsLanded, &extraHitsLanded);

    // handle shadows
    uint8 shadowsTaken = 0;
    uint8 landedHits = tpHitsLanded + extraHitsLanded;
    uint8 totalHits = landedHits;

    //count number of shadows taken
    while(totalHits && landedHits && battleutils::IsAbsorbByShadow(m_PBattleSubTarget)){
        landedHits--;
        shadowsTaken++;
    }

    if(shadowsTaken){
        // if no hits landed, deal no damage
        if(landedHits == 0){
            damage = 0;
        } else {
            //divide damage by amount of shadows taken
            damage *= 1 - ((float)shadowsTaken / totalHits);
        }
    }

	if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
	{
		m_PChar->addTP(-100 - bonusTp);
		m_PChar->PLatentEffectContainer->CheckLatentsTP(m_PChar->health.tp);
	}
	else if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI))
	{
		m_PChar->addTP(-100 - bonusTp);
		m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
		m_PChar->PLatentEffectContainer->CheckLatentsTP(m_PChar->health.tp);
	}
	else
	{
		m_PChar->health.tp = 0;
	}


	//incase a TA party member is available
	CBattleEntity* taChar = NULL;

	//trick attack agi bonus for thf main job
	if (m_PChar->GetMJob() == JOB_THF &&	m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
	{
		taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);
		if(taChar != NULL) damage += m_PChar->AGI();
	}

	//check if other jobs have trick attack active to change enmity lateron
	if (taChar == NULL && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
		taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);


	if (!battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID()))
	{
		uint8 damslot = SLOT_MAIN;
		if (m_PWeaponSkill->getID()>=192 && m_PWeaponSkill->getID()<=218)
		{
			//ranged WS IDs
			damslot = SLOT_RANGED;
		}


		// check for ws points
		CItemWeapon* PWeapon = (CItemWeapon*)m_PChar->m_Weapons[damslot];

		if (PWeapon->isUnlockable() && !m_PChar->unlockedWeapons[PWeapon->getUnlockId()-1].unlocked)
		{
			if (m_PChar->addWsPoints(1,PWeapon->getUnlockId()-1))
			{
				// weapon is now broken
				m_PChar->PLatentEffectContainer->CheckLatentsWeaponBreak(damslot);
			}
		}


		// add overwhelm damage bonus
		damage = battleutils::getOverWhelmDamageBonus(m_PChar, m_PBattleSubTarget, damage);

		damage = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage, false, damslot, tpHitsLanded, taChar, true);
		m_PBattleSubTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
	}

	m_PChar->addTP(extraHitsLanded);
	float afterWsTP = m_PChar->health.tp;

	if (m_PChar->PPet != NULL && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
	{
		((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_ELEMENTAL_BREATH;
		m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
	}

	apAction_t Action;

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction = REACTION_HIT;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation = m_PWeaponSkill->getAnimationId();
	Action.param = damage;
	Action.flag = 0;

    m_PTargetFinder->reset();
    m_PChar->m_ActionList.clear();

    // TODO: need better way to handle misses
    if(damage == 0 && !m_PBattleSubTarget->StatusEffectContainer->HasStatusEffect(EFFECT_STONESKIN))
    {
        Action.reaction = REACTION_EVADE;
        Action.messageID = 188; //but misses
    }
    else
    {
        Action.messageID = 185; //damage ws
    }

	if (damage > 0 && battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID()))
	{
		Action.speceffect = SPECEFFECT_NONE;
		Action.messageID = 224; //restores mp msg
		m_PChar->addMP(damage);
	}

	if (m_PWeaponSkill->getID() >= 192 && m_PWeaponSkill->getID() <= 218)
	{
		//ranged WS IDs
		CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getStorage(LOC_INVENTORY)->GetItem(m_PChar->equip[SLOT_AMMO]);

        uint8 recycleChance = m_PChar->getMod(MOD_RECYCLE) + m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE,m_PChar->GetMLevel());

        if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
               {
                    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
                    recycleChance = 100;
                }

		if(PAmmo!=NULL && rand()%100 > recycleChance)
		{
			if ( (PAmmo->getQuantity()-1) < 1) // ammo will run out after this shot, make sure we remove it from equip
			{
				uint8 slot = m_PChar->equip[SLOT_AMMO];
				charutils::UnequipItem(m_PChar,SLOT_AMMO);
				charutils::UpdateItem(m_PChar, LOC_INVENTORY, slot, -1);
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

    if(m_PWeaponSkill->isAoE())
    {
        float radius = 10;

        m_PTargetFinder->reset();
        m_PTargetFinder->findWithinArea(m_PBattleSubTarget, AOERADIUS_TARGET, radius);

        uint16 actionsLength = m_PTargetFinder->m_targets.size();

        uint16 msg = 0;
        for (std::vector<CBattleEntity*>::iterator it = m_PTargetFinder->m_targets.begin() ; it != m_PTargetFinder->m_targets.end(); ++it)
        {
            CBattleEntity* PTarget = *it;

            // don't add same target twice
            if(PTarget == m_PBattleSubTarget) continue;

            Action.ActionTarget = PTarget;

        	m_PChar->health.tp = wsTP;

        	damage = luautils::OnUseWeaponSkill(m_PChar, PTarget, &tpHitsLanded, &extraHitsLanded);

        	m_PChar->health.tp = afterWsTP;

        	Action.param = battleutils::TakePhysicalDamage(m_PChar, PTarget, damage, false, SLOT_MAIN, 0, taChar, true);

        	if(msg == 0)
        	{
        		msg = 185;
            } else {
                msg = 264; // "xxx takes ### damage." only
            }

            if (damage == 0)
            {
                Action.reaction = REACTION_EVADE;
                msg = 188;
            }

            Action.messageID = msg; //but misses

            // create hate on mob
            if(PTarget->objtype == TYPE_MOB){

                CMobEntity* mob = (CMobEntity*)PTarget;
                mob->PEnmityContainer->UpdateEnmityFromDamage(m_PChar, Action.param);
            }

            m_PChar->m_ActionList.push_back(Action);
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
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionSleep()
{
    if (!m_PChar->StatusEffectContainer->HasPreventActionEffect())
    {
		m_PBattleSubTarget = NULL;
		m_ActionType = (m_PChar->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
    }

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


	if (Monster->m_HiPCLvl < m_PChar->GetMLevel())
		Monster->m_HiPCLvl = m_PChar->GetMLevel();


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

						// lock on to the new, if its not charmed
						if (!m_PBattleTarget->isCharmed)
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
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_ALREADY_CLAIMED));

		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}

	float Distance = distance(m_PChar->loc.p,m_PBattleTarget->loc.p);

	if (Distance > 30)
	{
		m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_LOSE_SIGHT));

		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}


	uint16 WeaponDelay = m_PChar->GetWeaponDelay(false);

	if ((m_Tick - m_LastMeleeTime) > WeaponDelay)
	{
		if (!isFaceing(m_PChar->loc.p, m_PBattleTarget->loc.p, 40))
		{
			if ((m_Tick - m_AttackMessageTime) > WeaponDelay)
			{
				m_AttackMessageTime = m_Tick;
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_UNABLE_TO_SEE_TARG));
			}
			return;
		}
		if (Distance > m_PBattleTarget->m_ModelSize)
		{
			if ((m_Tick - m_AttackMessageTime) > WeaponDelay)
			{
				m_AttackMessageTime = m_Tick;
				m_PChar->pushPacket(new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_TARG_OUT_OF_RANGE));
			}
			return;
		}
		m_LastMeleeTime = m_Tick;
		if (battleutils::IsParalised(m_PChar))
		{
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_IS_PARALYZED));
		}
		else if (battleutils::IsIntimidated(m_PChar, m_PBattleTarget))
		{
			m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar,m_PBattleTarget,0,0,MSGBASIC_IS_INTIMIDATED));
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

            bool isHTH = m_PChar->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH;

			if(isHTH){ //h2h equipped!

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
			bool SATAhit = false; //SA/TA+Assassin guarantee every hit in a round to connect
            uint8 totalHits = numattacksLeftHand + numattacksRightHand + numKickAttacks;

			if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
				taChar = battleutils::getAvailableTrickAttackChar(m_PChar,m_PBattleTarget);

			for (uint8 i = 0; i < totalHits; ++i)
			{
				if (i != 0)
				{

					if (m_PBattleTarget->isDead())
					{
						break;
					}
					Action.ActionTarget = NULL;

					if (!isHTH && i>=numattacksRightHand)
					{
						PWeapon = m_PChar->m_Weapons[SLOT_SUB];
						fstrslot = SLOT_SUB;
					}
				}

				uint16 damage = 0;

				if(m_PChar->GetMJob() == JOB_MNK && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_FOOTWORK)){
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
				if(i < numattacksRightHand){
					if (zanshin){
						hitRate = battleutils::GetHitRate(m_PChar,m_PBattleTarget,0,(uint8)35);
					}
					else{
						hitRate = battleutils::GetHitRate(m_PChar,m_PBattleTarget,0);
					}
				}
				else if ( i < numattacksLeftHand + numattacksRightHand){
					if (zanshin){
						hitRate = battleutils::GetHitRate(m_PChar,m_PBattleTarget,1,(uint8)35);
					}
					else{
						hitRate = battleutils::GetHitRate(m_PChar,m_PBattleTarget,1);
					}
					//deciding this here because SA/TA wears on attack, before the 2nd+ hits go off
					if (hitRate = 100)
					{
						SATAhit = true;
					}
				}
				else if ( i >= numattacksLeftHand + numattacksRightHand )
				{
					hitRate = battleutils::GetHitRate(m_PChar,m_PBattleTarget,2);
				}
				// сначала вычисляем вероятность попадания по монстру
				// затем нужно вычислить вероятность нанесения критического удара
				if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE,0))
				{
					Action.messageID = 32;
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
				}
				else if ( rand()%100 < hitRate || SATAhit)
				{

                    // attack hit, try to be absorbed by shadow
                    if (battleutils::IsAbsorbByShadow(m_PBattleTarget))
                    {
                        Action.messageID = 0;
                        Action.reaction = REACTION_EVADE;
                        m_PBattleTarget->loc.zone->PushPacket(m_PBattleTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget,m_PBattleTarget,0,1,31));
                    }
                    else
                    {
						bool ignoreSneakTrickAttack = (i != 0); // Sneak attack critical effect should only be given on the first swing.
						bool isCritical = (rand()%100 < battleutils::GetCritHitRate(m_PChar, m_PBattleTarget, ignoreSneakTrickAttack));

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

						if(m_PChar->GetMJob() == JOB_THF && (!ignoreSneakTrickAttack) &&
							m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK_ATTACK) &&
							abs(m_PBattleTarget->loc.p.rotation - m_PChar->loc.p.rotation) < 23)
							{
								bonusDMG = m_PChar->DEX();
								if(rand()%100 < 4) Monster->m_THLvl +=1;
							}


						//trick attack agi bonus for thf main job
						if(m_PChar->GetMJob() == JOB_THF && (!ignoreSneakTrickAttack) && taChar != NULL)
						{
							bonusDMG += m_PChar->AGI();
						}

						if (isHTH)
						{
							// (ffxiclopedia h2h) remove 3 dmg from weapon, DB has an extra 3 for weapon rank

							// get natural h2h damage (h2hSkill*0.11+3)
							uint16 naturalH2hDmg = (float)(m_PChar->GetSkill(1) * 0.11f)+3;

                            int16 baseDamage = m_PChar->GetMainWeaponDmg()-3;

                            if(Action.animation == 2 || Action.animation == 3){
                                // this is a kick attack
                                baseDamage = m_PChar->getMod(MOD_KICK_DMG);
                            }

							damage = (uint16)((( baseDamage + naturalH2hDmg + bonusDMG +
									 battleutils::GetFSTR(m_PChar, m_PBattleTarget,fstrslot)) * DamageRatio));
						}
						else
						{
							if( fstrslot == SLOT_MAIN )
							{
								damage = (uint16)(((m_PChar->GetMainWeaponDmg() + bonusDMG +
									battleutils::GetFSTR(m_PChar, m_PBattleTarget,fstrslot)) * DamageRatio));
							} else if( fstrslot == SLOT_SUB )
							{
								damage = (uint16)(((m_PChar->GetSubWeaponDmg() + bonusDMG +
									battleutils::GetFSTR(m_PChar, m_PBattleTarget,fstrslot)) * DamageRatio));
							}
						}


						// do soul eater effect
						damage = battleutils::doSoulEaterEffect(m_PChar, damage);

						charutils::TrySkillUP(m_PChar, (SKILLTYPE)PWeapon->getSkillType(), m_PBattleTarget->GetMLevel());
						zanshin = false;
					}
				}
				else
				{
					// player misses the target
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
					Action.messageID  = 15;

					uint8 zanshinChance = 0;

					// Zanshin effects from gear, food or buffs do not require the job trait to be enabled.
					if (!zanshin)
						zanshinChance += m_PChar->getMod(MOD_ZANSHIN) + m_PChar->PMeritPoints->GetMeritValue(MERIT_ZASHIN_ATTACK_RATE, m_PChar->GetMLevel());

					if (!zanshin && rand()%100 < zanshinChance && (( i == 0 && numattacksRightHand == 1 ) || (i == numattacksRightHand && numattacksLeftHand == 1)) )
					{
						zanshin = true;
						i > numattacksRightHand ? numattacksLeftHand++ : numattacksRightHand++;
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

                    battleutils::ClaimMob(m_PBattleTarget, m_PChar);
				}

				if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
				{

                    // spikes take priority over enspells
					if(!battleutils::HandleSpikesDamage(m_PChar, m_PBattleTarget, &Action, damage)){
                        // no spikes, handle enspell
                       battleutils::HandleEnspell(m_PChar, m_PBattleTarget, &Action, i, WeaponDelay, damage);
                   }
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
	uint16 hpReturned = 1;

    apAction_t Action;
    m_PChar->m_ActionList.clear();

    Action.ActionTarget = m_PChar;
    if(m_PChar->m_hasRaise == 1)
    {
        Action.animation = 511;
        hpReturned = m_PChar->GetMaxHP()*0.1;
        ratioReturned = 0.50f * (1 - map_config.exp_retain);
    }
    else if(m_PChar->m_hasRaise == 2)
    {
        Action.animation = 512;
        hpReturned = m_PChar->GetMaxHP()*0.25;
        ratioReturned = ((m_PChar->GetMLevel() <= 50) ? 0.50f : 0.75f) * (1 - map_config.exp_retain);
    }
    else if(m_PChar->m_hasRaise == 3)
    {
        Action.animation = 496;
        hpReturned = m_PChar->GetMaxHP()*0.5;
        ratioReturned = ((m_PChar->GetMLevel() <= 50) ? 0.50f : 0.90f) * (1 - map_config.exp_retain);
    }
	m_PChar->addHP(((hpReturned < 1) ? 1 : hpReturned));
    Action.reaction   = REACTION_NONE;
    Action.speceffect = SPECEFFECT_RAISE;
    Action.messageID  = 0;
    Action.flag = 0;

    m_PChar->m_ActionList.push_back(Action);
    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

    uint8 weaknessLvl = 1;
    if(m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_WEAKNESS))
    {
        //double weakness! Calculate stuff here
        weaknessLvl = 2;
    }
    //add weakness effect (75% reduction in HP/MP)
    CStatusEffect* PWeaknessEffect = new CStatusEffect(EFFECT_WEAKNESS,EFFECT_WEAKNESS,weaknessLvl,0,300);
    m_PChar->StatusEffectContainer->AddStatusEffect(PWeaknessEffect);

    charutils::UpdateHealth(m_PChar);
    m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));

    uint8 mLevel = (m_PChar->m_LevelRestriction != 0 && m_PChar->m_LevelRestriction < m_PChar->GetMLevel()) ? m_PChar->m_LevelRestriction : m_PChar->GetMLevel();
    uint16 expLost = mLevel <= 67 ? (charutils::GetExpNEXTLevel(mLevel) * 8 ) / 100 : 2400;
    uint16 xpNeededToLevel = charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()]) - m_PChar->jobs.exp[m_PChar->GetMJob()];

    // Exp is enough to level you and (you're not under a level restriction, or the level restriction is higher than your current main level).
    if(xpNeededToLevel < expLost && (m_PChar->m_LevelRestriction == 0 || m_PChar->GetMLevel() < m_PChar->m_LevelRestriction))
    {
        // Player probably leveled down when they died.  Give they xp for the next level.
        expLost = m_PChar->GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()] + 1) * 8 ) / 100 : 2400;
    }

    uint16 xpReturned = ceil(expLost * ratioReturned);

    charutils::AddExperiencePoints(true, m_PChar, m_PChar, xpReturned);

	m_ActionType = ACTION_NONE;
}