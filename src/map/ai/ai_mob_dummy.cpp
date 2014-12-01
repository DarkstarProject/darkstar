/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "../utils/battleutils.h"
#include "../utils/blueutils.h"
#include "../utils/charutils.h"
#include "../utils/itemutils.h"
#include "../utils/attackutils.h"
#include "../mobskill.h"
#include "../utils/mobutils.h"
#include "../status_effect.h"
#include "../entities/petentity.h"
#include "../utils/petutils.h"
#include "../spell.h"
#include "../zone.h"
#include "../alliance.h"
#include "../map.h"
#include "../attack.h"
#include "../attackround.h"

#include "ai_mob_dummy.h"

#include "../lua/luautils.h"

#include "../packets/action.h"
#include "../packets/entity_update.h"
#include "../packets/entity_animation.h"
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
    m_PTargetFind = new CTargetFind(PMob);
    m_PPathFind = new CPathFind(PMob);

    m_PMagicState = new CMagicState(PMob, m_PTargetFind);

    m_checkDespawn = false;
	m_PSpecialSkill = NULL;
	m_firstSpell = true;
	m_LastSpecialTime = 0;
	m_skillTP = 0;
	m_LastStandbackTime = 0;
	m_DeaggroTime = 0;
	m_NeutralTime = 0;
	m_CanStandback = false;
	m_drawnIn = false;
    m_mobskillattack = false;
    m_actionqueueability = false;
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

	OnTick();

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
		case ACTION_DESPAWN:			  ActionDespawn();          break;
		case ACTION_SPAWN:				  ActionSpawn();            break;
		case ACTION_ATTACK:				  ActionAttack();           break;
        case ACTION_SLEEP:                ActionSleep();            break;
		case ACTION_MOBABILITY_START:     ActionAbilityStart();     break;
		case ACTION_MOBABILITY_USING:	  ActionAbilityUsing();     break;
		case ACTION_MOBABILITY_FINISH:	  ActionAbilityFinish();  	break;
        case ACTION_MOBABILITY_INTERRUPT: ActionAbilityInterrupt(); break;
        case ACTION_STUN: 			  	  ActionStun();			    break;
		case ACTION_MAGIC_START:		  ActionMagicStart();		break;
		case ACTION_MAGIC_CASTING:		  ActionMagicCasting();		break;
		case ACTION_MAGIC_INTERRUPT:	  ActionMagicInterrupt();	break;
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
	if (m_PMob->PEnmityContainer->GetHighestEnmity() != NULL && !(m_PMob->m_roamFlags & ROAMFLAG_IGNORE))
	{
		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
		return;
	}
	else if (m_PMob->m_OwnerID.id != 0 && !(m_PMob->m_roamFlags & ROAMFLAG_IGNORE))
	{
		// i'm claimed by someone and need hate towards this person
        m_PBattleTarget = (CBattleEntity*)m_PMob->GetEntity(m_PMob->m_OwnerID.targid, TYPE_PC | TYPE_MOB | TYPE_PET);

		battleutils::ClaimMob(m_PMob, m_PBattleTarget);

        // TODO: возможно необходимо добавлять цели базовое количество ненависти

		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
		return;
	}
	else if (m_PMob->GetDespawnTimer() > 0 && m_PMob->GetDespawnTimer() < m_Tick)
	{
		m_LastActionTime = m_Tick - 12000;
		m_PMob->PBattleAI->SetCurrentAction(ACTION_DEATH);
		return;
	}

	// wait my time
	if(m_Tick < m_LastWaitTime + m_WaitTime){
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_NONE));
		return;
	}

    uint8 updates = 0;

	if(m_PMob->m_roamFlags & ROAMFLAG_IGNORE)
	{
		// don't claim me if I ignore
		m_PMob->m_OwnerID.clean();
	}

	// don't aggro a little bit after I just disengaged
	m_PMob->m_neutral = m_PMob->CanBeNeutral() && m_Tick <= m_NeutralTime + MOB_NEUTRAL_TIME;

	if(m_PPathFind->IsFollowingPath())
	{
		FollowPath();

        updates |= UPDATE_POS;
	}
    else if (m_Tick >= m_LastActionTime + m_PMob->getBigMobMod(MOBMOD_ROAM_COOL))
	{
		// lets buff up or move around

                // can't rest with poison or disease
            if(m_PMob->CanRest()){
                // recover 10% health
                if(m_PMob->Rest(0.1f))
                {
                    // health updated
                    updates |= UPDATE_HP;
                }
                else
                {
                    // at max health undirty exp
                    m_PMob->m_giveExp = true;
                }
            }

		// if I just disengaged check if I should despawn
		if(m_checkDespawn && m_PMob->IsFarFromHome())
		{
			if(m_PMob->CanRoamHome() && m_PPathFind->PathTo(m_PMob->m_SpawnPoint, PATHFLAG_WALLHACK))
			{
				// walk back to spawn if too far away

				// limit total path to just 10 or
				// else we'll move straight back to spawn
				m_PPathFind->LimitDistance(10.0f);

				FollowPath();

                updates |= UPDATE_POS;

				// move back every 5 seconds
				m_LastActionTime = m_Tick - m_PMob->getBigMobMod(MOBMOD_ROAM_COOL) + MOB_NEUTRAL_TIME;
			}
			else
			{
				// despawn
				m_ActionType = ACTION_DEATH;
				return;
			}
		}
		else
		{
			// do not check for despawning because i'm at home
			m_checkDespawn = false;

			if(m_PSpecialSkill != NULL && TrySpecialSkill())
			{
				// I spawned a pet
			}
			else if(CanCastSpells() && WELL512::irand()%10 < 3 && m_PMob->SpellContainer->HasBuffSpells())
			{
				// cast buff
				CastSpell(m_PMob->SpellContainer->GetBuffSpell());
			}
			else if((m_PMob->m_roamFlags & ROAMFLAG_AMBUSH))
			{
				// stay underground
				m_PMob->HideName(true);
				m_PMob->HideModel(true);
				m_PMob->animationsub = 0;

				updates |= UPDATE_POS;
			}
            else if((m_PMob->m_roamFlags & ROAMFLAG_STEALTH))
            {
                // hidden name
                m_PMob->HideName(true);
                m_PMob->untargetable = true;

                updates |= UPDATE_POS;
            }
			else if(m_PMob->m_roamFlags & ROAMFLAG_EVENT)
			{
				// allow custom event action
				luautils::OnMobRoamAction(m_PMob);
				m_LastActionTime = m_Tick;

                updates |= UPDATE_POS;
			}
			else if(m_PMob->CanRoam() && m_PPathFind->RoamAround(m_PMob->m_SpawnPoint, m_PMob->m_roamFlags))
			{

				if(m_PMob->m_roamFlags & ROAMFLAG_WORM)
				{
					// move down
					m_PMob->animationsub = 1;
					m_PMob->HideName(true);

					// don't move around until i'm fully in the ground
					Wait(2000);
				}
				else
				{
					FollowPath();
				}

				updates |= UPDATE_POS;
			}
			else
			{
				m_LastActionTime = m_Tick;
			}
		}
	}

	// call every 3 seconds
	// NOTE: a lot of NMs use this like Taisai
	if ((m_Tick - m_SpawnTime) % 3000 <= 400)
	{
		luautils::OnMobRoam(m_PMob);
	}

	if (updates != 0)
	{
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, updates));
	}
}

/************************************************************************
*                                                                       *
*  Монстр переходит в боевую стойку, включается режим атаки             *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionEngage()
{
	SetupEngage();

	m_ActionType = ACTION_ATTACK;
	//if (m_PMob->animationsub == 1 || m_PMob->animationsub == 3) m_PMob->animationsub = 2;  //need a better way to do this: it only applies to some mobs!

	if (m_PBattleTarget != NULL)
	{
		if((m_PMob->m_roamFlags & ROAMFLAG_AMBUSH) && m_PMob->IsNameHidden())
		{
			// jump out at you
			TrySpecialSkill();

			m_PMob->animationsub = 1;
			m_PMob->HideName(false);
			m_PMob->HideModel(false);
		}
        else if ((m_PMob->m_roamFlags & ROAMFLAG_STEALTH) && m_PMob->IsNameHidden())
        {
            m_PMob->HideName(false);
            m_PMob->untargetable = false;
        }
		else
		{
			ActionAttack();
		}

	}
	else
	{
		m_ActionType = ACTION_DISENGAGE;
	}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
}

/************************************************************************
*																		*
*  Монстр выходит из режима атаки по каким-либо причинам. Если при этом	*
*  он слишком далеко от точки появления, то запускается перерождение.	*
*																		*
************************************************************************/

void CAIMobDummy::ActionDisengage()
{
	m_PPathFind->Clear();

	// this will let me decide to walk home or despawn
	m_LastActionTime = m_Tick - m_PMob->getBigMobMod(MOBMOD_ROAM_COOL) + MOB_NEUTRAL_TIME;
	m_PMob->m_neutral = true;

	m_checkDespawn = true;
	m_NeutralTime = m_Tick;

	m_PBattleTarget  = NULL;

	m_PMob->SetMainSkin(m_PMob->id);
    m_PMob->delRageMode();
    m_PMob->m_OwnerID.clean();
	m_PMob->m_CallForHelp = 0;
	m_PMob->animation = ANIMATION_NONE;

	//if (m_PMob->animationsub == 2) m_PMob->animationsub = 3;

	TransitionBack();

	luautils::OnMobDisengage(m_PMob);

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
}

