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

#include "../battleutils.h"
#include "../charutils.h"
#include "../charentity.h"
#include "../petentity.h"
#include "../zone.h"
#include "../mobskill.h"
#include "../petutils.h"
#include "../targetfinder.h"

#include "../lua/luautils.h"

#include "../packets/entity_update.h"
#include "../packets/action.h"
#include "../packets/char_update.h"
#include "../packets/pet_sync.h"
#include "../packets/message_basic.h"
#include "../mobentity.h"

#include "../alliance.h"
#include "ai_pet_dummy.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CAIPetDummy::CAIPetDummy(CPetEntity* PPet)
{
	m_PPet = PPet;
    m_PTargetFinder = new CTargetFinder(PPet);
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIPetDummy::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;


	//uncharm any pets if time is up
	if(tick > m_PPet->charmTime && m_PPet->isCharmed)
	{
		petutils::DespawnPet(m_PPet->PMaster);
		return;
	}

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
		case ACTION_DISENGAGE:	ActionDisengage();	break;
		case ACTION_MOBABILITY_START:	ActionAbilityStart();	break;
		case ACTION_MOBABILITY_USING: ActionAbilityUsing(); break;
		case ACTION_MOBABILITY_FINISH: ActionAbilityFinish(); break;
		case ACTION_MOBABILITY_INTERRUPT: ActionAbilityInterrupt(); break;

		default : DSP_DEBUG_BREAK_IF(true);
	}
}

