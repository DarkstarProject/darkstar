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

#include "ai_char.h"
#include "controllers/player_controller.h"
#include "states/ability_state.h"
#include "states/attack_state.h"
#include "states/death_state.h"
#include "states/raise_state.h"
#include "states/weaponskill_state.h"
#include "../ability.h"
#include "../conquest_system.h"
#include "../weapon_skill.h"
#include "../entities/charentity.h"
#include "../utils/battleutils.h"
#include "../utils/charutils.h"
#include "../packets/action.h"
#include "../packets/lock_on.h"
#include "../packets/char_recast.h"
#include "../packets/char_update.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/message_basic.h"

CAIChar::CAIChar(CCharEntity* PChar) :
    CAIBattle(PChar, nullptr, std::make_unique<CPlayerController>(PChar))
{
}

void CAIChar::Ability(uint16 targid, uint16 abilityid)
{
    auto PlayerController = static_cast<CPlayerController*>(Controller.get());
    if (PlayerController)
    {
        PlayerController->Ability(targid, abilityid);
    }
    else
    {
        Internal_Ability(targid, abilityid);
    }
}

bool CAIChar::Internal_Ability(uint16 targetid, uint16 abilityid)
{
    if (CanChangeState())
    {
        if (ChangeState<CAbilityState>(static_cast<CCharEntity*>(PEntity), targetid))
        {
            return static_cast<CAbilityState*>(GetCurrentState())->StartAbility(abilityid);
        }
    }
    return false;
}

CBattleEntity* CAIChar::IsValidTarget(uint16 targid, uint8 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PTarget = CAIBattle::IsValidTarget(targid, validTargetFlags, errMsg);
    if (PTarget)
    {
        if (static_cast<CCharEntity*>(PEntity)->IsMobOwner(PTarget))
        {
            return PTarget;
        }
        else
        {
            errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);
        }
    }
    else
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PEntity, 0, 0, MSGBASIC_CANNOT_ATTACK_TARGET);
    }
    return nullptr;
}

void CAIChar::OnChangeTarget(CBattleEntity* PNewTarget)
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    PChar->pushPacket(new CLockOnPacket(PChar, PNewTarget));
}

void CAIChar::OnDisengage()
{
    CAIBattle::OnDisengage();
    auto PChar = static_cast<CCharEntity*>(PEntity);
    auto state = PChar->PAIBattle()->GetCurrentState();
    if (state && state->HasErrorMsg())
    {
        PChar->pushPacket(state->GetErrorMsg());
    }
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->PLatentEffectContainer->CheckLatentsWeaponDraw(false);
}

bool CAIChar::CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PBattleEntity = static_cast<CBattleEntity*>(PEntity);

    float dist = distance(PEntity->loc.p, PTarget->loc.p);

    if (!IsMobOwner(PTarget))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_ALREADY_CLAIMED);

        Controller->Disengage();
        return false;
    }
    else if (dist > 30)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_LOSE_SIGHT);
        Controller->Disengage();
        return false;
    }
    else if (!isFaceing(PEntity->loc.p, PTarget->loc.p, 40))
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_UNABLE_TO_SEE_TARG);
    }
    else if (dist > PTarget->m_ModelSize)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_TARG_OUT_OF_RANGE);
    }
    return true;
}

bool CAIChar::OnAttack(CAttackState& state, action_t& action)
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    if (GetCurrentState()->HasErrorMsg())
    {
        if (m_errMsgTime + std::chrono::milliseconds(PChar->GetWeaponDelay(false)) < getTick())
        {
            m_errMsgTime = getTick();
            PChar->pushPacket(GetCurrentState()->GetErrorMsg());
        }
        return false;
    }
    static_cast<CPlayerController*>(Controller.get())->setLastAttackTime(server_clock::now());
    auto ret = CAIBattle::OnAttack(state, action);

    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    if (PTarget->isDead())
    {
        if (PChar->m_hasAutoTarget && PTarget->objtype == TYPE_MOB) // Auto-Target
        {
            for (auto&& PPotentialTarget : PChar->SpawnMOBList)
            {
                if (PPotentialTarget.second->animation == ANIMATION_ATTACK &&
                    isFaceing(PChar->loc.p, PPotentialTarget.second->loc.p, 64) &&
                    distance(PChar->loc.p, PPotentialTarget.second->loc.p) <= 10)
                {
                    std::unique_ptr<CMessageBasicPacket> errMsg;
                    if (IsValidTarget(PPotentialTarget.second->targid, TARGET_ENEMY, errMsg))
                    {
                        Controller->ChangeTarget(PPotentialTarget.second->targid);
                    }
                }
            }
        }
    }
    return ret;
}