/************************************************************************
*																		*
*  Монстр падает на землю после получения смертельного удара.			*
*																		*
************************************************************************/

void CAIMobDummy::ActionFall()
{
	m_PMob->m_THLvl = m_PMob->PEnmityContainer->GetHighestTH();
	m_PMob->PEnmityContainer->Clear();
	m_PPathFind->Clear();

	m_ActionType = ACTION_DROPITEMS;
	m_LastActionTime = m_Tick;
	m_PMob->animation = ANIMATION_DEATH;

	// my pet should fall as well
	if(m_PMob->PPet != NULL && !m_PMob->PPet->isDead() && m_PMob->GetMJob() == JOB_SMN)
	{
		m_PMob->PPet->health.hp = 0;
		m_PMob->PPet->PBattleAI->SetCurrentAction(ACTION_FALL);
	}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
}

/************************************************************************
*																		*
*  Здесь выполняется скрипт после смерти монстра, распределяется опыт	*
*  и определяются выпавшие предметы										*
*																		*
************************************************************************/

void CAIMobDummy::ActionDropItems()
{
    if (m_Tick >= m_LastActionTime + m_PMob->m_DropItemTime)
	{
        CCharEntity* PChar = (CCharEntity*)m_PMob->GetEntity(m_PMob->m_OwnerID.targid, TYPE_PC);

        if (PChar != NULL && PChar->id == m_PMob->m_OwnerID.id)
		{

			m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(PChar,m_PMob,0,0, MSGBASIC_DEFEATS_TARG));

			if (m_PMob->m_CallForHelp == 0)
			{
				blueutils::TryLearningSpells(PChar, m_PMob);
				m_PMob->m_UsedSkillIds.clear();

				if(m_PMob->m_giveExp)
				{
	                charutils::DistributeExperiencePoints(PChar, m_PMob);
				}

                DropList_t* DropList = itemutils::GetDropList(m_PMob->m_DropID);
                //ShowDebug(CL_CYAN"DropID: %u dropping with TH Level: %u\n" CL_RESET, m_PMob->m_DropID, m_PMob->m_THLvl);

			    if (DropList != NULL && DropList->size())
			    {
                    for(uint8 i = 0; i < DropList->size(); ++i)
				    {
						//THLvl is the number of 'extra chances' at an item. If the item is obtained, then break out.
						uint8 tries = 0;
						uint8 maxTries = 1 + (m_PMob->m_THLvl > 2 ? 2 : m_PMob->m_THLvl);
						uint8 bonus = (m_PMob->m_THLvl > 2 ? (m_PMob->m_THLvl - 2)*10 : 0);
						while(tries < maxTries)
						{
							if(WELL512::irand()%1000 < DropList->at(i).DropRate * map_config.drop_rate_multiplier + bonus)
							{
								PChar->PTreasurePool->AddItem(DropList->at(i).ItemID, m_PMob);
								break;
							}
							tries++;
						}
				    }

			    }

				//check for gil (beastmen drop gil, some NMs drop gil)
				if(m_PMob->CanDropGil() || map_config.all_mobs_gil_bonus > 0)
                {
					charutils::DistributeGil(PChar, m_PMob); // TODO: REALISATION MUST BE IN TREASUREPOOL
				}
				//check for seal drops
				/* MobLvl >= 1 = Beastmen Seals ID=1126
				          >= 50 = Kindred Seals ID=1127
						  >= 75 = Kindred Crests ID=2955
						  >= 90 = High Kindred Crests ID=2956
				*/

				uint16 Pzone = PChar->getZone();

				bool validZone = ((Pzone > 0 && Pzone < 39) || (Pzone > 42 && Pzone < 134) || (Pzone > 135 && Pzone < 185) || (Pzone > 188 && Pzone < 255));

                if(validZone && charutils::GetRealExp(PChar->GetMLevel(),m_PMob->GetMLevel()) > 0)
                {

					if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET) && m_PMob->m_Element > 0 &&
                        conquest::GetInfluenceGraphics(PChar->loc.zone->GetRegionID()) < 64 &&
                        WELL512::irand()%100 < 20) // Need to move to SIGNET_CHANCE constant
					{
						PChar->PTreasurePool->AddItem(4095 + m_PMob->m_Element, m_PMob);
						
					}

					if (WELL512::irand() % 100 < 20 && PChar->PTreasurePool->CanAddSeal())
					{
						//RULES: Only 1 kind may drop per mob
						if(m_PMob->GetMLevel() < 50){ //b.seal only
							PChar->PTreasurePool->AddItem(1126, m_PMob);
						}
						else if(m_PMob->GetMLevel() < 70){ //b.seal & k.seal only
							if(WELL512::irand()%2 == 0){
								PChar->PTreasurePool->AddItem(1126, m_PMob);
							}
							else{
								PChar->PTreasurePool->AddItem(1127, m_PMob);
							}
						}
						else if(m_PMob->GetMLevel() < 75){ //b.seal & k.seal & k.crest
							switch(WELL512::irand()%3){
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
						else if(m_PMob->GetMLevel() >= 75){ //all 4
							switch(WELL512::irand()%4){
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

			PChar->setWeaponSkillKill(false);
			m_PMob->StatusEffectContainer->KillAllStatusEffect();

			// NOTE: this is called for all alliance / party members!
			luautils::OnMobDeath(m_PMob, PChar);

		}
		else
		{
			luautils::OnMobDeath(m_PMob, NULL);
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
	if (m_Tick > m_LastActionTime + 12000 && !(m_PMob->m_Behaviour & BEHAVIOUR_NO_DESPAWN))
	{
		m_ActionType = ACTION_FADE_OUT;
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityAnimationPacket(m_PMob, CEntityAnimationPacket::FADE_OUT));
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
	if (m_Tick > m_LastActionTime + 15000 )
	{
		// reset pet cast time to now
		if(m_PMob->PMaster != NULL && m_PMob->PMaster->objtype == TYPE_MOB)
		{
			CAIMobDummy* PBattleAI = (CAIMobDummy*)m_PMob->PMaster->PBattleAI;
			PBattleAI->m_LastSpecialTime = m_Tick - WELL512::irand()%10000;
		}

		m_LastActionTime = m_Tick;
		m_PMob->status = STATUS_DISAPPEAR;
        m_PMob->PEnmityContainer->Clear();

        m_ActionType  = m_PMob->m_AllowRespawn ? ACTION_SPAWN : ACTION_NONE;

        luautils::OnMobDespawn(m_PMob);

		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
	}
}

void CAIMobDummy::ActionDespawn()
{
	ActionFadeOut();

	// do not go into action spawn!!!
	if(m_ActionType == ACTION_SPAWN)
	{
		m_ActionType = ACTION_NONE;
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
	if (m_Tick >= m_LastActionTime + m_PMob->m_RespawnTime)
	{
		m_NeutralTime = m_Tick;
		m_LastActionTime = m_Tick + WELL512::irand() % 8000 + 2000;
		m_SpawnTime = m_Tick;
		m_firstSpell = true;
		m_ActionType = ACTION_ROAMING;
		m_PBattleTarget = NULL;
		m_PBattleSubTarget = NULL;
		m_PSpecialSkill = NULL;
		m_PMobSkill = NULL;
		m_PMob->m_giveExp = true;
        m_PMob->m_OwnerID.clean();
		m_PMob->m_CallForHelp = 0;
		m_PMob->m_HiPCLvl = 0;
		m_PMob->m_THLvl = 0;
		m_PMob->m_ItemStolen = false;
        m_PMob->m_DropItemTime = 1000;
		m_PMob->status = m_PMob->allegiance == ALLEGIANCE_MOB ? STATUS_UPDATE : STATUS_NORMAL;
		m_PMob->animation = ANIMATION_NONE;
		m_PMob->HideName(false);
        m_PMob->ResetLocalVars();

        m_PMob->PEnmityContainer->Clear();
        m_PPathFind->Clear();

		uint8 level = m_PMob->m_minLevel;

		// Generate a random level between min and max level
		if (m_PMob->m_maxLevel != m_PMob->m_minLevel)
		{
			level += WELL512::irand()%(m_PMob->m_maxLevel - m_PMob->m_minLevel);
		}

		m_PMob->SetMLevel(level);
		m_PMob->SetSLevel(level);//calculated in function
        m_PMob->delRageMode();

		mobutils::CalculateStats(m_PMob);
		mobutils::GetAvailableSpells(m_PMob);
		
		if(m_PMob->getMobMod(MOBMOD_MUG_GIL) == 0)
		{
		    uint32 purse = m_PMob->GetRandomGil() / (4+(WELL512::irand()%3));
		    if(purse == 0)
		        purse = m_PMob->GetRandomGil();
		    m_PMob->setMobMod(MOBMOD_MUG_GIL, purse);
		}

		// get my special skill
		if(m_PMob->getMobMod(MOBMOD_SPECIAL_SKILL))
		{
			m_PSpecialSkill = battleutils::GetMobSkill(m_PMob->getMobMod(MOBMOD_SPECIAL_SKILL));
		}

		// spawn somewhere around my point
		m_PMob->loc.p = m_PMob->m_SpawnPoint;

		if(m_PMob->m_roamFlags & ROAMFLAG_AMBUSH)
		{
			m_PMob->HideName(true);
			m_PMob->animationsub = 0;
			// this will hide the mob
			m_PMob->HideModel(true);
		}

        if (m_PMob->m_roamFlags & ROAMFLAG_STEALTH)
        {
            m_PMob->HideName(true);
            m_PMob->untargetable = true;
        }

		// add people to my posse
		if(m_PMob->getMobMod(MOBMOD_ASSIST))
		{
			for(int8 i=1; i<m_PMob->getMobMod(MOBMOD_ASSIST)+1; i++)
			{
				CMobEntity* PMob = (CMobEntity*)m_PMob->GetEntity(m_PMob->targid + i, TYPE_MOB);

				if(PMob != NULL)
				{
					PMob->setMobMod(MOBMOD_SUPERLINK, m_PMob->targid);
				}
			}
		}

		// used for dynamis stat-spawned mobs
		if (m_PMob->loc.zone->GetType() == ZONETYPE_DYNAMIS)
		{
		    m_PMob->m_StatPoppedMobs = false;
		}
		
        luautils::OnMobSpawn( m_PMob );

		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_SPAWN, UPDATE_ALL));
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

    std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(m_PMob->getMobMod(MOBMOD_SKILLS));

    if(m_PMob->m_EcoSystem == SYSTEM_ELEMENTAL)
    {
    	// elementals have no tp moves
    	m_PMob->health.tp = 0;
    	TransitionBack(true);
    	return;
    }

    // не у всех монстов прописаны способности, так что выходим из процедуры, если способность не найдена
	// We don't have any skills we can use, so let's go back to attacking
    if (MobSkills.size() == 0)
    {
    	ShowWarning("CAIMobDummy::ActionAbilityStart No TP moves found for family (%d)\n", m_PMob->m_Family);
        m_PMob->health.tp = 0;
        TransitionBack(true);
		return;
    }

	bool valid = false; //Assume no valid moves exist

	// lets try to use my two hour
	// two hour is assumed to be at the front
	if(m_PMob->getMobMod(MOBMOD_MAIN_2HOUR) > 0)
	{

		// get my job two hour
        SetCurrentMobSkill(battleutils::GetTwoHourMobSkill(m_PMob->GetMJob()));

        if (m_PMobSkill != NULL)
        {
            if (m_PMobSkill->getValidTargets() == TARGET_SELF)
            {
                m_PBattleSubTarget = m_PMob;
            }
            else
            {
                m_PBattleSubTarget = m_PBattleTarget;
            }

            // set param so 2hour can be customized
            m_PMobSkill->setParam(m_PMob->getMobMod(MOBMOD_MAIN_2HOUR));
        }

        valid = (m_PMobSkill != NULL && luautils::OnMobSkillCheck(m_PBattleSubTarget, m_PMob, GetCurrentMobSkill()) == 0);

		if(valid)
		{
			// don't use again unless I can use it multiple times
			if (!m_PMob->getMobMod(MOBMOD_2HOUR_MULTI))
			{
				// don't use it again
				m_PMob->setMobMod(MOBMOD_MAIN_2HOUR, 0);
			}

			// force magic spam on chainspell, manafont and soul voice
			int16 skillID = m_PMobSkill->getID();
			if(skillID == 436 || skillID == 440 || skillID == 435)
			{
				m_LastMagicTime = 0;
			}
		}
	}

    if (!valid && m_PMob->getMobMod(MOBMOD_SUB_2HOUR) > 0)
    {

        // get my job two hour
        SetCurrentMobSkill(battleutils::GetTwoHourMobSkill(m_PMob->GetSJob()));

        if (m_PMobSkill != NULL)
        {
            if (m_PMobSkill->getValidTargets() == TARGET_SELF)
            {
                m_PBattleSubTarget = m_PMob;
            }
            else
            {
                m_PBattleSubTarget = m_PBattleTarget;
            }

            // set param so 2hour can be customized
            m_PMobSkill->setParam(m_PMob->getMobMod(MOBMOD_SUB_2HOUR));
        }

        valid = (m_PMobSkill != NULL && luautils::OnMobSkillCheck(m_PBattleSubTarget, m_PMob, GetCurrentMobSkill()) == 0);

        if (valid)
        {
            // don't use again unless I can use it multiple times
            if (!m_PMob->getMobMod(MOBMOD_2HOUR_MULTI))
            {
                // don't use it again
                m_PMob->setMobMod(MOBMOD_SUB_2HOUR, 0);
            }

            // force magic spam on chainspell, manafont and soul voice
            int16 skillID = m_PMobSkill->getID();
            if (skillID == 436 || skillID == 440 || skillID == 435)
            {
                m_LastMagicTime = 0;
            }
        }
    }

	// no 2 hour picked, lets find a normal skill
	if(!valid)
	{
		std::random_shuffle(MobSkills.begin(), MobSkills.end()); //Start the selection process by randomizing the container

		for(int i=0;i<MobSkills.size();i++){
            SetCurrentMobSkill(MobSkills.at(i));
            if (m_PMobSkill->getValidTargets() == TARGET_ENEMY){ //enemy
                m_PBattleSubTarget = m_PBattleTarget;
            }
            else if (m_PMobSkill->getValidTargets() == TARGET_SELF){ //self
                m_PBattleSubTarget = m_PMob;
            }
            else
            {
                continue;
            }
            float currentDistance = distance(m_PMob->loc.p, m_PBattleSubTarget->loc.p);
            if (!m_PMobSkill->isTwoHour() && luautils::OnMobSkillCheck(m_PBattleSubTarget, m_PMob, GetCurrentMobSkill()) == 0){ //A script says that the move in question is valid
				if(currentDistance <= m_PMobSkill->getDistance()) {
					valid = true;
					break;
				}
			}
		}
	}


	if(!valid) {
		// couldn't find anything so go back to attack
		m_PMob->health.tp = 0;
		TransitionBack(true);
		return;
	}
    
    if (!(m_PMob->m_Behaviour & BEHAVIOUR_NO_TURN))
        m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);
    m_LastActionTime = m_Tick;

	// store the TP the mob currently has as the mob skill TP modifier
	m_skillTP = m_PMob->health.tp;

	// remove tp
	if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_MEIKYO_SHISUI))
	{
		if(m_PMob->health.tp <= 1000)
		{
			m_PMob->health.tp = 0;
		} else {
			m_PMob->health.tp -= 1000;
		}
	} else {
		m_PMob->health.tp = 0;
	}

    if (m_PMobSkill->getFlag() & SKILLFLAG_DRAW_IN)
    {
        float currentDistance = distance(m_PMob->loc.p, m_PBattleTarget->loc.p);

        if (currentDistance >= m_PMob->m_ModelSize * 2)
        {
            if (!m_drawnIn)
            {
                battleutils::DrawIn(m_PBattleTarget, m_PMob, m_PMob->m_ModelSize - 0.2f);
                m_drawnIn = true;
            }
            else
            {
                m_drawnIn = false;
            }

        }
    }

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));

	if( m_PMobSkill->getActivationTime() == 0)
	{
		m_ActionType = ACTION_MOBABILITY_FINISH;
		ActionAbilityFinish();
	}
	else
	{

	    apAction_t Action;
	    m_PMob->m_ActionList.clear();
		// charge up time
		Action.ActionTarget = m_PBattleSubTarget;
		Action.reaction   = REACTION_HIT;
		Action.speceffect = SPECEFFECT_HIT;
		Action.animation  = 0;
		Action.param	  = m_PMobSkill->getMsgForAction();
        Action.messageID = m_PMobSkill->getMsg() == 0 ? 0 : 43; //readies message
        Action.knockback  = 0;

		m_PMob->m_ActionList.push_back(Action);
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
		m_ActionType = ACTION_MOBABILITY_USING;
	}

}

/***********************************************************************
		In the readying animation to use a TP move
************************************************************************/
void CAIMobDummy::ActionAbilityUsing()
{
	DSP_DEBUG_BREAK_IF(m_PMobSkill == NULL);

	// If our target dies or zones whilst readying, then interrupt the TP move.
    if ((m_PMobSkill->getValidTargets() == TARGET_ENEMY && !m_PBattleSubTarget) ||
            (m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->isDead()) ||
	        (m_PMobSkill->getValidTargets() == TARGET_ENEMY && m_PBattleSubTarget->getZone() != m_PMob->getZone()))
    {
		m_ActionType = ACTION_MOBABILITY_INTERRUPT;
		ActionAbilityInterrupt();
		return;
	}

    if (!(m_PMob->m_Behaviour & BEHAVIOUR_NO_TURN))
	    m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);

	//TODO: Any checks whilst the monster is preparing.
	//NOTE: RANGE CHECKS ETC ONLY ARE DONE AFTER THE ABILITY HAS FINISHED PREPARING.
	//      THE ONLY CHECK IN HERE SHOULD BE WITH STUN/SLEEP/TERROR/ETC

	if (m_Tick >= m_LastActionTime + m_PMobSkill->getActivationTime())
    {
		//Range check
		if(m_PMobSkill->getValidTargets() == TARGET_ENEMY &&
			m_PBattleSubTarget!=m_PMob &&
			distance(m_PBattleSubTarget->loc.p,m_PMob->loc.p) > m_PMobSkill->getDistance()){

			m_ActionType = ACTION_MOBABILITY_INTERRUPT;
			ActionAbilityInterrupt();
			return;
		}

		m_LastActionTime = m_Tick;
		m_ActionType = ACTION_MOBABILITY_FINISH;
		ActionAbilityFinish();
	}
	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT)); //need to keep HP updating

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

	// crash fix, a null target made it into CActionPacket
	if (m_PBattleSubTarget == NULL)
	{
		m_ActionType = ACTION_ATTACK;
		return;
	}

	m_DeaggroTime = m_Tick;
    m_PBattleSubTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

	// store the skill used
	m_PMob->m_UsedSkillIds[m_PMobSkill->getID()] = m_PMob->GetMLevel();

    m_PTargetFind->reset();
    m_PMob->m_ActionList.clear();

    float distance = m_PMobSkill->getDistance();
    uint8 findFlags = 0;
    if (m_PMobSkill->getFlag() & SKILLFLAG_HIT_ALL)
        findFlags |= FINDFLAGS_HIT_ALL;

    if(m_PTargetFind->isWithinRange(&m_PBattleSubTarget->loc.p, distance))
    {
		if(m_PMobSkill->isAoE())
		{
	        m_PTargetFind->findWithinArea(m_PBattleSubTarget, (AOERADIUS)m_PMobSkill->getAoe(), m_PMobSkill->getRadius(), findFlags);
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

    uint16 actionsLength = m_PTargetFind->m_targets.size();

    m_PMobSkill->setTotalTargets(actionsLength);
	m_PMobSkill->setTP(m_skillTP);

	apAction_t Action;
	Action.ActionTarget = m_PBattleSubTarget;
	Action.reaction   = REACTION_HIT;
	Action.speceffect = SPECEFFECT_HIT;
	Action.animation  = m_PMobSkill->getAnimationID();
	Action.messageID  = m_PMobSkill->getMsg();
    Action.knockback  = 0;

    uint16 msg = 0;
    for (std::vector<CBattleEntity*>::iterator it = m_PTargetFind->m_targets.begin() ; it != m_PTargetFind->m_targets.end(); ++it)
	{
        CBattleEntity* PTarget = *it;

        Action.ActionTarget = PTarget;

		Action.param = luautils::OnMobWeaponSkill(PTarget, m_PMob, GetCurrentMobSkill());

		if(msg == 0){
			msg = m_PMobSkill->getMsg();
		} else {
			msg = m_PMobSkill->getAoEMsg();
		}

		Action.messageID = msg;

		if(m_PMobSkill->hasMissMsg())
		{
		    Action.reaction   = REACTION_MISS;
            Action.speceffect = SPECEFFECT_NONE;
            if (msg = m_PMobSkill->getAoEMsg())
                msg = 282;
		} else {
		    Action.reaction   = REACTION_HIT;
		}

        if (Action.speceffect & SPECEFFECT_HIT)
        {
            Action.speceffect = SPECEFFECT_RECOIL;
            Action.knockback = m_PMobSkill->getKnockback();
            if (it == m_PTargetFind->m_targets.begin() && (m_PMobSkill->getSkillchain() != 0))
            {
                CWeaponSkill* PWeaponSkill = battleutils::GetWeaponSkill(m_PMobSkill->getSkillchain());
                if (PWeaponSkill)
                {
                    SUBEFFECT effect = battleutils::GetSkillChainEffect(m_PBattleSubTarget, PWeaponSkill);
                    if (effect != SUBEFFECT_NONE)
                    {
                        uint16 skillChainDamage = battleutils::TakeSkillchainDamage(m_PMob, PTarget, Action.param);

                        Action.addEffectParam = skillChainDamage;
                        Action.addEffectMessage = 287 + effect;
                        Action.additionalEffect = effect;
                    }
                }
            }
        }

		m_PMob->m_ActionList.push_back(Action);
	}

	if (m_ActionType == ACTION_FALL)
	{
		//  set when you kill the mob in a script, but need
		//  it to be ACTION_MOBABILITY_FINISH for pushing the packet.
		m_ActionType = ACTION_MOBABILITY_FINISH;
	}

    m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

	if (m_PMob->isDead()) //e.g. self-destruct. Needed here AFTER sending the action packets.
	{
		m_ActionType = ACTION_FALL;
		ActionFall();
	}
	else
	{
		// increase magic / ranged timer so its not used right after
		Stun(m_PMobSkill->getAnimationTime());

        if (m_PMobSkill->getActivationTime() == 0 && m_PMobSkill->getAnimationTime() < 1000)
        {
            m_LastActionTime = m_Tick - m_PMob->m_Weapons[SLOT_MAIN]->getDelay();
        }
	}
    m_PMobSkill = NULL;
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
        Action.knockback  = 0;

	m_PMob->m_ActionList.push_back(Action);
	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

    m_PMobSkill = NULL;
    m_ActionType = ACTION_ATTACK;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CAIMobDummy::ActionSleep()
{
	if (m_PMob->isDead()) {
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	m_DeaggroTime = m_Tick;

    if (!m_PMob->StatusEffectContainer->HasPreventActionEffect())
    {
		m_ActionType = ACTION_ATTACK;
    }

	if(m_PMob->animation == ANIMATION_NONE)
	{
		SetupEngage();
	}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
}


void CAIMobDummy::ActionStun()
{

	m_DeaggroTime = m_Tick;

	// lets just chill here for a bit
    if (m_Tick >= m_LastStunTime + m_StunTime){
		m_PBattleSubTarget = NULL;
		TransitionBack();
	}

	if(m_PBattleSubTarget != NULL)
	{
	    // face the target
		if (!(m_PMob->m_Behaviour & BEHAVIOUR_NO_TURN))
		{
			m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);
		}	
	}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
}

void CAIMobDummy::ActionMagicStart()
{
	DSP_DEBUG_BREAK_IF(m_PSpell == NULL);
	DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

	// this must be at the top to RESET magic cast timer
	m_LastMagicTime = m_Tick;

	STATESTATUS status = m_PMagicState->CastSpell(GetCurrentSpell(), m_PBattleSubTarget);

	if(status == STATESTATUS_START)
	{
		m_ActionType = ACTION_MAGIC_CASTING;

		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
	}
	else
	{
		TransitionBack(true);
	}

}

void CAIMobDummy::ActionMagicCasting()
{
	STATESTATUS status = m_PMagicState->Update(m_Tick);

	if(status == STATESTATUS_INTERRUPT)
	{
		m_ActionType = ACTION_MAGIC_INTERRUPT;
		ActionMagicInterrupt();
	}
	else if(status == STATESTATUS_ERROR)
	{
		TransitionBack(true);
	}
	else if(status == STATESTATUS_FINISH)
	{
		m_ActionType = ACTION_MAGIC_FINISH;
		ActionMagicFinish();
	}
	else
	{
		m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
	}
}

void CAIMobDummy::ActionMagicFinish()
{
	m_LastActionTime = m_Tick;
	m_LastMagicTime = m_Tick - WELL512::irand()%(uint32)((float)m_PMob->getBigMobMod(MOBMOD_MAGIC_COOL) / 2);
	m_DeaggroTime = m_Tick;

	m_PMagicState->FinishSpell();

	if (m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL,0)){
		// let's make CSing monsters actually use lots of spells.
		m_LastMagicTime = m_Tick - m_PMob->getBigMobMod(MOBMOD_MAGIC_COOL) + 5000;
	}
	else if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_MANAFONT,0) ||
	    m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SOUL_VOICE,0))
	{
		// cast magic sooner
		m_LastMagicTime = m_Tick - m_PMob->getBigMobMod(MOBMOD_MAGIC_COOL) + 10000;
	}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));

	// display animation, then continue fighting
	Stun(m_PSpell->getAnimationTime());

	// this shouldn't have to exist all the way through
	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;
}

