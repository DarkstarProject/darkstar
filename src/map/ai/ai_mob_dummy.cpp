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

#include "../../common/showmsg.h"
#include "../../common/utils.h"

#include "../battleutils.h"
#include "../charutils.h"
#include "../itemutils.h"
#include "../mobskill.h"
#include "../mobutils.h"
#include "../status_effect.h"
#include "../petentity.h"
#include "../zone.h"

#include "ai_mob_dummy.h"

#include "../lua/luautils.h"

#include "../packets/action.h"
#include "../packets/entity_update.h"
#include "../packets/fade_out.h"
#include "../packets/message_basic.h"


/************************************************************************
*																		*
*  Инициализируем владельца интеллекта (может добавить проверку на		*
*  пустой указатель с выводом FatalError ?)								*
*																		*
************************************************************************/

CAIMobDummy::CAIMobDummy(CMobEntity* PMob)
{
	m_PMob = PMob;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIMobDummy::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;

	switch(m_ActionType)
	{
		case ACTION_NONE:                                           break;
		case ACTION_ROAMING:			  ActionRoaming();          break;
		case ACTION_ENGAGE:				  ActionEngage();           break;
		case ACTION_DISENGAGE:			  ActionDisengage();        break;
		case ACTION_FALL:				  ActionFall();             break;
		case ACTION_DROPITEMS:			  ActionDropItems();        break;
		case ACTION_DEATH:				  ActionDeath();            break;
		case ACTION_FADE_OUT:			  ActionFadeOut();          break;
		case ACTION_SPAWN:				  ActionSpawn();            break;
		case ACTION_ATTACK:				  ActionAttack();           break;
        case ACTION_SLEEP:                ActionSleep();            break;
		case ACTION_MOBABILITY_START:     ActionAbilityStart();     break;
		case ACTION_MOBABILITY_USING:	  ActionAbilityUsing();     break;
		case ACTION_MOBABILITY_FINISH:	  ActionAbilityFinish();    break;
        case ACTION_MOBABILITY_INTERRUPT: ActionAbilityInterrupt(); break;

		default : DSP_DEBUG_BREAK_IF(true);
	}
}

/************************************************************************
*																		*
*  Здесь должен быть алгоритм путешествия по зоне, а также переход в	*
*  режим боевой стойки, если его обладатель (атакующий) не равен нулю.	*
*																		*
************************************************************************/

void CAIMobDummy::ActionRoaming() 
{
	if (m_PMob->PEnmityContainer->GetHighestEnmity() != NULL)
	{
		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
	}
	else if (m_PMob->m_OwnerID.id != 0)
	{
        m_PBattleTarget = (CBattleEntity*)m_PMob->loc.zone->GetEntity(m_PMob->m_OwnerID.targid, TYPE_PC | TYPE_MOB | TYPE_PET);
		
        // TODO: возможно необходимо добавлять цели базовое количество ненависти

		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
	}
	else if ((m_Tick - m_LastActionTime) > 45000 && m_PMob->m_Type != MOBTYPE_EVENT) 
	{	
		m_LastActionTime = m_Tick - rand()%30000;

		position_t RoamingPoint;

		RoamingPoint.x = m_PMob->m_SpawnPoint.x - 1 + rand()%2;
		RoamingPoint.y = m_PMob->m_SpawnPoint.y;
		RoamingPoint.z = m_PMob->m_SpawnPoint.z - 1 + rand()%2;

		m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, RoamingPoint);

		battleutils::MoveTo(m_PMob, RoamingPoint, 1);

		m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
	}
	if (m_PMob->GetDespawnTimer() > 0 && m_PMob->GetDespawnTimer() < m_Tick)
	{
		m_LastActionTime = m_Tick - 12000; 
		m_PMob->PBattleAI->SetCurrentAction(ACTION_DEATH);
	}
}

/************************************************************************
*                                                                       *
*  Монстр переходит в боевую стойку, включается режим атаки             *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionEngage() 
{
	m_PMob->animation = ANIMATION_ATTACK;

	m_ActionType = ACTION_ATTACK;
	m_LastActionTime = m_Tick - 1000;

	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();
	
	if (m_PBattleTarget!=NULL && m_PMob->m_OwnerID.id == m_PBattleTarget->id){
		luautils::OnMobEngaged(m_PMob,m_PBattleTarget);
	}

	ActionAttack();
}

/************************************************************************
*																		*
*  Монстр выходит из режима атаки по каким-либо причинам. Если при этом	*
*  он слишком далеко от точки появления, то запускается перерождение.	*
*																		*
************************************************************************/

