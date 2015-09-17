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

#include "../utils/battleutils.h"
#include "../utils/attackutils.h"
#include "../utils/charutils.h"
#include "../entities/charentity.h"
#include "../entities/petentity.h"
#include "../zone.h"
#include "../attack.h"
#include "../attackround.h"
#include "../mobskill.h"
#include "../utils/petutils.h"

#include "../lua/luautils.h"

#include "../packets/entity_update.h"
#include "../packets/action.h"
#include "../packets/char_update.h"
#include "../packets/pet_sync.h"
#include "../packets/message_basic.h"
#include "../entities/mobentity.h"

#include "states/magic_state.h"

#include "../alliance.h"
#include "ai_ultimate_summon.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CAIUltimateSummon::CAIUltimateSummon(CPetEntity* PPet)
    : CAIPetDummy(PPet)
{
    m_Timer = 0;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIUltimateSummon::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;

	switch(m_ActionType)
	{
		case ACTION_NONE:							break;
		case ACTION_ROAMING:	ActionRoaming();	break;
		case ACTION_DEATH:		ActionDeath();		break;
		case ACTION_SPAWN:		ActionSpawn();		break;
		case ACTION_FALL:		ActionFall();		break;
		case ACTION_ENGAGE:		ActionEngage();		break;
		case ACTION_ATTACK:		ActionAttack();		break;
		case ACTION_SLEEP:		ActionSleep();		break;
		case ACTION_MOBABILITY_START:	ActionAbilityStart();	break;
		case ACTION_MOBABILITY_USING: ActionAbilityUsing(); break;
		case ACTION_MOBABILITY_FINISH: ActionAbilityFinish(); break;
		case ACTION_MOBABILITY_INTERRUPT: ActionAbilityInterrupt(); break;

		default : DSP_DEBUG_BREAK_IF(true);
	}
    m_PPet->UpdateEntity();
}

void CAIUltimateSummon::ActionAbilityStart()
{
	if(m_PPet->StatusEffectContainer->HasPreventActionEffect())
	{
		return;
	}

    if (m_PPet->PetSkills[0])
    {
        auto PMobSkill = battleutils::GetMobSkill(m_PPet->PetSkills[0]);
        if (PMobSkill)
        {
            SetCurrentMobSkill(PMobSkill);
            preparePetAbility(m_PPet);
        }
	}
}

void CAIUltimateSummon::preparePetAbility(CBattleEntity* PTarg){
	if(m_PMobSkill!=nullptr){

		apAction_t Action;
		m_PPet->m_ActionList.clear();

		// find correct targe
		if(m_PMobSkill->getValidTargets() & TARGET_SELF)
		{ //self
		    m_PBattleSubTarget = m_PPet;
		}
		else if(m_PMobSkill->getValidTargets() & TARGET_PLAYER_PARTY)
		{
			m_PBattleSubTarget = m_PPet->PMaster;
		}
		else
		{
			if(m_PBattleTarget != nullptr)
			{
			    m_PBattleSubTarget = m_PBattleTarget;
			}
			DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);
		}

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;
		Action.speceffect = SPECEFFECT_HIT;
		Action.animation  = 0;
		Action.param	  = m_PMobSkill->getMsgForAction();
		Action.messageID  = 43; //readies message
        Action.knockback  = 0;

		m_PPet->health.tp = 0;
		m_skillTP = m_PPet->health.tp;

		m_PPet->m_ActionList.push_back(Action);
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

		m_LastActionTime = m_Tick;
		m_ActionType = ACTION_MOBABILITY_USING;
	}
	else{
		ShowWarning("ai_pet_dummy::ActionAbilityFinish Pet skill is NULL \n");
		TransitionBack(true);
	}
}

void CAIUltimateSummon::ActionAbilityUsing()
{
	DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr && m_PMobSkill->getValidTargets()==TARGET_ENEMY && m_PPet->getPetType()!=PETTYPE_AVATAR);

	if (m_PPet->objtype == TYPE_MOB)
	{
		if(m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
			m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			ActionAbilityInterrupt();
			return;
		}
	}
	else
	{
		if(m_PPet->getPetType()!=PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
			m_PPet->getPetType()!=PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			ActionAbilityInterrupt();
			return;
		}
		else if(m_PPet->getPetType()==PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead() ||
			m_PPet->getPetType()==PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			ActionAbilityInterrupt();
			return;
		}
		else if(m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY && m_PBattleSubTarget->isDead() ||
			m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY && m_PBattleSubTarget->getZone() != m_PPet->getZone()){
			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			ActionAbilityInterrupt();
			return;
		}
	}

	if(m_PPet != m_PBattleSubTarget)
	{

		// move towards target if i'm too far away
		float currentDistance = distance(m_PPet->loc.p, m_PBattleSubTarget->loc.p);

		//go to target if its too far away
		if (currentDistance > m_PMobSkill->getDistance() && m_PPathFind->PathTo(m_PBattleSubTarget->loc.p, PATHFLAG_RUN | PATHFLAG_WALLHACK))
		{
			m_PPathFind->FollowPath();
		}
		else
		{
			m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);
		}
	}

	//TODO: Any checks whilst the pet is preparing.
	//NOTE: RANGE CHECKS ETC ONLY ARE DONE AFTER THE ABILITY HAS FINISHED PREPARING.
	//      THE ONLY CHECK IN HERE SHOULD BE WITH STUN/SLEEP/TERROR/ETC

	if (m_Tick > m_LastActionTime + m_PMobSkill->getActivationTime())
    {
        if(m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget!=m_PPet &&
			distance(m_PBattleSubTarget->loc.p,m_PPet->loc.p) > m_PMobSkill->getDistance()){

			// Avatar's sub target is too far away (and isn't the avatar itself)
			SendTooFarInterruptMessage(m_PBattleSubTarget);
			return;
		}
		else if(m_PMobSkill->getValidTargets() == TARGET_PLAYER_PARTY &&
			distance(m_PBattleSubTarget->loc.p,m_PPet->loc.p) > m_PMobSkill->getDistance()){

			// Player in the pet's party is too far away
			SendTooFarInterruptMessage(m_PBattleSubTarget);
			return;
		}

		m_LastActionTime = m_Tick + 10000;
		m_ActionType = ACTION_MOBABILITY_FINISH;
		ActionAbilityFinish();
	}
}

