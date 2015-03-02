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

#include "ai_automaton_dummy.h"

#include "../entities/automatonentity.h"
#include "../entities/mobentity.h"
#include "../entities/petentity.h"

#include "../packets/pet_sync.h"

#include "../utils/battleutils.h"
#include "../utils/charutils.h"
#include "../utils/puppetutils.h"

CAIAutomatonDummy::CAIAutomatonDummy(CPetEntity* PPet)
    : CAIPetDummy(PPet)
{
    DSP_DEBUG_BREAK_IF(PPet->getPetType() != PETTYPE_AUTOMATON);

    CAutomatonEntity* PAutomaton = (CAutomatonEntity*)PPet;
}

void CAIAutomatonDummy::CheckCurrentAction(uint32 tick)
{
    m_Tick = tick;

    CBattleEntity* PSelf = m_PPet;

    switch (m_ActionType)
    {
    case ACTION_NONE:							                    break;
    case ACTION_ROAMING:	            ActionRoaming();	        break;
    case ACTION_DEATH:		            ActionDeath();		        break;
    case ACTION_SPAWN:		            ActionSpawn();		        break;
    case ACTION_FALL:		            ActionFall();		        break;
    case ACTION_ENGAGE:		            ActionEngage();		        break;
    case ACTION_ATTACK:		            ActionAttack();		        break;
    case ACTION_SLEEP:		            ActionSleep();		        break;
    case ACTION_DISENGAGE:	            ActionDisengage();	        break;
    case ACTION_MOBABILITY_START:	    ActionAbilityStart();	    break;
    case ACTION_MOBABILITY_USING:       ActionAbilityUsing();       break;
    case ACTION_MOBABILITY_FINISH:      ActionAbilityFinish();      break;
    case ACTION_MOBABILITY_INTERRUPT:   ActionAbilityInterrupt();   break;
    case ACTION_MAGIC_START:            ActionMagicStart();         break;
    case ACTION_MAGIC_CASTING:          ActionMagicCasting();       break;
    case ACTION_MAGIC_FINISH:           ActionMagicFinish();        break;

    default: DSP_DEBUG_BREAK_IF(true);
    }

    //check if this AI was replaced (the new AI will update if this is the case)
    if (m_PPet && PSelf->PBattleAI == this)
    {
        m_PPet->UpdateEntity();
    }
}

void CAIAutomatonDummy::ActionFall()
{
    m_PPet->PMaster->StatusEffectContainer->RemoveAllManeuvers();
    CAIPetDummy::ActionFall();
}