void CAIChar::OnCastFinished(CMagicState& state, action_t& action)
{
    CAIBattle::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    static_cast<CCharEntity*>(PEntity)->PRecastContainer->Add(RECAST_MAGIC, PSpell->getID(), action.recast);

    for (auto&& actionList : action.actionLists)
    {
        for (auto&& actionTarget : actionList.actionTargets)
        {
            if (actionTarget.param > 0 && PSpell->dealsDamage() && PSpell->getSpellGroup() == SPELLGROUP_BLUE &&
                static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->HasStatusEffect(EFFECT_CHAIN_AFFINITY) &&
                static_cast<CBlueSpell*>(PSpell)->getPrimarySkillchain() != 0)
            {

                SUBEFFECT effect = battleutils::GetSkillChainEffect(PTarget, static_cast<CBlueSpell*>(PSpell));
                if (effect != SUBEFFECT_NONE)
                {
                    uint16 skillChainDamage = battleutils::TakeSkillchainDamage(static_cast<CBattleEntity*>(PEntity), PTarget, actionTarget.param);

                    actionTarget.addEffectParam = skillChainDamage;
                    actionTarget.addEffectMessage = 287 + effect;
                    actionTarget.additionalEffect = effect;

                }
                if (static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->HasStatusEffect(EFFECT_SEKKANOKI) ||
                    static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
                {
                    static_cast<CBattleEntity*>(PEntity)->health.tp = (static_cast<CBattleEntity*>(PEntity)->health.tp > 1000 ? static_cast<CBattleEntity*>(PEntity)->health.tp - 1000 : 0);
                }
                else
                {
                    static_cast<CBattleEntity*>(PEntity)->health.tp = 0;
                }

                static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHAIN_AFFINITY);
            }
        }
    }
}

void CAIChar::OnCastInterrupted(CMagicState& state, action_t& action, MSGBASIC_ID msg)
{
    CAIBattle::OnCastInterrupted(state, action, msg);

    auto container = static_cast<CMagicState*>(GetCurrentState());
    auto message = container->GetErrorMsg();

    if (message)
    {
        static_cast<CCharEntity*>(PEntity)->pushPacket(message);
    }
}

void CAIChar::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    CAIBattle::OnWeaponSkillFinished(state, action);

    auto PWeaponSkill = state.GetWeaponSkill();
    auto PChar = static_cast<CCharEntity*>(PEntity);
    auto PBattleTarget = static_cast<CBattleEntity*>(state.GetTarget());

    int16 tp = battleutils::CalculateWeaponSkillTP(PChar, PWeaponSkill);
    state.SpendCost();
    PChar->PLatentEffectContainer->CheckLatentsTP(PChar->health.tp);

    if (distance(PEntity->loc.p, PBattleTarget->loc.p) - PBattleTarget->m_ModelSize < PWeaponSkill->getRange())
    {
        //WS scripts currently rely on user:getTP() to get the tp
        int16 prevTP = PChar->health.tp;
        PChar->health.tp = tp;

        uint8 damslot = SLOT_MAIN;
        if (PWeaponSkill->getID() >= 192 && PWeaponSkill->getID() <= 221)
        {
            damslot = SLOT_RANGED;
        }

        targetFind.reset();
        //#TODO: revise parameters
        targetFind.findWithinArea(PBattleTarget, AOERADIUS_TARGET, 10);

        for (auto&& PTarget : targetFind.m_targets)
        {
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;

            actionTarget_t& actionTarget = actionList.getNewActionTarget();

            uint16 tpHitsLanded;
            uint16 extraHitsLanded;
            int32 damage;
            std::tie(damage, tpHitsLanded, extraHitsLanded) = luautils::OnUseWeaponSkill(PChar, PTarget, PWeaponSkill);

            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.animation = PWeaponSkill->getAnimationId();
            actionTarget.messageID = 0;

            bool primary = PTarget == PBattleTarget;

            CBattleEntity* taChar = nullptr;

            if (primary)
            {
                if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TRICK_ATTACK))
                    taChar = battleutils::getAvailableTrickAttackChar(PChar, PBattleTarget);
            }

            if (!battleutils::isValidSelfTargetWeaponskill(PWeaponSkill->getID()))
            {
                damage = battleutils::TakeWeaponskillDamage(PChar, PBattleTarget, damage, damslot, tpHitsLanded, taChar);
                actionTarget.reaction = (tpHitsLanded || extraHitsLanded ? REACTION_HIT : REACTION_EVADE);
                actionTarget.speceffect = (damage > 0 ? SPECEFFECT_RECOIL : SPECEFFECT_NONE);
                PChar->addTP(extraHitsLanded * 10);

                if (actionTarget.reaction == REACTION_EVADE)
                    actionTarget.messageID = primary ? 188 : 282; //but misses
                else if (damage < 0)
                {
                    actionTarget.param = -damage;
                    actionTarget.messageID = primary ? 238 : 263; //absorbed ws
                }
                else
                {
                    actionTarget.param = damage;
                    actionTarget.messageID = primary ? 185 : 264; //damage ws

                    if (primary && PBattleTarget->objtype == TYPE_MOB)
                    {
                        luautils::OnWeaponskillHit(PBattleTarget, PChar, PWeaponSkill->getID());
                    }
                }
            }
            else
            {
                actionTarget.messageID = primary ? 224 : 276; //restores mp msg
                actionTarget.reaction = REACTION_HIT;
                dsp_max(damage, 0);
                actionTarget.param = PChar->addMP(damage);
            }

            if (primary)
            {
                if (PWeaponSkill->getID() >= 192 && PWeaponSkill->getID() <= 218)
                {
                    battleutils::RemoveAmmo(PChar);
                }
                int wspoints = 1;
                if (actionTarget.reaction == REACTION_HIT && PWeaponSkill->getPrimarySkillchain() != 0 || PBattleTarget->isDead())
                {
                    // NOTE: GetSkillChainEffect is INSIDE this if statement because it
                    //  ALTERS the state of the resonance, which misses and non-elemental skills should NOT do.
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(PBattleTarget, PWeaponSkill);
                    if (effect != SUBEFFECT_NONE)
                    {
                        actionTarget.addEffectParam = battleutils::TakeSkillchainDamage(PChar, PBattleTarget, damage);
                        if (actionTarget.addEffectParam < 0)
                        {
                            actionTarget.addEffectParam = -actionTarget.addEffectParam;
                            actionTarget.addEffectMessage = 384 + effect;
                        }
                        else
                            actionTarget.addEffectMessage = 287 + effect;
                        actionTarget.additionalEffect = effect;

                        if (effect >= 7)
                            wspoints += 1;
                        else if (effect >= 3)
                            wspoints += 2;
                        else
                            wspoints += 4;
                    }
                }
                // check for ws points
                charutils::AddWeaponSkillPoints(PChar, (SLOTTYPE)damslot, wspoints);
            }
        }
        PChar->health.tp = prevTP;
    }
    else
    {
        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PEntity, PEntity, 0, 0, MSGBASIC_TOO_FAR_AWAY));
    }
    PChar->PAI->EventHandler.triggerListener("WEAPONSKILL_USE", PChar, PWeaponSkill->getID());
    charutils::UpdateHealth(PChar);
}

