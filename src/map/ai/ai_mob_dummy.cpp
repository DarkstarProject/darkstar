/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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
#include "../mobutils.h"
#include "../zone.h"

#include "ai_mob_dummy.h"

#include "../lua/luautils.h"

#include "../packets/action.h"
#include "../packets/entity_update.h"
#include "../packets/fade_out.h"
#include "../packets/message_basic.h"
#include "../status_effect.h"

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
		case ACTION_NONE:										break;
		case ACTION_ROAMING:			ActionRoaming();		break;
		case ACTION_ENGAGE:				ActionEngage();			break;
		case ACTION_DISENGAGE:			ActionDisengage();		break;
		case ACTION_FALL:				ActionFall();			break;
		case ACTION_DROPITEMS:			ActionDropItems();		break;
		case ACTION_DEATH:				ActionDeath();			break;
		case ACTION_FADE_OUT:			ActionFadeOut();		break;
		case ACTION_SPAWN:				ActionSpawn();			break;
		case ACTION_ATTACK:				ActionAttack();			break;
		case ACTION_MOBABILITY_FINISH:	ActionAbilityStart();	break;

		default : ;//DSP_DEBUG_BREAK_IF(true);
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
	if (m_PMob->PEnmityContainer->GetHighestEnmity() != NULL ||   m_PMob->m_OwnerID != 0)
	{
		//uint16 TargID = m_PMob->m_OwnerID & 0x0FFF;
		uint16 TargID = ((CBattleEntity*)m_PMob->PEnmityContainer->GetHighestEnmity())->id;
		
		m_PBattleTarget = (CBattleEntity*)m_PZone->GetEntity(TargID, TYPE_PC | TYPE_MOB | TYPE_PET);

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

		m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
	}

	if (m_PMob->getDespawnTimer() > 0 && m_PMob->getDespawnTimer() < m_Tick)
	{
		m_LastActionTime = m_Tick; 
		m_PMob->PBattleAI->SetCurrentAction(ACTION_DEATH);
		//m_PMob->setDespawnTimer(0); 
	}
	
	
}

/************************************************************************
*																		*
*  Монстр переходит в боевую стойку, включается прежим атаки			*
*																		*
************************************************************************/

void CAIMobDummy::ActionEngage() 
{
	//DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);
	m_PMob->animation = ANIMATION_ATTACK;

	m_ActionType = ACTION_ATTACK;
	m_LastActionTime = m_Tick;

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

	m_PMob->m_OwnerID = 0;
	m_PMob->m_CallForHelp = 0;
	m_PMob->animation = ANIMATION_NONE;
	m_PMob->health.hp = m_PMob->health.maxhp;

	m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
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

	m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
}

/************************************************************************
*																		*
*  Здесь выполняется скрипт после смерти монстра, распределяется опыт	*
*  и определяются выпавшие предметы										*
*																		*
************************************************************************/

void CAIMobDummy::ActionDropItems() 
{
	if ((m_Tick - m_LastActionTime) > 1000 )
	{
		m_ActionType = ACTION_DEATH;
		
		// условие не дописано. питомец персонажа тоже может убить монстра

		CCharEntity* PChar = (CCharEntity*)m_PZone->GetEntity(m_PMob->m_OwnerID & 0x0FFF, TYPE_PC);

		if (PChar != NULL)
		{
			luautils::OnMobDeath(m_PMob,PChar);
			luautils::OnSpecialWeaponKill(PChar); 
			m_PZone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(PChar,m_PMob,0,0,6));
			
			uint32 exp = 0;
			if (m_PMob->m_CallForHelp == 0)
			{
				if (PChar->PParty != NULL)
				{
					for (int i = 0; i < PChar->PParty->members.size(); i++)
					{
						CCharEntity * PMember = PChar->PParty->members[i];
						if (PMember->getZone() == PChar->getZone())
						{
							exp = charutils::DistributeExperiencePoints(PMember, m_PMob);
							if (exp > 0 && PMember->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET,0) && m_PMob->m_Element > 0 && rand()%100 < 19) // Need to move to SIGNET_CHANCE constant
							{
								PChar->PTreasurePool->AddItem(4095 + m_PMob->m_Element, m_PMob);
							}		
						}
					}
				}
				else
				{
					exp = charutils::DistributeExperiencePoints(PChar, m_PMob);
					if (exp > 0 && PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SIGNET,0) && m_PMob->m_Element > 0 && rand()%100 < 19) // Need to move to SIGNET_CHANCE constant
					{
						PChar->PTreasurePool->AddItem(4095 + m_PMob->m_Element, m_PMob);
					}		
				}
			}

			DropList_t* DropList = itemutils::GetDropList(m_PMob->m_DropID);
		
			if (DropList && DropList->size())
			{
				for(DropList_t::const_iterator it = DropList->begin(); it != DropList->end(); ++it)
				{
					if(rand()%100 < it->DropRate) 
					{
						PChar->PTreasurePool->AddItem(it->ItemID, m_PMob); 
					}		
				}
			}
		}
	}				
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CAIMobDummy::ActionDeath() 
{
	m_PMob->PEnmityContainer->Clear();	
	if ((m_Tick - m_LastActionTime) > 12000 )
	{
		m_ActionType = ACTION_FADE_OUT;
		m_PMob->PEnmityContainer->Clear();
		m_PZone->PushPacket(m_PMob, CHAR_INRANGE, new CFadeOutPacket(m_PMob));
	}
}

