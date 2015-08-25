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

#include "attack_state.h"

#include "../../entities/battleentity.h"

#include "../../utils/battleutils.h"
#include "../../attackround.h"
#include "../../packets/action.h"

CAttackState::CAttackState(CBattleEntity* PEntity, uint16 targid) :
    CState(PEntity, targid),
    m_PEntity(PEntity),
    m_attackTime(1s)
{
}

CAttackState::~CAttackState()
{
    if (m_PEntity->animation == ANIMATION_ATTACK)
    {
        m_PEntity->animation = ANIMATION_NONE;
    }
}

bool CAttackState::Update(time_point tick)
{
    auto PTarget = static_cast<CBattleEntity*>(m_PEntity->GetEntity(targid));
    if (!PTarget || static_cast<CBattleEntity*>(PTarget)->isDead())
    {
        return true;
    }
    if (CanAttack(PTarget))
    {
        m_attackTime += std::chrono::milliseconds(m_PEntity->GetWeaponDelay(false));

        //#TODO: redo the attack_round code, because it sucks
        DoAttack(PTarget);
    }
    return false;
}

void CAttackState::Clear()
{
}

bool CAttackState::CanAttack(CBattleEntity* PTarget)
{
    m_attackTime -= (m_PEntity->PAI->getTick() - m_PEntity->PAI->getPrevTick());

    //#TODO: push the error messages
    //#TODO: message time vs attack time?
    if (m_attackTime < 0ms)
    {
        m_attackTime += std::chrono::milliseconds(m_PEntity->GetWeaponDelay(false));
        auto PEntity = static_cast<CBattleEntity*>(m_PEntity);

        float dist = distance(PEntity->loc.p, PTarget->loc.p);

        if (dist > PTarget->m_ModelSize)
        {
            return false;
        }
        if (!isFaceing(PEntity->loc.p, PTarget->loc.p, 40))
        {
            return false;
        }
        if (battleutils::IsParalyzed(static_cast<CBattleEntity*>(PEntity)))
        {
            return false;
        }
        if (battleutils::IsIntimidated(static_cast<CBattleEntity*>(PEntity), PTarget))
        {
            return true;
        }
        return true;
    }
    return false;
}

void CAttackState::DoAttack(CBattleEntity* PTarget)
{
    // Create a new attack round.
    CAttackRound attackRound(m_PEntity);

    action_t action;
    action.actiontype = ACTION_ATTACK;
    action.id = m_PEntity->id;
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

        // ??????? ????????? ??????????? ????????? ?? ???????
        // ????? ????? ????????? ??????????? ????????? ???????????? ?????
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
                attack.SetCritical(dsprand::GetRandomNumber(100) < battleutils::GetCritHitRate(m_PEntity, PTarget, !attack.IsFirstSwing()));

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

                actionTarget.param = battleutils::TakePhysicalDamage(m_PEntity, PTarget, attack.GetDamage(), attack.IsBlocked(), attack.GetWeaponSlot(), 1, attackRound.GetTAEntity(), true, true);
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
            battleutils::HandleAfflatusMiseryAccuracyBonus(m_PEntity);
        }

        if (actionTarget.reaction != REACTION_HIT && actionTarget.reaction != REACTION_BLOCK && actionTarget.reaction != REACTION_GUARD)
        {
            actionTarget.param = 0;
            battleutils::ClaimMob(PTarget, m_PEntity);
        }

        if (actionTarget.reaction != REACTION_EVADE && actionTarget.reaction != REACTION_PARRY)
        {
            //#TODO
            //battleutils::HandleEnspell(m_PEntity, PTarget, &Action, attack.IsFirstSwing(), (CItemWeapon*)m_PEntity->m_Weapons[attack.GetWeaponSlot()], attack.GetDamage());
            //battleutils::HandleSpikesDamage(m_PEntity, PTarget, &Action, attack.GetDamage());
        }

        if (actionTarget.speceffect == SPECEFFECT_HIT && actionTarget.param > 0)
        {
            actionTarget.speceffect = SPECEFFECT_RECOIL;
        }

        //try zanshin only on single swing attack rounds - it is last priority in the multi-hit order
        //if zanshin procs, the attack is repeated
        if (attack.IsFirstSwing() && attackRound.GetAttackSwingCount() == 1)
        {
            uint16 zanshinChance = m_PEntity->getMod(MOD_ZANSHIN) + battleutils::GetMeritValue(m_PEntity, MERIT_ZASHIN_ATTACK_RATE);
            zanshinChance = dsp_cap(zanshinChance, 0, 100);
            //zanshin may only proc on a missed/guarded/countered swing or as SAM main with hasso up (at 25% of the base zanshin rate)
            if (((actionTarget.reaction == REACTION_EVADE || actionTarget.reaction == REACTION_GUARD ||
                  actionTarget.spikesEffect == SUBEFFECT_COUNTER) && dsprand::GetRandomNumber(100) < zanshinChance) ||
                (m_PEntity->GetMJob() == JOB_SAM && m_PEntity->StatusEffectContainer->HasStatusEffect(EFFECT_HASSO) && dsprand::GetRandomNumber(100) < (zanshinChance / 4)))
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

    m_PEntity->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ATTACK | EFFECTFLAG_DETECTABLE);
    m_PEntity->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
}
