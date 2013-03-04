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
#include "../blueutils.h"
#include "../charutils.h"
#include "../itemutils.h"
#include "../mobskill.h"
#include "../mobutils.h"
#include "../status_effect.h"
#include "../petentity.h"
#include "../spell.h"
#include "../zone.h"
#include "../alliance.h"
#include "../map.h"

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
	m_firstSpell = true;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIMobDummy::CheckCurrentAction(uint32 tick)
{
	m_Tick = tick;

	m_PMob->PEnmityContainer->DecayEnmity();

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
		case ACTION_MAGIC_START:		  ActionMagicStart();		break;
		case ACTION_MAGIC_CASTING:		  ActionMagicCasting();		break;
		case ACTION_MAGIC_INTERRUPT:	  ActionMagicInterrupt();	break;
		case ACTION_MAGIC_FINISH:		  ActionMagicFinish();		break;

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

	// If there's someone on our enmity list, go from roaming -> engaging
	if (m_PMob->PEnmityContainer->GetHighestEnmity() != NULL)
	{
		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
	}
	else if (m_PMob->m_OwnerID.id != 0) // if we're claimed by someone
	{
		// try to resolve the person who owns us
        m_PBattleTarget = (CBattleEntity*)m_PMob->loc.zone->GetEntity(m_PMob->m_OwnerID.targid, TYPE_PC | TYPE_MOB | TYPE_PET);

        // TODO: возможно необходимо добавлять цели базовое количество ненависти

		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
	}
	else if ((m_PMob->m_Type & MOBTYPE_NOTORIOUS) && distance(m_PMob->loc.p,m_PMob->m_SpawnPoint) > 2)
	{
		position_t ReturnPoint;

		ReturnPoint.x = m_PMob->m_SpawnPoint.x;
		ReturnPoint.y = m_PMob->m_SpawnPoint.y;
		ReturnPoint.z = m_PMob->m_SpawnPoint.z;

		m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, m_PMob->m_SpawnPoint);
		battleutils::MoveTo(m_PMob, ReturnPoint, 1);

		m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
	}
	else if ((m_Tick - m_LastActionTime) > 45000)
	{
		// lets buff up or move around
		m_LastActionTime = m_Tick - rand()%30000;

		if(!(m_PMob->m_Type & MOBTYPE_EVENT) && rand()%10 < 7){
			// roam
			position_t RoamingPoint;

			RoamingPoint.x = m_PMob->m_SpawnPoint.x - 1 + rand()%2;
			RoamingPoint.y = m_PMob->m_SpawnPoint.y;
			RoamingPoint.z = m_PMob->m_SpawnPoint.z - 1 + rand()%2;

			m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, RoamingPoint);

			battleutils::MoveTo(m_PMob, RoamingPoint, 1);

			m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
		} else if(m_PMob->SpellContainer->HasBuffSpells())
		{
			// cast buff
			CastSpell(m_PMob->SpellContainer->GetBuffSpell());
		}
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
	m_StartBattle = m_Tick;
	m_ActionType = ACTION_ATTACK;
	m_LastActionTime = m_Tick - 1000; // Why do we subtract 1 sec?
	m_firstSpell = true;
	m_LastMagicTime = m_Tick - m_PMob->m_MagicRecastTime - 1; // Monster always cast on engage if they can.

	//if (m_PMob->animationsub == 1 || m_PMob->animationsub == 3) m_PMob->animationsub = 2;  //need a better way to do this: it only applies to some mobs!

	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();

	//Start luautils::OnMobEngaged
	if (m_PBattleTarget!=NULL) {
		luautils::OnMobEngaged(m_PMob,m_PBattleTarget);
	}

	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE));
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
	// Despawn if we're >20 yalms from our spawn point
	if(m_PMob->m_Type & MOBTYPE_NOTORIOUS)
	{
		m_ActionType = ACTION_ROAMING;
	}
	else
	{
		m_ActionType = (distance(m_PMob->loc.p,m_PMob->m_SpawnPoint) > 20 ? ACTION_DEATH : ACTION_ROAMING);
	}

	luautils::OnMobDisengage(m_PMob);

	m_LastActionTime = m_Tick;
	m_PBattleTarget  = NULL;

	m_PMob->SetMainSkin(m_PMob->id);
    m_PMob->delRageMode();
    m_PMob->m_OwnerID.clean();
	m_PMob->m_CallForHelp = 0;
	m_PMob->animation = ANIMATION_NONE;

	//if (m_PMob->animationsub == 2) m_PMob->animationsub = 3;

    m_PMob->health.tp = 0;
    m_PMob->health.hp = m_PMob->GetMaxHP();
    m_PMob->health.mp = m_PMob->GetMaxMP();

    m_firstSpell = true;

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
			luautils::OnMobDeath(m_PMob, PChar);

			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(PChar,m_PMob,0,0, MSGBASIC_DEFEATS_TARG));

			if (m_PMob->m_CallForHelp == 0)
			{
				blueutils::TryLearningSpells(PChar, m_PMob);
				m_PMob->m_UsedSkillIds.clear();
                charutils::DistributeExperiencePoints(PChar, m_PMob);

                DropList_t* DropList = itemutils::GetDropList(m_PMob->m_DropID);

			    if (DropList != NULL && DropList->size())
			    {
					uint8 highestTH = charutils::GetHighestTreasureHunter(PChar, m_PMob);

                    for(uint8 i = 0; i < DropList->size(); ++i)
				    {
						//highestTH is the number of 'extra chances' at an item. If the item is obtained, then break out.
						uint8 tries = 0;
						while(tries < 1+highestTH)
						{
							if(rand()%100 < DropList->at(i).DropRate)
							{
								PChar->PTreasurePool->AddItem(DropList->at(i).ItemID, m_PMob);
								break;
							}
							tries++;
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
					uint8 Pzone = PChar->getZone();
					if(charutils::GetRealExp(PChar->GetMLevel(),m_PMob->GetMLevel())>0 &&
						rand()%100 < 40 && m_PMob->m_Type == MOBTYPE_NORMAL && ((Pzone > 0 &&
						Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255))){ //exp-yielding monster and drop is successful
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
		m_PMob->StatusEffectContainer->KillAllStatusEffect();
		//if (m_PMob->animationsub == 2) m_PMob->animationsub = 1;

		luautils::OnMobDespawn(m_PMob);
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

        m_ActionType  = m_PMob->m_AllowRespawn ? ACTION_SPAWN : ACTION_NONE;
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
		m_firstSpell = true;
		m_ActionType = ACTION_ROAMING;
		m_PBattleTarget = NULL;
		m_PMob->m_SkillStatus = 0;
        m_PMob->m_OwnerID.clean();
		m_PMob->m_CallForHelp = 0;
		m_PMob->m_HiPCLvl = 0;
		m_PMob->m_THLvl = 0;
		m_PMob->m_THPCID = 0;
        m_PMob->m_DropItemTime = 1000;
		m_PMob->status = STATUS_UPDATE;
		m_PMob->animation = ANIMATION_NONE;

        m_PMob->PEnmityContainer->Clear();

		uint8 level = m_PMob->m_minLevel;
		// Generate a random level between min and max level
		if (m_PMob->m_maxLevel != m_PMob->m_minLevel)
		{
			level += rand()%(m_PMob->m_maxLevel - m_PMob->m_minLevel);
		}

		m_PMob->SetMLevel(level);
		m_PMob->SetSLevel(level);//calculated in function
        m_PMob->delRageMode();

		mobutils::CalculateStats(m_PMob);
		mobutils::GetAvailableSpells(m_PMob);

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
	// We don't have any skills we can use, so let's go back to attacking
    if (MobSkills.size() == 0)
    {
        m_PMob->health.tp = 0;
		m_ActionType = ACTION_ATTACK;
        ActionAttack();
		return;
    }
    m_LastActionTime = m_Tick;

	//TODO: Choose TP move sensibly (if no enemies in range, dont choose a damaging move, etc)
	std::random_shuffle(MobSkills.begin(), MobSkills.end()); //Start the selection process by randomizing the container

	bool valid = false; //Assume no valid moves exist
	for(int i=0;i<MobSkills.size();i++){
		m_PMobSkill = MobSkills.at(i);
		if(luautils::OnMobSkillCheck(m_PBattleTarget, m_PMob,m_PMobSkill) == 0){ //A script says that the move in question is valid
			if(distance(m_PBattleTarget->loc.p, m_PMob->loc.p) <= m_PMobSkill->getDistance()) {
				valid = true;
				break;
			}
		}
	}

	if(!valid) { //No valid moves exist in the container, but they may become valid later, so keep the TP
		if(distance(m_PBattleTarget->loc.p, m_PMob->loc.p) <= m_PMob->m_ModelSize) //mob is in melee range, so attack
		{
			m_ActionType = ACTION_ATTACK;
			ActionAttack();
			return;
		}
		else //mob is outside of melee range, so pursue
		{
			battleutils::MoveTo(m_PMob, m_PBattleTarget->loc.p, 2);
			return;
		}
	}

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
		if(m_PMobSkill->getID()==0 && MobSkills.size()==1){ //only 2h available, dont use a tp move
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
	else{
		m_PMob->health.tp = 0;
		m_ActionType = ACTION_ATTACK;
		ActionAttack();
		return;
	}
	if( m_PMobSkill->getActivationTime() != 0)
	{
		Action.reaction   = REACTION_HIT;
		Action.speceffect = SPECEFFECT_HIT;
		Action.animation  = 0;
		Action.param	  = battleutils::GetMobSkillMessage(m_PMobSkill);//m_PMobSkill->getAnimationID();
		Action.messageID  = 43; //readies message
		Action.flag		  = 0;

		m_PMob->m_ActionList.push_back(Action);
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
	}
	m_ActionType = ACTION_MOBABILITY_USING;
}

/***********************************************************************
		In the readying animation to use a TP move
************************************************************************/
void CAIMobDummy::ActionAbilityUsing()
{
	DSP_DEBUG_BREAK_IF(m_PMobSkill == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

	// If our target dies or zones whilst readying, then interrupt the TP move.
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
			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE,new CMessageBasicPacket(m_PBattleTarget, m_PBattleTarget, 0, 0, MSGBASIC_TOO_FAR_AWAY));
			ActionAbilityInterrupt();
			return;
		}

		m_PMobSkill->setTP(m_PMob->health.tp); // store the TP the mob currently has as the mob skill TP modifier
		m_LastActionTime = m_Tick;
		m_ActionType = ACTION_MOBABILITY_FINISH;
		ActionAbilityFinish();
	}
	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE)); //need to keep HP updating

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

		// crash fix, a null target made it into CActionPacket
		if (m_PBattleTarget == NULL)
		{
			m_ActionType = ACTION_ATTACK;
			return;
		}

		if (m_PMobSkill->getID() == 0 && m_PMob->m_SkillStatus == 0) // 2h
		{
			processTwoHour();
			return;
		}

		// store the skill used
		m_PMob->m_UsedSkillIds[m_PMobSkill->getID()] = m_PMob->GetMLevel();

		// Who will the ability hit?
		//   0. Solo player
		//   1. Party
		//   2. Alliance
		//	 3. Pet Party
		//   4. Pet Alliance
		TARGET_PARTY_TYPE targetPartyType = SOLO_TARGET; // solo by default


		//todo: have a separate msg field from this for shadow absorb?
		m_PMobSkill->setMsg(185); //need this as some skills may be set to "shadows absorb"

	    m_PMobSkill->setTotalTargets(1);

		//handle aoe stuff (self/mob)
		//AOE=1 means the circle is around the MONSTER
		//AOE=2 means the circle is around the BATTLE TARGET
		//AOE=4 means conal (breath)

		if (m_PMobSkill->getAoe() == 1 || m_PMobSkill->getAoe() == 2) // to handle both types of aoe
		{
			if(m_PMobSkill->getValidTargets() == TARGET_ENEMY) // aoe on the players
			{
				targetPartyType = battleutils::getAvailableAoeTargets(m_PBattleTarget);

				apAction_t Action;
				Action.reaction   = REACTION_HIT;
				Action.speceffect = SPECEFFECT_HIT;
				Action.animation  = m_PMobSkill->getAnimationID();
				Action.subparam   = m_PMobSkill->getID() + 256;
				Action.messageID  = m_PMobSkill->getMsg();
				Action.flag		  = 0;

				//determine the type of circle
				position_t radiusAround = m_PMob->loc.p;	// AOE 1 (circle on mob)

				if(m_PMobSkill->getAoe() == 2) //radius around TARGET not the monster using the ability
					radiusAround = m_PBattleTarget->loc.p;

				CBattleEntity* PVictim = m_PBattleTarget;

				switch (targetPartyType)
				{
					case SOLO_TARGET: // single char & maybe a pet
						if (battleutils::handleMobAoeAction(m_PMob, PVictim, &Action, m_PMobSkill, &radiusAround))
						{
							m_PMob->m_ActionList.push_back(Action);
						}

						if (PVictim->PPet != NULL)
						{
							if (battleutils::handleMobAoeAction(m_PMob, PVictim->PPet, &Action, m_PMobSkill, &radiusAround))
							{
								m_PMob->m_ActionList.push_back(Action);
							}
						}
						break;
					case PARTY_TARGET:	// party members and any pets
						for (uint8 i = 0; i < PVictim->PParty->members.size(); ++i)
						{
							if (battleutils::handleMobAoeAction(m_PMob, PVictim->PParty->members.at(i), &Action, m_PMobSkill, &radiusAround))
							{
								m_PMob->m_ActionList.push_back(Action);
							}

							if (PVictim->PParty->members.at(i)->PPet != NULL)
							{
								if (battleutils::handleMobAoeAction(m_PMob, PVictim->PParty->members.at(i)->PPet, &Action, m_PMobSkill, &radiusAround))
								{
									m_PMob->m_ActionList.push_back(Action);
								}
							}
						}
						break;
					case ALLIANCE_TARGET:  // alliance members and any pets
						for (uint8 a = 0; a < PVictim->PParty->m_PAlliance->partyList.size(); ++a)
						{
							for (uint8 i = 0; i < PVictim->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
							{
								if (battleutils::handleMobAoeAction(m_PMob, PVictim->PParty->m_PAlliance->partyList.at(a)->members.at(i), &Action, m_PMobSkill, &radiusAround))
								{
									m_PMob->m_ActionList.push_back(Action);
								}

								if (PVictim->PParty->m_PAlliance->partyList.at(a)->members.at(i)->PPet != NULL)
								{
									if (battleutils::handleMobAoeAction(m_PMob, PVictim->PParty->m_PAlliance->partyList.at(a)->members.at(i)->PPet, &Action, m_PMobSkill, &radiusAround))
									{
										m_PMob->m_ActionList.push_back(Action);
									}
								}
							}
						}
						break;
					case PET_PARTY_TARGET:  // pet with master in a party
						for (uint8 i = 0; i < PVictim->PMaster->PParty->members.size(); ++i)
						{
							if (battleutils::handleMobAoeAction(m_PMob, PVictim->PMaster->PParty->members.at(i), &Action, m_PMobSkill, &radiusAround))
							{
								m_PMob->m_ActionList.push_back(Action);
							}

							if (PVictim->PMaster->PParty->members.at(i)->PPet != NULL)
							{
								if (battleutils::handleMobAoeAction(m_PMob, PVictim->PMaster->PParty->members.at(i)->PPet, &Action, m_PMobSkill, &radiusAround))
								{
									m_PMob->m_ActionList.push_back(Action);
								}
							}
						}
						break;
					case PET_ALLIANCE_TARGET:  // pet with master in an alliance

						for (uint8 a = 0; a < PVictim->PMaster->PParty->m_PAlliance->partyList.size(); ++a)
						{
							for (uint8 i = 0; i < PVictim->PMaster->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
							{
								if (battleutils::handleMobAoeAction(m_PMob, PVictim->PMaster->PParty->m_PAlliance->partyList.at(a)->members.at(i), &Action, m_PMobSkill, &radiusAround))
								{
									m_PMob->m_ActionList.push_back(Action);
								}

								if (PVictim->PMaster->PParty->m_PAlliance->partyList.at(a)->members.at(i)->PPet != NULL)
								{
									if (battleutils::handleMobAoeAction(m_PMob, PVictim->PMaster->PParty->m_PAlliance->partyList.at(a)->members.at(i)->PPet, &Action, m_PMobSkill, &radiusAround))
									{
										m_PMob->m_ActionList.push_back(Action);
									}
								}
							}
						}
						break;
					case PET_AND_MASTER:  // pet with a master
						if (battleutils::handleMobAoeAction(m_PMob, PVictim, &Action, m_PMobSkill, &radiusAround))
						{
							m_PMob->m_ActionList.push_back(Action);
						}

						if (PVictim->PMaster != NULL)
						{
							if (battleutils::handleMobAoeAction(m_PMob, PVictim->PMaster, &Action, m_PMobSkill, &radiusAround))
							{
								m_PMob->m_ActionList.push_back(Action);
							}
						}
						break;
				}

				// handle AoE logic
				// loop through all targets

			    uint16 actionsLength = m_PMob->m_ActionList.size();
			    m_PMobSkill->setTotalTargets(actionsLength);
			    apAction_t* currentAction;
			    uint16 msg = 0;
			    for (uint32 i = 0; i < actionsLength; ++i)
				{
			        currentAction = &m_PMob->m_ActionList.at(i);

			        CBattleEntity* PTarget = currentAction->ActionTarget;

			        // set default message
			        m_PMobSkill->resetMsg();

					currentAction->param = luautils::OnMobWeaponSkill(PTarget, m_PMob, m_PMobSkill);

					if(i == 0){
						msg = m_PMobSkill->getMsg();
					} else {
						msg = m_PMobSkill->getAoEMsg();
					}

					currentAction->messageID = msg;

				}


			}
			else if (m_PMobSkill->getValidTargets() == TARGET_SELF)
			{
				//aoe on the enemy (e.g. aoe cure)
				//TODO: hit self and all targets of the same family? pt?
			}

			if (m_ActionType == ACTION_FALL)
			{
				//  set when you kill the mob in a script, but need
				//  it to be ACTION_MOBABILITY_FINISH for pushing the packet.
				m_ActionType = ACTION_MOBABILITY_FINISH;
			}

			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob, m_PMob, m_PMobSkill->getID() + 256, 0, MSGBASIC_USES_JA2));
			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
			m_PMob->health.tp = 0;
		}
		else
		{
			//single target moves
			apAction_t Action;

			if(m_PMobSkill->getValidTargets() == TARGET_ENEMY)
				Action.ActionTarget = m_PBattleTarget;

			else if(m_PMobSkill->getValidTargets() == TARGET_SELF)
				Action.ActionTarget = m_PMob;

			Action.reaction   = REACTION_HIT;
			Action.speceffect = SPECEFFECT_HIT;
			Action.animation  = m_PMobSkill->getAnimationID();
			Action.param	  = luautils::OnMobWeaponSkill(m_PBattleTarget, m_PMob,m_PMobSkill);
			Action.subparam   = m_PMobSkill->getID() + 256;
			Action.messageID  = m_PMobSkill->getMsg();
			Action.flag       = 0;

			m_PMob->m_ActionList.push_back(Action);

			if (m_ActionType == ACTION_FALL)
			{
				//  set when you kill the mob in a script, but need
				//  it to be ACTION_MOBABILITY_FINISH for pushing the packet.
				m_ActionType = ACTION_MOBABILITY_FINISH;
			}

			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
			m_PMob->health.tp = 0;

		}

	if (m_PMob->isDead()) //e.g. self-destruct. Needed here AFTER sending the action packets.
	{
		m_ActionType = ACTION_FALL;
		ActionFall();
	}
	else
	{
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

	// animation can be overrided
	uint16 animationId = 0;

	//determine the 2h based on mjob and set the correct target and do the right stuff
	uint16 id = 0; // this is just the main job - 1
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
	case JOB_RDM:
		id=4; Action.ActionTarget = m_PMob; Action.messageID=101;
		m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_CHAINSPELL,0,1,0,60));
		m_LastMagicTime = 0;
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

	// TODO: setup proper animations for dynamis and BCNM
	// if animation been set
	if(m_PMobSkill->getAnimationID() > 0){
		animationId = m_PMobSkill->getAnimationID();
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
	m_firstSpell = true;

	if (m_PMob->isDead()) {
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

    if (!m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP) &&
        !m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SLEEP_II) &&
        !m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_PETRIFICATION) &&
        !m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_LULLABY)
        && !m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_STUN))
    {
		//put it in combat if it isn't
		if( m_PMob->animation == ANIMATION_NONE ){
			m_PMob->animation = ANIMATION_ATTACK;
		}
		m_ActionType = (m_PMob->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);
    }
	//TODO: possibly change this so have ActionBeforeSleep then ActionSleep (send ENTITY_UPDATE once only rather than spam)
	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE));

}

