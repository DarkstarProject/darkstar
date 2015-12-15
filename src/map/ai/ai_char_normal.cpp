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

#include "../../common/utils.h"

#include "../ability.h"
#include "../alliance.h"
#include "../blue_spell.h"
#include "../utils/battleutils.h"
#include "../utils/charutils.h"
#include "../utils/attackutils.h"
#include "../attackround.h"
#include "../attack.h"
#include "../conquest_system.h"
#include "../utils/jailutils.h"
#include "../map.h"
#include "../utils/mobutils.h"
#include "../utils/petutils.h"
#include "../spell.h"
#include "../vana_time.h"
#include "../weapon_skill.h"
#include "../zone.h"
#include "../status_effect_container.h"
#include "../latent_effect_container.h"
#include "../universal_container.h"
#include "../recast_container.h"

#include "../items/item_weapon.h"

#include "../lua/luautils.h"

#include "../packets/action.h"
#include "../packets/char.h"
#include "../packets/char_abilities.h"
#include "../packets/char_health.h"
#include "../packets/char_recast.h"
#include "../packets/char_skills.h"
#include "../packets/char_stats.h"

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

void trackArrowUsageForScavenge(CItemWeapon* PAmmo, CCharEntity* m_PChar)
{
    // Check if local has been set yet
    if (m_PChar->GetLocalVar("ArrowsUsed") == 0)
    {
        // Local not set yet so set
        m_PChar->SetLocalVar("ArrowsUsed", PAmmo->getID() * 10000 + 1);
        //printf("\n arrows used: %i", m_PChar->GetLocalVar("ArrowsUsed"));
    }
    else
    {
        // Local exists now check if arrow used is same as last time
        if ((floor(m_PChar->GetLocalVar("ArrowsUsed") / 10000)) == PAmmo->getID())
        {
            // Same arrow used as last time now check that arrows used do not go above 1980
            if (floor(m_PChar->GetLocalVar("ArrowsUsed") % 10000) >= 1980)
            {
                // Do not increment arrows used past 1980
                //printf("\n arrows used: %i", m_PChar->GetLocalVar("ArrowsUsed"));
            }
            else
            {
                // Safe to increment arrows used
                m_PChar->SetLocalVar("ArrowsUsed", m_PChar->GetLocalVar("ArrowsUsed") + 1);
                //printf("\n arrows used %i", m_PChar->GetLocalVar("ArrowsUsed"));
            }
        }
        else
        {
            // Different arrow is being used so remake local
            m_PChar->SetLocalVar("ArrowsUsed", PAmmo->getID() * 10000 + 1);
            //printf("\n arrows used: %i", m_PChar->GetLocalVar("ArrowsUsed"));
        }
    }
}

/************************************************************************
*																		*
*  Инициализируем владельца интеллекта (может добавить проверку на		*
*  пустой указатель с выводом FatalError ?)								*
*																		*
************************************************************************/

CAICharNormal::CAICharNormal(CCharEntity* PChar)
{
    m_PChar = PChar;
    m_PTargetFind = new CTargetFind(PChar);
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

    CBattleEntity* PSelf = m_PChar;

    if ((m_ActionType != ACTION_NONE) && jailutils::InPrison(m_PChar))
    {
        Reset();
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_CANT_BE_USED_IN_AREA));
    }

    if (m_PChar->ReloadParty())
        charutils::ReloadParty(m_PChar);

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

    default: DSP_DEBUG_BREAK_IF(true);
    }

    if (m_PChar && PSelf->PBattleAI == this)
    {
        m_PChar->UpdateEntity();
    }
}