void CAIPetDummy::ActionAbilityStart()
{
	if(m_PPet->StatusEffectContainer->HasPreventActionEffect())
	{
		m_ActionType = ACTION_SLEEP;
		return;
	}

	if(m_PPet->objtype == TYPE_MOB && m_PPet->PMaster->objtype == TYPE_PC)
	{
		if(m_MasterCommand == MASTERCOMMAND_SIC && m_PPet->health.tp >= 100 && m_PBattleTarget != NULL)
		{
			m_MasterCommand = MASTERCOMMAND_NONE;
			CMobEntity* PMob = (CMobEntity*)m_PPet->PMaster->PPet;
			std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(PMob->m_Family);

			if(MobSkills.size() > 0)
			{
				int maxSearch = 10;
				// keep looking for an ability until one is valid
				do {
					m_PMobSkill = MobSkills.at(rand() % MobSkills.size());
				} while(luautils::OnMobSkillCheck(m_PBattleTarget, m_PPet, m_PMobSkill) != 0 && maxSearch--);

				// could not find skill
				if(maxSearch == 0)
				{
					m_ActionType = ACTION_ATTACK;
					ActionAttack();
					return;
				}

				preparePetAbility(m_PBattleTarget);
				return;
			}
			return;
		}
	}


	if(m_PPet->getPetType()==PETTYPE_JUGPET){
		if(m_MasterCommand==MASTERCOMMAND_SIC && m_PPet->health.tp>=100 && m_PBattleTarget!=NULL){ //choose random tp move
			m_MasterCommand = MASTERCOMMAND_NONE;
			if(m_PPet->PetSkills.size()>0){
				m_PMobSkill = m_PPet->PetSkills.at(rand() % m_PPet->PetSkills.size());
				preparePetAbility(m_PBattleTarget);
				return;
			}
		}
	}
	else if(m_PPet->getPetType()==PETTYPE_AVATAR){
		for(int i=0; i<m_PPet->PetSkills.size(); i++){
			if(m_PPet->PetSkills[i]->getAnimationTime() == m_MasterCommand){
				m_PMobSkill = m_PPet->PetSkills[i];
				m_MasterCommand = MASTERCOMMAND_NONE;
				preparePetAbility(m_PPet);
				return;
			}
		}
		m_MasterCommand = MASTERCOMMAND_NONE;
	}
	else if(m_PPet->getPetType()==PETTYPE_WYVERN){

		WYVERNTYPE wyverntype = m_PPet->getWyvernType();

		if(m_MasterCommand==MASTERCOMMAND_ELEMENTAL_BREATH && (wyverntype == WYVERNTYPE_MULTIPURPOSE || WYVERNTYPE_OFFENSIVE)){
			m_MasterCommand = MASTERCOMMAND_NONE;

			//offensive or multipurpose wyvern
			if(m_PBattleTarget != NULL){ //prepare elemental breaths
				int skip = rand()%6;
				int hasSkipped = 0;

				for(int i=0; i<m_PPet->PetSkills.size(); i++){
					if(m_PPet->PetSkills[i]->getValidTargets() == TARGET_ENEMY){
						if(hasSkipped == skip){
							m_PMobSkill = m_PPet->PetSkills[i];
							break;
						}
						else{
							hasSkipped++;
						}
					}
				}

				preparePetAbility(m_PBattleTarget);
				return;
			}

		}
		else if(m_MasterCommand==MASTERCOMMAND_HEALING_BREATH && (wyverntype == WYVERNTYPE_DEFENSIVE || wyverntype == WYVERNTYPE_MULTIPURPOSE))
		{

			m_MasterCommand = MASTERCOMMAND_NONE;
			m_PBattleSubTarget = NULL;
			//TODO: CHECK FOR STATUS EFFECTS FOR REMOVE- BREATH (higher priority than healing breaths)

		//	if(m_PPet->PMaster->PParty==NULL){//solo with master-kun
			uint16 masterHead = ((CCharEntity*)(m_PPet->PMaster))->getStorage(LOC_INVENTORY)->GetItem(((CCharEntity*)(m_PPet->PMaster))->equip[SLOT_HEAD])->getID();

			if(((CCharEntity*)(m_PPet->PMaster))->objtype == TYPE_PC && (masterHead == 12519 || masterHead == 15238)) { //Check for player & AF head, or +1
				if(m_PPet->PMaster->GetHPP() <= 50 && wyverntype == WYVERNTYPE_DEFENSIVE){//healer wyvern
					m_PBattleSubTarget = m_PPet->PMaster;
				}
				else if(m_PPet->PMaster->GetHPP() <= 33 && wyverntype == WYVERNTYPE_MULTIPURPOSE){//hybrid wyvern
					m_PBattleSubTarget = m_PPet->PMaster;
				}
			} else {
				if(m_PPet->PMaster->GetHPP() <= 33 && wyverntype == WYVERNTYPE_DEFENSIVE)
				{//healer wyvern
					m_PBattleSubTarget = m_PPet->PMaster;
				}
				else if(m_PPet->PMaster->GetHPP() <= 25 && wyverntype == WYVERNTYPE_MULTIPURPOSE)
				{//hybrid wyvern
					m_PBattleSubTarget = m_PPet->PMaster;
				}
			}
		//	}
		//	else{ //group play
		//		//for( int i=0; i<
		//	}
			if(m_PBattleSubTarget != NULL){ //target to heal
				//get highest breath for wyverns level
				m_PMobSkill = NULL;
				for(int i=0; i<m_PPet->PetSkills.size(); i++){
					if(m_PPet->PetSkills[i]->getValidTargets() == TARGET_PLAYER_PARTY){
						if(m_PPet->PetSkills[i]->getID()==638 &&
							m_PPet->PMaster->GetMLevel() < 20){ //can only using hb1
								m_PMobSkill = m_PPet->PetSkills[i];
								break;
						}
						else if(m_PPet->PetSkills[i]->getID()==639 &&
							m_PPet->PMaster->GetMLevel() < 40){ //can only using hb2
								m_PMobSkill = m_PPet->PetSkills[i];
								break;
						}
						else if(m_PPet->PetSkills[i]->getID()==640 &&
							m_PPet->PMaster->GetMLevel() >= 40){ //can only using hb3
								m_PMobSkill = m_PPet->PetSkills[i];
								break;
						}
					}
				}
				preparePetAbility(m_PBattleSubTarget);
				return;
			}
		}
	}
	m_ActionType = ACTION_ATTACK;
	ActionAttack();
}

void CAIPetDummy::preparePetAbility(CBattleEntity* PTarg){
	if(m_PMobSkill!=NULL){

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
			if(m_PBattleTarget != NULL)
			{
			    m_PBattleSubTarget = m_PBattleTarget;
			}
			DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);
			battleutils::MoveIntoRange(m_PPet, m_PBattleSubTarget, 25);
		}

		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;
		Action.speceffect = SPECEFFECT_HIT;
		Action.animation  = 0;
		Action.param	  = m_PMobSkill->getMsgForAction();
		Action.messageID  = 43; //readies message
		Action.flag		  = 0;


		m_PPet->health.tp = 0;
		m_skillTP = m_PPet->health.tp;

		m_PPet->m_ActionList.push_back(Action);
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

		m_LastActionTime = m_Tick;
		m_ActionType = ACTION_MOBABILITY_USING;
	}
	else{
		ShowWarning("ai_pet_dummy::ActionAbilityFinish Pet skill is null \n");
		m_ActionType = ACTION_ATTACK;
		ActionAttack();
	}
}