void CAIMobDummy::ActionMagicStart()
{
	DSP_DEBUG_BREAK_IF(m_PSpell == NULL);

	m_PBattleSubTarget = m_PBattleTarget;

	// check valid targets
	if ( (m_PSpell->getValidTarget() & TARGET_ENEMY) && m_PBattleSubTarget->id == m_PMob->id) {
		m_ActionType = ACTION_ATTACK;
		m_LastMagicTime = m_Tick;
		ShowDebug("Monster Magic Cast on self but spell is enemy... \n");
		return;
	}
	else if (m_PSpell->getValidTarget() & TARGET_SELF) {
		m_PBattleSubTarget = m_PMob;
	}


	m_LastActionTime = m_Tick;
	m_LastMagicTime = m_Tick;

	apAction_t Action;
    m_PMob->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = 0;
	Action.param	  = m_PSpell->getID();
	Action.messageID  = 327;
	Action.flag		  = 0;

	m_PMob->m_ActionList.push_back(Action);

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
    m_ActionType = ACTION_MAGIC_CASTING;
}

void CAIMobDummy::ActionMagicCasting()
{
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (m_PBattleSubTarget->isDead() || m_PBattleSubTarget->getZone() != m_PMob->getZone()) {
		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
		return;
	}

	if (m_PMob->isDead()) {
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	if ( ((m_Tick - m_LastMagicTime) >= (float)m_PSpell->getCastTime()*((100.0f-(float)dsp_cap(m_PMob->getMod(MOD_FASTCAST),-100,50))/100.0f)) ||
        m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL,0))
	{
		if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE))
        {
			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleSubTarget,0,0,MSGBASIC_UNABLE_TO_CAST));
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		else if (battleutils::IsParalised(m_PMob))
		{
			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleSubTarget,0,0,MSGBASIC_IS_PARALYZED));
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}
		else if (battleutils::IsIntimidated(m_PMob, m_PBattleSubTarget))
		{
		    m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleSubTarget,0,0,MSGBASIC_IS_INTIMIDATED));
		    m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}

		float CurrentDistance = distance(m_PMob->loc.p, m_PBattleSubTarget->loc.p);
		if (CurrentDistance > 25) {
			m_ActionType = ACTION_MAGIC_INTERRUPT;
			ActionMagicInterrupt();
			return;
		}

		m_ActionType = ACTION_MAGIC_FINISH;
		ActionMagicFinish();

	}
	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE)); //need to keep HP updating
}

