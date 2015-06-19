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

    m_PMagicState = new CMagicState(PChar, m_PTargetFind, 21.5, 21.5);
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
                    m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
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
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);

    if (m_PBattleTarget->targid != m_ActionTargetID)
    {
        CBattleEntity* PBattleTarget = nullptr;

        if (GetValidTarget(&PBattleTarget, TARGET_ENEMY))
        {
            if (IsMobOwner(PBattleTarget))
            {
                if (distance(m_PChar->loc.p, PBattleTarget->loc.p) <= 30)
                {
                    m_LastActionTime = m_Tick;
                    m_PBattleTarget = PBattleTarget;

                    m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                }
                else
                {
                    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
                }
            }
            else
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_ALREADY_CLAIMED));
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
    m_PBattleTarget = nullptr;
    m_PBattleSubTarget = nullptr;

    m_PChar->animation = ANIMATION_NONE;
    m_PChar->updatemask |= UPDATE_HP;
    m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
    m_PChar->PLatentEffectContainer->CheckLatentsWeaponDraw(false);

    if (m_PChar->PPet != nullptr && m_PChar->PPet->objtype == TYPE_PET && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
    {
        m_PChar->PPet->PBattleAI->SetBattleTarget(nullptr);
    }

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

    if (m_PBattleSubTarget == nullptr)
    {
        //falls to the ground
        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, 20));
    }
    else
    {
        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, 97));
    }

    m_PSpell = nullptr;
    m_PJobAbility = nullptr;
    m_PWeaponSkill = nullptr;
    m_PItemUsable = nullptr;
    m_PBattleTarget = nullptr;
    m_PBattleSubTarget = nullptr;

    m_PChar->UContainer->Clean();

    m_PChar->animation = ANIMATION_DEATH;
    m_PChar->m_DeathCounter = 0;
    m_PChar->m_DeathTimestamp = (uint32)time(nullptr);
    m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
    m_PChar->pushPacket(new CRaiseTractorMenuPacket(m_PChar, TYPE_HOMEPOINT));

    //influence for conquest system
    conquest::LoseInfluencePoints(m_PChar);

    if (!m_PChar->getMijinGakure())
        charutils::DelExperiencePoints(m_PChar, map_config.exp_retain);
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
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != nullptr);

    if (m_Tick < m_PChar->m_rangedDelay + m_PChar->GetAmmoDelay(false)){ //cooldown between shots
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_WAIT_LONGER));
        TransitionBack();
        m_ActionTargetID = 0;
        m_PBattleSubTarget = nullptr;
        return;
    }

    m_PChar->isRapidShot = false;
    m_PChar->secondDoubleShotTaken = false;

    CItemWeapon* PRanged = (CItemWeapon*)m_PChar->getEquip(SLOT_RANGED);
    CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);

    if (PRanged != nullptr && PRanged->isType(ITEM_WEAPON) ||
        PAmmo != nullptr && PAmmo->isThrowing())
    {
        uint8 SkillType = 0;

        if (PAmmo != nullptr && PAmmo->isThrowing()){
            SkillType = PAmmo->getSkillType();
        }
        else {
            SkillType = PRanged->getSkillType();
        }

        //ranged weapon delay is stored in the db as offset from 240 for some reason.
        m_PChar->m_rangedDelay = m_PChar->GetRangedWeaponDelay(false);

        // Get Snapshot reduction
        battleutils::GetSnapshotReduction(m_PChar);

        // do chance for rapid shot
        // TODO: random % reduction, not instant shot
        if (charutils::hasTrait(m_PChar, TRAIT_RAPID_SHOT))
        {
            uint16 chance = (m_PChar->getMod(MOD_RAPID_SHOT) + m_PChar->PMeritPoints->GetMeritValue(MERIT_RAPID_SHOT_RATE, m_PChar));
            if (WELL512::GetRandomNumber(100) < chance)
            {
                m_PChar->m_rangedDelay = 1;
                m_PChar->isRapidShot = true;
            }
        }

        if (m_PChar->m_rangedDelay <= 0){
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

            PRanged = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);
            if (PRanged != nullptr && PRanged->isType(ITEM_WEAPON))
            {
                break;
            }
        }
        default:
        {
            m_ActionTargetID = 0;
            TransitionBack();
            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_NO_RANGED_WEAPON));
            return;
        }
        }

    }
    else{

        m_ActionTargetID = 0;
        TransitionBack();
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_NO_RANGED_WEAPON));
        return;

    }

    if (GetValidTarget(&m_PBattleSubTarget, TARGET_ENEMY))
    {
        if (m_PBattleSubTarget->isDead())
        {
            TransitionBack();
            m_PBattleSubTarget = nullptr;
            return;
        }
        if (!isFaceing(m_PChar->loc.p, m_PBattleSubTarget->loc.p, 40))
        {
            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_CANNOT_SEE));

            TransitionBack();
            m_PBattleSubTarget = nullptr;
            return;
        }
        if (!IsMobOwner(m_PBattleSubTarget))
        {
            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED));

            TransitionBack();
            m_PBattleSubTarget = nullptr;
            return;
        }
        if (distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p) > 25)
        {
            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));

            TransitionBack();
            m_PBattleSubTarget = nullptr;
            return;
        }
    }
    else
    {
        TransitionBack();
        m_PBattleSubTarget = nullptr;
        return;
    }

    // TODO: скорее всего m_LastActionTime нужно выставлять лишь при ANIMATION_ATTACK, иначе использовать LastRangedTime для

    m_LastActionTime = m_Tick;
    m_PChar->m_StartActionPos = m_PChar->loc.p;

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

    m_ActionType = ACTION_RANGED_FINISH;
}

/************************************************************************
*																		*
*  Окончание дальней атаки												*
*																		*
************************************************************************/