void CAIPetDummy::ActionAbilityUsing()
{
	DSP_DEBUG_BREAK_IF(m_PMobSkill == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL && m_PMobSkill->getValidTargets()==TARGET_ENEMY && m_PPet->getPetType()!=PETTYPE_AVATAR);

	if (m_PPet->objtype == TYPE_MOB)
	{
		if(m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget->isDead() ||
			m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget->getZone() != m_PPet->getZone()){
			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			ActionAbilityInterrupt();
			return;
		}
	}
	else
	{
		if(m_PPet->getPetType()!=PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget->isDead() ||
			m_PPet->getPetType()!=PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget->getZone() != m_PPet->getZone()){
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

	//TODO: Any checks whilst the pet is preparing.
	//NOTE: RANGE CHECKS ETC ONLY ARE DONE AFTER THE ABILITY HAS FINISHED PREPARING.
	//      THE ONLY CHECK IN HERE SHOULD BE WITH STUN/SLEEP/TERROR/ETC

	if ((m_Tick - m_LastActionTime) > m_PMobSkill->getActivationTime())
    {
		//Range check
		if (m_PPet->objtype == TYPE_MOB)
		{
			if(m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget!=m_PPet &&
				distance(m_PBattleTarget->loc.p,m_PPet->loc.p) > m_PMobSkill->getDistance()){

				// Pet's target is too far away (and isn't itself)
				SendTooFarInterruptMessage(m_PBattleTarget);
				return;
			}
		}
		else
		{
			if(m_PPet->getPetType()!=PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
				m_PBattleTarget!=m_PPet &&
				distance(m_PBattleTarget->loc.p,m_PPet->loc.p) > m_PMobSkill->getDistance()){

				// Avatar's target is too far away (and isn't the avatar itself)
				SendTooFarInterruptMessage(m_PBattleTarget);
				return;
			}
			else if(m_PPet->getPetType()==PETTYPE_AVATAR && m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
				m_PBattleSubTarget!=m_PPet &&
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
		}

		m_LastActionTime = m_Tick;
		m_ActionType = ACTION_MOBABILITY_FINISH;
		ActionAbilityFinish();
	}
}

void CAIPetDummy::ActionAbilityFinish(){
	DSP_DEBUG_BREAK_IF(m_PMobSkill == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	// reset AoE finder
    m_PTargetFinder->reset();
    m_PPet->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();

    if(m_PTargetFinder->isWithinRange(m_PBattleSubTarget, distance))
    {
	    if(m_PMobSkill->isAoE())
	    {
		    float radius = m_PMobSkill->getDistance();

	    	m_PTargetFinder->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), distance);
	    }
	    else if(m_PMobSkill->isConal())
		{
			float angle = 45.0f;
			m_PTargetFinder->findWithinCone(m_PBattleSubTarget, distance, angle);
		}
	    else
	    {
	    	m_PTargetFinder->findSingleTarget(m_PBattleSubTarget);
	    }
	}

	uint16 totalTargets = m_PTargetFinder->m_targets.size();
	//call the script for each monster hit
	m_PMobSkill->setTotalTargets(totalTargets);
	m_PMobSkill->setTP(m_skillTP);

	apAction_t Action;
	Action.ActionTarget = NULL;
	Action.reaction   = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation  = m_PMobSkill->getAnimationID();
	Action.subparam   = m_PMobSkill->getMsgForAction();
	Action.flag       = 0;

	uint16 msg = 0;
	for (std::vector<CBattleEntity*>::iterator it = m_PTargetFinder->m_targets.begin() ; it != m_PTargetFinder->m_targets.end(); ++it)
	{

		CBattleEntity* PTarget = *it;

		Action.ActionTarget = PTarget;

		m_PMobSkill->resetMsg();

		if(m_PPet->isBstPet()){
			Action.param = luautils::OnMobWeaponSkill(PTarget, m_PPet, m_PMobSkill);
		} else {
			Action.param = luautils::OnPetAbility(PTarget, m_PPet, m_PMobSkill, m_PPet->PMaster);
		}

		if(msg == 0){
			msg = m_PMobSkill->getMsg();
		} else {
			msg = m_PMobSkill->getAoEMsg();
		}

		Action.messageID = msg;

		m_PPet->m_ActionList.push_back(Action);
	}

	m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

	m_PBattleSubTarget = NULL;
	m_ActionType = ACTION_ATTACK;
	if(Action.ActionTarget!=NULL && m_PPet->getPetType()==PETTYPE_AVATAR){ //todo: remove pet type avatar maybe
		Action.ActionTarget->loc.zone->PushPacket(Action.ActionTarget,CHAR_INRANGE,new CEntityUpdatePacket(Action.ActionTarget,ENTITY_UPDATE));
		m_PPet->loc.zone->PushPacket(m_PPet,CHAR_INRANGE,new CEntityUpdatePacket(m_PPet,ENTITY_UPDATE));
	}
}

void CAIPetDummy::ActionAbilityInterrupt(){
	m_LastActionTime = m_Tick;
	//cancel the whole readying animation
	apAction_t Action;
    m_PPet->m_ActionList.clear();

		Action.ActionTarget = m_PPet;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_NONE;
		Action.animation  = m_PMobSkill->getID();
	    Action.param	  = 0;
		Action.messageID  = 0;
        Action.flag       = 0;

	m_PPet->m_ActionList.push_back(Action);
	m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));

	m_PPet->health.tp = 0;
    m_PMobSkill = NULL;
    m_ActionType = ACTION_ATTACK;
}