/************************************************************************
*																		*
*  Здесь модель пропадает после постепенного ичезновения, так же		*
*  решается вопрос, а нужно ли включать процесс возрождения монстра.	*
*  Если его время возрождения равно нулю, значит он был вызван и в		*
*  возрождении не нуждается, иначе запускаем процесс					*
*																		*
************************************************************************/

void CAIMobDummy::ActionFadeOut() 
{
	if ((m_Tick - m_LastActionTime) > 15000 )
	{
		m_PMob->PEnmityContainer->Clear();
		m_PMob->status = STATUS_DISAPPEAR;
		m_ActionType = (m_PMob->m_RespawnTime != 0 ? ACTION_SPAWN : ACTION_NONE);

		m_PZone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_DESPAWN));
	}
}

/************************************************************************
*																		*
*  Вознождение монстра. Сейчас используется время 25 секунд после		*
*  смерти, позднее будет использоватся реальное время возрождения		*
*																		*
************************************************************************/

void CAIMobDummy::ActionSpawn() 
{
	if ((m_Tick - m_LastActionTime) > m_PMob->m_RespawnTime)
	{
		m_ActionType = ACTION_ROAMING;
		m_PBattleTarget = NULL;

		m_PMob->m_OwnerID = 0;
		m_PMob->m_CallForHelp = 0;
		m_PMob->status = STATUS_UPDATE;
		m_PMob->animation = ANIMATION_NONE;

		uint8 level = m_PMob->m_minLevel;

		if (m_PMob->m_maxLevel != m_PMob->m_minLevel)
		{ 
			level += rand()%(m_PMob->m_maxLevel - m_PMob->m_minLevel); 
		}
						
		m_PMob->SetMLevel(level);
		m_PMob->SetSLevel(level);

		mobutils::CalculateStats(m_PMob);

		m_PMob->loc.p = m_PMob->m_SpawnPoint;
		//luautils::OnMobSpawn(m_PMob); 
		m_PZone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_SPAWN));
	}
}

void CAIMobDummy::ActionAbilityStart()
{
	////DSP_DEBUG_BREAK_IF(m_ActionTargetID == 0 || m_PBattleSubTarget != NULL);
	//m_PMob->health.tp = 10; 

	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();
	apAction_t Action;
	
	int16 skill = battleutils::PerformMobSkill(m_PMob, m_PBattleTarget);
	if (skill == 0)
	{
		m_ActionType = ACTION_ATTACK;
		m_PMob->health.tp = 0; 
		return; 
	}
	 
	CAIGeneral::SetCurrentMobSkill(skill);
	m_PZone->PushPacket(m_PMob, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PMob,m_PMob,m_PMobSkill->getID()+256,m_PMobSkill->getID()+256,43));
	
	if (m_PMobSkill->getEffect() > 0) 
	{
		switch(m_PMobSkill->getEffect())
		{
		case 5: //blind
			break;

		};

	}
	Action.ActionTarget = m_PBattleTarget;
	Action.reaction   = REACTION_HIT;
	Action.speceffect = SPECEFFECT_RECOIL;
	Action.animation  = m_PMobSkill->getID();
	Action.param	  = 10;
	Action.subparam   = m_PMobSkill->getID()+256;
	Action.messageID  = 185;
	
	m_PBattleTarget->addHP(-10); 
	m_PMob->m_ActionList.push_back(Action);
	m_PZone->PushPacket(m_PMob, CHAR_INRANGE_SELF, new CActionPacket(m_PMob));
	m_ActionType = ACTION_ATTACK; 
	m_PMob->m_ActionList.clear(); 
	m_PMob->health.tp = 0; 
}


void CAIMobDummy::ActionAbilityFinish()
{
	m_ActionType = ACTION_ATTACK; 
}


/************************************************************************
*																		*
*  Обычная физическая атака без нанесения какого-либо урона				*
*																		*
************************************************************************/