void CAIMobDummy::ActionMagicInterrupt()
{
	m_LastActionTime = m_Tick;

	m_PMagicState->InterruptSpell();

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));

	m_PSpell = NULL;
	m_PBattleSubTarget = NULL;

	TransitionBack();
}

/************************************************************************
*																		*
*  Обычная физическая атака без нанесения какого-либо урона				*
*																		*
************************************************************************/

void CAIMobDummy::ActionAttack()
{
    if (m_PMob->getMobMod(MOBMOD_SHARE_TARGET) > 0 && m_PMob->loc.zone->GetEntity(m_PMob->getMobMod(MOBMOD_SHARE_TARGET), TYPE_MOB))
    {
        m_PBattleTarget = m_PMob->loc.zone->GetEntity(m_PMob->getMobMod(MOBMOD_SHARE_TARGET), TYPE_MOB)->PBattleAI->GetBattleTarget();
    }
    else
    {
        m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();
    }

    m_actionqueueability = false;

	if(TryDeaggro())
	{
		Deaggro();
		m_ActionType = ACTION_DISENGAGE;
		ActionDisengage();
		return;
	}

    float currentDistance = distance(m_PMob->loc.p, m_PBattleTarget->loc.p);

	TryLink();

    if (!(m_PMob->m_Behaviour & BEHAVIOUR_NO_TURN))
        m_PPathFind->LookAt(m_PBattleTarget->loc.p);

    if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_BIND))
    {
    	// bind prevents deaggro
    	m_DeaggroTime = m_Tick;
    }

    if(!m_actionQueue.empty() && m_Tick >= m_LastSpecialTime)
    {
        quAction_t action = m_actionQueue.front();
        m_actionQueue.pop();
        switch(action.action)
        {
            case ACTION_MAGIC_START:
            {
                m_LastActionTime = m_Tick;
                m_actionqueueability = true;
                CastSpell(action.param, action.target);
                FinishAttack();
                break;
            }
            case ACTION_MOBABILITY_START:
            {
	            if (action.param != 0)
	            {
		            if (m_PMob->PBattleAI->GetBattleTarget() != NULL)
		            {
                        m_PMob->PBattleAI->SetCurrentMobSkill(battleutils::GetMobSkill(action.param));
                        CMobSkill* mobskill = m_PMob->PBattleAI->GetCurrentMobSkill();

			            if(mobskill != NULL)
			            {
                            m_LastActionTime = m_Tick;
				            if( mobskill->getActivationTime() != 0)
				            {
					            apAction_t apAction;
					            m_PMob->m_ActionList.clear();
					            if(mobskill->getValidTargets() == TARGET_ENEMY){ //enemy
						            apAction.ActionTarget = (action.target != NULL ? action.target : m_PMob->PBattleAI->GetBattleTarget());
					            }
					            else if(mobskill->getValidTargets() == TARGET_SELF){ //self
						            apAction.ActionTarget = m_PMob;
					            }
					            apAction.reaction   = REACTION_HIT;
					            apAction.speceffect = SPECEFFECT_HIT;
					            apAction.animation  = 0;
					            apAction.param	  = mobskill->getMsgForAction();//m_PMobSkill->getAnimationID();
					            apAction.messageID  = 43; //readies message

                                m_PMob->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
                                m_actionqueueability = true;
					            m_PMob->m_ActionList.push_back(apAction);
					            m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
				            }
                            if (mobskill->getValidTargets() & TARGET_ENEMY)
				                m_PMob->PBattleAI->SetBattleSubTarget(m_PMob->PBattleAI->GetBattleTarget());
                            else
                                m_PMob->PBattleAI->SetBattleSubTarget(m_PMob);
				            m_PMob->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_USING);
                            m_actionqueueability = true;
                            ActionAbilityUsing();
                        }
			            else
			            {
				            ShowWarning("lua_baseentity::useMobAbility NULL mobskill used %d", action.param);
			            }
		            }
	            } else {
		            m_PMob->PBattleAI->SetCurrentAction(ACTION_MOBABILITY_START);
                    m_actionqueueability = true;
	            }
            }
        }
        return;
    }

	// Try to spellcast (this is done first so things like Chainspell spam is prioritised over TP moves etc.
    if (m_PSpecialSkill != NULL && !m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_CHAINSPELL) && (m_Tick >= m_LastSpecialTime + m_PMob->getBigMobMod(MOBMOD_SPECIAL_COOL)) && TrySpecialSkill())
	{
		FinishAttack();
		return;
	}
    else if (currentDistance <= MOB_SPELL_MAX_RANGE && (m_Tick >= m_LastMagicTime + m_PMob->getBigMobMod(MOBMOD_MAGIC_COOL)) && TryCastSpell())
	{
		FinishAttack();
		return;
	}
    else if (m_Tick >= m_LastSpecialTime && WELL512::irand() % 100 < m_PMob->TPUseChance())
	{
		m_ActionType = ACTION_MOBABILITY_START;
		ActionAbilityStart();
		FinishAttack();
		return;
	}

	if (m_PPathFind->IsFollowingScriptedPath())
	{
		m_PPathFind->FollowPath();
		FinishAttack();
		return;
	}

    // attempt to teleport
    if (m_PMob->getMobMod(MOBMOD_TELEPORT_TYPE) == 1)
    {
        if (m_Tick >= m_LastSpecialTime + m_PMob->getBigMobMod(MOBMOD_TELEPORT_CD))
        {
            CMobSkill* teleportBegin = battleutils::GetMobSkill(m_PMob->getMobMod(MOBMOD_TELEPORT_START));

            if (teleportBegin)
            {
                SetCurrentMobSkill(teleportBegin);
                m_PBattleSubTarget = m_PMob;
                m_LastStandbackTime = m_Tick;
                m_ActionType = ACTION_MOBABILITY_FINISH;
                ActionAbilityFinish();
                m_LastSpecialTime = m_Tick;
            }
        }
    }
    // try to standback if I can

    if (m_PMob->getBigMobMod(MOBMOD_STANDBACK_TIME) && m_PMob->getMobMod(MOBMOD_TELEPORT_TYPE) != 2)
	{
        if (currentDistance > 28)
		{
			// you're so far away i'm going to standback when I get closer
			m_CanStandback = true;
		}
		else if(m_PSpecialSkill == NULL && !CanCastSpells() || m_PMob->GetHPP() <= 65)
		{
			// can't standback anymore cause I don't have any ranged moves
			m_CanStandback = false;

			// don't stand back again
			m_LastStandbackTime = m_Tick + m_PMob->getBigMobMod(MOBMOD_STANDBACK_TIME);
		}
		else if(currentDistance < 20 && currentDistance > m_PMob->m_ModelSize * 2)
		{

			if(m_CanStandback && currentDistance > m_PMob->m_ModelSize)
		    {
		    	uint16 halfStandback = (float)m_PMob->getBigMobMod(MOBMOD_STANDBACK_TIME)/3;
		    	m_LastStandbackTime = m_Tick + m_PMob->getBigMobMod(MOBMOD_STANDBACK_TIME) - WELL512::irand()%(halfStandback);
		    	m_CanStandback = false;
		    }

			if(m_Tick >= m_LastStandbackTime + m_PMob->getBigMobMod(MOBMOD_STANDBACK_TIME))
			{
				// speed up my ranged attacks cause i'm waiting here
				m_LastSpecialTime -= 1000;
				m_LastMagicTime -= 500;
				FinishAttack();
				return;
			}

		}
		else
		{
			// if i'm chasing too much, just melee attack
			m_LastStandbackTime -= 1000;
		}
	}

    bool move = m_PPathFind->IsFollowingPath();

    //If using mobskills instead of attacks, calculate distance to move and ability to use here
    if (m_mobskillattack)
    {
        std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(m_PMob->getMobMod(MOBMOD_SKILLS));

        //get rid of every skill that doesn't have the auto attack flag
        for (int i = 0; i<MobSkills.size(); i++)
        {
            if (!(MobSkills.at(i)->getFlag() & SKILLFLAG_REPLACE_ATTACK))
            {
                MobSkills.erase(MobSkills.begin() + i);
                i--;
            }
        }
        std::random_shuffle(MobSkills.begin(), MobSkills.end()); //Start the selection process by randomizing the container

        for (int i = 0; i<MobSkills.size(); i++){
            SetCurrentMobSkill(MobSkills.at(i));
            if (m_PMobSkill->getValidTargets() == TARGET_ENEMY){ //enemy
                m_PBattleSubTarget = m_PBattleTarget;
            }
            else if (m_PMobSkill->getValidTargets() == TARGET_SELF){ //self
                m_PBattleSubTarget = m_PMob;
            }
            else
            {
                continue;
            }
            float currentDistance = distance(m_PMob->loc.p, m_PBattleSubTarget->loc.p);
            if (currentDistance <= m_PMobSkill->getDistance()) {
                int16 WeaponDelay = m_PMob->GetWeaponDelay(true);
                if (m_AutoAttackEnabled && m_Tick > m_LastActionTime + WeaponDelay)
                {
                    m_LastActionTime = m_Tick;
                    SetCurrentAction(ACTION_MOBABILITY_USING);
                    ActionAbilityUsing();
                }
            }
            else
            {
                move = true;
                m_PMobSkill = NULL;
            }
        }
    }

    if (m_PMob->getMobMod(MOBMOD_SHARE_POS) > 0)
    {
        CMobEntity* posShare = (CMobEntity*)m_PMob->GetEntity(m_PMob->getMobMod(MOBMOD_SHARE_POS), TYPE_MOB);
        m_PMob->loc = posShare->loc;
    }

    else if(currentDistance > m_PMob->m_ModelSize || move)
    {
        if (m_PMob->getMobMod(MOBMOD_DRAW_IN) > 0)
        {
            if (!m_drawnIn)
            {
                if (currentDistance >= m_PMob->m_ModelSize * 2)
                    battleutils::DrawIn(m_PBattleTarget, m_PMob, m_PMob->m_ModelSize - 0.2f);

                m_drawnIn = true;
            }
            else
            {
                m_drawnIn = false;
            }
        }
        if (m_PMob->speed != 0 && m_Tick >= m_LastSpecialTime)
		{
            // attempt to teleport to target (if in range)
            if (m_PMob->getMobMod(MOBMOD_TELEPORT_TYPE) == 2)
            {
                CMobSkill* teleportBegin = battleutils::GetMobSkill(m_PMob->getMobMod(MOBMOD_TELEPORT_START));

                if (teleportBegin && currentDistance <= teleportBegin->getDistance())
                {
                    SetCurrentMobSkill(teleportBegin);
                    m_PBattleSubTarget = m_PMob;
                    m_ActionType = ACTION_MOBABILITY_FINISH;
                    ActionAbilityFinish();
                    return;
                }
            }
            else if (!(m_PMob->m_Behaviour & BEHAVIOUR_STANDBACK && currentDistance < 20) &&
                !(m_PMob->getMobMod(MOBMOD_SPAWN_LEASH) > 0 && distance(m_PMob->loc.p, m_PMob->m_SpawnPoint) > m_PMob->getMobMod(MOBMOD_SPAWN_LEASH)))
            {

                m_PPathFind->PathAround(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                // m_PPathFind->CurvePath(0.5f);
                m_PPathFind->FollowPath();

                // recalculate
                currentDistance = distance(m_PMob->loc.p, m_PBattleTarget->loc.p);
            }
		}
	}

	// attack enemy if close enough
    if (currentDistance <= m_PMob->m_ModelSize && !m_mobskillattack)
	{
		//m_CanStandback = true;
        int16 WeaponDelay = m_PMob->GetWeaponDelay(false);

		if (m_AutoAttackEnabled && m_Tick > m_LastActionTime + WeaponDelay)
		{
			if (battleutils::IsParalyzed(m_PMob))
			{
				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0, MSGBASIC_IS_PARALYZED));
			}
			else if (battleutils::IsIntimidated(m_PMob, m_PBattleTarget))
			{
				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0, MSGBASIC_IS_INTIMIDATED));
			}
			else
			{
	            m_PBattleTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);

				apAction_t Action;
				m_PMob->m_ActionList.clear();

				Action.ActionTarget = m_PBattleTarget;

				uint8 mainAttacks = battleutils::CheckMobMultiHits(m_PMob);
                uint8 offAttacks = m_PMob->getMobMod(MOBMOD_DUAL_WIELD) > 0 ? battleutils::CheckMobMultiHits(m_PMob) : 0;

                for (uint8 i = 0; i<(mainAttacks + offAttacks); i++){
					Action.reaction   = REACTION_EVADE;
					Action.speceffect = SPECEFFECT_NONE;
                    Action.animation = i >= mainAttacks ? 1 : 0;
					Action.param	  = 0;
					Action.messageID  = 15;
                    Action.knockback  = 0;
					if(m_PBattleTarget->isDead()){
						break;
					}

					uint32 damage = 0;
					bool isCountered = false;
					bool isParried = false;
					bool isGuarded = false;
					bool isDodge = false;

					if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_DODGE))
					{
						Action.messageID = 32;
						isDodge = true;
					}
                    else if ((WELL512::irand() % 100 < battleutils::GetHitRate(m_PMob, m_PBattleTarget)) &&
                        !m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ALL_MISS))
					{
						if (attackutils::IsParried(m_PMob, m_PBattleTarget))
						{
							isParried = true;
							Action.messageID = 70;
							Action.reaction   = REACTION_PARRY;
							Action.speceffect = SPECEFFECT_NONE;

							battleutils::HandleTacticalParry(m_PBattleTarget);
							battleutils::HandleIssekiganEnmityBonus(m_PBattleTarget, m_PMob);
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
									meritCounter = ((CCharEntity*)m_PBattleTarget)->PMeritPoints->GetMeritValue(MERIT_COUNTER_RATE,(CCharEntity*)m_PBattleTarget);
							}


							//counter check (rate AND your hit rate makes it land, else its just a regular hit)
							if (WELL512::irand()%100 < (m_PBattleTarget->getMod(MOD_COUNTER) + meritCounter) &&
								WELL512::irand()%100 < battleutils::GetHitRate(m_PBattleTarget,m_PMob) &&
								(m_PBattleTarget->objtype != TYPE_PC || (charutils::hasTrait((CCharEntity*)m_PBattleTarget,TRAIT_COUNTER) ||
								m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SEIGAN))))
							{
								isCountered = true;
								Action.messageID = 33; //counter msg  32
								Action.reaction   = REACTION_HIT;
								Action.speceffect = SPECEFFECT_NONE;

								bool isCritical = (WELL512::irand()%100 < battleutils::GetCritHitRate(m_PBattleTarget, m_PMob,false));
								bool isHTH = m_PBattleTarget->m_Weapons[SLOT_MAIN]->getDmgType() == DAMAGE_HTH;
								if (!isHTH && m_PBattleTarget->objtype == TYPE_MOB && m_PBattleTarget->GetMJob() == JOB_MNK)
								{
									isHTH = true;
								}
								int16 naturalh2hDMG = 0;
								if (isHTH)
								{
									naturalh2hDMG = (float)(m_PBattleTarget->GetSkill(SKILL_H2H) * 0.11f)+3;
								}

								float DamageRatio = battleutils::GetDamageRatio(m_PBattleTarget, m_PMob,isCritical, 0);
								damage = (uint32)((m_PBattleTarget->GetMainWeaponDmg() + naturalh2hDMG + battleutils::GetFSTR(m_PBattleTarget, m_PMob,SLOT_MAIN)) * DamageRatio);

                                Action.spikesParam = damage;
                                Action.spikesEffect = SUBEFFECT_COUNTER;

							}
							else if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_PERFECT_COUNTER))
							{ //Perfect Counter only counters hits that normal counter misses
								isCountered = true;

							}
							else
							{
								bool isCritical = ( WELL512::irand()%100 < battleutils::GetCritHitRate(m_PMob, m_PBattleTarget,false) );

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
								if(attackutils::IsGuarded(m_PMob, m_PBattleTarget))
								{
									isGuarded = true;
									//Action.messageID = 0;
									Action.reaction = REACTION_GUARD;
									Action.speceffect = SPECEFFECT_NONE;
                                    if (DamageRatio > 1.0f)
                                        DamageRatio -= 1.0f; // Guard lowers pDif by 1.0
                                    else
                                        DamageRatio = 0;
								}

								damage = (uint32)((m_PMob->GetMainWeaponDmg() + battleutils::GetFSTR(m_PMob, m_PBattleTarget,SLOT_MAIN)) * DamageRatio);

								//  Guard skill up
                                if (m_PBattleTarget->objtype == TYPE_PC && (isGuarded || ((map_config.newstyle_skillups & NEWSTYLE_GUARD) > 0)))
                                {
                                    if (battleutils::GetGuardRate(m_PMob, m_PBattleTarget) > 0)
                                    {
                                        charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_GRD, m_PBattleTarget->GetMLevel());
                                    }
                                } // Guard skill up
							}

							if(!isCountered)
							{
								bool isBlocked = attackutils::IsBlocked(m_PMob, m_PBattleTarget);
								if(isBlocked){ Action.reaction = REACTION_BLOCK; }
								

								// Try Null damage chance (The target)
								if (WELL512::irand()%100 < m_PBattleTarget->getMod(MOD_NULL_PHYSICAL_DAMAGE) && m_PBattleTarget->objtype == TYPE_PC)
								{
									damage = 0;
								}

								// Try absorb HP chance (The target)
								if (attackutils::TryAbsorbHPfromPhysicalAttack(m_PBattleTarget, damage))
								{
                                    Action.messageID = 373;
                                    Action.param = battleutils::TakePhysicalDamage(m_PMob, m_PBattleTarget, -damage, isBlocked, SLOT_MAIN, 1, NULL, true);
                                }
                                else
                                {
                                    // Try to absorb MP (The target)
                                    attackutils::TryAbsorbMPfromPhysicalAttack(m_PBattleTarget, damage);

                                    Action.param = battleutils::TakePhysicalDamage(m_PMob, m_PBattleTarget, damage, isBlocked, SLOT_MAIN, 1, NULL, true);
                                }
								m_PMob->PEnmityContainer->UpdateEnmityFromAttack(m_PBattleTarget, Action.param);

								// Block skill up
								if(m_PBattleTarget->objtype == TYPE_PC && isBlocked || ((map_config.newstyle_skillups & NEWSTYLE_BLOCK) > 0))
								{
									if(battleutils::GetBlockRate(m_PMob, m_PBattleTarget) > 0)
									{
										charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_SHL, m_PMob->GetMLevel());
									}
								} // Block skill up


								// additional effects
                                battleutils::HandleEnspell(m_PMob, m_PBattleTarget, &Action, i, m_PMob->m_Weapons[SLOT_MAIN], damage);

								battleutils::HandleSpikesDamage(m_PMob, m_PBattleTarget, &Action, damage);
							}
							else
							{
								Action.param = battleutils::TakePhysicalDamage(m_PBattleTarget, m_PMob, damage, false, SLOT_MAIN, 1, NULL, true);
								if(m_PBattleTarget->objtype == TYPE_PC)
								{
									uint8 skilltype = (m_PBattleTarget->m_Weapons[SLOT_MAIN] == NULL ? SKILL_H2H : m_PBattleTarget->m_Weapons[SLOT_MAIN]->getSkillType());
									charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, (SKILLTYPE)skilltype, m_PMob->GetMLevel());
								}
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

					if (m_PBattleTarget->objtype == TYPE_PC && !isCountered && !isParried && !isDodge)
					{
						charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PMob->GetMLevel());
					}

                    if (Action.speceffect == SPECEFFECT_HIT && Action.param > 0)
                        Action.speceffect = SPECEFFECT_RECOIL;

					m_PMob->m_ActionList.push_back(Action);
				}

				m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));
			}
            m_LastActionTime = m_Tick;
            m_DeaggroTime = m_Tick;
		}
	}
    else if (m_Tick >= m_LastSpecialTime && WELL512::irand() % 100 < m_PMob->TPUseChance())
	{
		// not in range to attack my target
		// so try an other tp move
		m_ActionType = ACTION_MOBABILITY_START;
		ActionAbilityStart();
	}

	FinishAttack();
}