void CAIAutomatonDummy::ActionAttack()
{
    if (m_PPet->PMaster == NULL || m_PPet->PMaster->isDead() || m_PPet->isDead()){
        m_ActionType = ACTION_FALL;
        ActionFall();
        return;
    }

    //disengage a target that is dead or charmed
    if ((m_PBattleTarget == NULL || m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO) ||
        (m_PBattleTarget != NULL && m_PBattleTarget->objtype == TYPE_MOB && 
        m_PBattleTarget->PMaster != NULL && m_PBattleTarget->PMaster->objtype == TYPE_PC))
    {
        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }

    m_PPathFind->LookAt(m_PBattleTarget->loc.p);

    float currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);

    if (CheckSpellcast())
    {
        m_ActionType = ACTION_MAGIC_START;
        ActionMagicStart();
        return;
    }
    else if (CheckTPMove())
    {
        m_ActionType = ACTION_MOBABILITY_START;
        ActionAbilityStart();
        return;
    }
    else if (CheckRangedAttack())
    {
        m_ActionType = ACTION_MOBABILITY_FINISH;
        ActionAbilityFinish();
        return;
    }

    //go to target if its too far away
    if (currentDistance > m_PBattleTarget->m_ModelSize && m_PPet->speed != 0)
    {
        if (m_PPathFind->PathAround(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();

            // recalculate
            currentDistance = distance(m_PPet->loc.p, m_PBattleTarget->loc.p);
        }
    }

    if (currentDistance <= m_PBattleTarget->m_ModelSize)
    {
        int32 WeaponDelay = m_PPet->m_Weapons[SLOT_MAIN]->getDelay();
        //try to attack
        if (m_Tick > m_LastActionTime + WeaponDelay){
            if (battleutils::IsParalyzed(m_PPet))
            {
                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet, m_PBattleTarget, 0, 0, 29));
            }
            else if (battleutils::IsIntimidated(m_PPet, m_PBattleTarget))
            {
                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet, m_PBattleTarget, 0, 0, 106));
            }
            else
            {
                apAction_t Action;
                m_PPet->m_ActionList.clear();

                Action.ActionTarget = m_PBattleTarget;

                uint8 numAttacks = battleutils::CheckMultiHits(m_PPet, m_PPet->m_Weapons[SLOT_MAIN]);

                for (uint8 i = 0; i<numAttacks; i++){
                    Action.reaction = REACTION_EVADE;
                    Action.speceffect = SPECEFFECT_NONE;
                    Action.animation = 0;
                    Action.param = 0;
                    Action.messageID = 15;
                    Action.knockback = 0;
                    //ShowDebug("pet hp %i and atk %i def %i eva is %i \n",m_PPet->health.hp,m_PPet->ATT(),m_PPet->DEF(),m_PPet->getMod(MOD_EVA));
                    int32 damage = 0;

                    if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
                    {
                        Action.messageID = 32;
                    }
                    else if ((WELL512::irand() % 100 < battleutils::GetHitRate(m_PPet, m_PBattleTarget)) &&
                        !m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
                    {
                        if (battleutils::IsAbsorbByShadow(m_PBattleTarget))
                        {
                            Action.messageID = 31;
                            Action.param = 1;
                            Action.reaction = REACTION_EVADE;
                        }
                        else
                        {
                            Action.reaction = REACTION_HIT;
                            Action.speceffect = SPECEFFECT_HIT;
                            Action.messageID = 1;

                            bool isCritical = (WELL512::irand() % 100 < battleutils::GetCritHitRate(m_PPet, m_PBattleTarget, false));
                            float DamageRatio = battleutils::GetDamageRatio(m_PPet, m_PBattleTarget, isCritical, 0);

                            if (isCritical)
                            {
                                Action.speceffect = SPECEFFECT_CRITICAL_HIT;
                                Action.messageID = 67;
                            }

                            damage = (int32)((m_PPet->GetMainWeaponDmg() + battleutils::GetFSTR(m_PPet, m_PBattleTarget, SLOT_MAIN)) * DamageRatio);
                        }
                    }
                    else
                    {
                        // create enmity even on misses
                        if (m_PBattleTarget->objtype == TYPE_MOB){
                            CMobEntity* PMob = (CMobEntity*)m_PBattleTarget;
                            PMob->PEnmityContainer->UpdateEnmity(m_PPet, 0, 0);
                        }
                    }

                    if (m_PBattleTarget->objtype == TYPE_PC)
                    {
                        charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PPet->GetMLevel());
                    }

                    if (m_PPet->PMaster && m_PPet->PMaster->objtype == TYPE_PC)
                    {
                        puppetutils::TrySkillUP((CAutomatonEntity*)m_PPet, SKILL_AME, m_PBattleTarget->GetMLevel());
                    }

                    bool isBlocked = (WELL512::irand() % 100 < battleutils::GetBlockRate(m_PPet, m_PBattleTarget));
                    if (isBlocked){ Action.reaction = REACTION_BLOCK; }


                    Action.param = battleutils::TakePhysicalDamage(m_PPet, m_PBattleTarget, damage, isBlocked, SLOT_MAIN, 1, NULL, true, true);
                    if (Action.param < 0)
                    {
                        Action.param = -(Action.param);
                        Action.messageID = 373;
                    }

                    // spike effect
                    if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
                    {

                        battleutils::HandleEnspell(m_PPet, m_PBattleTarget, &Action, i, m_PPet->m_Weapons[SLOT_MAIN], damage);
                        battleutils::HandleSpikesDamage(m_PPet, m_PBattleTarget, &Action, damage);
                    }

                    m_PPet->m_ActionList.push_back(Action);
                }

                m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

                if (m_PPet->PMaster != NULL && m_PPet->PMaster->objtype == TYPE_PC && m_PPet->PMaster->PPet != NULL){
                    ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)m_PPet->PMaster));
                }
            }
            m_LastActionTime = m_Tick;

            // Update the targets attacker level..
            CMobEntity* Monster = (CMobEntity*)m_PBattleTarget;
            if (Monster->m_HiPCLvl < ((CCharEntity*)m_PPet->PMaster)->GetMLevel())
                Monster->m_HiPCLvl = ((CCharEntity*)m_PPet->PMaster)->GetMLevel();
        }
    }
}

bool CAIAutomatonDummy::CheckSpellcast()
{
    return false;
}

bool CAIAutomatonDummy::CheckTPMove()
{
    return false;
}

bool CAIAutomatonDummy::CheckRangedAttack()
{
    return false;
}