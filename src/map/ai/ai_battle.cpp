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

#include "ai_battle.h"

#include "controllers/controller.h"
#include "states/attack_state.h"
#include "states/magic_state.h"
#include "states/weaponskill_state.h"
#include "../attackround.h"
#include "../spell.h"
#include "../mobskill.h"
#include "../weapon_skill.h"
#include "../status_effect_container.h"
#include "../entities/battleentity.h"
#include "../utils/battleutils.h"
#include "../lua/luautils.h"
#include "../packets/action.h"

CAIBattle::CAIBattle(CBattleEntity* _PEntity, std::unique_ptr<CPathFind>&& pathfind,
    std::unique_ptr<CController>&& controller) :
    CAIBase(_PEntity, std::forward<std::unique_ptr<CPathFind>>(pathfind),
        std::forward<std::unique_ptr<CController>>(controller)),
    targetFind(_PEntity),
    m_battleTarget(0)
{
}

void CAIBattle::Cast(uint16 targid, uint16 spellid)
{
    if (Controller)
    {
        Controller->Cast(targid, spellid);
    }
    else
    {
        Internal_Cast(targid, spellid);
    }
}

void CAIBattle::Engage(uint16 targid)
{
    if (Controller)
    {
        Controller->Engage(targid);
    }
    else
    {
        Internal_Engage(targid);
    }
}

void CAIBattle::ChangeTarget(uint16 targid)
{
    if (Controller)
    {
        Controller->ChangeTarget(targid);
    }
    else
    {
        Internal_ChangeTarget(targid);
    }
}

void CAIBattle::Disengage()
{
    if (Controller)
    {
        Controller->Disengage();
    }
    else
    {
        Internal_Disengage();
    }
}

void CAIBattle::WeaponSkill(uint16 targid, uint16 wsid)
{
    if (Controller)
    {
        Controller->WeaponSkill(targid, wsid);
    }
    else
    {
        Internal_WeaponSkill(targid, wsid);
    }
}

bool CAIBattle::Internal_Engage(uint16 targetid)
{
    //#TODO: pet engage/disengage
    auto PTarget = static_cast<CBattleEntity*>(PEntity->GetEntity(targetid));

    //#TODO: use valid target stuff from spell
    if (!m_battleTarget && PTarget && !PTarget->isDead())
    {
        //#TODO: remove m_battleTarget if possible (need to check disengage)
        m_battleTarget = targetid;
        if (CanChangeState() || (GetCurrentState() && GetCurrentState()->IsCompleted()))
        {
            ForceChangeState<CAttackState>(static_cast<CBattleEntity*>(PEntity), targetid);
        }
        return true;
    }
    return false;
}

void CAIBattle::OnDisengage()
{
    m_battleTarget = 0;
    if (PEntity->animation == ANIMATION_ATTACK)
    {
        PEntity->animation = ANIMATION_NONE;
    }
    PEntity->updatemask |= UPDATE_HP;
}

void CAIBattle::OnChangeTarget(CBattleEntity* PTarget)
{
}