void CAICharNormal::ActionRangedFinish()
{
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    if (m_PBattleSubTarget->isDead())
    {
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        TransitionBack();
        m_PBattleSubTarget = nullptr;
        return;
    }

    // check if player moved during Range attack wait
    if (m_PChar->m_StartActionPos.x != m_PChar->loc.p.x || m_PChar->m_StartActionPos.z != m_PChar->loc.p.z)
    {
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_MOVE_AND_INTERRUPT));
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        TransitionBack();
        m_PBattleSubTarget = nullptr;
        return;
    }

    if (m_PBattleSubTarget->objtype == TYPE_MOB && !IsMobOwner(m_PBattleSubTarget))
    {
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED));

        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        TransitionBack();
        m_PBattleSubTarget = nullptr;
        return;
    }

    if (m_Tick >= m_LastActionTime + m_PChar->m_rangedDelay)
    {
        m_LastMeleeTime += (m_Tick - m_LastActionTime);
        m_LastActionTime = m_Tick;
        int32 damage = 0;
        int32 totalDamage = 0;

        apAction_t Action;
        m_PChar->m_ActionList.clear();

        Action.ActionTarget = m_PBattleSubTarget;
        Action.reaction = REACTION_HIT;		//0x10
        Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
        Action.animation = 0;
        Action.messageID = 352;
        Action.knockback = 0;

        CItemWeapon* PItem = (CItemWeapon*)m_PChar->getEquip(SLOT_RANGED);
        CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);

        bool ammoThrowing = PAmmo ? PAmmo->isThrowing() : false;
        bool rangedThrowing = PItem ? PItem->isThrowing() : false;
        uint8 slot = SLOT_RANGED;

        if (ammoThrowing)
        {
            slot = SLOT_AMMO;
            PItem = nullptr;
        }
        if (rangedThrowing)
        {
            PAmmo = nullptr;
        }

        uint8 shadowsTaken = 0;
        uint8 hitCount = 1;			// 1 hit by default
        uint8 realHits = 0;			// to store the real number of hit for tp multipler
        bool hitOccured = false;	// track if player hit mob at all
        bool isSange = false;
        bool isBarrage = m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0);

        // if barrage is detected, getBarrageShotCount also checks for ammo count
        if (!ammoThrowing && !rangedThrowing && isBarrage)
        {
            hitCount += battleutils::getBarrageShotCount(m_PChar);
        }
        else if (ammoThrowing && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SANGE))
        {
            isSange = true;
            hitCount += m_PChar->getMod(MOD_UTSUSEMI);
        }

        // loop for barrage hits, if a miss occurs, the loop will end
        for (uint8 i = 0; i < hitCount; ++i)
        {
            if (m_PBattleSubTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
            {
                Action.messageID = 32;
                Action.reaction = REACTION_EVADE;
                Action.speceffect = SPECEFFECT_NONE;
                i = hitCount; // end barrage, shot missed
            }
            else if (WELL512::GetRandomNumber(100) < battleutils::GetRangedHitRate(m_PChar, m_PBattleSubTarget, isBarrage)) // hit!
            {
                // absorbed by shadow
                if (battleutils::IsAbsorbByShadow(m_PBattleSubTarget))
                {
                    shadowsTaken++;
                }
                else
                {
                    float pdif = battleutils::GetRangedPDIF(m_PChar, m_PBattleSubTarget);
                    bool isCrit = false;

                    if (WELL512::GetRandomNumber(100) < battleutils::GetCritHitRate(m_PChar, m_PBattleSubTarget, true))
                    {
                        pdif *= 1.25; //uncapped
                        int16 criticaldamage = m_PChar->getMod(MOD_CRIT_DMG_INCREASE);
                        criticaldamage = dsp_cap(criticaldamage, 0, 100);
                        pdif *= ((100 + criticaldamage) / 100.0f);
                        Action.speceffect = SPECEFFECT_CRITICAL_HIT;
                        Action.messageID = 353;
                        isCrit = true;
                    }

                    // at least 1 hit occured
                    hitOccured = true;
                    realHits++;

                    if (isSange)
                    {
                        // change message to sange
                        Action.messageID = 77;
                    }

                    damage = (m_PChar->GetRangedWeaponDmg() + battleutils::GetFSTR(m_PChar, m_PBattleSubTarget, slot)) * pdif;

                    if (slot == SLOT_RANGED)
                    {
                        if (m_PChar->isRapidShot)
                        {
                            damage = attackutils::CheckForDamageMultiplier(m_PChar, PItem, damage, RAPID_SHOT_ATTACK);
                        }
                        else
                        {
                            damage = attackutils::CheckForDamageMultiplier(m_PChar, PItem, damage, RANGED_ATTACK);
                        }

                        if (PItem != nullptr)
                        {
                            charutils::TrySkillUP(m_PChar, (SKILLTYPE)PItem->getSkillType(), m_PBattleSubTarget->GetMLevel());
                        }
                    }
                    else if (slot == SLOT_AMMO && PAmmo != nullptr)
                    {
                        charutils::TrySkillUP(m_PChar, (SKILLTYPE)PAmmo->getSkillType(), m_PBattleSubTarget->GetMLevel());
                    }
                }
            }
            else //miss
            {
                Action.reaction = REACTION_EVADE;
                Action.speceffect = SPECEFFECT_NONE;
                Action.messageID = 354;

                battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);

                i = hitCount; // end barrage, shot missed
            }

            // check for recycle chance
            uint16 recycleChance = m_PChar->getMod(MOD_RECYCLE);
            if (charutils::hasTrait(m_PChar, TRAIT_RECYCLE))
            {
                recycleChance += m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE, m_PChar);
            }

            // Only remove unlimited shot on hit
            if (hitOccured && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
            {
                m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
                recycleChance = 100;
            }

            if (PAmmo != nullptr && WELL512::GetRandomNumber(100) > recycleChance)
            {
                if ((PAmmo->getQuantity() - 1) < 1) // ammo will run out after this shot, make sure we remove it from equip
                {
                    trackArrowUsageForScavenge(PAmmo, m_PChar);
                    uint8 slot = m_PChar->equip[SLOT_AMMO];
		    uint8 loc = m_PChar->equipLoc[SLOT_AMMO];
                    charutils::UnequipItem(m_PChar, SLOT_AMMO);
                    charutils::SaveCharEquip(m_PChar);
		    charutils::UpdateItem(m_PChar, loc, slot, -1);
                    i = hitCount; // end loop (if barrage), player is out of ammo
                    PAmmo = nullptr;
                }
                else
                {
                    trackArrowUsageForScavenge(PAmmo, m_PChar);
                    charutils::UpdateItem(m_PChar, m_PChar->equipLoc[SLOT_AMMO], m_PChar->equip[SLOT_AMMO], -1);
                }
                m_PChar->pushPacket(new CInventoryFinishPacket());
            }
            totalDamage += damage;
        }

        // if a hit did occur (even without barrage)
        if (hitOccured == true)
        {
            // any misses with barrage cause remaing shots to miss, meaning we must check Action.reaction
            if (Action.reaction == REACTION_EVADE && (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE) || isSange))
            {
                Action.messageID = 352;
                Action.reaction = REACTION_HIT;
                Action.speceffect = SPECEFFECT_CRITICAL_HIT;
            }

            Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, totalDamage, false, slot, realHits, nullptr, true, true);

            // lower damage based on shadows taken
            if (shadowsTaken)
                Action.param = Action.param * (1 - ((float)shadowsTaken / realHits));

            // absorb message
            if (Action.param < 0)
            {
                Action.param = -(Action.param);
                Action.messageID = 382;
            }

            //add additional effects
            //this should go AFTER damage taken
            //or else sleep effect won't work
            //battleutils::HandleRangedAdditionalEffect(m_PChar,m_PBattleSubTarget,&Action);
            //TODO: move all hard coded additional effect ammo to scripts
            if ((PAmmo != nullptr && PAmmo->getModifier(MOD_ADDITIONAL_EFFECT) > 0) || (PItem != nullptr && PItem->getModifier(MOD_ADDITIONAL_EFFECT) > 0))
                luautils::OnAdditionalEffect(m_PChar, m_PBattleSubTarget, (PAmmo != nullptr ? PAmmo : PItem), &Action, totalDamage);
        }
        else if (shadowsTaken > 0)
        {
            // shadows took damage
            Action.messageID = 0;
            Action.reaction = REACTION_EVADE;
            m_PBattleSubTarget->loc.zone->PushPacket(m_PBattleSubTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleSubTarget, m_PBattleSubTarget, 0, shadowsTaken, MSGBASIC_SHADOW_ABSORB));

            battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);
        }

        if (Action.speceffect == SPECEFFECT_HIT && Action.param > 0)
            Action.speceffect = SPECEFFECT_RECOIL;

        m_PChar->m_ActionList.push_back(Action);
        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

        // TODO: что это ? ....
        // если не ошибаюсь, то TREASURE_HUNTER работает лишь при последнем ударе

        CMobEntity* Monster = (CMobEntity*)m_PBattleSubTarget;

        if (Monster->m_HiPCLvl < m_PChar->GetMLevel())
        {
            Monster->m_HiPCLvl = m_PChar->GetMLevel();
        }

        // remove barrage effect if present
        if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BARRAGE, 0)){
            m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BARRAGE, 0);
        }
        else if (isSange)
        {
            uint16 power = m_PChar->StatusEffectContainer->GetStatusEffect(EFFECT_SANGE)->GetPower();

            // remove shadows
            while (realHits-- && WELL512::GetRandomNumber(100) <= power && battleutils::IsAbsorbByShadow(m_PChar));

            m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SANGE);
        }

        // only remove detectables
        m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

        // Try to double shot
        // Will instantly trigger another ranged attack
        if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_SHOT, 0) && !m_PChar->secondDoubleShotTaken &&	!isBarrage && !isSange)
        {
            uint16 doubleShotChance = m_PChar->getMod(MOD_DOUBLE_SHOT_RATE);
            if (WELL512::GetRandomNumber(100) < doubleShotChance)
            {
                m_PChar->secondDoubleShotTaken = true;
                m_ActionType = ACTION_RANGED_FINISH;
                m_PChar->m_rangedDelay = 0;
                return;
            }
        }

        TransitionBack();
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
    DSP_DEBUG_BREAK_IF(m_PSpell == nullptr);
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);

    if (m_PMagicState->IsOnCoolDown(m_Tick))
    {
        MagicStartError();
        return;
    }

    STATESTATUS status = m_PMagicState->CastSpell(GetCurrentSpell(), m_PTargetFind->getValidTarget(m_ActionTargetID, m_PSpell->getValidTarget()));


    if (status == STATESTATUS_START)
    {
        m_ActionTargetID = 0;
        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_MAGIC_CASTING;
    }
    else
    {
        MagicStartError();
    }
}

/************************************************************************
*                                                                       *
*  Невозможно начать читать заклинание                                  *
*                                                                       *
************************************************************************/

