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
		case ACTION_NONE:							break;
		case ACTION_ROAMING:	ActionRoaming();	break;
		case ACTION_ENGAGE:		ActionEngage();		break;
		case ACTION_DISENGAGE:	ActionDisengage();	break;
		case ACTION_FALL:		ActionFall();		break;
		case ACTION_DROPITEMS:	ActionDropItems();	break;
		case ACTION_DEATH:		ActionDeath();		break;
		case ACTION_FADE_OUT:	ActionFadeOut();	break;
		case ACTION_SPAWN:		ActionSpawn();		break;
		case ACTION_ATTACK:		ActionAttack();		break;

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
	if (m_PMob->m_OwnerID != 0)
	{
		uint16 TargID = m_PMob->m_OwnerID & 0x0FFF;

		m_PBattleTarget = (CBattleEntity*)m_PZone->GetEntity(TargID, TYPE_PC | TYPE_MOB | TYPE_PET);

		m_ActionType = ACTION_ENGAGE;
		ActionEngage();
	}
	else if ((m_Tick - m_LastActionTime) > 45000) 
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
}

/************************************************************************
*																		*
*  Монстр переходит в боевую стойку, включается прежим атаки			*
*																		*
************************************************************************/

void CAIMobDummy::ActionEngage() 
{
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

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

			m_PZone->PushPacket(m_PMob, CHAR_INRANGE, new CMessageBasicPacket(PChar,m_PMob,0,0,6));
			
			// еще должно быть сообщение "No experience points gained", но пока не известно, видит ли его один персонаж или вся группа

			if (m_PMob->m_CallForHelp == 0)
			{
				charutils::DistributeExperiencePoints(PChar, m_PMob);
			}

			DropList_t* DropList = itemutils::GetDropList(m_PMob->m_DropID);

			if (DropList && DropList->size())
			{
				for(DropList_t::const_iterator it = DropList->begin(); it != DropList->end(); ++it)
				{
					if(rand()%100 < it->DropRate) 
					{
						//PChar->Party->TreasurePool->AddItem(it->ItemID, m_PMob);
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
	if ((m_Tick - m_LastActionTime) > 12000 )
	{
		m_ActionType = ACTION_FADE_OUT;

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

		m_PZone->PushPacket(m_PMob, CHAR_INRANGE, new CEntityUpdatePacket(m_PMob,ENTITY_SPAWN));
	}
}

/************************************************************************
*																		*
*  Обычная физическая атака без нанесения какого-либо урона				*
*																		*
************************************************************************/

void CAIMobDummy::ActionAttack() 
{
	DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

	m_PMob->loc.p.rotation = getangle(m_PMob->loc.p, m_PBattleTarget->loc.p);

	if (m_PBattleTarget->isDead())
	{
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
				apAction_t Action;

				Action.ActionTarget = m_PBattleTarget;
				Action.reaction   = REACTION_EVADE;
				Action.speceffect = SPECEFFECT_NONE;
				Action.animation  = 0;
				Action.param	  = 0;
				Action.messageID  = 15;
				Action.flag		  = 0;

				uint16 damage = 0;

				if ( rand()%100 < battleutils::GetHitRate(m_PMob, m_PBattleTarget) )
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

					damage = (uint16)((m_PMob->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(m_PMob,m_PBattleTarget)) * DamageRatio);
				}

				Action.param = battleutils::TakePhysicalDamage(m_PMob,m_PBattleTarget, damage);

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