void CAIMobDummy::ActionDisengage() 
{
	m_ActionType = (distance(m_PMob->loc.p,m_PMob->m_SpawnPoint) > 20 ? ACTION_DEATH : ACTION_ROAMING);
	m_LastActionTime = m_Tick;
	m_PBattleTarget  = NULL;

    m_PMob->m_OwnerID.clean();
	m_PMob->m_CallForHelp = 0;
	m_PMob->animation = ANIMATION_NONE;
    m_PMob->health.tp = 0;
    m_PMob->health.hp = m_PMob->GetMaxHP();
    m_PMob->health.mp = m_PMob->GetMaxMP();

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE));
}

/************************************************************************
*																		*
*  Монстр падает на землю после получения смертельного удара.			*
*																		*
************************************************************************/

void CAIMobDummy::ActionFall() 
{
	m_ActionType = ACTION_DROPITEMS;
	m_LastActionTime = m_Tick;
	m_PMob->animation = ANIMATION_DEATH;

	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
}

/************************************************************************
*																		*
*  Здесь выполняется скрипт после смерти монстра, распределяется опыт	*
*  и определяются выпавшие предметы										*
*																		*
************************************************************************/

void CAIMobDummy::ActionDropItems() 
{
    if ((m_Tick - m_LastActionTime) > m_PMob->m_DropItemTime)
	{
        CCharEntity* PChar = (CCharEntity*)m_PMob->loc.zone->GetEntity(m_PMob->m_OwnerID.targid, TYPE_PC);

        if (PChar != NULL && PChar->id == m_PMob->m_OwnerID.id)
		{
            // TODO: blu может выучить последнюю использованную монстром специальную атаку m_PMobSkill

			luautils::OnMobDeath(m_PMob, PChar);

			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(PChar,m_PMob,0,0,6));
			
			if (m_PMob->m_CallForHelp == 0)
			{
                charutils::DistributeExperiencePoints(PChar, m_PMob);

                DropList_t* DropList = itemutils::GetDropList(m_PMob->m_DropID);
		
			    if (DropList != NULL && DropList->size())
			    {
                    for(uint8 i = 0; i < DropList->size(); ++i)
				    {
                        if(rand()%100 < DropList->at(i).DropRate) 
					    {
                            PChar->PTreasurePool->AddItem(DropList->at(i).ItemID, m_PMob); 
					    }		
				    }
					//check for gil (beastmen drop gil, some NMs drop gil)
					if(m_PMob->m_EcoSystem == SYSTEM_BEASTMEN || m_PMob->m_Type & MOBTYPE_NOTORIOUS)
                    {
						charutils::DistributeGil(PChar, m_PMob); // TODO: REALISATION MUST BE IN TREASUREPOOL
					}
					//check for seal drops 
					/* MobLvl >= 1 = Beastmen Seals ID=1126
					          >= 50 = Kindred Seals ID=1127
							  >= 75 = Kindred Crests ID=2955
							  >= 90 = High Kindred Crests ID=2956
					*/
					if(charutils::GetRealExp(PChar->GetMLevel(),m_PMob->GetMLevel())>0 &&
						rand()%100 < 40 && m_PMob->m_Type & MOBTYPE_NORMAL){ //exp-yielding monster and drop is successful
						//TODO: The drop is actually based on a 5 minute timer, and not a probability of dropping!

						//RULES: Only 1 kind may drop per mob
						if(m_PMob->GetMLevel() < 50){ //b.seal only
							PChar->PTreasurePool->AddItem(1126, m_PMob);
						}
						else if(m_PMob->GetMLevel() < 75){ //b.seal & k.seal only
							if(rand()%2 == 0){
								PChar->PTreasurePool->AddItem(1126, m_PMob);
							}
							else{
								PChar->PTreasurePool->AddItem(1127, m_PMob);
							}
						}
						else if(m_PMob->GetMLevel() < 90){ //b.seal & k.seal & k.crest
							switch(rand()%3){
							case 0:
								PChar->PTreasurePool->AddItem(1126, m_PMob);
								break;
							case 1:
								PChar->PTreasurePool->AddItem(1127, m_PMob);
								break;
							case 2:
								PChar->PTreasurePool->AddItem(2955, m_PMob);
								break;
							}
						}
						else if(m_PMob->GetMLevel() >= 90){ //all 4
							switch(rand()%4){
							case 0:
								PChar->PTreasurePool->AddItem(1126, m_PMob);
								break;
							case 1:
								PChar->PTreasurePool->AddItem(1127, m_PMob);
								break;
							case 2:
								PChar->PTreasurePool->AddItem(2955, m_PMob);
								break;
							case 3:
								PChar->PTreasurePool->AddItem(2956, m_PMob);
								break;
							}
						}
					}

			    }
			}
		}
        m_ActionType = ACTION_DEATH;
	}				
}