void CAIMobDummy::FinishAttack()
{
	if(m_PMob->getMobMod(MOBMOD_RAGE) && !m_PMob->hasRageMode() && m_Tick >= m_StartBattle + m_PMob->getBigMobMod(MOBMOD_RAGE))
	{
		// come at me bro
		m_PMob->addRageMode();
	}

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob, ENTITY_UPDATE, UPDATE_COMBAT));
}

bool CAIMobDummy::TryDeaggro()
{
	if(m_PBattleTarget == NULL && (m_PMob->PEnmityContainer != NULL && m_PMob->PEnmityContainer->GetHighestEnmity() == NULL))
    {
		return true;
	}

	// target is dead, on a choco or zoned, so wipe them from our enmity list
    if (m_PBattleTarget->isDead() ||
        m_PBattleTarget->animation == ANIMATION_CHOCOBO ||
		m_PBattleTarget->loc.zone->GetID() != m_PMob->loc.zone->GetID())
	{
        m_PMob->PEnmityContainer->Clear(m_PBattleTarget->id);
        m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();
		return TryDeaggro();
	}

	bool tryDetectDeaggro = false;
	bool tryTimeDeaggro = true;

	if(m_PMob->m_Aggro & AGGRO_SCENT)
	{
		// if mob is in water it will instant aggro if target cannot be detected
		if(m_PPathFind->InWater() || m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DEODORIZE))
		{
			tryDetectDeaggro = true;
		}

		// certain weather / deodorize will turn on time deaggro
		tryTimeDeaggro = m_PMob->m_disableScent;
	}

	if(tryTimeDeaggro && m_Tick >= m_DeaggroTime + MOB_DEAGGRO_TIME && m_PMob->CanDeaggro())
	{
		tryDetectDeaggro = true;
	}

    //Hide allows you to lose aggro on certain types of enemies.
    //Generally works on monsters that don't track by scent, regardless of detection method.
    //Can work on monsters that track by scent if the proper conditions are met (double rain weather, crossing over water, etc.) 
    if(tryTimeDeaggro && m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_HIDE))
        return true;

	// I will now deaggro if I cannot detect my target
	if(tryDetectDeaggro && !m_PMob->CanDetectTarget(m_PBattleTarget))
	{
		return true;
	}

	return false;
}