void CAIUltimateSummon::ActionAbilityFinish(){
	DSP_DEBUG_BREAK_IF(m_PMobSkill == nullptr);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == nullptr);

	// reset AoE finder
    m_PTargetFind->reset();
    m_PPet->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();

    if(m_PTargetFind->isWithinRange(&m_PBattleSubTarget->loc.p, distance))
    {
	    if(m_PMobSkill->isAoE())
	    {
		    float radius = m_PMobSkill->getDistance();

	    	m_PTargetFind->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), distance);
	    }
	    else if(m_PMobSkill->isConal())
		{
			float angle = 45.0f;
			m_PTargetFind->findWithinCone(m_PBattleSubTarget, distance, angle);
		}
	    else
	    {
	    	m_PTargetFind->findSingleTarget(m_PBattleSubTarget);
	    }
	}

	uint16 totalTargets = m_PTargetFind->m_targets.size();
	//call the script for each monster hit
	m_PMobSkill->setTotalTargets(totalTargets);
	m_PMobSkill->setTP(m_skillTP);

	apAction_t Action;
	Action.ActionTarget = nullptr;
	Action.reaction   = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation  = m_PMobSkill->getAnimationID();
    Action.knockback  = 0;

	uint16 msg = 0;
	for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin() ; it != m_PTargetFind->m_targets.end(); ++it)
	{

		CBattleEntity* PTarget = *it;

		Action.ActionTarget = PTarget;

		Action.param = luautils::OnPetAbility(PTarget, m_PPet, GetCurrentMobSkill(), m_PPet->PMaster);

		if(msg == 0){
			msg = m_PMobSkill->getMsg();
		} else {
			msg = m_PMobSkill->getAoEMsg();
		}

		Action.messageID = msg;

        battleutils::ClaimMob(m_PBattleSubTarget, m_PPet);

        if(PTarget->objtype == TYPE_MOB && !m_PTargetFind->checkIsPlayer(PTarget) && m_PMobSkill->isDamageMsg())
        {
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmityFromDamage(m_PPet, Action.param);
        }

		m_PPet->m_ActionList.push_back(Action);
	}

	m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

	if(Action.ActionTarget!=nullptr){ //todo: remove pet type avatar maybe
		Action.ActionTarget->loc.zone->PushPacket(Action.ActionTarget, CHAR_INRANGE, new CEntityUpdatePacket(Action.ActionTarget, ENTITY_UPDATE, UPDATE_COMBAT));
	}

    if (m_PPet->PMaster)
    {
        m_PPet->PMaster->StatusEffectContainer->DelStatusEffect(EFFECT_ASTRAL_FLOW);
        m_PPet->PMaster->addMP(-m_PPet->PMaster->health.mp);
    }

	m_PBattleSubTarget = nullptr;
	m_ActionType = ACTION_ATTACK;
}

void CAIUltimateSummon::ActionAbilityInterrupt(){
	m_LastActionTime = m_Tick + 10000;
	//cancel the whole readying animation
	apAction_t Action;
    m_PPet->m_ActionList.clear();

		Action.ActionTarget = m_PPet;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_NONE;
		Action.animation  = 0;
	    Action.param	  = 0;
		Action.messageID  = 0;
        Action.knockback  = 0;

		m_PPet->m_ActionList.push_back(Action);
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

    m_PMobSkill = nullptr;
    m_ActionType = ACTION_ATTACK;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIUltimateSummon::ActionRoaming()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead() || m_Tick > m_Timer + 10000){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

    if (m_Tick > m_LastActionTime)
    {
        m_ActionType = ACTION_MOBABILITY_START;
    }
}