void CAICharNormal::MagicStartError()
{
    DSP_DEBUG_BREAK_IF(m_ActionType != ACTION_MAGIC_START);

    m_ActionTargetID = 0;

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAICharNormal::ActionMagicCasting()
{
    STATESTATUS status = m_PMagicState->Update(m_Tick);

    if (status == STATESTATUS_INTERRUPT)
    {
        m_ActionType = ACTION_MAGIC_INTERRUPT;
        ActionMagicInterrupt();
    }
    else if (status == STATESTATUS_ERROR)
    {
        TransitionBack();
    }
    else if (status == STATESTATUS_FINISH)
    {
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
    m_PMagicState->FinishSpell();

    m_LastMeleeTime += (m_Tick - m_LastActionTime);

    m_PMagicState->SetLastCoolTime(m_Tick);

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionMagicInterrupt()
{
    m_PMagicState->InterruptSpell();

    m_LastMeleeTime += (m_Tick - m_LastActionTime);

    m_PMagicState->SetLastCoolTime(m_Tick);

    m_PSpell = nullptr;
    m_PBattleSubTarget = nullptr;

    TransitionBack();
}

/************************************************************************
*                                                                       *
*  Start the Job Ability                                                *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionJobAbilityStart()
{
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PJobAbility == nullptr);

    if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)){
        // can't use abilities
        m_ActionTargetID = 0;
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));

        m_PJobAbility = nullptr;
        TransitionBack();
        return;
    }

    if (m_PChar->PRecastContainer->HasRecast(RECAST_ABILITY, m_PJobAbility->getRecastId()))
    {
        m_ActionTargetID = 0;

        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_WAIT_LONGER));

        m_PJobAbility = nullptr;
        TransitionBack();
        return;
    }
    if (GetValidTarget(&m_PBattleSubTarget, m_PJobAbility->getValidTarget()))
    {
        if (m_PBattleSubTarget != m_PChar)
        {
            if (distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p) > m_PJobAbility->getRange())
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));

                m_PJobAbility = nullptr;
                TransitionBack();
                return;
            }
        }
        if (m_PJobAbility->getID() >= ABILITY_HEALING_RUBY){//blood pact
            if (m_PChar->health.mp < m_PJobAbility->getAnimationID()){ //not enough mp for BP
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA));
                m_PJobAbility = nullptr;
                TransitionBack();
                return;
            }
        }

        //TODO: Remove all these ability-specific checks and put them into their appropriate scripts

        if (m_PJobAbility->getID() == ABILITY_EAGLE_EYE_SHOT || m_PJobAbility->getID() == ABILITY_SHADOWBIND){
            CItemWeapon* PItem = (CItemWeapon*)m_PChar->getEquip(SLOT_RANGED);

            if (PItem != nullptr && PItem->isType(ITEM_WEAPON))
            {
                switch (PItem->getSkillType())
                {
                case SKILL_THR: break;
                case SKILL_ARC:
                case SKILL_MRK:
                {
                    PItem = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);

                    if (PItem != nullptr && PItem->isType(ITEM_WEAPON))
                    {
                        break;
                    }
                }
                default:
                {
                    m_ActionTargetID = 0;
                    TransitionBack();
                    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_NO_RANGED_WEAPON));
                    return;
                }
                }
            }
            else{
                PItem = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);

                if (PItem == nullptr ||
                    !(PItem->isType(ITEM_WEAPON)) ||
                    (PItem->getSkillType() != SKILL_THR))
                {
                    m_ActionTargetID = 0;
                    TransitionBack();
                    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_NO_RANGED_WEAPON));
                    return;
                }

                m_ActionTargetID = 0;
                TransitionBack();
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_NO_RANGED_WEAPON));
                return;
            }
        }

        // End of core checks, so call script checks
        CBaseEntity* PMsgTarget = (CBaseEntity*)m_PChar;
        int32 errNo = luautils::OnAbilityCheck(m_PChar, m_PBattleSubTarget, GetCurrentJobAbility(), &PMsgTarget);
        if (errNo != 0)
        {
            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, PMsgTarget, m_PJobAbility->getID() + 16, m_PJobAbility->getID(), errNo));
            TransitionBack();
            m_PJobAbility = nullptr;
            return;
        }

        // After script check, because some scripts overwrite this check (Charm)
        if (m_PJobAbility->getValidTarget() == TARGET_ENEMY)
        {
            if (!IsMobOwner(m_PBattleSubTarget))
            {
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_ALREADY_CLAIMED));

                TransitionBack();
                m_PJobAbility = nullptr;
                return;
            }
        }

        m_ActionType = ACTION_JOBABILITY_FINISH;
        ActionJobAbilityFinish();
        return;
    }
    m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));

    TransitionBack();
    m_PJobAbility = nullptr;
}

/************************************************************************
*                                                                       *
*  End the Job Ability                                                  *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionJobAbilityFinish()
{
    DSP_DEBUG_BREAK_IF(m_PJobAbility == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    if (m_PChar->animation == ANIMATION_ATTACK)
    {
        m_LastActionTime = m_Tick;
        m_LastMeleeTime += 1000;
    }

    // get any available merit recast reduction
    uint8 meritRecastReduction = 0;

    if (m_PJobAbility->getMeritModID() > 0 && !(m_PJobAbility->getAddType() & ADDTYPE_MERIT))
    {
        meritRecastReduction = m_PChar->PMeritPoints->GetMeritValue((Merit_t*)m_PChar->PMeritPoints->GetMerit((MERIT_TYPE)m_PJobAbility->getMeritModID()), m_PChar);
    }

    uint32 RecastTime = (m_PJobAbility->getRecastTime() - meritRecastReduction);

    if (m_PJobAbility->getID() == ABILITY_LIGHT_ARTS || m_PJobAbility->getID() == ABILITY_DARK_ARTS || m_PJobAbility->getRecastId() == 231) //stratagems
    {
        if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
            RecastTime = 0;
    }
    else if (m_PJobAbility->getID() == ABILITY_DEACTIVATE && m_PChar->PAutomaton && m_PChar->PAutomaton->health.hp == m_PChar->PAutomaton->GetMaxHP())
    {
        CAbility* PAbility = ability::GetAbility(ABILITY_ACTIVATE);
        if (PAbility)
            m_PChar->PRecastContainer->Del(RECAST_ABILITY, PAbility->getRecastId());
    }
    else if (m_PJobAbility->getID() >= ABILITY_HEALING_RUBY)
    {
        if (m_PChar->getMod(MOD_BP_DELAY) > 15){
            RecastTime -= 15;
        }
        else{
            RecastTime -= m_PChar->getMod(MOD_BP_DELAY);
        }
    }

    // check paralysis
    if (battleutils::IsParalyzed(m_PChar)){
        // display paralyzed
        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_IS_PARALYZED));
    }
    else {

        // remove invisible if aggresive
        if (m_PJobAbility->getID() != ABILITY_FIGHT)
        {
            if (m_PJobAbility->getValidTarget() & TARGET_ENEMY){
                // aggresive action
                m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
            }
            else if (m_PJobAbility->getID() != ABILITY_TRICK_ATTACK) {
                // remove invisible only
                m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);
            }
        }

        if (m_PJobAbility->getID() == ABILITY_REWARD){
            CItem* PItem = m_PChar->getEquip(SLOT_HEAD);
            if (PItem && (PItem->getID() == 15157 || PItem->getID() == 15158 || PItem->getID() == 16104 || PItem->getID() == 16105)){
                //TODO: Transform this into an item MOD_REWARD_RECAST perhaps ?
                //The Bison/Brave's Warbonnet & Khimaira/Stout Bonnet reduces recast time by 10 seconds.
                RecastTime -= 10;   // remove 10 seconds
            }
        }

        apAction_t Action;
        m_PChar->m_ActionList.clear();

        if (m_PJobAbility->getID() >= ABILITY_FIGHTERS_ROLL && m_PJobAbility->getID() <= ABILITY_SCHOLARS_ROLL)
        {
            m_PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
            uint8 roll = WELL512::GetRandomNumber(1,7);
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

            Action.reaction = REACTION_NONE;
            Action.speceffect = (SPECEFFECT)roll;
            Action.animation = m_PJobAbility->getAnimationID();
            Action.param = roll;
            Action.knockback = 0;

            if (m_PChar->PParty != nullptr)
            {
                for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
                {
                    CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

                    if (!PTarget->isDead() &&
                        PTarget->getZone() == m_PChar->getZone() &&
                        distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
                    {
                        Action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, GetCurrentJobAbility(), roll);
                        if (PTarget->id == m_PChar->id){
                            if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
                                Action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
                            }
                            else {
                                Action.messageID = m_PJobAbility->getMessage();
                            }
                        }
                        else if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
                            Action.messageID = MSGBASIC_ROLL_SUB_FAIL;
                        }
                        else {
                            Action.messageID = MSGBASIC_ROLL_SUB;
                        }
                        m_PChar->m_ActionList.push_back(Action);
                    }
                }
            }
            else {
                Action.ActionTarget = m_PBattleSubTarget;
                luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, GetCurrentJobAbility(), roll);
                if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
                    Action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
                }
                else {
                    Action.messageID = m_PJobAbility->getMessage();
                }

                m_PChar->m_ActionList.push_back(Action);
            }
            m_PChar->PRecastContainer->Add(RECAST_ABILITY, 194, 8); //double up
        }
        else if (m_PJobAbility->getID() == ABILITY_WILD_CARD)
        {
            uint8 roll = WELL512::GetRandomNumber(1,7);
            uint16 AnimationId = 132 + (roll - 1);

            CAbility* rollAbility = ability::GetAbility(ABILITY_WILD_CARD);
            Action.animation = AnimationId;
            Action.reaction = REACTION_NONE;
            Action.speceffect = (SPECEFFECT)roll;
            Action.param = roll;
            Action.knockback = 0;

            if (m_PChar->PParty != nullptr)
            {
                for (uint8 i = 0; i < m_PChar->PParty->members.size(); i++)
                {
                    CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

                    if (!PTarget->isDead() &&
                        PTarget->getZone() == m_PChar->getZone() &&
                        distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
                    {
                        Action.ActionTarget = PTarget;
                        battleutils::DoWildCardToEntity(m_PChar, PTarget, roll);
                        PTarget->pushPacket(new CCharSkillsPacket(PTarget));
                        PTarget->pushPacket(new CCharRecastPacket(PTarget));
                        PTarget->pushPacket(new CCharHealthPacket(PTarget));
                        Action.messageID = m_PJobAbility->getMessage();
                        m_PChar->m_ActionList.push_back(Action);
                    }
                }
            }
            else
            {
                battleutils::DoWildCardToEntity(m_PChar, m_PChar, roll);
                Action.ActionTarget = m_PBattleSubTarget;
                m_PChar->pushPacket(new CCharSkillsPacket(m_PChar));
                m_PChar->pushPacket(new CCharRecastPacket(m_PChar));
                m_PChar->pushPacket(new CCharHealthPacket(m_PChar));
                Action.messageID = m_PJobAbility->getMessage();
                m_PChar->m_ActionList.push_back(Action);
            }
            luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, roll);
        }
        else if (m_PJobAbility->getID() == ABILITY_DOUBLE_UP)
        {
            if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_UP_CHANCE))
            {
                //TODO: some reason cosair double up chance is sometimes null
                uint8 roll = (WELL512::GetRandomNumber(1,7));
                CStatusEffect* doubleUpEffect = m_PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DOUBLE_UP_CHANCE);

                if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNAKE_EYE))
                {
                    //check for instant 11 via Snake Eye merits
                    if (doubleUpEffect->GetPower() >= 5 && WELL512::GetRandomNumber(100) < m_PChar->StatusEffectContainer->GetStatusEffect(EFFECT_SNAKE_EYE)->GetPower())
                    {
                        roll = 11 - doubleUpEffect->GetPower();
                    }
                    else
                    {
                        roll = 1;
                    }
                    m_PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_SNAKE_EYE);
                }

                uint8 total = doubleUpEffect->GetPower() + roll;
                if (total > 12)
                {
                    total = 12;
                }
                doubleUpEffect->SetPower(total);

                CAbility* rollAbility = ability::GetAbility(m_CorsairDoubleUp);

                Action.animation = doubleUpEffect->GetSubPower();
                Action.reaction = REACTION_NONE;
                Action.speceffect = (SPECEFFECT)roll;
                Action.param = total;

                if (total == 12) //bust!
                {
                    if (m_PChar->PParty != nullptr)
                    {
                        for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
                        {
                            CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

                            if (!PTarget->isDead() &&
                                PTarget->getZone() == m_PChar->getZone() &&
                                distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
                            {
                                Action.ActionTarget = PTarget;
                                if (PTarget->id == m_PChar->id){
                                    Action.messageID = MSGBASIC_DOUBLEUP_BUST;
                                    luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
                                }
                                else {
                                    Action.messageID = MSGBASIC_DOUBLEUP_BUST_SUB;
                                }
                                PTarget->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
                                m_PChar->m_ActionList.push_back(Action);
                            }
                        }
                    }
                    else {
                        Action.ActionTarget = m_PBattleSubTarget;
                        luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
                        Action.messageID = MSGBASIC_DOUBLEUP_BUST;
                        m_PChar->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
                        m_PChar->m_ActionList.push_back(Action);
                    }
                    m_PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
                }
                else {
                    if (total == 11)
                    {
                        m_PChar->PRecastContainer->Del(RECAST_ABILITY, 193); //phantom roll
                    }
                    if (m_PChar->PParty != nullptr)
                    {
                        for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
                        {
                            CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];

                            if (!PTarget->isDead() &&
                                PTarget->getZone() == m_PChar->getZone() &&
                                distance(m_PChar->loc.p, PTarget->loc.p) <= m_PJobAbility->getRange())
                            {
                                Action.ActionTarget = PTarget;
                                luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
                                if (PTarget->id == m_PChar->id){
                                    if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
                                        Action.messageID = MSGBASIC_DOUBLEUP_FAIL;
                                    }
                                    else {
                                        Action.messageID = m_PJobAbility->getMessage();
                                    }
                                }
                                else if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
                                    Action.messageID = MSGBASIC_ROLL_SUB_FAIL;
                                }
                                else {
                                    Action.messageID = MSGBASIC_ROLL_SUB;
                                }
                                m_PChar->m_ActionList.push_back(Action);
                            }
                        }
                    }
                    else {
                        Action.ActionTarget = m_PBattleSubTarget;
                        luautils::OnUseAbilityRoll(m_PChar, Action.ActionTarget, rollAbility, total);
                        if (m_PJobAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL){
                            Action.messageID = MSGBASIC_DOUBLEUP_FAIL;
                        }
                        else {
                            Action.messageID = m_PJobAbility->getMessage();
                        }
                        m_PChar->m_ActionList.push_back(Action);
                    }
                }
            }
        }

        // TODO: бардак. тоже выкинуть отсюда
        else if (m_PJobAbility->isAvatarAbility())
        {
            if (m_PChar->PPet != nullptr) //is a bp - dont display msg and notify pet
            {
                Action.animation = 94; //assault anim
                Action.ActionTarget = m_PBattleSubTarget;
                Action.reaction = REACTION_NONE;
                Action.speceffect = SPECEFFECT_RECOIL;
                Action.param = 0;
                Action.messageID = 0;

                if (m_PJobAbility->getID() == ABILITY_SEARING_LIGHT || m_PJobAbility->getID() == ABILITY_AERIAL_BLAST || m_PJobAbility->getID() == ABILITY_EARTHEN_FURY){
                    if (m_PChar->health.mp >= m_PChar->GetMLevel() * 2){
                        m_PChar->addMP(-m_PChar->GetMLevel() * 2);
                    }
                }
                else {
                    m_PChar->addMP(-m_PJobAbility->getAnimationID()); // TODO: ...
                }
                m_PChar->m_ActionList.push_back(Action);
                m_PChar->PPet->PBattleAI->SetBattleSubTarget(m_PBattleSubTarget);

                ((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = m_PJobAbility->getID(); // TODO: не допустимый подход

                m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
                charutils::UpdateHealth(m_PChar);
            }
        }
        else if (m_PJobAbility->isAoE() && m_PChar->PParty != nullptr)
        {
            Action.ActionTarget = nullptr;
            Action.reaction = REACTION_NONE;
            Action.speceffect = SPECEFFECT_NONE;
            Action.animation = m_PJobAbility->getAnimationID();
            Action.messageID = m_PJobAbility->getMessage();

            m_PTargetFind->reset();
            m_PChar->m_ActionList.clear();

            float distance = m_PJobAbility->getRange();

            m_PTargetFind->findWithinArea(m_PChar, AOERADIUS_ATTACKER, distance);

            uint16 msg = 0;
            for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin(); it != m_PTargetFind->m_targets.end(); ++it)
            {
                CCharEntity* PTarget = (CCharEntity*)*it;

                Action.ActionTarget = PTarget;

                Action.param = luautils::OnUseAbility(m_PChar, PTarget, GetCurrentJobAbility(), &Action);

                if (msg == 0){
                    msg = m_PJobAbility->getMessage();
                }
                else {
                    msg = m_PJobAbility->getAoEMsg();
                }

                if (Action.param < 0)
                {
                    msg = ability::GetAbsorbMessage(msg);
                    Action.param = -Action.param;
                }

                Action.messageID = msg;

                m_PChar->m_ActionList.push_back(Action);
            }
        }
        else if (m_PJobAbility->getID() == ABILITY_EAGLE_EYE_SHOT)
        {
            uint16 damage = 0;

            Action.ActionTarget = m_PBattleSubTarget;
            Action.reaction = REACTION_HIT;		//0x10
            Action.speceffect = SPECEFFECT_HIT;		//0x60 (SPECEFFECT_HIT + SPECEFFECT_RECOIL)
            Action.animation = m_PJobAbility->getAnimationID();;
            Action.messageID = MSGBASIC_USES_JA_TAKE_DAMAGE;

            bool hitOccured = false;	// track if player hit mob at all
            if (m_PBattleSubTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
            {
                Action.messageID = 32;
                Action.reaction = REACTION_EVADE;
                Action.speceffect = SPECEFFECT_NONE;
            }
            else if (WELL512::GetRandomNumber(100) < battleutils::GetRangedHitRate(m_PChar, m_PBattleSubTarget, false)) // hit!
            {
                //check for shadow absorb
                if (battleutils::IsAbsorbByShadow(m_PBattleSubTarget)) {
                    Action.messageID = 0;
                    Action.param = 1;
                    Action.reaction = REACTION_EVADE;
                    m_PBattleSubTarget->loc.zone->PushPacket(m_PBattleSubTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleSubTarget, m_PBattleSubTarget, 0, 1, MSGBASIC_SHADOW_ABSORB));

                    battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);
                }
                else {

                    float pdif = battleutils::GetRangedPDIF(m_PChar, m_PBattleSubTarget);

                    if (WELL512::GetRandomNumber(100) < battleutils::GetCritHitRate(m_PChar, m_PBattleSubTarget, true))
                    {
                        pdif *= 1.25; //uncapped
                        Action.speceffect = SPECEFFECT_CRITICAL_HIT;
                        if (m_PBattleSubTarget->objtype == TYPE_MOB)
                        {
                            luautils::OnCriticalHit(m_PBattleSubTarget);
                        }
                    }

                    CItemWeapon* PItem = (CItemWeapon*)m_PChar->getEquip(SLOT_RANGED);
                    CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);


                    // at least 1 hit occured
                    hitOccured = true;

                    damage = (damage + m_PChar->GetRangedWeaponDmg() + battleutils::GetFSTR(m_PChar, m_PBattleSubTarget, SLOT_RANGED)) * pdif * 5;
                    damage = attackutils::CheckForDamageMultiplier(m_PChar, PItem, damage, ATTACK_NORMAL);
                }
            }
            else //miss
            {
                Action.reaction = REACTION_EVADE;
                Action.speceffect = SPECEFFECT_NONE;
                Action.messageID = MSGBASIC_USES_BUT_MISSES;

                battleutils::ClaimMob(m_PBattleSubTarget, m_PChar);
            }


            // check for recycle chance
            CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);
            uint16 recycleChance = m_PChar->getMod(MOD_RECYCLE);

            if (charutils::hasTrait(m_PChar, TRAIT_RECYCLE))
                recycleChance += m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE, m_PChar);

            if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
            {
                m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
                recycleChance = 100;
            }

            if (PAmmo != nullptr && WELL512::GetRandomNumber(100) > recycleChance)
            {

                if ((PAmmo->getQuantity() - 1) < 1) // ammo will run out after this shot, make sure we remove it from equip
                {
                    trackArrowUsageForScavenge(PAmmo, m_PChar);
                    uint8 slot = m_PChar->equip[SLOT_AMMO];
		    uint8 loc = m_PChar->equipLoc[SLOT_AMMO];
                    charutils::UnequipItem(m_PChar, SLOT_AMMO);
                    charutils::SaveCharEquip(m_PChar);
		    charutils::UpdateItem(m_PChar, loc, slot, -1);
                }
                else
                {
                    trackArrowUsageForScavenge(PAmmo, m_PChar);
                    charutils::UpdateItem(m_PChar, m_PChar->equipLoc[SLOT_AMMO], m_PChar->equip[SLOT_AMMO], -1);
                }

                m_PChar->pushPacket(new CInventoryFinishPacket());
            }

            // if a hit did occur (even without barrage)
            if (hitOccured == true)
            {
                Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleSubTarget, damage, false, SLOT_RANGED, 1, nullptr, true, false);
                if (Action.param < 0)
                {
                    Action.param = -(Action.param);
                    Action.messageID = 318;
                }
            }
            m_PChar->m_ActionList.push_back(Action);
        }
        else if (m_PJobAbility->getID() == ABILITY_SCAVENGE)
        {
            Action.ActionTarget = m_PBattleSubTarget;
            Action.reaction = REACTION_NONE;
            Action.speceffect = SPECEFFECT_RECOIL;
            Action.animation = m_PJobAbility->getAnimationID();

            int32 value = luautils::OnUseAbility(m_PChar, m_PBattleSubTarget, GetCurrentJobAbility(), &Action);

            m_PChar->m_ActionList.push_back(Action);
        }
        else
        {
            Action.ActionTarget = m_PBattleSubTarget;
            Action.reaction = REACTION_NONE;
            Action.speceffect = SPECEFFECT_RECOIL;
            Action.animation = m_PJobAbility->getAnimationID();
            Action.param = 0;

            int32 value = luautils::OnUseAbility(m_PChar, m_PBattleSubTarget, GetCurrentJobAbility(), &Action);
            Action.messageID = m_PJobAbility->getMessage();
            Action.param = value;

            if (value < 0)
            {
                Action.messageID = ability::GetAbsorbMessage(Action.messageID);
                Action.param = -value;
            }

            if (m_PJobAbility->getID() == ABILITY_MIJIN_GAKURE)
            {
                m_PChar->setMijinGakure(true);
                m_PChar->health.hp = 0;
                charutils::UpdateHealth(m_PChar);
                m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE, new CActionPacket(m_PChar));
            }

            /* TODO: Handle post-Lv. 75 genkai job abilities from support jobs that
             * deal damage points and defeats a monster while Blade of Darkness and/or
             * Blade of Death quests are active.
             */

            // Shadow Bind
            if (m_PJobAbility->getID() == ABILITY_SHADOWBIND)
            {
                //Action.flag = 3;

                uint16 shadowBindDuration = 30 + m_PChar->getMod(MOD_SHADOW_BIND_EXT);
                if (WELL512::GetRandomNumber(100) >= m_PBattleSubTarget->getMod(MOD_BINDRES))
                {
                    // Shadow bind success!
                    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, 11, 277));
                    m_PBattleSubTarget->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BIND, EFFECT_BIND, 1, 0, shadowBindDuration));
                }
                else
                {
                    // Shadowbind failed!
                    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, 11, 283));
                }
            }

            // Jump
            if (m_PJobAbility->getID() == ABILITY_JUMP)
            {
                Action.param = battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 1);
                if (Action.param == 0)
                {
                    Action.messageID = 0;
                    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, 0, MSGBASIC_USES_BUT_MISSES));
                }
                else if (Action.param >= m_PBattleSubTarget->health.hp)
                {
                    m_PChar->setWeaponSkillKill(true);
                }
            }

            // High Jump
            else if (m_PJobAbility->getID() == ABILITY_HIGH_JUMP)
            {
                Action.param = battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 2);
                if (Action.param == 0)
                {
                    Action.messageID = 0;
                    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, 0, MSGBASIC_USES_BUT_MISSES));
                }
                else if (Action.param >= m_PBattleSubTarget->health.hp)
                {
                    m_PChar->setWeaponSkillKill(true);
                }
            }

            // Super Jump
            else if (m_PJobAbility->getID() == ABILITY_SUPER_JUMP)
            {
                battleutils::jumpAbility(m_PChar, m_PBattleSubTarget, 3);
                Action.messageID = 0;
                m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, 0, MSGBASIC_USES_JA));
            }

            // Handle Accomplice / Collabrator..
            if (m_PJobAbility->getID() == ABILITY_ACCOMPLICE || m_PJobAbility->getID() == ABILITY_COLLABORATOR)
            {
                // Find all mobs within 8.5 radius of the target..
                for (uint32 x = 0; x < 0x400; x++)
                {
                    CBaseEntity* PTarget = m_PBattleSubTarget->GetEntity(x, TYPE_MOB);
                    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB)
                    {
                        if (m_PTargetFind->isWithinRange(&PTarget->loc.p, 8.5f))
                        {
                            CMobEntity* PTargetMob = (CMobEntity*)PTarget;
                            if (PTargetMob->PEnmityContainer->HasTargetID(m_PBattleSubTarget->id))
                                battleutils::TransferEnmity(m_PChar, m_PBattleSubTarget, PTargetMob, (m_PJobAbility->getID() == ABILITY_ACCOMPLICE) ? 50 : 25);
                        }
                    }
                }
            }

            m_PChar->m_ActionList.push_back(Action);

            if (m_PJobAbility->getID() == ABILITY_SNARL)
            {
                //Snarl
                CBattleEntity* PTarget = (CBattleEntity*)m_PBattleSubTarget->PBattleAI->GetBattleTarget();

                if (PTarget != nullptr)
                {
                    switch (PTarget->objtype)
                    {
                    case TYPE_MOB:
                        ((CMobEntity*)PTarget)->PEnmityContainer->LowerEnmityByPercent(m_PChar, 100, m_PBattleSubTarget);
                        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, 0, 528));  //528 - The <player> uses .. Enmity is transferred to the <player>'s pet.
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
            if (m_PJobAbility->getID() == ABILITY_GAUGE){
                if (m_PBattleSubTarget != nullptr && m_PBattleSubTarget->objtype == TYPE_MOB){
                    if (((CMobEntity*)m_PBattleSubTarget)->m_Type & MOBTYPE_NOTORIOUS ||
                        m_PBattleSubTarget->m_EcoSystem == SYSTEM_BEASTMEN ||
                        m_PBattleSubTarget->m_EcoSystem == SYSTEM_ARCANA)
                    {
                        //NM, Beastman or Arcana, cannot charm at all !
                        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_CANNOT_CHARM));
                    }
                    else{
                        uint16 baseExp = charutils::GetRealExp(m_PChar->GetMLevel(), m_PBattleSubTarget->GetMLevel());

                        if (baseExp >= 400) {//IT
                            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_VERY_DIFFICULT_CHARM));
                        }
                        else if (baseExp >= 240) {//VT
                            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_DIFFICULT_TO_CHARM));
                        }
                        else if (baseExp >= 120) {//T
                            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_MIGHT_BE_ABLE_CHARM));
                        }
                        else if (baseExp >= 100) {//EM
                            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
                        }
                        else {
                            m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
                        }
                    }
                }
            }
            if (m_PJobAbility->getID() == ABILITY_REWARD)
            {
                m_PChar->PPet->UpdateHealth();
                m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleSubTarget, m_PJobAbility->getID() + 16, value, MSGBASIC_USES_RECOVERS_HP));

                //Reward gives enmity to the pet and not the Beastmaster.
                CBattleEntity* PTarget = m_PChar->PPet->PBattleAI->GetBattleTarget();
                if (PTarget != nullptr && PTarget->objtype == TYPE_MOB)
                {
                    ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromCure(m_PChar->PPet, m_PChar->PPet->GetMLevel(), value, false);
                }
            }


            if (m_PJobAbility->getValidTarget() & TARGET_ENEMY &&
                m_PBattleSubTarget->allegiance != m_PChar->allegiance)
            {
                // во время pvp целью могут быт персонажи, монстры и их питомцы
                if (m_PBattleSubTarget->objtype == TYPE_MOB && 
                    !(m_PJobAbility->getCE() == 0 && m_PJobAbility->getVE() == 0))
                    //assault(72)/fight(53) doesnt generate hate directly
                {
                    CMobEntity* mob = (CMobEntity*)m_PBattleSubTarget;
                    mob->m_OwnerID.id = m_PChar->id;
                    mob->m_OwnerID.targid = m_PChar->targid;
                    mob->updatemask |= UPDATE_STATUS;
                    mob->PEnmityContainer->UpdateEnmity(m_PChar, m_PJobAbility->getCE(), m_PJobAbility->getVE());
                }
            }
            else if (m_PBattleSubTarget->allegiance == m_PChar->allegiance)
            {
                battleutils::GenerateInRangeEnmity(m_PChar, m_PJobAbility->getCE(), m_PJobAbility->getVE());
            }
        }

        // TODO: все перенести в скрипты, т.к. система позволяет получать указатель на питомца

        if (m_PJobAbility->getID() == ABILITY_CALL_BEAST || m_PJobAbility->getID() == ABILITY_REWARD)
        {
            CItemArmor* PAmmo = m_PChar->getEquip(SLOT_AMMO);
            uint8 slot = m_PChar->equip[SLOT_AMMO];
	    uint8 loc = m_PChar->equipLoc[SLOT_AMMO];
            if (PAmmo->getQuantity() == 1)
            {
		charutils::UnequipItem(m_PChar, SLOT_AMMO);
                charutils::SaveCharEquip(m_PChar);
		charutils::UpdateItem(m_PChar, loc, slot, -1);
            }
            
            m_PChar->pushPacket(new CInventoryFinishPacket());
        }

        if (m_PJobAbility->getID() >= ABILITY_FIRE_SHOT && m_PJobAbility->getID() <= ABILITY_DARK_SHOT)
        {
            CItemContainer* inventory = m_PChar->getStorage(LOC_INVENTORY);
            uint8 slotID = inventory->SearchItem(2176 + m_PJobAbility->getID() - ABILITY_FIRE_SHOT); //Elemental Card

            if (slotID != ERROR_SLOTID)
            {
                charutils::UpdateItem(m_PChar, LOC_INVENTORY, slotID, -1);
            }
            else
            {
                slotID = inventory->SearchItem(2974); //Trump Card
                DSP_DEBUG_BREAK_IF(slotID == ERROR_SLOTID);
                charutils::UpdateItem(m_PChar, LOC_INVENTORY, slotID, -1);
            }
            m_PChar->pushPacket(new CInventoryFinishPacket());
        }

        if (m_PJobAbility->getID() == ABILITY_SIC && m_PChar->PPet != nullptr){//Sic

            CAIPetDummy* PPetAI = (CAIPetDummy*)m_PChar->PPet->PBattleAI;

            if (m_PChar->PPet->health.tp >= 1000)
            {
                PPetAI->m_MasterCommand = MASTERCOMMAND_SIC;
                PPetAI->SetCurrentAction(ACTION_MOBABILITY_START);
            }
            else
            {
                // queue sic and use when ready
                PPetAI->m_queueSic = true;
            }
        }

        m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

    } // end paralysis if

    uint32 chargeTime = 0;
    uint8 maxCharges = 0;
    Charge_t* charge = ability::GetCharge(m_PChar, m_PJobAbility->getRecastId());
    if (charge != nullptr)
    {
        chargeTime = charge->chargeTime;
        maxCharges = charge->maxCharges;
    }
    m_PChar->PRecastContainer->Add(RECAST_ABILITY, m_PJobAbility->getRecastId(), RecastTime, chargeTime, maxCharges);
    m_PChar->pushPacket(new CCharRecastPacket(m_PChar));

    m_PJobAbility = nullptr;
    TransitionBack();

    if (m_PChar->getMijinGakure())
    {
        m_ActionType = ACTION_FALL;
        ActionFall();
    }

}