void CAIMobDummy::ActionMagicInterrupt()
{
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleSubTarget,0,0, MSGBASIC_IS_INTERRUPTED));

	apAction_t Action;
    m_PMob->m_ActionList.clear();

	Action.ActionTarget = m_PMob;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = m_PSpell->getAnimationID();
	Action.param	  = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;

	m_PMob->m_ActionList.push_back(Action);

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
	m_LastMagicTime = m_Tick; // reset this in case the spell is long casting, don't want to immediately recast
	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;
	m_ActionType = ACTION_ATTACK;
}

void CAIMobDummy::ActionMagicFinish()
{
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL || m_PSpell == NULL);

	apAction_t Action;
	CBattleEntity* PTarget;
    m_PMob->m_ActionList.clear();

	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_NONE;
	Action.speceffect = SPECEFFECT_NONE;
	Action.animation  = m_PSpell->getAnimationID();
	Action.param      = 0;
	Action.messageID  = 0;
	Action.flag		  = 0;
	m_LastMagicTime = m_Tick; // reset this in case the spell is long casting, don't want to immediately recast

    m_PMob->m_ActionList.push_back(Action);

	if (m_PSpell->isAOE()) {
		TARGET_PARTY_TYPE targetPartyType = battleutils::getAvailableAoeTargets(m_PBattleSubTarget);

		switch (targetPartyType) {
		case SOLO_TARGET: // confusingly this can also include a pet apparently (?)
			if (m_PBattleSubTarget->PPet != NULL) {
				AddEntityForAoe(m_PBattleSubTarget->PPet, Action);
			}
			break;
		case PARTY_TARGET:
			for (uint8 i = 0; i < m_PBattleSubTarget->PParty->members.size(); ++i) {
				CBattleEntity* PTarget = m_PBattleSubTarget->PParty->members[i];
				if(m_PBattleSubTarget != PTarget) { // we've already added the target of the spell, so don't add twice.
					AddEntityForAoe(PTarget, Action);
				}
			}
			break;
		case ALLIANCE_TARGET:
			for (uint8 a = 0; a < m_PBattleSubTarget->PParty->m_PAlliance->partyList.size(); ++a) {
				for (uint8 i = 0; i < m_PBattleSubTarget->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i) {
					CBattleEntity* PTarget = m_PBattleSubTarget->PParty->m_PAlliance->partyList.at(a)->members.at(i);

					if (m_PBattleSubTarget != PTarget) {
						// add the member of the alliance
						AddEntityForAoe(PTarget, Action);
					}

					if (PTarget->PPet != NULL) {
						// add the member's pet too
						AddEntityForAoe(PTarget->PPet, Action);
					}
				}
			}
			break;
		case PET_PARTY_TARGET:
			for (uint8 i = 0; i < m_PBattleSubTarget->PMaster->PParty->members.size(); ++i) {
				AddEntityForAoe(m_PBattleSubTarget->PMaster->PParty->members.at(i), Action);
				PTarget = m_PBattleSubTarget->PMaster->PParty->members.at(i);

				if (PTarget->PPet != NULL && m_PBattleSubTarget != PTarget->PPet) {
					AddEntityForAoe(PTarget->PPet, Action);
				}
			}
			break;
		case PET_ALLIANCE_TARGET:
			for (uint8 a = 0; a < m_PBattleSubTarget->PMaster->PParty->m_PAlliance->partyList.size(); ++a) {
				for (uint8 i = 0; i < m_PBattleSubTarget->PMaster->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i) {
					PTarget = m_PBattleSubTarget->PMaster->PParty->m_PAlliance->partyList.at(a)->members.at(i);
					AddEntityForAoe(PTarget, Action);

					if (PTarget->PPet != NULL && m_PBattleSubTarget != PTarget->PPet) {
						AddEntityForAoe(PTarget->PPet, Action);
					}
				}
			}
			break;
		case PET_AND_MASTER:
			if (m_PBattleSubTarget->PMaster != NULL) {
				AddEntityForAoe(m_PBattleSubTarget->PMaster, Action);
			}
			break;
		}
	}

    uint16 actionsLength = m_PMob->m_ActionList.size();
	for (uint32 i = 0; i < actionsLength; ++i)
	{
        PTarget = m_PMob->m_ActionList.at(i).ActionTarget;

		if (m_PSpell->canTargetEnemy()) {
			// wipe shadows if needed
			if (m_PSpell->isAOE()) {
				PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE);
				PTarget->StatusEffectContainer->DelStatusEffect(EFFECT_BLINK);
			}
			else if (battleutils::IsAbsorbByShadow(PTarget)) {
				m_PMob->m_ActionList.at(i).messageID = 0;
				m_PMob->m_ActionList.at(i).param = 1;
				PTarget->loc.zone->PushPacket(PTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(PTarget,PTarget,0,1, MSGBASIC_SHADOW_ABSORB));
				continue; // continue to next pt member
			}
		}

        m_PSpell->setMessage(m_PSpell->getDefaultMessage());
        uint16 result = luautils::OnSpellCast(m_PMob, PTarget);
        m_PMob->m_ActionList.at(i).param = result;

        if(result >= 2000){
        	ShowDebug("Super high magic damage warning: %d\n", result);
        }

        m_PMob->m_ActionList.at(i).messageID = m_PSpell->getMessage();

		if(m_PMob->m_ActionList.at(i).param>0 && m_PSpell->canTargetEnemy()){ //damage spell which dealt damage, TODO: use a better identifier!
			if(m_PSpell->getMessage()==2 || m_PSpell->getMessage()==227){//damage or drain hp
				PTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DAMAGE);
			}

            if(m_PSpell->isAOE()){
                // reduce damage from -ga spell
                if(actionsLength > 9){
                    // ga spells on 10+ targets = 0.4
                    m_PMob->m_ActionList.at(i).param *= (float)0.4;
                } else if(actionsLength > 1){
                    // -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
                    m_PMob->m_ActionList.at(i).param *= (float)0.9 - 0.05*actionsLength;
                }
            }
		}

		if(i>0){
			m_PMob->m_ActionList.at(i).messageID = m_PSpell->getAoEMessage();
		}

		if (PTarget->objtype == TYPE_MOB && m_PMob->id != PTarget->id)
        {
            if (PTarget->isDead())
            {
                ((CMobEntity*)PTarget)->m_DropItemTime = m_PSpell->getAnimationTime();
            }
            ((CMobEntity*)PTarget)->m_OwnerID.id = m_PMob->id;
            ((CMobEntity*)PTarget)->m_OwnerID.targid = m_PMob->targid;
            ((CMobEntity*)PTarget)->PEnmityContainer->UpdateEnmity(m_PMob, m_PSpell->getCE(), m_PSpell->getVE());
        }
    }

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

	m_ActionType = (m_PMob->animation == ANIMATION_ATTACK ? ACTION_ATTACK : ACTION_NONE);

	if(m_PMob->PEnmityContainer->GetHighestEnmity() == NULL){
		// just buffing, lets go back to roaming
		m_ActionType = ACTION_ROAMING;
	} else if(m_ActionType == ACTION_NONE){
		// attack something
		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
		return;
	} else {
		if (m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL,0) ) {
			// let's make CSing monsters actually use lots of spells.
			m_LastMagicTime = m_Tick - m_PMob->m_MagicRecastTime + m_PSpell->getAnimationTime(); // so the animations look correct.
		}
	}

	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;
}