void CAICharNormal::CheckActionAfterReceive(uint32 tick)
{
    if (m_PChar->m_EquipSwap == true)
    {
        m_PChar->pushPacket(new CCharAppearancePacket(m_PChar));
        m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));

        m_PChar->pushPacket(new CCharHealthPacket(m_PChar));
        m_PChar->m_EquipSwap = false;
    }

    if ((m_ActionType != ACTION_NONE) && jailutils::InPrison(m_PChar))
    {
        Reset();
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_CANT_BE_USED_IN_AREA));
    }

    switch (m_ActionType)
    {
    case ACTION_MAGIC_START:
    case ACTION_ENGAGE:
    case ACTION_DISENGAGE:
    case ACTION_RANGED_START:
    case ACTION_ITEM_START:
    case ACTION_CHANGE_TARGET:
    case ACTION_WEAPONSKILL_START:
    case ACTION_JOBABILITY_START:
    case ACTION_RAISE_MENU_SELECTION:
        //call the classes (or subclasses) action handlers
        CheckCurrentAction(tick);

    default: break;
    }
}

void CAICharNormal::WeatherChange(WEATHER weather, uint8 element)
{

}

/************************************************************************
* Checks to see if the action can be cast on self/player/party/dead		*
* or mobs.																*
************************************************************************/

bool CAICharNormal::GetValidTarget(CBattleEntity** PBattleTarget, uint8 ValidTarget)
{
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);

    CBattleEntity* PTarget = (CBattleEntity*)m_PChar->GetEntity(m_ActionTargetID, TYPE_MOB | TYPE_PC | TYPE_PET);
    *PBattleTarget = PTarget;

    m_ActionTargetID = 0;

    if (PTarget == nullptr)
    {
        *PBattleTarget = m_PChar; //this prevents a nullptr crash when message is sent
        return false;
    }

    if (m_PChar->StatusEffectContainer->GetConfrontationEffect() != PTarget->StatusEffectContainer->GetConfrontationEffect())
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
            (m_PChar->PParty != nullptr && m_PChar->PParty == PTarget->PParty))
        {
            return true;
        }
        if ((ValidTarget & TARGET_PLAYER_DEAD) && PTarget->isDead())
        {
            return true;
        }

        return false;
    }

    if (PTarget->objtype == TYPE_MOB)
    {
        if (ValidTarget & TARGET_PLAYER_DEAD && ((CMobEntity*)PTarget)->m_Behaviour & BEHAVIOUR_RAISABLE
            && PTarget->isDead())
        {
            return true;
        }

        if (ValidTarget & TARGET_NPC)
        {
            if (PTarget->allegiance == m_PChar->allegiance && !(((CMobEntity*)PTarget)->m_Behaviour & BEHAVIOUR_NOHELP))
            {
                return true;
            }
        }
    }

    if (ValidTarget & TARGET_ENEMY)
    {
        if (!PTarget->isDead())
        {
            if (PTarget->allegiance == (m_PChar->allegiance % 2 == 0 ? m_PChar->allegiance + 1 : m_PChar->allegiance - 1))
            {
                return true;
            }
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
    DSP_DEBUG_BREAK_IF(PBattleTarget == nullptr);

    if (PBattleTarget->m_OwnerID.id == 0 || PBattleTarget->m_OwnerID.id == m_PChar->id || PBattleTarget->objtype == TYPE_PC)
    {
        return true;
    }

    bool found = false;

    m_PChar->ForAlliance([&PBattleTarget, &found](CBattleEntity* PChar){
        if (PChar->id == PBattleTarget->m_OwnerID.id)
        {
            found = true;
        }
    });

    return found;
}

/************************************************************************
*																		*
*  Персонаж переходит в боевую стойку, включается прежим атаки			*
*																		*
************************************************************************/

void CAICharNormal::ActionEngage()
{
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);

    if (GetValidTarget(&m_PBattleTarget, TARGET_ENEMY))
    {
        if (IsMobOwner(m_PBattleTarget))
        {
            if (distance(m_PChar->loc.p, m_PBattleTarget->loc.p) <= 30)
            {
                if (m_Tick > m_LastMeleeTime + m_PChar->m_Weapons[SLOT_MAIN]->getDelay())
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

                    m_PChar->animation = ANIMATION_ATTACK;
                    m_PChar->PLatentEffectContainer->CheckLatentsWeaponDraw(true);
                    m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                    m_PChar->updatemask |= UPDATE_HP;
                    return;
                }
                else
                {
                    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_WAIT_LONGER));
                }
            }
            else
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
            }
        }
        else
        {
            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED));
        }
    }
    else if (m_PBattleTarget != nullptr)
    {
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_CANNOT_ATTACK_TARGET));
    }
    m_PBattleTarget = nullptr;
    m_PBattleSubTarget = nullptr;
    m_ActionType = ACTION_NONE;
}