bool CAIPetDummy::WyvernIsHealing(){
	DSP_DEBUG_BREAK_IF(m_PPet->getPetType() != PETTYPE_WYVERN);

	bool isMasterHealing = (m_PPet->PMaster->animation == ANIMATION_HEALING);
	bool isPetHealing = (m_PPet->animation == ANIMATION_HEALING);

	if(isMasterHealing && !isPetHealing && !m_PPet->StatusEffectContainer->HasPreventActionEffect()){
		//animation down
		m_PPet->animation = ANIMATION_HEALING;
		m_PPet->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING,0,0,10,0));
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
		return true;
	}
	else if(!isMasterHealing && isPetHealing){
		//animation up
		m_PPet->animation = ANIMATION_NONE;
		m_PPet->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
		return false;
	}
	return isMasterHealing;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionRoaming()
{
	if( m_PPet->PMaster==NULL || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	//wyvern behaviour
	if(m_PPet->getPetType()==PETTYPE_WYVERN){
		//see if master is engaged on something, if so, help attack
		if(m_PPet->PMaster->PBattleAI->GetBattleTarget()!=NULL){
			m_PBattleTarget = m_PPet->PMaster->PBattleAI->GetBattleTarget();
		}
		if(WyvernIsHealing()){
			m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
			if(m_PPet->PMaster->objtype == TYPE_PC){
				((CCharEntity*)m_PPet->PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)m_PPet->PMaster));
			}
			return;
		}
	}

	if(m_PBattleTarget!=NULL){
		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
	}
	else if (distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) > 3)
	{
		m_PPet->loc.p.rotation = getangle(m_PPet->loc.p, m_PPet->PMaster->loc.p);

		battleutils::MoveTo(m_PPet, m_PPet->PMaster->loc.p, 2);

        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
	}
}