/************************************************************************
*																		*
*  Обычная физическая атака без нанесения какого-либо урона				*
*																		*
************************************************************************/

void CAIMobDummy::ActionAttack()
{
	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();

	if(m_PBattleTarget == NULL) // we have no target, so disengage
    {
		m_ActionType = ACTION_DISENGAGE;
		return;
	}

	// mob should not attack another mob with no master
	if(m_PBattleTarget != NULL && m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->PMaster == NULL)
	{
		m_PMob->PEnmityContainer->Clear(m_PBattleTarget->id);
		m_PMob->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
	}

	// target is dead, on a choco or zoned, so wipe them from our enmity list
    if (m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO ||
		m_PBattleTarget->loc.zone->GetID() != m_PMob->loc.zone->GetID())
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
	// Avatars defend masters by attacking mobs if the avatar isn't attacking anything currently (bodyguard behaviour)
	if(m_PBattleTarget->PPet != NULL && m_PBattleTarget->PPet->PBattleAI->GetBattleTarget()==NULL) {
		if(((CPetEntity*)m_PBattleTarget->PPet)->getPetType()==PETTYPE_AVATAR) {
			m_PBattleTarget->PPet->PBattleAI->SetBattleTarget(m_PMob);
		}
	}
	// Jug pets (and normal charmed pets) will defend themselves from attack only, not their master. (self-preservation behaviour)
	else if(m_PBattleTarget->objtype == TYPE_PET && m_PBattleTarget->PBattleAI->GetBattleTarget()==NULL){
		if(((CPetEntity*)m_PBattleTarget)->getPetType()==PETTYPE_JUGPET){
			m_PBattleTarget->PBattleAI->SetBattleTarget(m_PMob);
		}
	}

	// Handle monster linking if they are close enough
    if (m_PMob->PParty != NULL)
    {
        for (uint16 i = 0; i < m_PMob->PParty->members.size(); ++i)
        {
            CMobEntity* PPartyMember = (CMobEntity*)m_PMob->PParty->members[i];

            if (PPartyMember->PBattleAI->GetCurrentAction() == ACTION_ROAMING &&
                distance(m_PMob->loc.p, PPartyMember->loc.p) < m_PMob->linkRadius)
            {
                PPartyMember->PEnmityContainer->AddBaseEnmity(m_PBattleTarget);
            }
        }
    }

    m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, m_PBattleTarget->loc.p);

    float CurrentDistance = distance(m_PMob->loc.p, m_PBattleTarget->loc.p);

	// Try to spellcast (this is done first so things like Chainspell spam is prioritised over TP moves etc.
	if (CurrentDistance <= 25 && (m_Tick - m_LastMagicTime) > m_PMob->m_MagicRecastTime && TryCastSpell()) { // 25 yalms is roughly spellcasting range. This also pairs with deaggro range which is 25.
		return;
	}

	if (CurrentDistance <= m_PMob->m_ModelSize)
	{
		int32 WeaponDelay = m_PMob->m_Weapons[SLOT_MAIN]->getDelay();
		if (m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_HUNDRED_FISTS,0))
		{
			WeaponDelay = 600;
		} else {
			int16 hasteMagic = (m_PMob->getMod(MOD_HASTE_MAGIC) > 448) ? 448 : m_PMob->getMod(MOD_HASTE_MAGIC);
			int16 hasteAbility = (m_PMob->getMod(MOD_HASTE_ABILITY) > 256) ? 256 : m_PMob->getMod(MOD_HASTE_ABILITY);
			WeaponDelay -= (((float)(hasteMagic + hasteAbility) * WeaponDelay) / 1024);
		}

		if ((m_Tick - m_LastActionTime) > WeaponDelay)
		{
			if (battleutils::IsParalised(m_PMob) && m_AutoAttackEnabled)
			{
				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0, MSGBASIC_IS_PARALYZED));
			}
			else if (battleutils::IsIntimidated(m_PMob, m_PBattleTarget) && m_AutoAttackEnabled)
			{
				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0, MSGBASIC_IS_INTIMIDATED));
			}
			else
			{
				// give a 40% chance of a TP move >100% TP under most circumstances. Always use TP if we hit 300%. Always use TP if we're < 25% HP and have >100% TP
				if ( m_MobAbilityEnabled && (m_PMob->health.tp >= 100 && rand()%100 > 60 || m_PMob->health.tp == 300 ||
					m_PMob->health.tp >= 100 && m_PMob->GetHPP()<=25 ))
				{
					m_ActionType = ACTION_MOBABILITY_START;
                    ActionAbilityStart();
					return;
				}
				if (m_AutoAttackEnabled)
				{
					apAction_t Action;
					m_PMob->m_ActionList.clear();

					Action.ActionTarget = m_PBattleTarget;

					uint8 numAttacks = battleutils::CheckMultiHits(m_PMob, m_PMob->m_Weapons[SLOT_MAIN]);

					for(uint8 i=0; i<numAttacks; i++){
						Action.reaction   = REACTION_EVADE;
						Action.speceffect = SPECEFFECT_NONE;
						Action.animation  = 0;
						Action.param	  = 0;
						Action.messageID  = 15;
						Action.flag		  = 0;
						if(m_PBattleTarget->isDead()){
							break;
						}

						uint16 damage = 0;
						bool isCountered = false;
						bool isParried = false;
						bool isGuarded = false;
						if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
						{
							Action.messageID = 32;
						}
						else if ( rand()%100 < battleutils::GetHitRate(m_PMob, m_PBattleTarget) )
						{
							if (battleutils::IsParried(m_PMob, m_PBattleTarget))
							{
								isParried = true;
								Action.messageID = 70;
								Action.reaction   = REACTION_PARRY;
								Action.speceffect = SPECEFFECT_NONE;
							}
							else if (battleutils::IsAbsorbByShadow(m_PBattleTarget))
							{
								Action.messageID = 0;
								m_PBattleTarget->loc.zone->PushPacket(m_PBattleTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget,m_PBattleTarget,0,1, MSGBASIC_SHADOW_ABSORB));
							}
							else if (battleutils::IsAnticipated(m_PBattleTarget,false,false))
							{
								Action.messageID = 30;
							}
							else
							{
								Action.reaction   = REACTION_HIT;
								Action.speceffect = SPECEFFECT_HIT;
								Action.messageID  = 1;

								// if victim is a player, get the players counter merits
								uint8 meritCounter = 0;
								if (m_PBattleTarget->objtype == TYPE_PC && charutils::hasTrait((CCharEntity*)m_PBattleTarget,TRAIT_COUNTER))
								{
									if (m_PBattleTarget->GetMJob() == JOB_MNK || m_PBattleTarget->GetMJob() == JOB_PUP)
										meritCounter = ((CCharEntity*)m_PBattleTarget)->PMeritPoints->GetMeritValue(MERIT_COUNTER_RATE,m_PBattleTarget->GetMLevel());
								}


								//counter check (rate AND your hit rate makes it land, else its just a regular hit)
								if (rand()%100 < (m_PBattleTarget->getMod(MOD_COUNTER) + meritCounter) &&
									rand()%100 < battleutils::GetHitRate(m_PBattleTarget,m_PMob) &&
									charutils::hasTrait((CCharEntity*)m_PBattleTarget,TRAIT_COUNTER))
								{
									isCountered = true;
									Action.messageID = 33; //counter msg  32
									Action.reaction   = REACTION_HIT;
									Action.speceffect = SPECEFFECT_NONE;

									bool isCritical = ( rand()%100 < battleutils::GetCritHitRate(m_PBattleTarget, m_PMob,false) );

									float DamageRatio = battleutils::GetDamageRatio(m_PBattleTarget, m_PMob,isCritical, 0);
									damage = (uint16)((m_PBattleTarget->GetMainWeaponDmg() + battleutils::GetFSTR(m_PBattleTarget, m_PMob,SLOT_MAIN)) * DamageRatio);

									Action.subparam = (damage * 2);
									Action.flag = 2;
								}
								else
								{
									bool isCritical = ( rand()%100 < battleutils::GetCritHitRate(m_PMob, m_PBattleTarget,false) );

									if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_MIGHTY_STRIKES,0))
									{
										isCritical=true;
									}

									float DamageRatio = battleutils::GetDamageRatio(m_PMob, m_PBattleTarget,isCritical, 0);

									if(isCritical)
									{
										Action.speceffect = SPECEFFECT_CRITICAL_HIT;
										Action.messageID  = 67;
									}

									// Guard
									if(battleutils::IsGuarded(m_PMob, m_PBattleTarget))
									{
										isGuarded = true;
										//Action.messageID = 0;
										Action.reaction = REACTION_GUARD;
										Action.speceffect = SPECEFFECT_NONE;
										DamageRatio -= 1.0f; // Guard lowers pDif by 1.0
									}

									damage = (uint16)((m_PMob->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(m_PMob, m_PBattleTarget,SLOT_MAIN)) * DamageRatio);

									//  Guard skill up
									if(m_PBattleTarget->objtype == TYPE_PC && isGuarded || ((map_config.newstyle_skillups & NEWSTYLE_GUARD) > 0))
									{
										if(battleutils::GetGuardRate(m_PMob, m_PBattleTarget) > 0)
										{
											charutils::TrySkillUP((CCharEntity*)m_PBattleTarget,SKILL_GRD, m_PBattleTarget->GetMLevel());
										}
									} // Guard skill up
								}
							}

							// Parry skill up
							if(m_PBattleTarget->objtype == TYPE_PC && isParried || ((map_config.newstyle_skillups & NEWSTYLE_PARRY) > 0))
							{
								if(battleutils::GetParryRate(m_PMob, m_PBattleTarget) > 0)
								{
									charutils::TrySkillUP((CCharEntity*)m_PBattleTarget,SKILL_PAR,m_PBattleTarget->GetMLevel());
								}
							} // Parry skill up
						}
						if (m_PBattleTarget->objtype == TYPE_PC && !isCountered && !isParried)
						{
							charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PMob->GetMLevel());
						}

						bool isBlocked = battleutils::IsBlocked(m_PMob, m_PBattleTarget);
						if(isBlocked){ Action.reaction = REACTION_BLOCK; }

						if(!isCountered)
						{
							if (m_PBattleTarget->objtype == TYPE_PC)
							{
								damage = battleutils::HandleSpecialPhysicalDamageReduction((CCharEntity*)m_PBattleTarget,damage,&Action);
							}

							Action.param = battleutils::TakePhysicalDamage(m_PMob, m_PBattleTarget, damage, isBlocked ,SLOT_MAIN, 1, NULL, true);
							m_PMob->PEnmityContainer->UpdateEnmityFromAttack(m_PBattleTarget, Action.param);

							// Block skill up
							if(m_PBattleTarget->objtype == TYPE_PC && isBlocked || ((map_config.newstyle_skillups & NEWSTYLE_BLOCK) > 0))
							{
								if(battleutils::GetBlockRate(m_PMob, m_PBattleTarget) > 0)
								{
									charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_SHL, m_PMob->GetMLevel());
								}
							} // Block skill up


							// spike effect
							if (Action.reaction != REACTION_EVADE && Action.reaction != REACTION_PARRY)
							{
								// spikes take priority
								if(!battleutils::HandleSpikesDamage(m_PMob, m_PBattleTarget, &Action, damage)){
		                    		// no spikes, handle enspell
		                    		// TODO: enspell method needs to be refactored to accept just battleentity
		                    		// battleutils::HandleEnspell(m_PMob, m_PBattleTarget, &Action, i, WeaponDelay, damage);
								}
							}
						}
						else
						{
							Action.param = battleutils::TakePhysicalDamage(m_PBattleTarget, m_PMob, damage, false, SLOT_MAIN, 1, NULL, true);
						}

						m_PMob->m_ActionList.push_back(Action);
					}
					m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
				} //end attack for
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
		// TODO: Do we really want to do this every tick? We should probably only do this check occasionally, else it's almost
		// guarenteed that the mob will try to use its TP whilst being out of range (if it has the TP)
		if (m_PMob->health.tp >= 100 && rand()%100 > 60 || m_PMob->health.tp == 300 ||
			m_PMob->health.tp >= 100 && m_PMob->GetHPP()<=25 )
		{
			m_ActionType = ACTION_MOBABILITY_START;
			ActionAbilityStart();
			return;
		}
		battleutils::MoveTo(m_PMob, m_PBattleTarget->loc.p, 2);
	}

	if(m_PMob->m_Type & MOBTYPE_NOTORIOUS && (m_Tick - m_StartBattle) % 3000 <= 400) // launch OnMobFight every 3 sec (not everytime at 0 but 0~400)
	{
		luautils::OnMobFight(m_PMob,m_PBattleTarget);
	}

	m_PMob->loc.zone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE));
}