bool CAIBattle::OnAttack(CAttackState& state, action_t& action)
{
    auto PBattleEntity = static_cast<CBattleEntity*>(PEntity);
    auto PTarget = static_cast<CBattleEntity*>(state.GetTarget());

    if (battleutils::IsParalyzed(PBattleEntity))
    {
        PBattleEntity->loc.zone->PushPacket(PBattleEntity, CHAR_INRANGE_SELF, new CMessageBasicPacket(PBattleEntity, PTarget, 0, 0, MSGBASIC_IS_PARALYZED));
        return false;
    }
    if (battleutils::IsIntimidated(PBattleEntity, PTarget))
    {
        PBattleEntity->loc.zone->PushPacket(PBattleEntity, CHAR_INRANGE_SELF, new CMessageBasicPacket(PBattleEntity, PTarget, 0, 0, MSGBASIC_IS_INTIMIDATED));
        return false;
    }

    // Create a new attack round.
    CAttackRound attackRound(PBattleEntity, PTarget);

    action.actiontype = ACTION_ATTACK;
    action.id = PBattleEntity->id;
    actionList_t& list = action.getNewActionList();

    list.ActionTargetID = PTarget->id;

    /////////////////////////////////////////////////////////////////////////
    //	Start of the attack loop.
    /////////////////////////////////////////////////////////////////////////
    while (attackRound.GetAttackSwingCount() && !(PTarget->isDead()))
    {
        actionTarget_t& actionTarget = list.getNewActionTarget();
        // Reference to the current swing.
        CAttack attack = attackRound.GetCurrentAttack();

        // Set the swing animation.
        actionTarget.animation = attack.GetAnimationID();

        if (PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE, 0))
        {
            actionTarget.messageID = 32;
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
        }
        else if ((dsprand::GetRandomNumber(100) < attack.GetHitRate() || attackRound.GetSATAOccured()) &&
                 !PTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
        {
            // attack hit, try to be absorbed by shadow unless it is a SATA attack round
            if (!(attackRound.GetSATAOccured()) && battleutils::IsAbsorbByShadow(PTarget))
            {
                actionTarget.messageID = 0;
                actionTarget.reaction = REACTION_EVADE;
                attack.SetEvaded(true);
                PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget, PTarget, 0, 1, 31));
            }
            else
            {
                // Set this attack's critical flag.
                attack.SetCritical(dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(PBattleEntity, PTarget, !attack.IsFirstSwing()));

                // Critical hit.
                if (attack.IsCritical())
                {
                    actionTarget.reaction = REACTION_HIT;
                    actionTarget.speceffect = SPECEFFECT_CRITICAL_HIT;
                    actionTarget.messageID = 67;

                    if (PTarget->objtype == TYPE_MOB)
                    {
                        luautils::OnCriticalHit(PTarget);
                    }
                }
                // Not critical hit.
                else
                {
                    actionTarget.reaction = REACTION_HIT;
                    actionTarget.speceffect = SPECEFFECT_HIT;
                    actionTarget.messageID = 1;
                }

                // Guarded. TODO: Stuff guards that shouldn't.
                if (attack.IsGuarded())
                {
                    actionTarget.reaction = REACTION_GUARD;
                }

                // Process damage.
                attack.ProcessDamage();

                // Try shield block
                if (attack.IsBlocked())
                {
                    actionTarget.reaction = REACTION_BLOCK;
                }

                actionTarget.param = battleutils::TakePhysicalDamage(PBattleEntity, PTarget, attack.GetDamage(), attack.IsBlocked(), attack.GetWeaponSlot(), 1, attackRound.GetTAEntity(), true, true);
                if (actionTarget.param < 0)
                {
                    actionTarget.param = -(actionTarget.param);
                    actionTarget.messageID = 373;
                }
            }
        }
        else
        {
            // Player misses the target
            actionTarget.reaction = REACTION_EVADE;
            actionTarget.speceffect = SPECEFFECT_NONE;
            actionTarget.messageID = 15;
            attack.SetEvaded(true);

            // Check & Handle Afflatus Misery Accuracy Bonus
            battleutils::HandleAfflatusMiseryAccuracyBonus(PBattleEntity);
        }

        if (actionTarget.reaction != REACTION_HIT && actionTarget.reaction != REACTION_BLOCK && actionTarget.reaction != REACTION_GUARD)
        {
            actionTarget.param = 0;
            battleutils::ClaimMob(PTarget, PBattleEntity);
        }

        if (actionTarget.reaction != REACTION_EVADE && actionTarget.reaction != REACTION_PARRY)
        {
            //#TODO
            //battleutils::HandleEnspell(PBattleEntity, PTarget, &Action, attack.IsFirstSwing(), (CItemWeapon*)PBattleEntity->m_Weapons[attack.GetWeaponSlot()], attack.GetDamage());
            //battleutils::HandleSpikesDamage(PBattleEntity, PTarget, &Action, attack.GetDamage());
        }

        if (actionTarget.speceffect == SPECEFFECT_HIT && actionTarget.param > 0)
        {
            actionTarget.speceffect = SPECEFFECT_RECOIL;
        }

        //try zanshin only on single swing attack rounds - it is last priority in the multi-hit order
        //if zanshin procs, the attack is repeated
        if (attack.IsFirstSwing() && attackRound.GetAttackSwingCount() == 1)
        {
            uint16 zanshinChance = PBattleEntity->getMod(MOD_ZANSHIN) + battleutils::GetMeritValue(PBattleEntity, MERIT_ZASHIN_ATTACK_RATE);
            zanshinChance = dsp_cap(zanshinChance, 0, 100);
            //zanshin may only proc on a missed/guarded/countered swing or as SAM main with hasso up (at 25% of the base zanshin rate)
            if (((actionTarget.reaction == REACTION_EVADE || actionTarget.reaction == REACTION_GUARD ||
                  actionTarget.spikesEffect == SUBEFFECT_COUNTER) && dsprand::GetRandomNumber(100) < zanshinChance) ||
                (PBattleEntity->GetMJob() == JOB_SAM && PBattleEntity->StatusEffectContainer->HasStatusEffect(EFFECT_HASSO) && dsprand::GetRandomNumber(100) < (zanshinChance / 4)))
            {
                attack.SetAttackType(ZANSHIN_ATTACK);
                attack.SetAsFirstSwing(false);
            }
            else
                attackRound.DeleteAttackSwing();
        }
        else
            attackRound.DeleteAttackSwing();

        if (list.actionTargets.size() == 8)
        {
            break;
        }
    }
    /////////////////////////////////////////////////////////////////////////////////////////////
    // End of attack loop
    /////////////////////////////////////////////////////////////////////////////////////////////

    PBattleEntity->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK | EFFECTFLAG_DETECTABLE);

    return true;
}