/************************************************************************
*																		*
*  Время ожидания до исчезновения (монстр не обязательно мертв) 		*
*																		*
************************************************************************/

void CAIMobDummy::ActionDeath() 
{
	if ((m_Tick - m_LastActionTime) > 12000)
	{
		m_ActionType = ACTION_FADE_OUT;
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CFadeOutPacket(m_PMob));
		//TODO! wipe status container 
	}
    else if (!m_PMob->isDead())
    {
        if (m_PMob->PEnmityContainer->GetHighestEnmity() != NULL)
	    {
		    m_ActionType = ACTION_ENGAGE;
		    ActionEngage();
	    }
    }
}

/************************************************************************
*                                                                       *
*  Здесь модель пропадает после постепенного ичезновения, так же        *
*  решается вопрос, а нужно ли включать процесс возрождения монстра.    *
*  Если его тип возрождения равен нулю, значит он был вызван и в        *
*  возрождении не нуждается, иначе запускаем процесс                    *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionFadeOut() 
{
	if ((m_Tick - m_LastActionTime) > 15000 )
	{
		m_PMob->status = STATUS_DISAPPEAR;
        m_PMob->PEnmityContainer->Clear();

        m_ActionType   = m_PMob->m_SpawnType == SPAWNTYPE_NORMAL ? ACTION_SPAWN : ACTION_NONE;
	}
}

/************************************************************************
*                                                                       *
*  Возрождение монстра                                                  *
*                                                                       *
************************************************************************/

// TODO: ночные монстры должны появляться только ночью

void CAIMobDummy::ActionSpawn() 
{
	if ((m_Tick - m_LastActionTime) > m_PMob->m_RespawnTime)
	{
		m_ActionType = ACTION_ROAMING;
		m_PBattleTarget = NULL;
		m_PMob->m_SkillStatus = 0;
        m_PMob->m_OwnerID.clean();
		m_PMob->m_CallForHelp = 0;
        m_PMob->m_DropItemTime = 1000;
		m_PMob->status = STATUS_UPDATE;
		m_PMob->animation = ANIMATION_NONE;

        m_PMob->PEnmityContainer->Clear();

		uint8 level = m_PMob->m_minLevel;

		if (m_PMob->m_maxLevel != m_PMob->m_minLevel)
		{ 
			level += rand()%(m_PMob->m_maxLevel - m_PMob->m_minLevel); 
		}
						
		m_PMob->SetMLevel(level);
		m_PMob->SetSLevel(level);//calculated in function

		mobutils::CalculateStats(m_PMob);

		m_PMob->loc.p = m_PMob->m_SpawnPoint;
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_SPAWN));
	}
}