/************************************************************************
*                                                                       *
*  Start the weapon skill                                               *
*                                                                       *
************************************************************************/

void CAICharNormal::ActionWeaponSkillStart()
{
    DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0);
    DSP_DEBUG_BREAK_IF(m_PWeaponSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget != nullptr);

    if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA))
    {
        WeaponSkillStartError(89);
        return;
    }

    if (!charutils::hasWeaponSkill(m_PChar, m_PWeaponSkill->getID()))
    {
        WeaponSkillStartError(MSGBASIC_CANNOT_USE_WS);
        return;
    }

    if (m_PChar->health.tp < 1000)
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
        if (218 >= m_PWeaponSkill->getID() && m_PWeaponSkill->getID() >= 192) // ranged WS IDs
        {
            CItemWeapon* PItem = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);

            // before allowing ranged weapon skill...
            if (PItem == nullptr ||								// check item is not nullptr
                !(PItem->isType(ITEM_WEAPON)) ||
                !m_PChar->m_Weapons[SLOT_AMMO]->isRanged() ||		// make sure ammo item is a ranged item
                !m_PChar->m_Weapons[SLOT_RANGED]->isRanged() ||	// make sure range weapon is a range weapon
                m_PChar->equip[SLOT_AMMO] == 0)					// make sure ammo is equiped (the ammo qty checks the inventory slot and not the ammo slot)
            {
                WeaponSkillStartError(MSGBASIC_NO_RANGED_WEAPON); // You do not have an appropriate ranged weapon equipped
                return;
            }

        }
        m_LastActionTime = m_Tick;
        m_ActionType = ACTION_WEAPONSKILL_FINISH;
        return;
    }

    if (m_PBattleSubTarget == m_PChar)
    {
        if (battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID()))
        {
            m_LastActionTime = m_Tick;
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
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, (m_PBattleSubTarget != nullptr ? m_PBattleSubTarget : m_PChar), 0, 0, error));
    }
    m_ActionTargetID = 0;

    m_PWeaponSkill = nullptr;
    m_PBattleSubTarget = nullptr;

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
    DSP_DEBUG_BREAK_IF(m_PWeaponSkill == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

    m_LastMeleeTime += (m_Tick - m_LastActionTime);

    if (m_PBattleSubTarget->isDead())
    {
        m_PWeaponSkill = nullptr;
        m_PBattleSubTarget = nullptr;
        TransitionBack();
        return;
    }

    float Distance = distance(m_PChar->loc.p, m_PBattleSubTarget->loc.p);

    // check if mob is too far away, lose tp
    if ((Distance - m_PBattleSubTarget->m_ModelSize) > m_PWeaponSkill->getRange())
    {
        m_PWeaponSkill = nullptr;
        m_PBattleSubTarget = nullptr;

        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PChar, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE));

        // this is stupid but lose tp
        // this whole thing has to be refactored
        if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
        {
            m_PChar->addTP(-1000);
        }
        else if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI))
        {
            m_PChar->addTP(-1000);
            m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
        }
        else
        {
            m_PChar->health.tp = 0;
        }

        m_PChar->PLatentEffectContainer->CheckLatentsTP(m_PChar->health.tp);
        TransitionBack();
        return;
    }

    //apply TP Bonus
    float bonusTp = m_PChar->getMod(MOD_TP_BONUS);

    uint8 damslot = SLOT_MAIN;
    if (m_PWeaponSkill->getID() >= 192 && m_PWeaponSkill->getID() <= 221)
    {
        damslot = SLOT_RANGED;
    }

    //remove TP Bonus from offhand weapon
    if (m_PChar->equip[SLOT_SUB] != 0)
    {
        std::vector<CModifier*>::iterator modIterator;
        std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getEquip(SLOT_SUB))->modList;

        for (modIterator = modList.begin(); modIterator != modList.end(); modIterator++)
        {
            if ((*modIterator)->getModID() == MOD_TP_BONUS){
                bonusTp = bonusTp - (*modIterator)->getModAmount();
            }
        }
    }

    //if ranged WS, remove TP bonus from mainhand weapon
    if (damslot == SLOT_RANGED)
    {
        if (m_PChar->equip[SLOT_MAIN] != 0)
        {
            std::vector<CModifier*>::iterator modIterator;
            std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getEquip(SLOT_MAIN))->modList;

            for (modIterator = modList.begin(); modIterator != modList.end(); modIterator++)
            {
                if ((*modIterator)->getModID() == MOD_TP_BONUS)
                {
                    bonusTp = bonusTp - (*modIterator)->getModAmount();
                }
            }
        }
    }
    else
    {
        //if melee WS, remove TP bonus from ranged weapon
        if (m_PChar->equip[SLOT_RANGED] != 0)
        {
            std::vector<CModifier*>::iterator modIterator;
            std::vector<CModifier*> modList = ((CItemArmor*)m_PChar->getEquip(SLOT_RANGED))->modList;

            for (modIterator = modList.begin(); modIterator != modList.end(); modIterator++)
            {
                if ((*modIterator)->getModID() == MOD_TP_BONUS)
                {
                    bonusTp = bonusTp - (*modIterator)->getModAmount();
                }
            }
        }
    }

    if (bonusTp + m_PChar->health.tp > 3000)
    {
        bonusTp = 3000 - m_PChar->health.tp;
        m_PChar->health.tp = 3000;
    }
    else
    {
        m_PChar->addTP(bonusTp);
    }


    float wsTP = m_PChar->health.tp;
    uint16 tpHitsLanded = 0;
    uint16 extraHitsLanded = 0;
    int32 damage = 0;
    m_PChar->PLatentEffectContainer->CheckLatentsTP(0);

    damage = luautils::OnUseWeaponSkill(m_PChar, m_PBattleSubTarget, &tpHitsLanded, &extraHitsLanded);

    if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
    {
        m_PChar->addTP(-1000 - bonusTp);
    }
    else if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI))
    {
        m_PChar->addTP(-1000 - bonusTp);
        m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_SEKKANOKI);
    }
    else
    {
        m_PChar->health.tp = 0;
    }

    m_PChar->PLatentEffectContainer->CheckLatentsTP(m_PChar->health.tp);

    //incase a TA party member is available
    CBattleEntity* taChar = nullptr;

    if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
        taChar = battleutils::getAvailableTrickAttackChar(m_PChar, m_PBattleSubTarget);

    apAction_t Action;
    Action.ActionTarget = m_PBattleSubTarget;
    Action.animation = m_PWeaponSkill->getAnimationId();


    if (!battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID()))
    {
        damage = battleutils::TakeWeaponskillDamage(m_PChar, m_PBattleSubTarget, damage, damslot, tpHitsLanded, taChar);
        Action.reaction = (tpHitsLanded || extraHitsLanded ? REACTION_HIT : REACTION_EVADE);
        Action.speceffect = (damage > 0 ? SPECEFFECT_RECOIL : SPECEFFECT_NONE);
        m_PChar->addTP(extraHitsLanded * 10);

        if (Action.reaction == REACTION_EVADE)
            Action.messageID = 188; //but misses
        else if (damage < 0)
        {
            Action.param = -damage;
            Action.messageID = 238; //absorbed ws
        }
        else
        {
            Action.param = damage;
            Action.messageID = 185; //damage ws

            if (m_PBattleSubTarget->objtype == TYPE_MOB)
            {
                uint16 PWeaponskill = m_PWeaponSkill->getID();
                luautils::OnWeaponskillHit(m_PBattleSubTarget, m_PChar, PWeaponskill);
            }
        }
    }
    else
    {
        Action.messageID = 224; //restores mp msg
        Action.reaction = REACTION_HIT;
        dsp_max(damage, 0);
        Action.param = m_PChar->addMP(damage);
    }
    
    float afterWsTP = m_PChar->health.tp;

    if (m_PChar->PPet != nullptr && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
    {
        ((CAIPetDummy*)m_PChar->PPet->PBattleAI)->m_MasterCommand = MASTERCOMMAND_ELEMENTAL_BREATH;
        m_PChar->PPet->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
    }

    m_PTargetFind->reset();
    m_PChar->m_ActionList.clear();

    uint8 wspoints = 0;

    // try to skill up if ws hit
    if (Action.reaction == REACTION_HIT)
    {
        charutils::TrySkillUP(m_PChar, (SKILLTYPE)m_PWeaponSkill->getType(), m_PBattleSubTarget->GetMLevel());
        wspoints = 1;
    }

    if (m_PWeaponSkill->getID() >= 192 && m_PWeaponSkill->getID() <= 218)
    {
        //ranged WS IDs
        CItemWeapon* PAmmo = (CItemWeapon*)m_PChar->getEquip(SLOT_AMMO);

        uint16 recycleChance = m_PChar->getMod(MOD_RECYCLE) + m_PChar->PMeritPoints->GetMeritValue(MERIT_RECYCLE, m_PChar);

        if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_UNLIMITED_SHOT))
        {
            m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_UNLIMITED_SHOT);
            recycleChance = 100;
        }
        // ranged WS will apply ammo additional effects silently
        if (Action.reaction == REACTION_HIT && PAmmo != nullptr && PAmmo->getModifier(MOD_ADDITIONAL_EFFECT) > 0 && damage >= 0)
        {
            luautils::OnAdditionalEffect(m_PChar, m_PBattleSubTarget, PAmmo, &Action, (uint32)damage);
            Action.additionalEffect = SUBEFFECT_NONE;
        }
        if (PAmmo != nullptr && WELL512::GetRandomNumber(100) > recycleChance)
        {
            if ((PAmmo->getQuantity() - 1) < 1) // ammo will run out after this shot, make sure we remove it from equip
            {
                uint8 slot = m_PChar->equip[SLOT_AMMO];
		uint8 loc = m_PChar->equipLoc[SLOT_AMMO];	
                charutils::UnequipItem(m_PChar, SLOT_AMMO);
                charutils::SaveCharEquip(m_PChar);
		charutils::UpdateItem(m_PChar, loc, slot, -1);
            }
            else
            {
                charutils::UpdateItem(m_PChar, m_PChar->equipLoc[SLOT_AMMO], m_PChar->equip[SLOT_AMMO], -1);
            }
            m_PChar->pushPacket(new CInventoryFinishPacket());
        }
    }

    // DO NOT REMOVE!  This is here for a reason...
    // Skill chains should not be affected by MISSED weapon skills or non-elemental
    // weapon skills such as: Spirits Within, Spirit Taker, Energy Steal, Energy Drain, Starlight, and Moonlight.
    if (Action.reaction == REACTION_HIT && m_PWeaponSkill->getPrimarySkillchain() != 0 && !(m_PBattleSubTarget->isDead()))
    {
        // NOTE: GetSkillChainEffect is INSIDE this if statement because it
        //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
        SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, GetCurrentWeaponSkill());
        if (effect != SUBEFFECT_NONE)
        {
            Action.addEffectParam = battleutils::TakeSkillchainDamage(m_PChar, m_PBattleSubTarget, damage);
            if (Action.addEffectParam < 0)
            {
                Action.addEffectParam = -Action.addEffectParam;
                Action.addEffectMessage = 384 + effect;
            }
            else
                Action.addEffectMessage = 287 + effect;
            Action.additionalEffect = effect;

            if (effect >= 7)
                wspoints += 1;
            else if (effect >= 3)
                wspoints += 2;
            else
                wspoints += 4;
        }
    }

    // check for ws points
    CItemWeapon* PWeapon = (CItemWeapon*)m_PChar->m_Weapons[damslot];

    if (PWeapon->isUnlockable() && !PWeapon->isUnlocked())
    {
        if (PWeapon->addWsPoints(wspoints))
        {
            // weapon is now broken
            m_PChar->PLatentEffectContainer->CheckLatentsWeaponBreak(damslot);
            m_PChar->pushPacket(new CCharStatsPacket(m_PChar));
        }
        int8 extra[sizeof(PWeapon->m_extra) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, extra, (const char*)PWeapon->m_extra, sizeof(PWeapon->m_extra));

        const int8* Query = "UPDATE char_inventory SET extra = '%s' WHERE charid = %u AND location = %u AND slot = %u LIMIT 1";
        Sql_Query(SqlHandle, Query, extra, m_PChar->id, PWeapon->getLocationID(), PWeapon->getSlotID());
    }

    m_PChar->m_ActionList.push_back(Action);

    if (m_PWeaponSkill->isAoE())
    {
        float radius = 10;

        m_PTargetFind->reset();
        m_PTargetFind->findWithinArea(m_PBattleSubTarget, AOERADIUS_TARGET, radius);

        uint16 actionsLength = m_PTargetFind->m_targets.size();

        for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin(); it != m_PTargetFind->m_targets.end(); ++it)
        {
            CBattleEntity* PTarget = *it;

            // don't add same target twice
            if (PTarget == m_PBattleSubTarget) continue;

            Action.ActionTarget = PTarget;

            m_PChar->health.tp = wsTP;

            damage = luautils::OnUseWeaponSkill(m_PChar, PTarget, &tpHitsLanded, &extraHitsLanded);

            if (!(battleutils::isValidSelfTargetWeaponskill(m_PWeaponSkill->getID())))
            {
                damage = battleutils::TakeWeaponskillDamage(m_PChar, PTarget, damage, SLOT_MAIN, tpHitsLanded, taChar);

                Action.reaction = (tpHitsLanded || extraHitsLanded ? REACTION_HIT : REACTION_EVADE);
                Action.speceffect = (damage > 0 ? SPECEFFECT_RECOIL : SPECEFFECT_NONE);

                if (Action.reaction == REACTION_EVADE)
                {
                    Action.messageID = 282;
                    Action.param = 0;
                }
                else if (damage < 0)
                {
                    Action.param = -damage;
                    Action.messageID = 263;
                }
                else
                {
                    Action.messageID = 264; // "xxx takes ### damage." only
                    Action.param = damage;
                }
            }
            else
            {
                Action.messageID = 276; //xxx recovers mp
                dsp_max(damage, 0);
                Action.param = PTarget->addMP(damage);
                if (PTarget->objtype == TYPE_PC)
                    charutils::UpdateHealth((CCharEntity*)PTarget);
            }

            m_PChar->health.tp = afterWsTP;
            m_PChar->m_ActionList.push_back(Action);
        }
    }

    charutils::UpdateHealth(m_PChar);

    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

    if (Action.param >= m_PBattleSubTarget->health.hp)
    {
        m_PChar->setWeaponSkillKill(true);
    }

    m_PWeaponSkill = nullptr;
    m_PBattleSubTarget = nullptr;
    m_ActionType = ACTION_ATTACK;
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
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);

    //disengage if player has charmed the mob
    if (m_PChar->PPet != nullptr && m_PChar->PPet == m_PBattleTarget)
    {
        m_PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
        return;
    }

    //disengage if another player has charmed the mob
    if (m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->PMaster != nullptr && m_PBattleTarget->PMaster->objtype == TYPE_PC)
    {
        m_PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
        return;
    }


    CMobEntity* Monster = (CMobEntity*)m_PBattleTarget;
    if (Monster->m_HiPCLvl < m_PChar->GetMLevel())
    {
        Monster->m_HiPCLvl = m_PChar->GetMLevel();
    }

    if (m_PBattleTarget->isDead())
    {
        if (m_PChar->m_hasAutoTarget && m_PBattleTarget->objtype == TYPE_MOB) // Auto-Target
        {
            for (SpawnIDList_t::const_iterator it = m_PChar->SpawnMOBList.begin(); it != m_PChar->SpawnMOBList.end(); ++it)
            {
                CBattleEntity* PTarget = (CBattleEntity*)it->second;

                if (PTarget->animation == ANIMATION_ATTACK &&
                    isFaceing(m_PChar->loc.p, PTarget->loc.p, 64) &&
                    distance(m_PChar->loc.p, PTarget->loc.p) <= 10)
                {
                    if (m_PChar->PParty != nullptr)
                    {
                        if (m_PChar->PParty->m_PAlliance != nullptr)
                        {
                            for (uint8 a = 0; a < m_PChar->PParty->m_PAlliance->partyList.size(); ++a)
                            {
                                for (uint8 i = 0; i < m_PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
                                {
                                    if (PTarget->m_OwnerID.id == m_PChar->PParty->m_PAlliance->partyList.at(a)->members[i]->id ||
                                        (PTarget->m_OwnerID.id == 0 && PTarget->PBattleAI->GetBattleTarget() == m_PChar->PParty->m_PAlliance->partyList.at(a)->members[i]))
                                    {

                                        if (!PTarget->isCharmed)
                                        {
                                            m_PBattleTarget = PTarget;
                                            m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                                            return;
                                        }
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

                                    if (!PTarget->isCharmed)
                                    {
                                        m_PBattleTarget = PTarget;
                                        m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                                        return;
                                    }
                                }
                            }
                        }
                    }
                    else if (PTarget->m_OwnerID.id == m_PChar->id ||
                        (PTarget->m_OwnerID.id == 0 && PTarget->PBattleAI->GetBattleTarget() == m_PChar))
                    {
                        // lock on to the new, if its not charmed
                        if (!PTarget->isCharmed)
                        {
                            m_PBattleTarget = PTarget;
                            m_PChar->pushPacket(new CLockOnPacket(m_PChar, m_PBattleTarget));
                        }
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
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED));

        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }

    float Distance = distance(m_PChar->loc.p, m_PBattleTarget->loc.p);

    if (Distance > 30)
    {
        m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_LOSE_SIGHT));

        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }


    uint16 WeaponDelay = m_PChar->GetWeaponDelay(false);

    if (m_Tick > m_LastMeleeTime + WeaponDelay)
    {
        if (!isFaceing(m_PChar->loc.p, m_PBattleTarget->loc.p, 40))
        {
            if (m_Tick > m_AttackMessageTime + WeaponDelay)
            {
                m_AttackMessageTime = m_Tick;
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_UNABLE_TO_SEE_TARG));
            }
            return;
        }
        if (Distance > m_PBattleTarget->m_ModelSize)
        {
            if (m_Tick > m_AttackMessageTime + WeaponDelay)
            {
                m_AttackMessageTime = m_Tick;
                m_PChar->pushPacket(new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE));
            }
            return;
        }
        m_LastMeleeTime = m_Tick;
        if (battleutils::IsParalyzed(m_PChar))
        {
            m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_IS_PARALYZED));
        }
        else if (battleutils::IsIntimidated(m_PChar, m_PBattleTarget))
        {
            m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_IS_INTIMIDATED));
        }
        else
        {
            DoAttack();

            if (m_PChar->PPet != nullptr && m_PChar->PPet->objtype == TYPE_PET && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
            {
                m_PChar->PPet->PBattleAI->SetBattleTarget(m_PBattleTarget);
            }
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

    uint8 weaknessLvl = 1;
    if (m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_WEAKNESS))
    {
        //double weakness!
        weaknessLvl = 2;
    }

    //add weakness effect (75% reduction in HP/MP)
    if (!m_PChar->getMijinGakure())
    {
        CStatusEffect* PWeaknessEffect = new CStatusEffect(EFFECT_WEAKNESS, EFFECT_WEAKNESS, weaknessLvl, 0, 300);
        m_PChar->StatusEffectContainer->AddStatusEffect(PWeaknessEffect);
    }

    double ratioReturned = 0.0f;
    uint16 hpReturned = 1;

    apAction_t Action;
    m_PChar->m_ActionList.clear();

    Action.ActionTarget = m_PChar;
    if (m_PChar->m_hasRaise == 1)
    {
        Action.animation = 511;
        hpReturned = (m_PChar->getMijinGakure()) ? m_PChar->GetMaxHP()*0.5 : m_PChar->GetMaxHP()*0.1;
        ratioReturned = 0.50f * (1 - map_config.exp_retain);
    }
    else if (m_PChar->m_hasRaise == 2)
    {
        Action.animation = 512;
        hpReturned = (m_PChar->getMijinGakure()) ? m_PChar->GetMaxHP()*0.5 : m_PChar->GetMaxHP()*0.25;
        ratioReturned = ((m_PChar->GetMLevel() <= 50) ? 0.50f : 0.75f) * (1 - map_config.exp_retain);
    }
    else if (m_PChar->m_hasRaise == 3)
    {
        Action.animation = 496;
        hpReturned = m_PChar->GetMaxHP()*0.5;
        ratioReturned = ((m_PChar->GetMLevel() <= 50) ? 0.50f : 0.90f) * (1 - map_config.exp_retain);
    }
    m_PChar->addHP(((hpReturned < 1) ? 1 : hpReturned));
    m_PChar->updatemask |= UPDATE_HP;
    Action.reaction = REACTION_NONE;
    Action.speceffect = SPECEFFECT_RAISE;
    Action.messageID = 0;
    Action.knockback = 0;

    m_PChar->m_ActionList.push_back(Action);
    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));

    m_PChar->pushPacket(new CCharUpdatePacket(m_PChar));
    charutils::UpdateHealth(m_PChar);

    uint8 mLevel = (m_PChar->m_LevelRestriction != 0 && m_PChar->m_LevelRestriction < m_PChar->GetMLevel()) ? m_PChar->m_LevelRestriction : m_PChar->GetMLevel();
    uint16 expLost = mLevel <= 67 ? (charutils::GetExpNEXTLevel(mLevel) * 8) / 100 : 2400;

    uint16 xpNeededToLevel = charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()]) - m_PChar->jobs.exp[m_PChar->GetMJob()];

    // Exp is enough to level you and (you're not under a level restriction, or the level restriction is higher than your current main level).
    if (xpNeededToLevel < expLost && (m_PChar->m_LevelRestriction == 0 || m_PChar->GetMLevel() < m_PChar->m_LevelRestriction))
    {
        // Player probably leveled down when they died.  Give they xp for the next level.
        expLost = m_PChar->GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(m_PChar->jobs.job[m_PChar->GetMJob()] + 1) * 8) / 100 : 2400;
    }

    uint16 xpReturned = ceil(expLost * ratioReturned);

    if (!m_PChar->getMijinGakure())
    {
        charutils::AddExperiencePoints(true, m_PChar, m_PChar, xpReturned);
    }

    m_PChar->setMijinGakure(false);

    m_ActionType = ACTION_NONE;
    m_PChar->m_hasRaise = 0;
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
    // Create a new attack round.
    CAttackRound attackRound(m_PChar);

    /////////////////////////////////////////////////////////////////////////
    //	Start of the attack loop.
    /////////////////////////////////////////////////////////////////////////
    while (attackRound.GetAttackSwingCount() && !(m_PBattleTarget->isDead()))
    {
        apAction_t Action;
        Action.ActionTarget = m_PBattleTarget;
        Action.knockback = 0;

        // Reference to the current swing.
        CAttack attack = attackRound.GetCurrentAttack();

        // Set the swing animation.
        Action.animation = attack.GetAnimationID();

        // сначала вычисляем вероятность попадания по монстру
        // затем нужно вычислить вероятность нанесения критического удара
        if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            Action.messageID = 32;
            Action.reaction = REACTION_EVADE;
            Action.speceffect = SPECEFFECT_NONE;
        }
        else if ((WELL512::GetRandomNumber(100) < attack.GetHitRate() || attackRound.GetSATAOccured()) &&
            !m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
        {
            // attack hit, try to be absorbed by shadow unless it is a SATA attack round
            if (!(attackRound.GetSATAOccured()) && battleutils::IsAbsorbByShadow(m_PBattleTarget))
            {
                Action.messageID = 0;
                Action.reaction = REACTION_EVADE;
                attack.SetEvaded(true);
                m_PBattleTarget->loc.zone->PushPacket(m_PBattleTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget, m_PBattleTarget, 0, 1, 31));
            }
            else
            {
                // Set this attack's critical flag.
                attack.SetCritical(WELL512::GetRandomNumber(100) < battleutils::GetCritHitRate(m_PChar, m_PBattleTarget, !attack.IsFirstSwing()));

                // Critical hit.
                if (attack.IsCritical())
                {
                    Action.reaction = REACTION_HIT;
                    Action.speceffect = SPECEFFECT_CRITICAL_HIT;
                    Action.messageID = 67;

                    if (m_PBattleTarget->objtype == TYPE_MOB)
                    {
                        luautils::OnCriticalHit(m_PBattleTarget);
                    }
                }
                // Not critical hit.
                else
                {
                    Action.reaction = REACTION_HIT;
                    Action.speceffect = SPECEFFECT_HIT;
                    Action.messageID = 1;
                }

                // Guarded. TODO: Stuff guards that shouldn't.
                if (attack.IsGuarded())
                {
                    Action.reaction = REACTION_GUARD;
                }

                // Process damage.
                attack.ProcessDamage();

                // Try shield block
                if (attack.IsBlocked())
                {
                    Action.reaction = REACTION_BLOCK;
                }

                Action.param = battleutils::TakePhysicalDamage(m_PChar, m_PBattleTarget, attack.GetDamage(), attack.IsBlocked(), attack.GetWeaponSlot(), 1, attackRound.GetTAEntity(), true, true);
                if (Action.param < 0)
                {
                    Action.param = -(Action.param);
                    Action.messageID = 373;
                }
            }
        }
        else
        {
            // Player misses the target
            Action.reaction = REACTION_EVADE;
            Action.speceffect = SPECEFFECT_NONE;
            Action.messageID = 15;
            attack.SetEvaded(true);

            // Check & Handle Afflatus Misery Accuracy Bonus
            battleutils::HandleAfflatusMiseryAccuracyBonus(m_PChar);
        }

        if (Action.reaction != REACTION_HIT && Action.reaction != REACTION_BLOCK && Action.reaction != REACTION_GUARD)
        {
            Action.param = 0;
            battleutils::ClaimMob(m_PBattleTarget, m_PChar);
        }

        if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
        {
            battleutils::HandleEnspell(m_PChar, m_PBattleTarget, &Action, attack.IsFirstSwing(), (CItemWeapon*)m_PChar->m_Weapons[attack.GetWeaponSlot()], attack.GetDamage());
            battleutils::HandleSpikesDamage(m_PChar, m_PBattleTarget, &Action, attack.GetDamage());
        }

        if (Action.speceffect == SPECEFFECT_HIT && Action.param > 0)
        {
            Action.speceffect = SPECEFFECT_RECOIL;
        }

        m_PChar->m_ActionList.push_back(Action);

        //try zanshin only on single swing attack rounds - it is last priority in the multi-hit order
        //if zanshin procs, the attack is repeated
        if (attack.IsFirstSwing() && attackRound.GetAttackSwingCount() == 1)
        {
            uint16 zanshinChance = m_PChar->getMod(MOD_ZANSHIN) + m_PChar->PMeritPoints->GetMeritValue(MERIT_ZASHIN_ATTACK_RATE, m_PChar);
            zanshinChance = dsp_cap(zanshinChance, 0, 100);
            //zanshin may only proc on a missed/guarded/countered swing or as SAM main with hasso up (at 25% of the base zanshin rate)
            if (((Action.reaction == REACTION_EVADE || Action.reaction == REACTION_GUARD || 
                Action.spikesEffect == SUBEFFECT_COUNTER) && WELL512::GetRandomNumber(100) < zanshinChance) || 
                (m_PChar->GetMJob() == JOB_SAM && m_PChar->StatusEffectContainer->HasStatusEffect(EFFECT_HASSO) && WELL512::GetRandomNumber(100) < (zanshinChance / 4)))
            {
                attack.SetAttackType(ZANSHIN_ATTACK);
                attack.SetAsFirstSwing(false);
            }
            else
                attackRound.DeleteAttackSwing();
        }
        else
            attackRound.DeleteAttackSwing();

        if (m_PChar->m_ActionList.size() == 8)
        {
            break;
        }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////
    // End of attack loop
    /////////////////////////////////////////////////////////////////////////////////////////////

    m_PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK | EFFECTFLAG_DETECTABLE);
    m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CActionPacket(m_PChar));
}