bool CAIBattle::CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    if (distance(PEntity->loc.p, PTarget->loc.p) > PTarget->m_ModelSize)
    {
        return false;
    }
    return true;
}

CBattleEntity* CAIBattle::IsValidTarget(uint16 targid, uint8 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg)
{
    auto PTarget = targetFind.getValidTarget(targid, validTargetFlags);

    return PTarget;
}

bool CAIBattle::Internal_Cast(uint16 targetid, uint16 spellid)
{
    return ChangeState<CMagicState>(static_cast<CBattleEntity*>(PEntity), targetid, spellid);
}

void CAIBattle::Internal_ChangeTarget(uint16 targetid)
{
    m_battleTarget = targetid;
}

void CAIBattle::Internal_Disengage()
{
    m_battleTarget = 0;
}

bool CAIBattle::Internal_WeaponSkill(uint16 targid, uint16 wsid)
{
    return ChangeState<CWeaponSkillState>(static_cast<CBattleEntity*>(PEntity), targid, wsid);
}

void CAIBattle::OnCastFinished(CMagicState& state, action_t& action)
{
    auto PSpell = state.GetSpell();
    auto PBattleEntity = static_cast<CBattleEntity*>(PEntity);
    auto PActionTarget = static_cast<CBattleEntity*>(state.GetTarget());

    luautils::OnSpellPrecast(PBattleEntity, PSpell);

    state.SpendCost();

    // remove effects based on spell cast first
    int16 effectFlags = EFFECTFLAG_INVISIBLE | EFFECTFLAG_MAGIC_BEGIN;

    if (PSpell->canTargetEnemy())
    {
        effectFlags |= EFFECTFLAG_DETECTABLE;
    }

    PBattleEntity->StatusEffectContainer->DelStatusEffectsByFlag(effectFlags);

    targetFind.reset();

    // setup special targeting flags
    // can this spell target the dead?

    uint8 flags = FINDFLAGS_NONE;
    if (PSpell->getValidTarget() & TARGET_PLAYER_DEAD)
    {
        flags |= FINDFLAGS_DEAD;
    }
    if (PSpell->getFlag() & SPELLFLAG_HIT_ALL)
    {
        flags |= FINDFLAGS_HIT_ALL;
    }
    uint8 aoeType = battleutils::GetSpellAoEType(PBattleEntity, PSpell);

    if (aoeType == SPELLAOE_RADIAL) {
        float distance = spell::GetSpellRadius(PSpell, PBattleEntity);

        targetFind.findWithinArea(PActionTarget, AOERADIUS_TARGET, distance, flags);

    }
    else if (aoeType == SPELLAOE_CONAL)
    {
        //TODO: actual radius calculation
        float radius = spell::GetSpellRadius(PSpell, PBattleEntity);

        targetFind.findWithinCone(PActionTarget, radius, 45, flags);
    }
    else
    {
        // only add target
        targetFind.findSingleTarget(PActionTarget, flags);
    }

    uint16 totalTargets = targetFind.m_targets.size();

    PSpell->setTotalTargets(totalTargets);

    action.id = PEntity->id;
    action.actiontype = ACTION_MAGIC_FINISH;
    action.actionid = PSpell->getID();
    action.recast = state.GetRecast();
    action.spellgroup = PSpell->getSpellGroup();

    uint16 msg = 0;

    for (auto PTarget : targetFind.m_targets)
    {
        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PTarget->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();

        actionTarget.reaction = REACTION_NONE;
        actionTarget.speceffect = SPECEFFECT_NONE;
        actionTarget.animation = PSpell->getAnimationID();
        actionTarget.param = 0;
        actionTarget.messageID = 0;

        auto ce = PSpell->getCE();
        auto ve = PSpell->getVE();

        // take all shadows
        if (PSpell->canTargetEnemy() && aoeType > 0)
        {
            PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
            PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
        }

        // TODO: this is really hacky and should eventually be moved into lua
        if (PSpell->canHitShadow() && aoeType == SPELLAOE_NONE && battleutils::IsAbsorbByShadow(PTarget))
        {
            // take shadow
            msg = 31;
            actionTarget.param = 1;
            ve = 0;
            ce = 0;
        }
        else
        {
            actionTarget.param = luautils::OnSpellCast(PBattleEntity, PTarget, PSpell);

            // remove effects from damage
            if (PSpell->canTargetEnemy() && actionTarget.param > 0 && PSpell->dealsDamage())
            {
                PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
            }

            // Check for bind breaking
            battleutils::BindBreakCheck(PBattleEntity, PTarget);

            if (msg == 0)
            {
                msg = PSpell->getMessage();
            }
            else
            {
                msg = PSpell->getAoEMessage();
            }
        }

        if (actionTarget.animation == 122 && msg == 283) // teleport spells don't target unqualified members
        {
            actionList.actionTargets.pop_back();
            continue;
        }

        actionTarget.messageID = msg;

        state.ApplyEnmity(PTarget, ce, ve);

        if (PTarget->objtype == TYPE_MOB && msg != 31) // If message isn't the shadow loss message, because I had to move this outside of the above check for it.
        {
            luautils::OnMagicHit(PBattleEntity, PTarget, PSpell);
        }
    }

    PBattleEntity->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END);
}