/************************************************************************
*                                                                       *
*  Начало специальной атаки монстра (эффект начала)                     *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionAbilityStart()
{
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

    std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(m_PMob->m_Family);

    // не у всех монстов прописаны способности, так что выходим из процедуры, если способность не найдена
    if (MobSkills.size() == 0)
    {
        m_PMob->health.tp = 0; 
		m_ActionType = ACTION_ATTACK;
        ActionAttack();
		return; 
    }
    m_LastActionTime = m_Tick;

	//TODO: Choose TP move sensibly (if no enemies in range, dont choose a damaging move, etc)
	m_PMobSkill = MobSkills.at(rand() % MobSkills.size());

	if(m_PMob->m_Type & MOBTYPE_NOTORIOUS){
		for(int i=0;i<MobSkills.size();i++){
			if(MobSkills[i]->getID() == 0){ //TWO-HOUR
				if(m_PMob->GetHPP() <= 50 && m_PMob->m_SkillStatus==0){//<50% HP and not used skill
					m_PMobSkill = MobSkills[i];
					m_ActionType = ACTION_MOBABILITY_FINISH; //no prep time
					return;
				}
				break;
			}
		}
	}
		//prevent randomly selecting the 2h as a tp move
		if(m_PMobSkill->getID()==0 && MobSkills.size()==1){//only 2h available, dont use a tp move
			m_PMob->health.tp = 0; 
			m_ActionType = ACTION_ATTACK;
		    ActionAttack();
			return; 
		}
		else if(m_PMobSkill->getID()==0 && MobSkills.size()>1){//>1 tp move available, choose index 0 or 1.
			if(MobSkills[0]->getID()==0){ m_PMobSkill = MobSkills[1];}
			else{ m_PMobSkill = MobSkills[0];}
		}
	
	

    apAction_t Action;
    m_PMob->m_ActionList.clear();
	if(m_PMobSkill->getValidTargets() == TARGET_ENEMY){ //enemy
		Action.ActionTarget = m_PBattleTarget;
	}
	else if(m_PMobSkill->getValidTargets() == TARGET_SELF){ //self
		Action.ActionTarget = m_PMob;
	}
	Action.reaction   = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation  = 0;
    Action.param	  = m_PMobSkill->getID() + 256;//m_PMobSkill->getAnimationID();
	Action.messageID  = 43; //readies message
	Action.flag		  = 0;

	m_PMob->m_ActionList.push_back(Action);
	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

	m_ActionType = ACTION_MOBABILITY_USING;
}

/***********************************************************************
		In the readying animation to use a TP move
************************************************************************/
void CAIMobDummy::ActionAbilityUsing()
{
	DSP_DEBUG_BREAK_IF(m_PMobSkill == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

	if(m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget->isDead() ||
		m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleTarget->getZone() != m_PMob->getZone()){
		m_ActionType = ACTION_MOBABILITY_INTERRUPT;
		ActionAbilityInterrupt();
		return;
	}

	//TODO: Any checks whilst the monster is preparing.
	//NOTE: RANGE CHECKS ETC ONLY ARE DONE AFTER THE ABILITY HAS FINISHED PREPARING.
	//      THE ONLY CHECK IN HERE SHOULD BE WITH STUN/SLEEP/TERROR/ETC

	if ((m_Tick - m_LastActionTime) > m_PMobSkill->getActivationTime())
    {
		//Range check
		if(m_PMobSkill->getValidTargets() == TARGET_ENEMY && 
			m_PBattleTarget!=m_PMob && 
			distance(m_PBattleTarget->loc.p,m_PMob->loc.p) > m_PMobSkill->getDistance()){

			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			//too far away message
			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE,new CMessageBasicPacket(m_PBattleTarget, m_PBattleTarget, 0, 0, 78));
			ActionAbilityInterrupt();
			return;
		}
		m_PMobSkill->setTP(m_PMob->health.tp);
		m_LastActionTime = m_Tick;
		m_ActionType = ACTION_MOBABILITY_FINISH;
		ActionAbilityFinish();
	}

}