void CAIMobDummy::ActionAttack() 
{
	//DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);
	m_PBattleTarget = m_PMob->PEnmityContainer->GetHighestEnmity();
	m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, m_PBattleTarget->loc.p);

	if (m_PBattleTarget->isDead())
	{
		m_PMob->PEnmityContainer->Clear(m_PBattleTarget->id);
		m_ActionType = ACTION_DISENGAGE;
		m_PBattleTarget = NULL;
		return;
	}

	if (distance(m_PMob->loc.p, m_PBattleTarget->loc.p) <= m_PMob->m_ModelSize)
	{
		if ((m_Tick - m_LastActionTime) > m_PMob->m_Weapons[SLOT_MAIN]->getDelay())
		{
			m_LastActionTime = m_Tick;

			if (battleutils::IsParalised(m_PMob)) 
			{
				m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0,29));
			}
			else if (battleutils::IsIntimidated(m_PMob, m_PBattleTarget)) 
			{
				m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CMessageBasicPacket(m_PMob,m_PBattleTarget,0,0,106));
			}
			else
			{

				if (m_PMob->health.tp > 100 && rand()%100 > 55) 
				{
					m_ActionType = ACTION_MOBABILITY_FINISH;
					return;
				}

				apAction_t Action;

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
				else if ( rand()%100 < battleutils::GetHitRate(m_PMob, m_PBattleTarget) )
				{
					int16 utsu = m_PBattleTarget->getMod(MOD_UTSUSEMI);
					if (utsu > 0) 
					{
						utsu -= 1;
						m_PBattleTarget->setModifier(MOD_UTSUSEMI, utsu);
						if (utsu == 0)
						{
						m_PZone->PushPacket(m_PBattleTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget,m_PBattleTarget,1,1,31));
						m_PBattleTarget->StatusEffectContainer->DelStatusEffect(EFFECT_COPY_IMAGE_1);
						}

						
						Action.ActionTarget = m_PBattleTarget;
						Action.reaction   = REACTION_EVADE;
						Action.speceffect = SPECEFFECT_NONE;
						Action.animation  = 0;
						Action.param	  = 0;
						Action.messageID  = 0;
						Action.flag = 0; 
					}
					else
					{
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_HIT;
						Action.messageID  = 1;

						float DamageRatio = battleutils::GetDamageRatio(m_PMob,m_PBattleTarget); 

						if ( rand()%100 < battleutils::GetCritHitRate(m_PMob, m_PBattleTarget) )
						{
							DamageRatio += 1;
							DamageRatio = (DamageRatio > 3 ? 3 : DamageRatio);

							Action.speceffect = SPECEFFECT_CRITICAL_HIT;
							Action.messageID  = 67;
						}
					
						damage = (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_INVINCIBLE) ? 0 : (uint16)((m_PMob->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(m_PMob,m_PBattleTarget)) * DamageRatio));
						m_PMob->PEnmityContainer->UpdateEnmityFromAttack(m_PBattleTarget,damage);
						m_PMob->addTP(12); 

						/*	if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_BLAZE_SPIKES))
						{
							uint32 spikeDamage = 6; //Calculate Spike Damage
							m_PMob->addhp(-spikeDamage);
							m_PBattleTarget->addHP(damage);
							Action.subeffect = SUBEFFECT_BLAZE_SPIKES;
							Action.flag = 2; 
							Action.submessageID = ??; 
						} */

						/*	if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_ICE_SPIKES))
						{
							uint32 spikeDamage = 6; //Calculate Spike Damage
							m_PMob->addhp(-spikeDamage);
							m_PBattleTarget->addHP(damage);

							if (rand() > 0.5) 
							{
								//m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_PARALYSIS,1,0,60));
							}
							Action.subeffect = SUBEFFECT_ICE_SPIKES;
							Action.flag = 2; 
							Action.submessageID = ??; 
						} */


						/*	if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_SHOCK_SPIKES))
						{
							uint32 spikeDamage = 6; //Calculate Spike Damage
							m_PMob->addhp(-spikeDamage);
							m_PBattleTarget->addHP(damage);

							if (rand() > 0.5) 
							{
								//m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_PARALYSIS,1,0,3));
							}
							Action.subeffect = SUBEFFECT_ICE_SPIKES;
							Action.flag = 2; 
							Action.submessageID = ??; 
						} */

						/*	if (m_PBattleTarget->StatusEffectContainer->HasStatusEffect(EFFECT_DREAD_SPIKES))
						{
							m_PBattleTarget->addHP(damage);
							Action.subeffect = SUBEFFECT_DREAD_SPIKES;
							Action.flag = 2; 
							Action.submessageID = 132; 
						} */
					}
				}
				else
				{
					charutils::TrySkillUP((CCharEntity*)m_PBattleTarget,SKILL_EVA,m_PMob->GetMLevel());
				}
				Action.param = battleutils::TakePhysicalDamage(m_PMob, m_PBattleTarget, damage, m_PZone);

				m_PMob->m_ActionList.push_back(Action);

				m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CActionPacket(m_PMob));
				m_PMob->m_ActionList.clear();
			}
		}
	}
	else
	{
		battleutils::MoveTo(m_PMob, m_PBattleTarget->loc.p, 2);
	}
			
	m_PZone->PushPacket(m_PMob,CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_UPDATE));
}