std::vector<CBattleEntity*> CAIMobDummy::GetAdditionalTargets(AOERANGE AoeRange, position_t radiusAround, float radius)
{
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);
    //ShowInfo("Getting Additional Targets\n");

    std::vector<CBattleEntity*> results;

    CParty* PParty = NULL;
    CAlliance* PAlliance = NULL;
    CZone* PZone = NULL;

    switch(m_PBattleTarget->objtype)
    {
        case TYPE_PC: // Use player's info
        {
            //ShowInfo("Target: PC\n");
            //PZone = m_PBattleTarget->loc.zone; // TODO: Zone wide aoe not implemented
            //PAlliance = ((CCharEntity*)m_PBattleTarget)->PAlliance; // TODO: Alliances not implemented
            PParty = ((CCharEntity*)m_PBattleTarget)->PParty;
            break;
        }

        case TYPE_PET: // Use owner's info
        {
            //ShowInfo("Target: Pet\n");
            if(m_PBattleTarget->PMaster)
            {
                if(m_PBattleTarget->PMaster->objtype == TYPE_PC)
                {
                    // Pet has an owner, and the owner is a player.
                    //PZone = m_PBattleTarget->PMaster->loc.zone; // TODO: Zone wide aoe not implemented
                    //PAlliance = ((CCharEntity*)m_PBattleTarget->PMaster)->PAlliance; // TODO: Alliances not implemented
                    PParty = ((CCharEntity*)m_PBattleTarget->PMaster)->PParty;
                }
                else
                {
                    // TODO: AoEs initiated from a monster to a monster's or npc's pet.
                }
            }
            break;
        }

        default: // TODO: NPC as an AoE target?
        {
            //ShowInfo("Target: Else\n");
            break;
        }
    }

    // TODO: Implement zone wide AoEs
    //if(AoeRange & AOE_ZONE > 0 && PZone != NULL)
    //{
    //    ShowInfo("Adding Zone\n");
    //    // When checking the entire zone there is no need to check alliance, party, owner, etc.
    //    for(uint16 i = 0; i < PZone->m_charList.size; i++) // m_charList is private.
    //    {
    //        results.push_back((CBattleEntity*)PZone->m_charList[i]);
    //        // TODO: Add entity's pet
    //    }
    //}
    // TODO: Implement alliances
    //else if(AoeRange & AOE_ALLIANCE > 0 && PAlliance != NULL)
    //{
    //    ShowInfo("Adding Alliance\n");
    //    // When checking the alliance there is no need to check party, owner, etc.
    //    for(uint16 i = 0; i < PAlliance->members.size(); i++)
    //    {
    //        results.push_back(PAlliance->members[i]);
    //        // TODO: Add entity's pet
    //    }
    //}
    /*else*/ if(((AoeRange & AOE_PARTY) > 0) && PParty != NULL)
    {
        //ShowInfo("Adding Party\n");

        // When checking the party there is no need to check owner, etc.
        for(uint16 i = 0; i < PParty->members.size(); i++)
        {
            results.push_back(PParty->members[i]);

            if(PParty->members[i]->PPet)
                results.push_back(PParty->members[i]->PPet);
        }
    }
    else // Solo
    {
        if(m_PBattleTarget->PMaster)
        {
            //ShowInfo("Adding Owner\n");

            // When all else fails at least check the master
            results.push_back(m_PBattleTarget->PMaster);
        }

        if(m_PBattleTarget->PPet)
        {
            //ShowInfo("Adding Pet\n");
            results.push_back(m_PBattleTarget->PPet);
        }
    }


    // Prune entities that aren't in range/zone/alive/etc
    for (std::vector<CBattleEntity*>::iterator itr = results.begin(); itr != results.end();)
    {
        CBattleEntity* PTarget = (*itr);

        //ShowInfo("Checking Target: %d %s\n", PTarget->id, PTarget->GetName());

        if((PTarget->isDead()) ||
            PTarget == m_PBattleTarget ||
            PTarget->getZone() != m_PBattleTarget->getZone() ||
            distance(radiusAround, PTarget->loc.p) > radius)
        {
            //ShowInfo("Removed");
            results.erase(itr++);
        }
        else
        {
            itr++;
        }
    }

	// Trim excess entities (no more than 16 valid targets!)
	if(results.size() > 16)
		results.erase(results.end() - (results.size() - 16), results.end());

    return results;
}