/************************************************************************
*                                                                       *
*  Окончание специальной атаки монстра (анимация эффекта).              *
*  После выполения специальной атаки не обнуляем m_PMobSkill, позднее   *
*  по этому значению blu будет учить заклинания.                        *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionAbilityFinish()
{
    DSP_DEBUG_BREAK_IF(m_PMobSkill == NULL);

        m_PMob->m_ActionList.clear();

		if(m_PMobSkill->getID()==0 && m_PMob->m_SkillStatus==0){//2h
			processTwoHour();
			return;
		}

		//handle aoe stuff (self/mob)
		//AOE=1 means the circle is around the MONSTER
		//AOE=2 means the circle is around the BATTLE TARGET
		//AOE=4 means conal (breath)
		if(m_PMobSkill->getAoe()==1 || m_PMobSkill->getAoe()==2){ //to handle both types of aoe
			if(m_PMobSkill->getValidTargets() == TARGET_ENEMY){//aoe on the  players
				//hit the target + the target's PT/alliance
				apAction_t Action;

				Action.ActionTarget = m_PBattleTarget;
				Action.reaction   = REACTION_HIT;
				Action.speceffect = SPECEFFECT_HIT;
				Action.animation  = m_PMobSkill->getAnimationID();
				Action.param	  = luautils::OnMobWeaponSkill(m_PBattleTarget, m_PMob,m_PMobSkill);
				Action.subparam   = m_PMobSkill->getID() + 256;
				Action.messageID  = m_PMobSkill->getMsg();
				Action.flag		  = 0;
				m_PMob->m_ActionList.push_back(Action);	

				if(m_PBattleTarget->objtype==TYPE_PC){
					CCharEntity* m_PChar = (CCharEntity*)m_PBattleTarget;
					if(m_PChar->PParty != NULL){
						//determine the type of circle
						position_t radiusAround = m_PMob->loc.p;
						if(m_PMobSkill->getAoe()==2){//radius around TARGET not the monster
							radiusAround = m_PBattleTarget->loc.p;
						}

						for (uint32 i = 0; i < m_PChar->PParty->members.size(); i++)
						{
							CCharEntity* PTarget = (CCharEntity*)m_PChar->PParty->members[i];
							

							if(!PTarget->isDead() && PTarget!=m_PBattleTarget &&
							PTarget->getZone() == m_PChar->getZone() &&
							distance(radiusAround, PTarget->loc.p) <= m_PMobSkill->getDistance())
							{
								Action.ActionTarget = PTarget;
								Action.param	  = luautils::OnMobWeaponSkill(PTarget, m_PMob,m_PMobSkill);
								Action.messageID  = m_PMobSkill->getMsg();

								//handle aoe damage text
								if(Action.messageID == 185){
									Action.messageID = 264; //just the damage value needed
								}

								m_PMob->m_ActionList.push_back(Action);	
							}
						}
					}
				}
			}
			else if(m_PMobSkill->getValidTargets() == TARGET_SELF){ //aoe on the enemy (e.g. aoe cure)
				//TODO: hit self and all targets of the same family? pt?
			}
		}
		else{//single target moves
			apAction_t Action;
			if(m_PMobSkill->getValidTargets() == TARGET_ENEMY){
				Action.ActionTarget = m_PBattleTarget;
			}
			else if(m_PMobSkill->getValidTargets() == TARGET_SELF){
				Action.ActionTarget = m_PMob;
			}
			Action.reaction   = REACTION_HIT;
			Action.speceffect = SPECEFFECT_HIT;
			Action.animation  = m_PMobSkill->getAnimationID();
			Action.param	  = luautils::OnMobWeaponSkill(m_PBattleTarget, m_PMob,m_PMobSkill);
			Action.subparam   = m_PMobSkill->getID() + 256;
			Action.messageID  = m_PMobSkill->getMsg();
			Action.flag       = 0;
	
			m_PMob->m_ActionList.push_back(Action);
			
		}

		if(m_ActionType==ACTION_FALL){//set when you kill the mob in a script, but need
									//it to be ACTION_MOBABILITY_FINISH for pushing the packet.
			m_ActionType = ACTION_MOBABILITY_FINISH;
		}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
	
	m_PMob->health.tp = 0; 

	if(m_PMob->isDead()){ //e.g. self-destruct. Needed here AFTER sending the action packets.
		m_ActionType = ACTION_FALL;
		ActionFall();
	}
	else{
		m_ActionType = ACTION_ATTACK;
	}
}

/************************************************************************
*																		*
*  Прерывание специальной атаки монстра                 				*
*																		*
************************************************************************/

void CAIMobDummy::ActionAbilityInterrupt()
{
    m_LastActionTime = m_Tick;
	//cancel the whole readying animation
	apAction_t Action;
    m_PMob->m_ActionList.clear();

		Action.ActionTarget = m_PMob;
		Action.reaction   = REACTION_NONE;
		Action.speceffect = SPECEFFECT_NONE;
		Action.animation  = m_PMobSkill->getID();
	    Action.param	  = 0;
		Action.messageID  = 0;
        Action.flag       = 0;
	
	m_PMob->m_ActionList.push_back(Action);
	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

	m_PMob->health.tp = 0; 

    m_PMobSkill = NULL;
    m_ActionType = ACTION_ATTACK;
}