void CAIPetDummy::ActionEngage()
{

	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

	if(m_PPet->StatusEffectContainer->HasPreventActionEffect())
	{
		m_ActionType = ACTION_SLEEP;
		return;
	}

	if( m_PPet->PMaster==NULL || m_PPet->PMaster->isDead())
	{
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	bool hasClaim = false;

	if(m_PBattleTarget->m_OwnerID.id == m_PPet->PMaster->id)
		hasClaim = true;

	if(m_PBattleTarget->m_OwnerID.id == NULL)
		hasClaim = true;


	if(m_PPet->PMaster->PParty != NULL)
	{
		// alliance
		if (m_PPet->PMaster->PParty->m_PAlliance != NULL)
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
		battleutils::MoveTo(m_PPet, m_PBattleTarget->loc.p, 2);

		m_PPet->animation = ANIMATION_ATTACK;
		m_ActionType = ACTION_ATTACK;
		m_LastActionTime = m_Tick - 4000;
		ActionAttack();
	}
	else
	{
		if(m_PPet->PMaster->objtype == TYPE_PC)
		{
			((CCharEntity*)m_PPet->PMaster)->pushPacket(new CMessageBasicPacket(((CCharEntity*)m_PPet->PMaster),
				((CCharEntity*)m_PPet->PMaster),0,0,12));
			m_ActionType = ACTION_DISENGAGE;
			return;
		}
	}

}


void CAIPetDummy::ActionAttack()
{

	if( m_PPet->PMaster==NULL || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}


	//if 2 bsts are in party, make sure their pets cannot fight eachother
	if (m_PBattleTarget != NULL && m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->PMaster != NULL && m_PBattleTarget->PMaster->objtype == TYPE_PC)
	{
		m_PPet->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
	}


	//wyvern behaviour
	if(m_PPet->getPetType()==PETTYPE_WYVERN && m_PPet->PMaster->PBattleAI->GetBattleTarget()==NULL){
		m_PBattleTarget = NULL;
	}

	//handle death of target
    if (m_PBattleTarget == NULL || m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO)
	{
        m_ActionType = ACTION_DISENGAGE;
		return;
	}

	m_PPet->loc.p.rotation = getangle(m_PPet->loc.p, m_PBattleTarget->loc.p);

	//go to target if its too far away
	if (distance(m_PPet->loc.p, m_PBattleTarget->loc.p) > m_PBattleTarget->m_ModelSize)
	{
		battleutils::MoveTo(m_PPet, m_PBattleTarget->loc.p, 2);
        m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
	}
	else{
		//try to attack
		if((m_Tick - m_LastActionTime) > m_PPet->m_Weapons[SLOT_MAIN]->getDelay()){
			if (battleutils::IsParalised(m_PPet))
			{
				m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet,m_PBattleTarget,0,0,29));
			}
			else if (battleutils::IsIntimidated(m_PPet, m_PBattleTarget))
			{
				m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CMessageBasicPacket(m_PPet,m_PBattleTarget,0,0,106));
			}
			else
			{
				apAction_t Action;
                m_PPet->m_ActionList.clear();

				Action.ActionTarget = m_PBattleTarget;

				uint8 numAttacks = battleutils::CheckMultiHits(m_PPet, m_PPet->m_Weapons[SLOT_MAIN]);

				for(uint8 i=0; i<numAttacks; i++){
				Action.reaction   = REACTION_EVADE;
				Action.speceffect = SPECEFFECT_NONE;
				Action.animation  = 0;
				Action.param	  = 0;
				Action.messageID  = 15;
				Action.flag		  = 0;
				//ShowDebug("pet hp %i and atk %i def %i eva is %i \n",m_PPet->health.hp,m_PPet->ATT(),m_PPet->DEF(),m_PPet->getMod(MOD_EVA));
				uint16 damage = 0;

				if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
				{
					Action.messageID = 32;
				}
				else if ( rand()%100 < battleutils::GetHitRate(m_PPet, m_PBattleTarget) )
				{
                    if (battleutils::IsAbsorbByShadow(m_PBattleTarget))
					{
                        Action.messageID = 0;
                        Action.reaction = REACTION_EVADE;
                        m_PBattleTarget->loc.zone->PushPacket(m_PBattleTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget,m_PBattleTarget,0,1,31));
					}
					else
					{
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_HIT;
						Action.messageID  = 1;

						bool isCritical = ( rand()%100 < battleutils::GetCritHitRate(m_PPet, m_PBattleTarget, false) );
						float DamageRatio = battleutils::GetDamageRatio(m_PPet, m_PBattleTarget,isCritical, 0);

						if(isCritical)
						{
							DamageRatio += 1;
							DamageRatio = (DamageRatio > 3 ? 3 : DamageRatio);

							Action.speceffect = SPECEFFECT_CRITICAL_HIT;
							Action.messageID  = 67;
						}
						damage = (uint16)((m_PPet->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(m_PPet, m_PBattleTarget,SLOT_MAIN)) * DamageRatio);
					}
				}
				if (m_PBattleTarget->objtype == TYPE_PC)
				{
					charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PPet->GetMLevel());
				}

				bool isBlocked = (rand()%100 < battleutils::GetBlockRate(m_PPet,m_PBattleTarget));
				if(isBlocked){ Action.reaction = REACTION_BLOCK; }

                Action.param = battleutils::TakePhysicalDamage(m_PPet, m_PBattleTarget, damage, isBlocked, SLOT_MAIN, 1, NULL, true);

                // spike effect
				if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
				{
					battleutils::HandleSpikesDamage(m_PPet, m_PBattleTarget, &Action, damage);
				}

				m_PPet->m_ActionList.push_back(Action);

				m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));
				if(m_PPet->PMaster != NULL && m_PPet->PMaster->objtype == TYPE_PC && m_PPet->PMaster->PPet != NULL){
					((CCharEntity*)m_PPet->PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)m_PPet->PMaster));
				}
			}
			m_LastActionTime = m_Tick;
		}
	}

}