void CAIMobDummy::TryLink()
{
	if(m_PBattleTarget == NULL)
	{
		return;
	}

	//handle pet behaviour on the targets behalf (faster than in ai_pet_dummy)
	// Avatars defend masters by attacking mobs if the avatar isn't attacking anything currently (bodyguard behaviour)
	if(m_PBattleTarget->PPet != NULL && m_PBattleTarget->PPet->PBattleAI->GetBattleTarget()==NULL) {
		if(((CPetEntity*)m_PBattleTarget->PPet)->getPetType()==PETTYPE_AVATAR) {
			m_PBattleTarget->PPet->PBattleAI->SetBattleTarget(m_PMob);
		}
	}

    // my pet should help as well
	if(m_PMob->PPet != NULL && m_PMob->PPet->PBattleAI->GetCurrentAction() == ACTION_ROAMING)
	{
		((CMobEntity*)m_PMob->PPet)->PEnmityContainer->AddLinkEnmity(m_PBattleTarget);
	}

	// Handle monster linking if they are close enough
    if (m_PMob->PParty != NULL)
    {
        for (uint16 i = 0; i < m_PMob->PParty->members.size(); ++i)
        {
            CMobEntity* PPartyMember = (CMobEntity*)m_PMob->PParty->members[i];

            if(PPartyMember->PBattleAI->GetCurrentAction() == ACTION_ROAMING && PPartyMember->CanLink(&m_PMob->loc.p, m_PMob->getMobMod(MOBMOD_SUPERLINK))){
		        PPartyMember->PEnmityContainer->AddLinkEnmity(m_PBattleTarget);

		        if(PPartyMember->m_roamFlags & ROAMFLAG_IGNORE)
		        {
		        	// force into attack action
					PPartyMember->PBattleAI->SetCurrentAction(ACTION_ENGAGE);
		        }
            }
        }
    }

    // ask my master for help
    if(m_PMob->PMaster != NULL && m_PMob->PMaster->PBattleAI->GetCurrentAction() == ACTION_ROAMING)
    {
    	CMobEntity* PMaster = (CMobEntity*)m_PMob->PMaster;

        if(PMaster->PBattleAI->GetCurrentAction() == ACTION_ROAMING && PMaster->CanLink(&m_PMob->loc.p, m_PMob->getMobMod(MOBMOD_SUPERLINK))){
	        PMaster->PEnmityContainer->AddLinkEnmity(m_PBattleTarget);
        }
    }

}