void CAIUltimateSummon::ActionEngage()
{
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == nullptr);

	if( m_PPet->PMaster==nullptr || m_PPet->PMaster->isDead())
	{
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	bool hasClaim = false;

	if(m_PBattleTarget->m_OwnerID.id == m_PPet->PMaster->id)
		hasClaim = true;

	if(m_PBattleTarget->m_OwnerID.id == 0)
		hasClaim = true;


	if(m_PPet->PMaster->PParty != nullptr)
	{
		// alliance
		if (m_PPet->PMaster->PParty->m_PAlliance != nullptr)
		{
			for (uint8 a = 0; a < m_PPet->PMaster->PParty->m_PAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < m_PPet->PMaster->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
				{
					if (m_PPet->PMaster->PParty->m_PAlliance->partyList.at(a)->members[i]->id == m_PBattleTarget->m_OwnerID.id)
						hasClaim = true;
				}
			}
		}
		else  // party
			for (uint8 i = 0; i < m_PPet->PMaster->PParty->members.size(); ++i)
			{
				if (m_PPet->PMaster->PParty->members[i]->id == m_PBattleTarget->m_OwnerID.id)
					hasClaim = true;
			}
	}


	if(hasClaim)
	{
		m_PPet->animation = ANIMATION_ATTACK;
		m_LastActionTime = m_Tick - 1000;
        m_PPet->updatemask |= UPDATE_HP;
		TransitionBack(true);
	}
	else
	{
		m_PPet->animation = ANIMATION_NONE;
        m_PPet->updatemask |= UPDATE_HP;
		if(m_PPet->PMaster->objtype == TYPE_PC)
		{
			((CCharEntity*)m_PPet->PMaster)->pushPacket(new CMessageBasicPacket(((CCharEntity*)m_PPet->PMaster),
				((CCharEntity*)m_PPet->PMaster),0,0,12));
			m_ActionType = ACTION_ROAMING;
			return;
		}
	}

}


void CAIUltimateSummon::ActionAttack()
{
    if (m_PPet->PMaster == nullptr || m_PPet->PMaster->isDead() || m_PPet->isDead() || m_Tick > m_Timer + 10000){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	//handle death of target
    if (m_PBattleTarget == nullptr || m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO)
	{
        m_ActionType = ACTION_ROAMING;
        ActionRoaming();
		return;
	}

	m_PPathFind->LookAt(m_PBattleTarget->loc.p);

    if (m_Tick > m_LastActionTime)
    {
        m_ActionType = ACTION_MOBABILITY_START;
    }
}

void CAIUltimateSummon::ActionSleep()
{
    if (!m_PPet->StatusEffectContainer->HasPreventActionEffect())
    {
    	TransitionBack();
    }
}

void CAIUltimateSummon::ActionDisengage()
{
	if( m_PPet->PMaster==nullptr || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	m_queueSic = false;
	m_PPet->animation = ANIMATION_NONE;
	m_LastActionTime = m_Tick;
	m_PBattleTarget  = nullptr;
	TransitionBack();
    m_PPet->updatemask |= UPDATE_HP;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIUltimateSummon::ActionFall()
{
	if(m_PPet->PMaster->objtype == TYPE_PC && distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) >= 50){
		//master won't get this fall packet, so send it directly
        ((CCharEntity*)m_PPet->PMaster)->pushPacket(new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE, UPDATE_ALL_MOB));
	}

	m_LastActionTime = m_Tick;
	m_PPet->health.hp = 0;
	m_ActionType = ACTION_DEATH;
}

void CAIUltimateSummon::ActionDeath()
{
	if(m_Tick > m_LastActionTime + 3000){
		m_PPet->status = STATUS_DISAPPEAR;
        m_PPet->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DEATH, true);

		if(m_PPet->PMaster!=nullptr){
			if(m_PPet->PMaster->objtype == TYPE_PC && distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) >= 50){
				//master won't get this despawn packet, so send it directly
				((CCharEntity*)m_PPet->PMaster)->pushPacket(new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN, UPDATE_NONE));
			}
			m_PPet->PMaster->PPet = nullptr;
		}
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN, UPDATE_NONE));
		if (m_PPet->PMaster != nullptr && m_PPet->PMaster->objtype == TYPE_PC)
		{
			((CCharEntity*)m_PPet->PMaster)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PPet->PMaster));
		}

		m_ActionType = ACTION_NONE;
	}
}


/************************************************************************
*																		*
*  При появлении питомца задержка в 4.5 секунды перед началом			*
*  следования за персонажем. Состояние может быть перезаписано.			*
*																		*
************************************************************************/

void CAIUltimateSummon::ActionSpawn()
{
	if( m_PPet->PMaster==nullptr || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	if (m_Tick > m_LastActionTime + 3500)
	{
        m_Timer = m_Tick;
		m_ActionType = ACTION_ROAMING;
	}
}

void CAIUltimateSummon::TransitionBack(bool skipWait)
{

	if(m_PPet->animation == ANIMATION_ATTACK)
	{
		m_ActionType = ACTION_ATTACK;
		if(skipWait)
		{
			ActionAttack();
		}
	}
	else
	{
		m_ActionType = ACTION_ROAMING;
		if(skipWait)
		{
			ActionRoaming();
		}
	}
}