void CAIBattle::OnCastInterrupted(CMagicState& state, action_t& action, MSGBASIC_ID msg)
{
    CSpell* PSpell = static_cast<CMagicState*>(GetCurrentState())->GetSpell();
    if (PSpell)
    {
        action.id = PEntity->id;
        action.actiontype = ACTION_MAGIC_INTERRUPT;
        action.actionid = PSpell->getID();
        action.spellgroup = PSpell->getSpellGroup();
        
        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PEntity->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.messageID = 0;
        actionTarget.animation = PSpell->getAnimationID();

        PEntity->loc.zone->PushPacket(PEntity, CHAR_INRANGE_SELF, new CMessageBasicPacket(PEntity, PEntity, 0, 0, msg));
    }
}

void CAIBattle::OnWeaponSkillFinished(CWeaponSkillState& state, action_t& action)
{
    auto PWeaponskill = state.GetSkill();

    action.id = PEntity->id;
    action.actiontype = ACTION_WEAPONSKILL_FINISH;
    action.actionid = PWeaponskill->getID();
}

uint16 CAIBattle::GetBattleTargetID()
{
    return m_battleTarget;
}

void CAIBattle::OnDeathTimer()
{}

void CAIBattle::TryHitInterrupt(CBattleEntity* PAttacker)
{
    if (GetCurrentState())
        GetCurrentState()->TryInterrupt(PAttacker);
}

