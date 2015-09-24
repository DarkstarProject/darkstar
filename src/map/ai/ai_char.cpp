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
#include "states/attack_state.h"
#include "states/weaponskill_state.h"
#include "../entities/charentity.h"
#include "../utils/battleutils.h"
#include "../utils/charutils.h"
#include "../packets/action.h"
#include "../packets/lock_on.h"
#include "../packets/char_update.h"
#include "../packets/message_basic.h"

CAIChar::CAIChar(CCharEntity* PChar) :
    CAIBattle(PChar, nullptr, std::make_unique<CPlayerController>(PChar))
{
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

    if (dist > 30)
    {
        errMsg = std::make_unique<CMessageBasicPacket>(PEntity, PTarget, 0, 0, MSGBASIC_LOSE_SIGHT);
        PBattleEntity->PAIBattle()->Disengage();
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

bool CAIChar::Attack(action_t& action)
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
    return CAIBattle::Attack(action);
}

void CAIChar::OnCastFinished(CMagicState& state, action_t& action)
{
    CAIBattle::OnCastFinished(state, action);

    auto PSpell = state.GetSpell();
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    static_cast<CPlayerController*>(Controller.get())->setLastActionTime(server_clock::now());
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
    charutils::UpdateHealth(PChar);
}