void CAIChar::OnAbility(CAbilityState& state, action_t& action)
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    auto PAbility = state.GetAbility();
    if (PChar->PRecastContainer->HasRecast(RECAST_ABILITY, PAbility->getRecastId()))
    {
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_WAIT_LONGER));
        return;
    }
    if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_AMNESIA)) {
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_UNABLE_TO_USE_JA2));
        return;
    }
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());
    std::unique_ptr<CMessageBasicPacket> errMsg;
    if (IsValidTarget(PTarget->targid, PAbility->getValidTarget(), errMsg))
    {
        if (PChar != PTarget && distance(PChar->loc.p, PTarget->loc.p) > PAbility->getRange())
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
            return;
        }
        if (PAbility->getID() >= ABILITY_HEALING_RUBY) 
        {
            // Blood pact MP costs are stored under animation ID
            if (PChar->health.mp < PAbility->getAnimationID())
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_UNABLE_TO_USE_JA));
                return;
            }
        }
        CBaseEntity* PMsgTarget = PChar;
        int32 errNo = luautils::OnAbilityCheck(PChar, PTarget, PAbility, &PMsgTarget);
        if (errNo != 0)
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar, PMsgTarget, PAbility->getID() + 16, PAbility->getID(), errNo));
            return;
        }
        // #TODO: needed??
        //if (PAbility->getValidTarget() == TARGET_ENEMY)
        //{
        //    if (!IsMobOwner(PTarget))
        //    {
        //        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_ALREADY_CLAIMED));

        //        TransitionBack();
        //        PAbility = nullptr;
        //        return;
        //    }
        //}

        if (battleutils::IsParalyzed(PChar)) {
            // display paralyzed
            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            return;
        }

        // get any available merit recast reduction
        uint8 meritRecastReduction = 0;

        if (PAbility->getMeritModID() > 0 && !(PAbility->getAddType() & ADDTYPE_MERIT))
        {
            meritRecastReduction = PChar->PMeritPoints->GetMeritValue((MERIT_TYPE)PAbility->getMeritModID(), PChar);
        }

        uint32 RecastTime = (PAbility->getRecastTime() - meritRecastReduction);

        if (PAbility->getID() == ABILITY_LIGHT_ARTS || PAbility->getID() == ABILITY_DARK_ARTS || PAbility->getRecastId() == 231) //stratagems
        {
            if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_TABULA_RASA))
                RecastTime = 0;
        }
        else if (PAbility->getID() == ABILITY_DEACTIVATE && PChar->PAutomaton && PChar->PAutomaton->health.hp == PChar->PAutomaton->GetMaxHP())
        {
            CAbility* PAbility = ability::GetAbility(ABILITY_ACTIVATE);
            if (PAbility)
                PChar->PRecastContainer->Del(RECAST_ABILITY, PAbility->getRecastId());
        }
        else if (PAbility->getID() >= ABILITY_HEALING_RUBY)
        {
            if (PChar->getMod(MOD_BP_DELAY) > 15) {
                RecastTime -= 15;
            }
            else {
                RecastTime -= PChar->getMod(MOD_BP_DELAY);
            }
        }

        // remove invisible if aggresive
        if (PAbility->getID() != ABILITY_FIGHT)
        {
            if (PAbility->getValidTarget() & TARGET_ENEMY) {
                // aggresive action
                PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
            }
            else if (PAbility->getID() != ABILITY_TRICK_ATTACK) {
                // remove invisible only
                PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_INVISIBLE);
            }
        }

        if (PAbility->getID() == ABILITY_REWARD) {
            CItem* PItem = PChar->getEquip(SLOT_HEAD);
            if (PItem && (PItem->getID() == 15157 || PItem->getID() == 15158 || PItem->getID() == 16104 || PItem->getID() == 16105)) {
                //TODO: Transform this into an item MOD_REWARD_RECAST perhaps ?
                //The Bison/Brave's Warbonnet & Khimaira/Stout Bonnet reduces recast time by 10 seconds.
                RecastTime -= 10;   // remove 10 seconds
            }
        }

        //#TODO: move this somewhere (hopefully entirely to script!)
        /*if (PAbility->getID() >= ABILITY_FIGHTERS_ROLL && PAbility->getID() <= ABILITY_SCHOLARS_ROLL)
        {
            PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
            uint8 roll = dsprand::GetRandomNumber(1, 7);
            PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(
                EFFECT_DOUBLE_UP_CHANCE,
                EFFECT_DOUBLE_UP_CHANCE,
                roll,
                0,
                45,
                PAbility->getID(),
                PAbility->getAnimationID(),
                battleutils::getCorsairRollEffect(PAbility->getID())
                ), true);

            m_CorsairDoubleUp = PAbility->getID();

            if (PChar->StatusEffectContainer->CheckForElevenRoll())
            {
                RecastTime /= 2;
            }

            action.reaction = REACTION_NONE;
            action.speceffect = (SPECEFFECT)roll;
            action.animation = PAbility->getAnimationID();
            action.param = roll;
            action.knockback = 0;

            if (PChar->PParty != nullptr)
            {
                for (uint32 i = 0; i < PChar->PParty->members.size(); i++)
                {
                    CCharEntity* PTarget = (CCharEntity*)PChar->PParty->members[i];

                    if (!PTarget->isDead() &&
                        PTarget->getZone() == PChar->getZone() &&
                        distance(PChar->loc.p, PTarget->loc.p) <= PAbility->getRange())
                    {
                        action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(PChar, action.ActionTarget, PAbility, roll);
                        if (PTarget->id == PChar->id) {
                            if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                                action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
                            }
                            else {
                                action.messageID = PAbility->getMessage();
                            }
                        }
                        else if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                            action.messageID = MSGBASIC_ROLL_SUB_FAIL;
                        }
                        else {
                            action.messageID = MSGBASIC_ROLL_SUB;
                        }
                        PChar->m_ActionList.push_back(Action);
                    }
                }
            }
            else {
                action.ActionTarget = PTarget;
                luautils::OnUseAbilityRoll(PChar, action.ActionTarget, PAbility, roll);
                if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                    action.messageID = MSGBASIC_ROLL_MAIN_FAIL;
                }
                else {
                    action.messageID = PAbility->getMessage();
                }

                PChar->m_ActionList.push_back(Action);
            }
            PChar->PRecastContainer->Add(RECAST_ABILITY, 194, 8); //double up
        }
        else if (PAbility->getID() == ABILITY_WILD_CARD)
        {
            uint8 roll = dsprand::GetRandomNumber(1, 7);
            uint16 AnimationId = 132 + (roll - 1);

            CAbility* rollAbility = ability::GetAbility(ABILITY_WILD_CARD);
            action.animation = AnimationId;
            action.reaction = REACTION_NONE;
            action.speceffect = (SPECEFFECT)roll;
            action.param = roll;
            action.knockback = 0;

            if (PChar->PParty != nullptr)
            {
                for (uint8 i = 0; i < PChar->PParty->members.size(); i++)
                {
                    CCharEntity* PTarget = (CCharEntity*)PChar->PParty->members[i];

                    if (!PTarget->isDead() &&
                        PTarget->getZone() == PChar->getZone() &&
                        distance(PChar->loc.p, PTarget->loc.p) <= PAbility->getRange())
                    {
                        action.ActionTarget = PTarget;
                        battleutils::DoWildCardToEntity(PChar, PTarget, roll);
                        PTarget->pushPacket(new CCharSkillsPacket(PTarget));
                        PTarget->pushPacket(new CCharRecastPacket(PTarget));
                        PTarget->pushPacket(new CCharHealthPacket(PTarget));
                        action.messageID = PAbility->getMessage();
                        PChar->m_ActionList.push_back(Action);
                    }
                }
            }
            else
            {
                battleutils::DoWildCardToEntity(PChar, PChar, roll);
                action.ActionTarget = PTarget;
                PChar->pushPacket(new CCharSkillsPacket(PChar));
                PChar->pushPacket(new CCharRecastPacket(PChar));
                PChar->pushPacket(new CCharHealthPacket(PChar));
                action.messageID = PAbility->getMessage();
                PChar->m_ActionList.push_back(Action);
            }
            luautils::OnUseAbilityRoll(PChar, action.ActionTarget, rollAbility, roll);
        }
        else if (PAbility->getID() == ABILITY_DOUBLE_UP)
        {
            if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DOUBLE_UP_CHANCE))
            {
                //TODO: some reason cosair double up chance is sometimes null
                uint8 roll = (dsprand::GetRandomNumber(1, 7));
                CStatusEffect* doubleUpEffect = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DOUBLE_UP_CHANCE);

                if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNAKE_EYE))
                {
                    //check for instant 11 via Snake Eye merits
                    if (doubleUpEffect->GetPower() >= 5 && dsprand::GetRandomNumber(100) < PChar->StatusEffectContainer->GetStatusEffect(EFFECT_SNAKE_EYE)->GetPower())
                    {
                        roll = 11 - doubleUpEffect->GetPower();
                    }
                    else
                    {
                        roll = 1;
                    }
                    PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_SNAKE_EYE);
                }

                uint8 total = doubleUpEffect->GetPower() + roll;
                if (total > 12)
                {
                    total = 12;
                }
                doubleUpEffect->SetPower(total);

                CAbility* rollAbility = ability::GetAbility(m_CorsairDoubleUp);

                action.animation = doubleUpEffect->GetSubPower();
                action.reaction = REACTION_NONE;
                action.speceffect = (SPECEFFECT)roll;
                action.param = total;

                if (total == 12) //bust!
                {
                    if (PChar->PParty != nullptr)
                    {
                        for (uint32 i = 0; i < PChar->PParty->members.size(); i++)
                        {
                            CCharEntity* PTarget = (CCharEntity*)PChar->PParty->members[i];

                            if (!PTarget->isDead() &&
                                PTarget->getZone() == PChar->getZone() &&
                                distance(PChar->loc.p, PTarget->loc.p) <= PAbility->getRange())
                            {
                                action.ActionTarget = PTarget;
                                if (PTarget->id == PChar->id) {
                                    action.messageID = MSGBASIC_DOUBLEUP_BUST;
                                    luautils::OnUseAbilityRoll(PChar, action.ActionTarget, rollAbility, total);
                                }
                                else {
                                    action.messageID = MSGBASIC_DOUBLEUP_BUST_SUB;
                                }
                                PTarget->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
                                PChar->m_ActionList.push_back(Action);
                            }
                        }
                    }
                    else {
                        action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(PChar, action.ActionTarget, rollAbility, total);
                        action.messageID = MSGBASIC_DOUBLEUP_BUST;
                        PChar->StatusEffectContainer->DelStatusEffectSilent(battleutils::getCorsairRollEffect(m_CorsairDoubleUp));
                        PChar->m_ActionList.push_back(Action);
                    }
                    PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_DOUBLE_UP_CHANCE);
                }
                else {
                    if (total == 11)
                    {
                        PChar->PRecastContainer->Del(RECAST_ABILITY, 193); //phantom roll
                    }
                    if (PChar->PParty != nullptr)
                    {
                        for (uint32 i = 0; i < PChar->PParty->members.size(); i++)
                        {
                            CCharEntity* PTarget = (CCharEntity*)PChar->PParty->members[i];

                            if (!PTarget->isDead() &&
                                PTarget->getZone() == PChar->getZone() &&
                                distance(PChar->loc.p, PTarget->loc.p) <= PAbility->getRange())
                            {
                                action.ActionTarget = PTarget;
                                luautils::OnUseAbilityRoll(PChar, action.ActionTarget, rollAbility, total);
                                if (PTarget->id == PChar->id) {
                                    if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                                        action.messageID = MSGBASIC_DOUBLEUP_FAIL;
                                    }
                                    else {
                                        action.messageID = PAbility->getMessage();
                                    }
                                }
                                else if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                                    action.messageID = MSGBASIC_ROLL_SUB_FAIL;
                                }
                                else {
                                    action.messageID = MSGBASIC_ROLL_SUB;
                                }
                                PChar->m_ActionList.push_back(Action);
                            }
                        }
                    }
                    else {
                        action.ActionTarget = PTarget;
                        luautils::OnUseAbilityRoll(PChar, action.ActionTarget, rollAbility, total);
                        if (PAbility->getMessage() == MSGBASIC_ROLL_SUB_FAIL) {
                            action.messageID = MSGBASIC_DOUBLEUP_FAIL;
                        }
                        else {
                            action.messageID = PAbility->getMessage();
                        }
                        PChar->m_ActionList.push_back(Action);
                    }
                }
            }
        }*/

        action.id = PEntity->id;
        action.actiontype = ACTION_JOBABILITY_FINISH;
        action.actionid = PAbility->getID();

        // #TODO: get rid of this to script, too
        if (PAbility->isAvatarAbility())
        {
            if (PChar->PPet != nullptr) //is a bp - dont display msg and notify pet
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.animation = 94; //assault anim
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_RECOIL;
                actionTarget.param = 0;
                actionTarget.messageID = 0;

                if (PAbility->getID() == ABILITY_SEARING_LIGHT || PAbility->getID() == ABILITY_AERIAL_BLAST || PAbility->getID() == ABILITY_EARTHEN_FURY) {
                    if (PChar->health.mp >= PChar->GetMLevel() * 2) {
                        PChar->addMP(-PChar->GetMLevel() * 2);
                    }
                }
                else {
                    PChar->addMP(-PAbility->getAnimationID()); // TODO: ...
                }
                //PChar->PPet->PBattleAI->SetBattleSubTarget(PTarget);

                //((CAIPetDummy*)PChar->PPet->PBattleAI)->m_MasterCommand = PAbility->getID();
                //#TODO: probably needs to be in a script, since the pet abilities actually have their own IDs
                PChar->PPet->PAIBattle()->WeaponSkill(PTarget->targid, PAbility->getID());

                charutils::UpdateHealth(PChar);
            }
        }
        //#TODO: make this generic enough to not require an if
        else if (PAbility->isAoE() && PChar->PParty != nullptr)
        {
            targetFind.reset();
            PChar->m_ActionList.clear();

            float distance = PAbility->getRange();

            targetFind.findWithinArea(PChar, AOERADIUS_ATTACKER, distance);

            uint16 msg = 0;
            for (auto&& PTarget : targetFind.m_targets)
            {
                actionList_t& actionList = action.getNewActionList();
                actionList.ActionTargetID = PTarget->id;
                actionTarget_t& actionTarget = actionList.getNewActionTarget();
                actionTarget.reaction = REACTION_NONE;
                actionTarget.speceffect = SPECEFFECT_NONE;
                actionTarget.animation = PAbility->getAnimationID();
                actionTarget.messageID = PAbility->getMessage();
                actionTarget.param = luautils::OnUseAbility(PChar, PTarget, PAbility, &action, &actionList);

                if (msg == 0) {
                    msg = PAbility->getMessage();
                }
                else {
                    msg = PAbility->getAoEMsg();
                }

                if (actionTarget.param < 0)
                {
                    msg = ability::GetAbsorbMessage(msg);
                    actionTarget.param = -actionTarget.param;
                }

                actionTarget.messageID = msg;
            }
        }
        else
        { 
            actionList_t& actionList = action.getNewActionList();
            actionList.ActionTargetID = PTarget->id;
            actionTarget_t& actionTarget = actionList.getNewActionTarget();
            actionTarget.reaction = REACTION_NONE;
            actionTarget.speceffect = SPECEFFECT_RECOIL;
            actionTarget.animation = PAbility->getAnimationID();
            actionTarget.param = 0;

            int32 value = luautils::OnUseAbility(PChar, PTarget, PAbility, &action, &actionList);
            actionTarget.messageID = PAbility->getMessage();
            actionTarget.param = value;

            if (value < 0)
            {
                actionTarget.messageID = ability::GetAbsorbMessage(actionTarget.messageID);
                actionTarget.param = -value;
            }

            //#TODO: set the HP from script
            //if (PAbility->getID() == ABILITY_MIJIN_GAKURE)
            //{
            //    PChar->setMijinGakure(true);
            //    PChar->health.hp = 0;
            //    charutils::UpdateHealth(PChar);
            //    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CActionPacket(PChar));
            //}

            /* TODO: Handle post-Lv. 75 genkai job abilities from support jobs that
            * deal damage points and defeats a monster while Blade of Darkness and/or
            * Blade of Death quests are active.
            */

            //#TODO: move all of these to script!
            // Shadow Bind
            //if (PAbility->getID() == ABILITY_SHADOWBIND)
            //{
            //    //action.flag = 3;

            //    uint16 shadowBindDuration = 30 + PChar->getMod(MOD_SHADOW_BIND_EXT);
            //    if (dsprand::GetRandomNumber(100) >= PTarget->getMod(MOD_BINDRES))
            //    {
            //        // Shadow bind success!
            //        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, 11, 277));
            //        PTarget->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_BIND, EFFECT_BIND, 1, 0, shadowBindDuration));
            //    }
            //    else
            //    {
            //        // Shadowbind failed!
            //        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, 11, 283));
            //    }
            //}

            //// Jump
            //if (PAbility->getID() == ABILITY_JUMP)
            //{
            //    action.param = battleutils::jumpAbility(PChar, PTarget, 1);
            //    if (action.param == 0)
            //    {
            //        action.messageID = 0;
            //        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, 0, MSGBASIC_USES_BUT_MISSES));
            //    }
            //    else if (action.param >= PTarget->health.hp)
            //    {
            //        PChar->setWeaponSkillKill(true);
            //    }
            //}

            //// High Jump
            //else if (PAbility->getID() == ABILITY_HIGH_JUMP)
            //{
            //    action.param = battleutils::jumpAbility(PChar, PTarget, 2);
            //    if (action.param == 0)
            //    {
            //        action.messageID = 0;
            //        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, 0, MSGBASIC_USES_BUT_MISSES));
            //    }
            //    else if (action.param >= PTarget->health.hp)
            //    {
            //        PChar->setWeaponSkillKill(true);
            //    }
            //}

            //// Super Jump
            //else if (PAbility->getID() == ABILITY_SUPER_JUMP)
            //{
            //    battleutils::jumpAbility(PChar, PTarget, 3);
            //    action.messageID = 0;
            //    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, 0, MSGBASIC_USES_JA));
            //}

            // Handle Accomplice / Collabrator..
            if (PAbility->getID() == ABILITY_ACCOMPLICE || PAbility->getID() == ABILITY_COLLABORATOR)
            {
                // Find all mobs within 8.5 radius of the target..
                //#TODO: use spawned mob list to avoid iterating 400 mobs
                //for (uint32 x = 0; x < 0x400; x++)
                //{
                //    CBaseEntity* PTarget = PTarget->GetEntity(x, TYPE_MOB);
                //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB)
                //    {
                //        if (targetFind.isWithinRange(&PTarget->loc.p, 8.5f))
                //        {
                //            CMobEntity* PTargetMob = (CMobEntity*)PTarget;
                //            if (PTargetMob->PEnmityContainer->HasTargetID(PTarget->id))
                //                battleutils::TransferEnmity(PChar, PTarget, PTargetMob, (PAbility->getID() == ABILITY_ACCOMPLICE) ? 50 : 25);
                //        }
                //    }
                //}
            }

            //#TODO: move these 3 BST abilities to scripts
            //if (PAbility->getID() == ABILITY_SNARL)
            //{
            //    //Snarl
            //    CBattleEntity* PTarget = (CBattleEntity*)PTarget->PBattleAI->GetBattleTarget();

            //    if (PTarget != nullptr)
            //    {
            //        switch (PTarget->objtype)
            //        {
            //            case TYPE_MOB:
            //                ((CMobEntity*)PTarget)->PEnmityContainer->LowerEnmityByPercent(PChar, 100, PTarget);
            //                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, 0, 528));  //528 - The <player> uses .. Enmity is transferred to the <player>'s pet.
            //                break;

            //            case TYPE_PET:
            //                // pets have no emnity container
            //                break;

            //            case TYPE_PC:
            //                PTarget->PBattleAI->SetBattleTarget(PTarget); //Change target. in prevision of future PvP
            //                break;
            //        }
            //    }
            //}
            //if (PAbility->getID() == ABILITY_GAUGE) {
            //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB) {
            //        if (((CMobEntity*)PTarget)->m_Type & MOBTYPE_NOTORIOUS ||
            //            PTarget->m_EcoSystem == SYSTEM_BEASTMEN ||
            //            PTarget->m_EcoSystem == SYSTEM_ARCANA)
            //        {
            //            //NM, Beastman or Arcana, cannot charm at all !
            //            PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_CANNOT_CHARM));
            //        }
            //        else {
            //            uint16 baseExp = charutils::GetRealExp(PChar->GetMLevel(), PTarget->GetMLevel());

            //            if (baseExp >= 400) {//IT
            //                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_VERY_DIFFICULT_CHARM));
            //            }
            //            else if (baseExp >= 240) {//VT
            //                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_DIFFICULT_TO_CHARM));
            //            }
            //            else if (baseExp >= 120) {//T
            //                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_MIGHT_BE_ABLE_CHARM));
            //            }
            //            else if (baseExp >= 100) {//EM
            //                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
            //            }
            //            else {
            //                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, MSGBASIC_SHOULD_BE_ABLE_CHARM));
            //            }
            //        }
            //    }
            //}
            //if (PAbility->getID() == ABILITY_REWARD)
            //{
            //    PChar->PPet->UpdateHealth();
            //    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, PAbility->getID() + 16, value, MSGBASIC_USES_RECOVERS_HP));

            //    //Reward gives enmity to the pet and not the Beastmaster.
            //    CBattleEntity* PTarget = PChar->PPet->PBattleAI->GetBattleTarget();
            //    if (PTarget != nullptr && PTarget->objtype == TYPE_MOB)
            //    {
            //        ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromCure(PChar->PPet, PChar->PPet->GetMLevel(), value, false);
            //    }
            //}

            state.ApplyEnmity();
        }

        // #TODO: delete ammo from script

        //if (PAbility->getID() == ABILITY_CALL_BEAST || PAbility->getID() == ABILITY_REWARD ||
        //    PAbility->getID() == ABILITY_ANGON || PAbility->getID() == ABILITY_TOMAHAWK || PAbility->getID() == ABILITY_REPAIR)
        //{
        //    CItemArmor* PAmmo = PChar->getEquip(SLOT_AMMO);
        //    uint8 slot = PChar->equip[SLOT_AMMO];
        //    uint8 loc = PChar->equipLoc[SLOT_AMMO];
        //    if (PAmmo->getQuantity() == 1)
        //    {
        //        charutils::UnequipItem(PChar, SLOT_AMMO);
        //        charutils::SaveCharEquip(PChar);
        //    }
        //    charutils::UpdateItem(PChar, loc, slot, -1);

        //    PChar->pushPacket(new CInventoryFinishPacket());
        //}

        //if (PAbility->getID() >= ABILITY_FIRE_SHOT && PAbility->getID() <= ABILITY_DARK_SHOT)
        //{
        //    CItemContainer* inventory = PChar->getStorage(LOC_INVENTORY);
        //    uint8 slotID = inventory->SearchItem(2176 + PAbility->getID() - ABILITY_FIRE_SHOT); //Elemental Card

        //    if (slotID != ERROR_SLOTID)
        //    {
        //        charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -1);
        //    }
        //    else
        //    {
        //        slotID = inventory->SearchItem(2974); //Trump Card
        //        DSP_DEBUG_BREAK_IF(slotID == ERROR_SLOTID);
        //        charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -1);
        //    }
        //    PChar->pushPacket(new CInventoryFinishPacket());
        //}

        //#TODO: command pet from script
        //if (PAbility->getID() == ABILITY_SIC && PChar->PPet != nullptr) {//Sic

        //    CAIPetDummy* PPetAI = (CAIPetDummy*)PChar->PPet->PBattleAI;

        //    if (PChar->PPet->health.tp >= 1000)
        //    {
        //        PPetAI->m_MasterCommand = MASTERCOMMAND_SIC;
        //        PPetAI->SetCurrentAction(ACTION_MOBABILITY_START);
        //    }
        //    else
        //    {
        //        // queue sic and use when ready
        //        PPetAI->m_queueSic = true;
        //    }
        //}

        uint32 chargeTime = 0;
        uint8 maxCharges = 0;
        Charge_t* charge = ability::GetCharge(PChar, PAbility->getRecastId());
        if (charge != nullptr)
        {
            chargeTime = charge->chargeTime;
            maxCharges = charge->maxCharges;
        }
        PChar->PRecastContainer->Add(RECAST_ABILITY, PAbility->getRecastId(), RecastTime, chargeTime, maxCharges);
        PChar->pushPacket(new CCharRecastPacket(PChar));
        action.recast = RecastTime;

        //#TODO: refactor 
        //if (PChar->getMijinGakure())
        //{
        //    m_ActionType = ACTION_FALL;
        //    ActionFall();
        //}
    }
    else if (errMsg)
    {
        PChar->pushPacket(std::move(errMsg));
    }
}

