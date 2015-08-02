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

#include "states/magic_state.h"
#include "../spell.h"
#include "../entities/battleentity.h"
#include "../packets/message_basic.h"
#include "../utils/battleutils.h"
#include "../lua/luautils.h"
#include "../packets/action.h"

CAIBattle::CAIBattle(CBattleEntity* _PEntity) :
    CAIBase(_PEntity, std::make_unique<CPathFind>(_PEntity)),
    targetFind(_PEntity),
    actionStateContainer(nullptr),
    m_AttackTime(0)
{
}

void CAIBattle::ActionQueueStateChange(const queueAction& action)
{
    switch(action.action)
    {
        case AIState::Casting:
            Cast(action.spell.spellid, action.spell.targid);
            break;
        default:
            break;
    }
}

void CAIBattle::Cast(uint16 targetid, uint16 spellid)
{
    if (CanChangeState())
    {
        if (m_Tick < m_LastActionTime + g_GCD)
        {
            //MagicStartError();
            return;
        }
        ChangeState(AIState::Casting);
        actionStateContainer = std::make_unique<CMagicState>(static_cast<CBattleEntity*>(PEntity), targetFind);

        STATESTATUS status = static_cast<CMagicState*>(actionStateContainer.get())->CastSpell(spellid, targetid);

        if (status != STATESTATUS::InProgress)
        {
            //MagicStartError();
        }
    }
}

void CAIBattle::ActionAttacking()
{
    switch(CanAttack())
    {
        case STATESTATUS::ErrorRange:
        case STATESTATUS::ErrorInvalidTarget:
        case STATESTATUS::ErrorFacing:
        case STATESTATUS::ErrorParalyzed:
        case STATESTATUS::ErrorIntimidated:
        case STATESTATUS::ErrorUnknown:
            break; //todo: error handling
        case STATESTATUS::OK:
            //attack
            break;
        default:
            break;
    }
}

void CAIBattle::ActionCasting()
{
    STATESTATUS status = actionStateContainer->Update(m_Tick);

    action_t action;
    bool acted = true;

    switch (status)
    {
        case STATESTATUS::Finish:
            CastFinished(action);
            break;
        case STATESTATUS::Interrupt:
        case STATESTATUS::ErrorRange:
        case STATESTATUS::ErrorInvalidTarget:
        case STATESTATUS::ErrorUnknown:
            CastInterrupted(action);
            break;
        default:
            acted = false;
            break;
    }
    if (acted)
    {
        PEntity->loc.zone->PushPacket(PEntity, CHAR_INRANGE_SELF, new CActionPacket(action));
        TransitionBack();
    }
}

bool CAIBattle::CanChangeState()
{
    return CAIBase::CanChangeState() && (!actionStateContainer ||
        (actionStateContainer && actionStateContainer->CanChangeState()));
}

void CAIBattle::ChangeState(AIState state)
{
    actionStateContainer->Clear();
    actionStateContainer.reset();
    CAIBase::ChangeState(state);
}

void CAIBattle::TransitionBack()
{
    if (PEntity->animation == ANIMATION_ATTACK)
    {
        ChangeState(AIState::Attacking);
    }
    else
    {
        ChangeState(AIState::None);
    }
}

STATESTATUS CAIBattle::CanAttack()
{
    if (m_AttackTime < std::chrono::milliseconds(0))
    {
        float dist = distance(PEntity->loc.p, PBattleTarget->loc.p);

        if (dist > PBattleTarget->m_ModelSize)
        {
            return STATESTATUS::ErrorRange;
        }
        if (!isFaceing(PEntity->loc.p, PBattleTarget->loc.p, 40))
        {
            return STATESTATUS::ErrorFacing;
        }
        if (battleutils::IsParalyzed(static_cast<CBattleEntity*>(PEntity)))
        {
            return STATESTATUS::ErrorParalyzed;
        }
        if (battleutils::IsIntimidated(static_cast<CBattleEntity*>(PEntity), PBattleTarget))
        {
            return STATESTATUS::ErrorIntimidated;
        }
        return STATESTATUS::OK;
    }
    return STATESTATUS::InProgress;
}