/************************************************************************
*																		*
*  Персонаж меняет основную цель атаки									*
*																		*
************************************************************************/

void CAICharNormal::ActionChangeBattleTarget()
{
}

/************************************************************************
*																		*
*  Персонаж выходит из режима атаки по каким-либо причинам				*
*																		*
************************************************************************/

void CAICharNormal::ActionDisengage()
{
}

/************************************************************************
*                                                                       *
*  Смерть персонажа                                                     *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionFall()
{
}

/************************************************************************
*                                                                       *
*  Удаляем соответствующие эффекты с ожиданием в одну секунду           *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionDeath()
{
    // без задержки удаление эффектов не всегда правильно обрабатывается клиентом
    if (m_Tick >= m_LastActionTime + 1000)
    {
        m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH, true);

        // reraise modifiers
        if (m_PChar->getMod(MOD_RERAISE_I) > 0)
            m_PChar->m_hasRaise = 1;

        if (m_PChar->getMod(MOD_RERAISE_II) > 0)
            m_PChar->m_hasRaise = 2;

        if (m_PChar->getMod(MOD_RERAISE_III) > 0)
            m_PChar->m_hasRaise = 3;

        // has reraise, don't stop timer
        // this must be after deleting status effects
        if (m_PChar->m_hasRaise == 0){
            m_LastActionTime = m_Tick;
            m_ActionType = ACTION_NONE;
        }
    }

    // show reraise menu after sometime
    // this also prevents the menu from appearing before you're totally dead
    if (m_PChar->m_hasRaise && m_Tick >= m_LastActionTime + 8000)
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
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != nullptr);

    DSP_DEBUG_BREAK_IF(m_PChar->UContainer->GetType() != UCONTAINER_USEITEM);
    DSP_DEBUG_BREAK_IF(m_PChar->UContainer->GetItem(0) == nullptr);

    m_PItemUsable = (CItemUsable*)m_PChar->UContainer->GetItem(0);
    m_PChar->UContainer->Clean();

    if (GetValidTarget(&m_PBattleSubTarget, m_PItemUsable->getValidTarget()))
    {
        int32 ErrorID = luautils::OnItemCheck(m_PBattleSubTarget, m_PItemUsable);

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
    else if (m_PBattleSubTarget != nullptr)
    {
        m_ActionType = ACTION_ITEM_INTERRUPT;

        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PItemUsable->getID(), 0, MSGBASIC_CANNOT_USE_ITEM_ON));
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
    Action.reaction = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation = 0;
    Action.param = m_PItemUsable->getID();
    Action.messageID = 28;
    Action.knockback = 0;

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
    DSP_DEBUG_BREAK_IF(m_PItemUsable == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x ||
        m_PChar->m_StartActionPos.z != m_PChar->loc.p.z ||
        m_PChar->StatusEffectContainer->HasPreventActionEffect())
    {
        m_ActionType = ACTION_ITEM_INTERRUPT;
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, m_PItemUsable->getID(), 0, MSGBASIC_ITEM_FAILS_TO_ACTIVATE));
        ActionItemInterrupt();
        return;
    }

    if (m_PBattleSubTarget->objtype == TYPE_MOB && !IsMobOwner(m_PBattleSubTarget))
    {
        m_ActionType = ACTION_ITEM_INTERRUPT;
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED));

        ActionItemInterrupt();
        return;
    }

    if (m_Tick >= m_LastActionTime + m_PItemUsable->getActivationTime())
    {
        // обновление времени необходимо для правильной работы задержки анимации
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_ITEM_FINISH;

        if (m_PItemUsable->isType(ITEM_ARMOR))
        {
            if (m_PItemUsable->getMaxCharges() > 1)
            {
                m_PItemUsable->setCurrentCharges(m_PItemUsable->getCurrentCharges() - 1);
            }
            m_PItemUsable->setLastUseTime(CVanaTime::getInstance()->getVanaTime());
            m_PChar->pushPacket(new CInventoryItemPacket(m_PItemUsable, m_PItemUsable->getLocationID(), m_PItemUsable->getSlotID()));

            int8 extra[sizeof(m_PItemUsable->m_extra) * 2 + 1];
            Sql_EscapeStringLen(SqlHandle, extra, (const char*)m_PItemUsable->m_extra, sizeof(m_PItemUsable->m_extra));

            const int8* Query =
                "UPDATE char_inventory "
                "SET extra = '%s' "
                "WHERE charid = %u AND location = %u AND slot = %u;";

            Sql_Query(
                SqlHandle,
                Query,
                extra,
                m_PChar->id,
                m_PItemUsable->getLocationID(),
                m_PItemUsable->getSlotID());

            if (m_PItemUsable->getCurrentCharges() != 0)
            {
                m_PChar->PRecastContainer->Add(RECAST_ITEM, m_PItemUsable->getSlotID(), m_PItemUsable->getReuseTime() / 1000);
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
        Action.reaction = REACTION_NONE;
        Action.speceffect = SPECEFFECT_NONE;
        Action.animation = m_PItemUsable->getAnimationID();
        Action.param = 0;
        Action.messageID = 0;
        Action.knockback = 0;

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
    DSP_DEBUG_BREAK_IF(m_PItemUsable == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    if (m_Tick >= m_LastActionTime + m_PItemUsable->getAnimationTime())
    {
        if (battleutils::IsParalyzed(m_PChar)){
            m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_IS_PARALYZED));
        }
        else {

            m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);

            // party AoE effect
            if (m_PItemUsable->getAoE() == 1)
            {
                m_PBattleSubTarget->ForParty([this](CBattleEntity* PTarget){
                    if (!PTarget->isDead() && distance(m_PBattleSubTarget->loc.p, PTarget->loc.p) <= 10)
                    {
                        luautils::OnItemUse(PTarget, m_PItemUsable);
                    }
                });
            }
            else
            {
                luautils::OnItemUse(m_PBattleSubTarget, m_PItemUsable);
            }
        }
        delete m_PItemUsable;

        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        //we may have modified the action via item use! (e.g. sleeping potion)
        if (m_ActionType == ACTION_ITEM_FINISH)
        {
            TransitionBack();
        }
        m_PItemUsable = nullptr;
        m_PBattleSubTarget = nullptr;

    }
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionItemInterrupt()
{
    DSP_DEBUG_BREAK_IF(m_PItemUsable == nullptr);

    m_PItemUsable->setSubType(ITEM_UNLOCKED);

    m_PChar->pushPacket(new CInventoryAssignPacket(m_PItemUsable, INV_NORMAL));
    m_PChar->pushPacket(new CInventoryFinishPacket());

    apAction_t Action;
    m_PChar->m_ActionList.clear();

    Action.ActionTarget = m_PChar;
    Action.reaction = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation = 54;
    Action.param = 0;
    Action.messageID = 0;
    Action.knockback = 0;

    m_PChar->m_ActionList.push_back(Action);

    m_PChar->pushPacket(new CActionPacket(m_PChar));

    TransitionBack();
    m_PItemUsable = nullptr;
    m_PBattleSubTarget = nullptr;
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
}

/************************************************************************
*																		*
*  Окончание дальней атаки												*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedFinish()
{
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
    Action.reaction = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation = ANIMATION_RANGED;
    Action.param = 0;
    Action.messageID = 0;
    Action.knockback = 0;

    m_PChar->m_ActionList.push_back(Action);

    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

    TransitionBack();
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
    // keeping this for legacy
    // m_PSpell will eventually be refactored out
    // needed for packets
    //DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);
    //DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);

    //if (m_PMagicState->IsOnCoolDown(m_Tick))
    //{
    //    MagicStartError();
    //    return;
    //}

    //STATESTATUS status = m_PMagicState->CastSpell(GetCurrentSpell(), m_PTargetFind->getValidTarget(m_ActionTargetID, m_PSpell->getValidTarget()));


    //if (status == STATESTATUS_START)
    //{
    //    m_ActionTargetID = 0;
    //    m_LastActionTime = m_Tick;
    //    m_ActionType = ACTION_MAGIC_CASTING;
    //}
    //else
    //{
    //    MagicStartError();
    //}
}

/************************************************************************
*                                                                       *
*  Невозможно начать читать заклинание                                  *
*                                                                       *
************************************************************************/