void CAIMobDummy::processTwoHour(){
	m_PMob->m_SkillStatus = 1;
	m_LastActionTime = m_Tick;
	apAction_t Action;
    m_PMob->m_ActionList.clear();
	Action.param = 0;

	//determine the 2h based on mjob and set the correct target and do the right stuff
	uint16 id = 0;
	switch(m_PMob->GetMJob()){
	case JOB_WAR: 
		id=0; Action.ActionTarget = m_PMob; Action.messageID=101; 
		m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_MIGHTY_STRIKES,0,1,0,45));
		break;
	case JOB_MNK: 
		id=1; Action.ActionTarget = m_PMob; Action.messageID=101; 
		m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HUNDRED_FISTS,0,1,0,45));
		break;
	case JOB_THF: 
		id=5; Action.ActionTarget = m_PMob; Action.messageID=101; 
		m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_PERFECT_DODGE,0,1,0,30));
		break;
	case JOB_WHM: {
		id=2; Action.ActionTarget = m_PMob; Action.messageID=103; 
		int hp = m_PMob->GetMaxHP() - m_PMob->health.hp;
		m_PMob->addHP(hp);
		Action.param = hp;
		}
		break;
	//case JOB_NIN: 
	//	id=12; Action.ActionTarget = m_PBattleTarget; Action.messageID=185; break;
	//case JOB_SMN: 
	//	id=14; Action.ActionTarget = m_PBattleTarget; Action.messageID=185; break;
	case JOB_PLD: 
		id=6; Action.ActionTarget = m_PMob; Action.messageID=101; 
		m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_INVINCIBLE,0,1,0,30));
		break;
	//case JOB_DRK: 
	//	id=7; Action.ActionTarget = m_PMob; Action.messageID=101; break;
	//case JOB_SAM: 
	//	id=11; Action.ActionTarget = m_PMob; Action.messageID=101; break;
	//case JOB_RNG: 
	//	id=10; Action.ActionTarget = m_PBattleTarget; Action.messageID=185; break;
	default: 
		m_PMobSkill = NULL; 
		m_PMob->health.tp = 0;
		m_ActionType = ACTION_ATTACK;
		return;
	}

	m_PMobSkill->setID(1986+id);
	//addstatuseffect
	//send packet with msgid "xxx uses zzz."
	Action.reaction   = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation  = m_PMobSkill->getAnimationID();
	Action.subparam   = m_PMobSkill->getID() + 256;
	Action.flag		  = 0;
	m_PMob->m_ActionList.push_back(Action);
	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

	//JAs to handle: SELF TARGET
	//100 fists, might strike, benedict, perf dodge
	//invincible, blood weapon, 
	//MOB TARGET (PT)
	//mijin gakure (no death), astral flow (no pet for now)

	m_PMobSkill->setID(0);
	m_PMob->health.tp = 0; 
	if(m_PMob->isDead()){ //mijin will not kill the mob using the 2h, so no need to check for it, only for pcs killing
		m_ActionType = ACTION_FALL;
		ActionFall();
	}
	else{
		m_ActionType = ACTION_ATTACK;
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionSleep()
{
    if (!m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP) && !m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP_II))
    {
		m_ActionType = ACTION_ATTACK;
    }
	//TODO: possibly change this so have ActionBeforeSleep then ActionSleep (send ENTITY_UPDATE once only rather than spam)
	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE));
}

/************************************************************************
*																		*
*  Обычная физическая атака без нанесения какого-либо урона				*
*																		*
************************************************************************/