bool CAIChar::IsMobOwner(CBattleEntity* PBattleTarget)
{
    DSP_DEBUG_BREAK_IF(PBattleTarget == nullptr);

    if (PBattleTarget->m_OwnerID.id == 0 || PBattleTarget->m_OwnerID.id == PEntity->id || PBattleTarget->objtype == TYPE_PC)
    {
        return true;
    }

    bool found = false;

    static_cast<CCharEntity*>(PEntity)->ForAlliance([&PBattleTarget, &found](CBattleEntity* PChar) {
        if (PChar->id == PBattleTarget->m_OwnerID.id)
        {
            found = true;
        }
    });

    return found;
}

void CAIChar::OnDeathTimer()
{
    //home point
}

void CAIChar::Die()
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    if (GetBattleTargetID() == 0)
    {
        //falls to the ground
        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PChar, 0, 0, 20));
    }
    else
    {
        auto PTarget = PChar->GetEntity(GetBattleTargetID());
        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PTarget, 0, 0, 97));
    }
    Die(60min);
    PChar->m_DeathCounter = 0;
    PChar->m_DeathTimestamp = (uint32)time(nullptr);

    //influence for conquest system
    conquest::LoseInfluencePoints(PChar);

    if (!PChar->getMijinGakure())
        charutils::DelExperiencePoints(PChar, map_config.exp_retain);
}