void CAIPetDummy::ActionSleep()
{
    if (!m_PPet->StatusEffectContainer->HasPreventActionEffect())
    {
		//put it in combat if it isn't
		if( m_PPet->animation == ANIMATION_NONE ){
			m_PPet->animation = ANIMATION_ATTACK;
		}
		m_ActionType = (m_PPet->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
    }
	//TODO: possibly change this so have ActionBeforeSleep then ActionSleep (send ENTITY_UPDATE once only rather than spam)
	m_PPet->loc.zone->PushPacket(m_PPet,CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
}

void CAIPetDummy::ActionDisengage()
{
	if( m_PPet->PMaster==NULL || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	m_ActionType = ACTION_ROAMING;
	m_LastActionTime = m_Tick;
	m_PBattleTarget  = NULL;
	m_PPet->animation = ANIMATION_NONE;
	m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIPetDummy::ActionFall()
{
	//Charmed pets do not die when their master kicks the bucket
	if(m_PPet->GetHPP() != 0 && m_PPet->objtype == TYPE_MOB && m_PPet->PMaster->objtype == TYPE_PC){
		petutils::DespawnPet(m_PPet->PMaster);
		return;
	}


    m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));

	if(m_PPet->PMaster->objtype == TYPE_PC && distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) >= 50){
		//master won't get this fall packet, so send it directly
		((CCharEntity*)m_PPet->PMaster)->pushPacket(new CEntityUpdatePacket(m_PPet, ENTITY_UPDATE));
	}

	m_LastActionTime = m_Tick;
	m_PPet->health.hp = 0;
	m_ActionType = ACTION_DEATH;
}

void CAIPetDummy::ActionDeath()
{
	if(m_Tick-m_LastActionTime > 3000){
		m_PPet->status = STATUS_DISAPPEAR;

		//a charmed pet was killed
		if(m_PPet->objtype == TYPE_MOB && m_PPet->PMaster->objtype == TYPE_PC)
		{
			((CCharEntity*)m_PPet->PMaster)->pushPacket(new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN));
			petutils::DespawnPet(m_PPet->PMaster);
			return;
		}

		if(m_PPet->PMaster!=NULL){
			if(m_PPet->PMaster->objtype == TYPE_PC && distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) >= 50){
				//master won't get this despawn packet, so send it directly
				((CCharEntity*)m_PPet->PMaster)->pushPacket(new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN));
			}
			m_PPet->PMaster->PPet = NULL;
		}
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN));
		if (m_PPet->PMaster != NULL && m_PPet->PMaster->objtype == TYPE_PC)
		{
			((CCharEntity*)m_PPet->PMaster)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PPet->PMaster));
			charutils::BuildingCharPetAbilityTable((CCharEntity*)m_PPet->PMaster,m_PPet,0);//blank the pet commands
		}
		if(m_PPet->getPetType() == PETTYPE_AVATAR){
			m_PPet->PMaster->setModifier(MOD_AVATAR_PERPETUATION, 0);
		}


		m_PPet->PMaster = NULL;
		m_ActionType = ACTION_NONE;
	}
}

/************************************************************************
*																		*
*  При появлении питомца задержка в 4.5 секунды перед началом			*
*  следования за персонажем. Состояние может быть перезаписано.			*
*																		*
************************************************************************/

void CAIPetDummy::ActionSpawn()
{
	if( m_PPet->PMaster==NULL || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	if ((m_Tick - m_LastActionTime) > 4000)
	{
		m_ActionType = ACTION_ROAMING;
	}
}

/************************************************************************
*																		*
*  Sends the too far away message and interrupts the pet from			*
*  performing its action. Changes to the interrupt state.				*
*																		*
************************************************************************/

void CAIPetDummy::SendTooFarInterruptMessage(CBattleEntity* PTarg)
{
	m_ActionType = ACTION_MOBABILITY_INTERRUPT;
	//too far away message = 78
	m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE,new CMessageBasicPacket(PTarg, PTarg, 0, 0, 78));
	ActionAbilityInterrupt();
}