void CAIMobDummy::ActionAttack() 
{
	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();

	if (m_PBattleTarget == NULL)
	{
        m_ActionType = ACTION_DISENGAGE;
		return; 
	}
    if (m_PBattleTarget->isDead() || 
        m_PBattleTarget->animation == ANIMATION_CHOCOBO)
	{
        if (m_PMob->m_OwnerID.id == m_PBattleTarget->id)
        {
            m_PMob->m_OwnerID.clean();
        }
		m_PMob->PEnmityContainer->Clear(m_PBattleTarget->id);
		ActionAttack();
		return;
	}

	//handle pet behaviour on the targets behalf (faster than in ai_pet_dummy)
	if(m_PBattleTarget->PPet != NULL && m_PBattleTarget->PPet->PBattleAI->GetBattleTarget()==NULL){
		if(((CPetEntity*)m_PBattleTarget->PPet)->getPetType()==PETTYPE_AVATAR){
			m_PBattleTarget->PPet->PBattleAI->SetBattleTarget(m_PMob);
		}
	}
	else if(m_PBattleTarget->objtype == TYPE_PET && m_PBattleTarget->PBattleAI->GetBattleTarget()==NULL){
		if(((CPetEntity*)m_PBattleTarget)->getPetType()==PETTYPE_JUGPET){
			m_PBattleTarget->PBattleAI->SetBattleTarget(m_PMob);
		}
	}

    if (m_PMob->PParty != NULL)
    {
        for (uint16 i = 0; i < m_PMob->PParty->members.size(); ++i)
        {
            CMobEntity* PPartyMember = (CMobEntity*)m_PMob->PParty->members[i];

            if (PPartyMember->PBattleAI->GetCurrentAction() == ACTION_ROAMING &&
                distance(m_PMob->loc.p, PPartyMember->loc.p) < 10)
            {
                PPartyMember->PEnmityContainer->AddBaseEnmity(m_PBattleTarget);
            }
        }
    }

    m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, m_PBattleTarget->loc.p);

    float CurrentDistance = distance(m_PMob->loc.p, m_PBattleTarget->loc.p);

	if (CurrentDistance <= m_PMob->m_ModelSize)
	{
		uint32 WeaponDelay = m_PMob->m_Weapons[SLOT_MAIN]->getDelay();
		if (m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS,0))
		{
			WeaponDelay = 600;
		}

		if ((m_Tick - m_LastActionTime) > WeaponDelay)
		{
			if (battleutils::IsParalised(m_PMob)) 
			{
				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0,29));
			}
			else if (battleutils::IsIntimidated(m_PMob, m_PBattleTarget)) 
			{
				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0,106));
			}
			else
			{
				if (m_PMob->health.tp >= 100 && rand()%100 > 55 || m_PMob->health.tp == 300 ||
					m_PMob->health.tp >= 100 && m_PMob->GetHPP()<=25 ) 
				{
					m_ActionType = ACTION_MOBABILITY_START;
                    ActionAbilityStart();
					return;
				}

				apAction_t Action;
                m_PMob->m_ActionList.clear();

				Action.ActionTarget = m_PBattleTarget;
				Action.reaction   = REACTION_EVADE;
				Action.speceffect = SPECEFFECT_NONE;
				Action.animation  = 0;
				Action.param	  = 0;
				Action.messageID  = 15;
				Action.flag		  = 0;

				uint16 damage = 0;

				if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
				{
					Action.messageID = 32; 
				}
				else if ( rand()%90 < battleutils::GetHitRate(m_PMob, m_PBattleTarget) )
				{
                    if (battleutils::IsAbsorbByShadow(m_PBattleTarget)) 
					{
                        Action.messageID = 0;
                        m_PBattleTarget->loc.zone->PushPacket(m_PBattleTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget,m_PBattleTarget,0,1,31));
					}
					else
					{
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_HIT;
						Action.messageID  = 1;

						bool isCritical = ( rand()%100 < battleutils::GetCritHitRate(m_PMob, m_PBattleTarget) );
						if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_MIGHTY_STRIKES,0)){isCritical=true;}

						float DamageRatio = battleutils::GetDamageRatio(m_PMob, m_PBattleTarget,isCritical); 
						
						if(isCritical)
						{
							Action.speceffect = SPECEFFECT_CRITICAL_HIT;
							Action.messageID  = 67;
						}
						damage = (uint16)((m_PMob->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(m_PMob, m_PBattleTarget)) * DamageRatio);	
					}
				}
				if (m_PBattleTarget->objtype == TYPE_PC)
				{
					charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PMob->GetMLevel());
				}

				bool isBlocked = (rand()%100 < battleutils::GetBlockRate(m_PMob,m_PBattleTarget));
				if(isBlocked){ Action.reaction = REACTION_BLOCK; }

                Action.param = battleutils::TakePhysicalDamage(m_PMob, m_PBattleTarget, damage, isBlocked);

				m_PMob->m_ActionList.push_back(Action);
                m_PMob->PEnmityContainer->UpdateEnmityFromAttack(m_PBattleTarget, Action.param);

				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
			}
            m_LastActionTime = m_Tick;
		}
	}
	else if (m_PMob->CanDeaggro() && CurrentDistance > 25 && (m_Tick - m_LastActionTime) > 20000)
    {
        //player has been too far away for some time, deaggro if the mob type dictates it

		if (m_PMob->m_OwnerID.id == m_PBattleTarget->id)
        {
            m_PMob->m_OwnerID.clean();
        }
		m_PMob->PEnmityContainer->Clear(m_PBattleTarget->id);
		ActionAttack();
	}
	else
    {
		battleutils::MoveTo(m_PMob, m_PBattleTarget->loc.p, 2);
	}
	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE));
}