void CAIChar::Die(duration _duration)
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    ClearStateStack();
    ChangeState<CDeathState>(static_cast<CBattleEntity*>(PEntity), _duration);
    m_battleTarget = 0;
    PChar->pushPacket(new CRaiseTractorMenuPacket(PChar, TYPE_HOMEPOINT));
    PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH, true);

    // reraise modifiers
    if (PChar->getMod(MOD_RERAISE_I) > 0)
        PChar->m_hasRaise = 1;

    if (PChar->getMod(MOD_RERAISE_II) > 0)
        PChar->m_hasRaise = 2;

    if (PChar->getMod(MOD_RERAISE_III) > 0)
        PChar->m_hasRaise = 3;
}

void CAIChar::Raise()
{
    ForceChangeState<CRaiseState>(static_cast<CBattleEntity*>(PEntity));
}

void CAIChar::OnRaise()
{
    auto PChar = static_cast<CCharEntity*>(PEntity);
    // TODO: Moghancement Experience needs to be factored in here somewhere.
    if (PChar->m_hasRaise > 0)
    {
        uint8 weaknessLvl = 1;
        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_WEAKNESS))
        {
            //double weakness!
            weaknessLvl = 2;
        }

        //add weakness effect (75% reduction in HP/MP)
        if (!PChar->getMijinGakure())
        {
            CStatusEffect* PWeaknessEffect = new CStatusEffect(EFFECT_WEAKNESS, EFFECT_WEAKNESS, weaknessLvl, 0, 300);
            PChar->StatusEffectContainer->AddStatusEffect(PWeaknessEffect);
        }

        double ratioReturned = 0.0f;
        uint16 hpReturned = 1;

        action_t action;
        action.id = PChar->id;
        action.actiontype = ACTION_RAISE_MENU_SELECTION;
        auto& list = action.getNewActionList();
        auto& actionTarget = list.getNewActionTarget();

        list.ActionTargetID = PChar->id;
        if (PChar->m_hasRaise == 1)
        {
            actionTarget.animation = 511;
            hpReturned = (PChar->getMijinGakure()) ? PChar->GetMaxHP()*0.5 : PChar->GetMaxHP()*0.1;
            ratioReturned = 0.50f * (1 - map_config.exp_retain);
        }
        else if (PChar->m_hasRaise == 2)
        {
            actionTarget.animation = 512;
            hpReturned = (PChar->getMijinGakure()) ? PChar->GetMaxHP()*0.5 : PChar->GetMaxHP()*0.25;
            ratioReturned = ((PChar->GetMLevel() <= 50) ? 0.50f : 0.75f) * (1 - map_config.exp_retain);
        }
        else if (PChar->m_hasRaise == 3)
        {
            actionTarget.animation = 496;
            hpReturned = PChar->GetMaxHP()*0.5;
            ratioReturned = ((PChar->GetMLevel() <= 50) ? 0.50f : 0.90f) * (1 - map_config.exp_retain);
        }
        PChar->addHP(((hpReturned < 1) ? 1 : hpReturned));
        PChar->updatemask |= UPDATE_HP;
        actionTarget.speceffect = SPECEFFECT_RAISE;

        PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CActionPacket(action));

        charutils::UpdateHealth(PChar);

        uint8 mLevel = (PChar->m_LevelRestriction != 0 && PChar->m_LevelRestriction < PChar->GetMLevel()) ? PChar->m_LevelRestriction : PChar->GetMLevel();
        uint16 expLost = mLevel <= 67 ? (charutils::GetExpNEXTLevel(mLevel) * 8) / 100 : 2400;

        uint16 xpNeededToLevel = charutils::GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - PChar->jobs.exp[PChar->GetMJob()];

        // Exp is enough to level you and (you're not under a level restriction, or the level restriction is higher than your current main level).
        if (xpNeededToLevel < expLost && (PChar->m_LevelRestriction == 0 || PChar->GetMLevel() < PChar->m_LevelRestriction))
        {
            // Player probably leveled down when they died.  Give they xp for the next level.
            expLost = PChar->GetMLevel() <= 67 ? (charutils::GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()] + 1) * 8) / 100 : 2400;
        }

        uint16 xpReturned = ceil(expLost * ratioReturned);

        if (!PChar->getMijinGakure() && PChar->GetMLevel() >= map_config.exp_loss_level)
        {
            charutils::AddExperiencePoints(true, PChar, PChar, xpReturned);
        }

        PChar->setMijinGakure(false);

        PChar->m_hasRaise = 0;
    }
}