bool CAIMobDummy::TryCastSpell()
{
	if ( !m_MagicCastingEnabled || !m_PMob->SpellContainer->HasSpells()) return false;

	// check for spell blockers e.g. silence
	if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE)) {
		return false;
	}

	int chosenSpellId = -1;
	if (m_PMob->m_HasSpellScript) {
		// skip logic and follow script
		chosenSpellId = luautils::OnMonsterMagicPrepare(m_PMob, m_PBattleTarget);
		if(chosenSpellId > -1){
			CastSpell(chosenSpellId);
			return true;
		}
	} else {
		// find random spell

		if(m_firstSpell){
			// mobs first spell, should be aggro spell
			chosenSpellId = m_PMob->SpellContainer->GetAggroSpell();
			m_firstSpell = false;
		} else {
			chosenSpellId = m_PMob->SpellContainer->GetSpell();
		}

		if(chosenSpellId > -1){
			CastSpell(chosenSpellId);
			return true;
		}

	}

	// the script doesn't want to cast a spell at the moment, but it should still be treated as a magic attempt
	m_LastMagicTime = m_Tick;
	return false;
}

void CAIMobDummy::CastSpell(uint16 spellId)
{
	m_PSpell = spell::GetSpell(spellId);

	if(m_PSpell == NULL){
		ShowWarning(CL_YELLOW"ai_mob_dummy::CastSpell: SpellId <%i> is not found\n" CL_RESET, spellId);
	} else {
		m_ActionType = ACTION_MAGIC_START;
		ActionMagicStart();
	}
}

void CAIMobDummy::AddEntityForAoe(CBattleEntity* entityToAdd, apAction_t Action) {
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	if (!entityToAdd->isDead() && distance(m_PBattleSubTarget->loc.p, entityToAdd->loc.p) <= 10) {
	    Action.ActionTarget = entityToAdd;
	    m_PMob->m_ActionList.push_back(Action);
	}
}