bool CAIMobDummy::CanCastSpells()
{

	if (!m_PMob->SpellContainer->HasSpells()) return false;

	// check for spell blockers e.g. silence
	if(m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE) ||
		m_PMob->StatusEffectContainer->HasStatusEffect(EFFECT_MUTE)) {
		return false;
	}

	// smn can only cast spells if it has an existing pet
	if(m_PMob->GetMJob() == JOB_SMN && m_PMob->PPet == NULL){
		return false;
	}

	return true;
}

bool CAIMobDummy::TryCastSpell()
{
	if(!CanCastSpells())
	{
		return false;
	}

	int chosenSpellId = -1;

	// only cast first spell if target is out of range
	if(m_firstSpell && m_PBattleTarget != NULL && distance(m_PMob->loc.p, m_PBattleTarget->loc.p) <= m_PMob->m_ModelSize){

		m_firstSpell = false;
		m_LastMagicTime = m_Tick - m_PMob->getBigMobMod(MOBMOD_MAGIC_COOL) + WELL512::irand()%5000 + 3000;
		return false;
	}

	if (m_PMob->m_HasSpellScript) {
		// skip logic and follow script
		chosenSpellId = luautils::OnMonsterMagicPrepare(m_PMob, m_PBattleTarget);
		if(chosenSpellId > -1){
			CastSpell(chosenSpellId);
			return true;
		}
	} else {
		// find random spell

		if(m_firstSpell)
		{
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

void CAIMobDummy::ActionSpecialSkill()
{

	if(m_PSpecialSkill == NULL){
		m_PBattleSubTarget = NULL;
		TransitionBack();
		return;
	}


	// this will be read by the packets layer
	SetCurrentMobSkill(m_PSpecialSkill);

	// this makes sure the proper packet is sent
	m_ActionType = ACTION_MOBABILITY_FINISH;

    DSP_DEBUG_BREAK_IF(m_PBattleSubTarget == NULL);

    m_LastActionTime = m_Tick;
    m_DeaggroTime = m_Tick;

    uint32 halfSpecial = (float)m_PMob->getBigMobMod(MOBMOD_SPECIAL_COOL)/2;

    m_LastSpecialTime = m_Tick - WELL512::irand()%(halfSpecial);

    // don't use magic right after
    m_LastMagicTime = m_Tick + m_PMob->getBigMobMod(MOBMOD_MAGIC_COOL) + WELL512::irand()%5000 + 4000;

    m_PBattleSubTarget->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
    apAction_t Action;
    m_PMob->m_ActionList.clear();

    m_PPathFind->LookAt(m_PBattleSubTarget->loc.p);

	Action.speceffect = SPECEFFECT_HIT;
    Action.ActionTarget = m_PBattleSubTarget;
	Action.animation  = m_PMobSkill->getAnimationID();
    //Why is this even here? if flag = 0, it doesn't even do anything.
	//Action.subparam   = m_PMobSkill->getMsgForAction();
    Action.param = luautils::OnMobWeaponSkill(m_PBattleSubTarget, m_PMob, GetCurrentMobSkill());
	Action.messageID  = m_PMobSkill->getMsg();
    Action.knockback  = 0;

	// display hit or miss
	if(m_PMobSkill->hasMissMsg())
	{
	    Action.reaction   = REACTION_MISS;
	} else {
	    Action.reaction   = REACTION_HIT;
	}

	m_PMob->m_ActionList.push_back(Action);

	m_PMob->loc.zone->PushPacket(m_PMob, CHAR_INRANGE, new CActionPacket(m_PMob));

	// this stops the mob from chasing
	Stun(m_PMobSkill->getAnimationTime());

	m_PMobSkill = NULL;
}

void CAIMobDummy::CastSpell(uint16 spellId, CBattleEntity* PTarget)
{
	SetCurrentSpell(spellId);

	if(m_PSpell == NULL){
		ShowWarning(CL_YELLOW"ai_mob_dummy::CastSpell: SpellId <%i> is not found\n" CL_RESET, spellId);
	} else {

		if(PTarget == NULL)
		{
			// find my own target
			// check valid targets
			if (m_PSpell->getValidTarget() & TARGET_SELF) {
				m_PBattleSubTarget = m_PMob;

				// only buff other targets if i'm roaming
				if((m_PSpell->getValidTarget() & TARGET_PLAYER_PARTY))
				{
					// chance to target my master
					if(m_PMob->PMaster != NULL && WELL512::irand()%2 == 0)
					{
						// target my master
						m_PBattleSubTarget = m_PMob->PMaster;
					}
					else if(WELL512::irand()%2 == 0)
					{
						// chance to target party
						m_PTargetFind->reset();
						m_PTargetFind->findWithinArea(m_PMob, AOERADIUS_ATTACKER, MOB_SPELL_MAX_RANGE);

						uint16 totalTargets = m_PTargetFind->m_targets.size();

						if(totalTargets)
						{
							// randomly select a target
							m_PBattleSubTarget = m_PTargetFind->m_targets[WELL512::irand()%totalTargets];

							// only target if are on same action
							if(m_PBattleSubTarget->PBattleAI->GetCurrentAction() != GetCurrentAction()){
								m_PBattleSubTarget = m_PMob;
							}
						}

					}
				}

			}
			else
			{
				m_PBattleSubTarget = m_PBattleTarget;
			}

		}
		else
		{
			m_PBattleSubTarget = PTarget;
		}

		m_ActionType = ACTION_MAGIC_START;
		ActionMagicStart();
	}
}

bool CAIMobDummy::TrySpecialSkill()
{
	if(m_PSpecialSkill == NULL) return false;
	if(!m_MobAbilityEnabled) return false;

	if((m_PMob->m_specialFlags & SPECIALFLAG_HIDDEN) && !m_PMob->IsNameHidden())
	{
		return false;
	}

	if(m_PSpecialSkill->getValidTargets() & TARGET_SELF)
	{
		m_PBattleSubTarget = m_PMob;
	}
	else if(m_PBattleTarget != NULL)
	{
		// distance check for special skill
	    float currentDistance = distance(m_PMob->loc.p, m_PBattleTarget->loc.p);

		if(currentDistance <= m_PSpecialSkill->getDistance())
		{
			m_PBattleSubTarget = m_PBattleTarget;
		}
		else
		{
			return false;
		}
	}
	else
	{
		return false;
	}

	if(luautils::OnMobSkillCheck(m_PBattleSubTarget, m_PMob, m_PSpecialSkill) == 0)
	{
		ActionSpecialSkill();
		return true;
	}

	return false;
}

void CAIMobDummy::FollowPath()
{
	m_PPathFind->FollowPath();

	if(m_ActionType == ACTION_ROAMING)
	{

		CBattleEntity* PPet = m_PMob->PPet;
		if(PPet != NULL && PPet->PBattleAI->GetCurrentAction() == ACTION_ROAMING)
		{

			// pet should follow me if roaming
	        position_t targetPoint = nearPosition(m_PMob->loc.p, 2.1f, M_PI);

	        PPet->PBattleAI->MoveTo(&targetPoint);

			PPet->loc.zone->PushPacket(PPet, CHAR_INRANGE, new CEntityUpdatePacket(PPet, ENTITY_UPDATE, UPDATE_COMBAT));
		}

		// if I just finished reset my last action time
		if(!m_PPathFind->IsFollowingPath())
		{
			m_LastActionTime = m_Tick - WELL512::irand()%m_PMob->getBigMobMod(MOBMOD_ROAM_COOL) + 10000;

			// i'm a worm pop back up
			if(m_PMob->m_roamFlags & ROAMFLAG_WORM)
			{
				m_PMob->animationsub = 0;
				m_PMob->HideName(false);
			}

			// face spawn rotation if I just moved back to spawn
			// used by dynamis mobs, bcnm mobs etc
			if((m_PMob->m_roamFlags & ROAMFLAG_EVENT) &&
				m_PMob->m_SpawnPoint.x == m_PMob->loc.p.x &&
				m_PMob->m_SpawnPoint.y == m_PMob->loc.p.y &&
				m_PMob->m_SpawnPoint.z == m_PMob->loc.p.z)
			{
				m_PMob->loc.p.rotation = m_PMob->m_SpawnPoint.rotation;
			}
		}


		if(m_PPathFind->OnPoint()){
			luautils::OnMobPath(m_PMob);
		}
	}
}

void CAIMobDummy::Stun(uint32 stunTime)
{
	m_StunTime = stunTime;
    m_LastStunTime = m_Tick;
	m_ActionType = ACTION_STUN;
}

void CAIMobDummy::SetupEngage()
{
	m_checkDespawn = false;
	m_PMob->animation = ANIMATION_ATTACK;
	m_StartBattle = m_Tick;
	m_DeaggroTime = m_Tick;
	m_LastActionTime = m_Tick - 1000; // Why do we subtract 1 sec?
	m_firstSpell = true;
	m_CanStandback = true;
	m_PPathFind->Clear();

	// drg shouldn't use jump right away
	if(m_PMob->GetMJob() == JOB_DRG && m_PMob->getBigMobMod(MOBMOD_SPECIAL_COOL) != 0)
	{
		m_LastSpecialTime = m_Tick - WELL512::irand()%m_PMob->getBigMobMod(MOBMOD_SPECIAL_COOL) + 5000;
	}

	if(m_PMob->m_roamFlags & ROAMFLAG_WORM)
	{
		m_PMob->animationsub = 0;
		m_PMob->HideName(false);
	}

	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();
	
	if(m_PBattleTarget != NULL)
	{
        // clear the ActionQueue
        ActionQueue_t empty;
        std::swap(m_actionQueue, empty);
		luautils::OnMobEngaged(m_PMob, m_PBattleTarget);
	}
}

void CAIMobDummy::WeatherChange(WEATHER weather, uint8 element)
{

	// can't detect by scent in this weather
	if (m_PMob->m_Aggro & AGGRO_SCENT)
	{
		m_PMob->m_disableScent = (weather == WEATHER_RAIN || weather == WEATHER_SQUALL || weather == WEATHER_BLIZZARDS);
	}

	if (m_PMob->m_EcoSystem == SYSTEM_ELEMENTAL && m_PMob->PMaster == NULL && m_PMob->getZone()!=37  && m_PMob->getZone()!=38 )
	{
		if (m_PMob->m_Element == element)
		{
			m_PMob->SetDespawnTimer(0);
			m_PMob->m_AllowRespawn = true;
			SetLastActionTime(0);
			SetCurrentAction(ACTION_SPAWN);
		}
		else
		{
			m_PMob->SetDespawnTimer(1);
			m_PMob->m_AllowRespawn = false;
		}
	}
	else if(m_PMob->m_Family == 25)
	{
		// antica gain more sound aggro range during sand weather
		if(weather == WEATHER_DUST_STORM || weather == WEATHER_SAND_STORM)
		{
			m_PMob->setMobMod(MOBMOD_SOUND_RANGE, 12);
		}
		else
		{
			m_PMob->setMobMod(MOBMOD_SOUND_RANGE, MOB_SOUND_RANGE);
		}
	}
	else if(m_PMob->m_Family == 198)
	{
		// puk
		// what up I gain regain
		if(weather == WEATHER_WIND || weather == WEATHER_GALES)
		{
			m_PMob->addModifier(MOD_REGAIN, 5);
		}
		else
		{
			m_PMob->delModifier(MOD_REGAIN, 5);
		}
	}
	else if(m_PMob->m_Family == 107 || m_PMob->m_Family == 108)
	{
		// eruca
		// what up I gain regain
		if(weather == WEATHER_HOT_SPELL || weather == WEATHER_HEAT_WAVE)
		{
			m_PMob->addModifier(MOD_REGAIN, 5);
		}
		else
		{
			m_PMob->delModifier(MOD_REGAIN, 5);
		}
	}
	// TODO: slug auto-regen rain
}

bool CAIMobDummy::CanAggroTarget(CBattleEntity* PTarget)
{
	// don't aggro i'm neutral
	if(m_PMob->m_neutral) return false;

	if(PTarget->isDead() || PTarget->animation == ANIMATION_CHOCOBO) return false;

	if(m_PMob->PMaster == NULL && m_ActionType == ACTION_ROAMING && m_PMob->CanDetectTarget(PTarget))
	{
		return true;
	}

	return false;
}

void CAIMobDummy::Deaggro()
{
	if(m_PBattleTarget != NULL)
	{
		m_PMob->PEnmityContainer->Clear(m_PBattleTarget->id);

		if(m_PMob->m_OwnerID.id == m_PBattleTarget->id)
		{
		    m_PMob->m_OwnerID.clean();
		}
	}
	else
	{
	    m_PMob->m_OwnerID.clean();
	}


	m_PBattleTarget = NULL;
}

void CAIMobDummy::TransitionBack(bool skipWait)
{
	if(m_PMob->isDead())
	{
		m_ActionType = ACTION_FALL;
		ActionFall();
	}
	else if(m_PMob->animation == ANIMATION_ATTACK)
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

void CAIMobDummy::setMobSkillAttack(bool value)
{
    m_mobskillattack = value;
}

bool CAIMobDummy::getMobSkillAttack()
{
    return m_mobskillattack;
}

bool CAIMobDummy::isActionQueueAttack()
{
    return m_actionqueueability;
}

void CAIMobDummy::OnTick()
{
	// launch OnMobFight every sec
	if (battleutils::IsEngauged(m_PMob) && (m_Tick - m_StartBattle) % 1000 < 500)
	{
		luautils::OnMobFight(m_PMob, m_PBattleTarget);
	}
}