void CAICharNormal::MagicStartError()
{
    //DSP_DEBUG_BREAK_IF(m_ActionType != ACTION_MAGIC_START);

    //m_ActionTargetID = 0;

    //m_PSpell = nullptr;
    //m_PBattleSubTarget = nullptr;

    //TransitionBack();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicCasting()
{
    //STATESTATUS status = m_PMagicState->Update(m_Tick);

    //if (status == STATESTATUS_INTERRUPT)
    //{
    //    m_ActionType = ACTION_MAGIC_INTERRUPT;
    //    ActionMagicInterrupt();
    //}
    //else if (status == STATESTATUS_ERROR)
    //{
    //    TransitionBack();
    //}
    //else if (status == STATESTATUS_FINISH)
    //{
    //    m_ActionType = ACTION_MAGIC_FINISH;
    //    ActionMagicFinish();
    //}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicFinish()
{
    //m_PMagicState->FinishSpell();

    //m_LastMeleeTime += (m_Tick - m_LastActionTime);

    //m_PMagicState->SetLastCoolTime(m_Tick);

    //m_PSpell = nullptr;
    //m_PBattleSubTarget = nullptr;

    //TransitionBack();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionMagicInterrupt()
{
    //m_PMagicState->Interrupt();

    //m_LastMeleeTime += (m_Tick - m_LastActionTime);

    //m_PMagicState->SetLastCoolTime(m_Tick);

    //m_PSpell = nullptr;
    //m_PBattleSubTarget = nullptr;

    //TransitionBack();
}

/************************************************************************
*                                                                       *
*  Start the Job Ability                                                *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionJobAbilityStart()
{
}

/************************************************************************
*                                                                       *
*  End the Job Ability                                                  *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionJobAbilityFinish()
{
}

/************************************************************************
*                                                                       *
*  Start the weapon skill                                               *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionWeaponSkillStart()
{
}

/************************************************************************
*                                                                       *
*  Невозможно начать weapon skill                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::WeaponSkillStartError(uint16 error)
{
}

/************************************************************************
*																		*
*			End the weapon skill										*
*																		*
************************************************************************/

void CAICharNormal::ActionWeaponSkillFinish()
{
}


/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionSleep()
{
    if (m_PChar->isDead())
    {
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    if (!m_PChar->StatusEffectContainer->HasPreventActionEffect())
    {
        TransitionBack();
    }

}

/************************************************************************
*																		*
*  Auto Attack															*
*																		*
************************************************************************/

void CAICharNormal::ActionAttack()
{

            //if (m_PChar->PPet != nullptr && m_PChar->PPet->objtype == TYPE_PET && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
            //{
            //    m_PChar->PPet->PBattleAI->SetBattleTarget(m_PBattleTarget);
            //}

}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionRaiseMenuSelection()
{
}

void CAICharNormal::TransitionBack(bool skipWait)
{
    m_PBattleSubTarget = nullptr;
    if (m_PChar->animation == ANIMATION_ATTACK)
    {
        m_ActionType = ACTION_ATTACK;
        if (skipWait)
        {
            ActionAttack();
        }
    }
    else
    {
        m_ActionType = ACTION_NONE;
    }
}

void CAICharNormal::DoAttack()
{
}