void CAIBattle::CastFinished(action_t& action)
{
    CMagicState* container = static_cast<CMagicState*>(actionStateContainer.get());
    CSpell* PSpell = container->GetSpell();

    luautils::OnSpellPrecast(static_cast<CBattleEntity*>(PEntity), PSpell);

    container->SpendCost();

    // remove effects based on spell cast first
    int16 effectFlags = EFFECTFLAG_INVISIBLE | EFFECTFLAG_MAGIC_BEGIN;

    if (PSpell->canTargetEnemy())
    {
        effectFlags |= EFFECTFLAG_DETECTABLE;
    }

    static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->DelStatusEffectsByFlag(effectFlags);

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
    uint8 aoeType = battleutils::GetSpellAoEType(static_cast<CBattleEntity*>(PEntity), PSpell);

    if (aoeType == SPELLAOE_RADIAL) {
        float distance = spell::GetSpellRadius(PSpell, static_cast<CBattleEntity*>(PEntity));

        targetFind.findWithinArea(static_cast<CBattleEntity*>(PActionTarget), AOERADIUS_TARGET, distance, flags);

    }
    else if (aoeType == SPELLAOE_CONAL)
    {
        //TODO: actual radius calculation
        float radius = spell::GetSpellRadius(PSpell, static_cast<CBattleEntity*>(PEntity));

        targetFind.findWithinCone(static_cast<CBattleEntity*>(PActionTarget), radius, 45, flags);
    }
    else
    {
        // only add target
        targetFind.findSingleTarget(static_cast<CBattleEntity*>(PActionTarget), flags);
    }

    uint16 totalTargets = targetFind.m_targets.size();

    PSpell->setTotalTargets(totalTargets);

    action.id = PEntity->id;
    action.actiontype = ACTION_MAGIC_FINISH;
    action.actionid = PSpell->getID();
    action.recast = container->GetRecast();
    action.spellgroup = PSpell->getSpellGroup();

    uint16 msg = 0;
    int16 ce = 0;
    int16 ve = 0;

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

        ce = PSpell->getCE();
        ve = PSpell->getVE();

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
            actionTarget.param = luautils::OnSpellCast(static_cast<CBattleEntity*>(PEntity), PTarget, PSpell);

            // remove effects from damage
            if (PSpell->canTargetEnemy() && actionTarget.param > 0 && PSpell->dealsDamage())
            {
                PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
            }

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
            continue;

        actionTarget.messageID = msg;

        if (PTarget->objtype == TYPE_MOB && msg != 31) // If message isn't the shadow loss message, because I had to move this outside of the above check for it.
        {
            luautils::OnMagicHit(static_cast<CBattleEntity*>(PEntity), PTarget, PSpell);
        }
    }

    static_cast<CBattleEntity*>(PEntity)->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_MAGIC_END);
}

void CAIBattle::CastInterrupted(action_t& action)
{
    CSpell* PSpell = static_cast<CMagicState*>(actionStateContainer.get())->GetSpell();
    if (PSpell)
    {
        action.id = PEntity->id;
        action.actionid = ACTION_MAGIC_INTERRUPT;
        action.spellgroup = PSpell->getSpellGroup();
        
        actionList_t& actionList = action.getNewActionList();
        actionList.ActionTargetID = PEntity->id;

        actionTarget_t& actionTarget = actionList.getNewActionTarget();
        actionTarget.messageID = MSGBASIC_IS_INTERRUPTED;
    }
}

void CAIBattle::TryHitInterrupt(CBattleEntity* PAttacker)
{
    if (GetCurrentState() == AIState::Casting)
    {
        static_cast<CMagicState*>(actionStateContainer.get())->TryInterrupt(PAttacker);
    }
}

void CAIBattle::ResetIfTarget(CBaseEntity* PTarget)
{
    if (actionStateContainer && actionStateContainer->GetTarget() == PTarget)
    {
        actionStateContainer->Clear();
    }
}

bool CAIBattle::ShouldDisengage()
{
    return PBattleTarget->isDead();
}