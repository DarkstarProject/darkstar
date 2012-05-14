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

#include "../packets/entity_update.h"
#include "../packets/action.h"
#include "../packets/pet_sync.h"
#include "../packets/message_basic.h"

#include "ai_pet_dummy.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CAIPetDummy::CAIPetDummy(CPetEntity* PPet)
{
	m_PPet = PPet;
}

/************************************************************************
*																		*
*  Основная часть интеллекта - главный цикл								*
*																		*
************************************************************************/

void CAIPetDummy::CheckCurrentAction(uint32 tick)
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
		case ACTION_DISENGAGE:	ActionDisengage();	break;

		default : DSP_DEBUG_BREAK_IF(true);
	}
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

	if( m_PPet->PMaster==NULL || m_PPet->PMaster->isDead()){
		m_ActionType = ACTION_FALL;
		ActionFall();
		return;
	}

	if(m_PBattleTarget->m_OwnerID.id == m_PPet->PMaster->id || m_PBattleTarget->m_OwnerID.id==NULL){
		m_PPet->animation = ANIMATION_ATTACK;
		m_ActionType = ACTION_ATTACK;
		m_LastActionTime = m_Tick - 4000;
		ActionAttack();
	}
	else{
		if(m_PPet->PMaster->objtype == TYPE_PC){
			((CCharEntity*)m_PPet->PMaster)->pushPacket(new CMessageBasicPacket(((CCharEntity*)m_PPet->PMaster),
				((CCharEntity*)m_PPet->PMaster),0,0,12));
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
                        m_PBattleTarget->loc.zone->PushPacket(m_PBattleTarget,CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBattleTarget,m_PBattleTarget,0,1,31));
					}
					else
					{
						Action.reaction   = REACTION_HIT;
						Action.speceffect = SPECEFFECT_HIT;
						Action.messageID  = 1;

						float DamageRatio = battleutils::GetDamageRatio(m_PPet, m_PBattleTarget); 

						if ( rand()%100 < battleutils::GetCritHitRate(m_PPet, m_PBattleTarget) )
						{
							DamageRatio += 1;
							DamageRatio = (DamageRatio > 3 ? 3 : DamageRatio);

							Action.speceffect = SPECEFFECT_CRITICAL_HIT;
							Action.messageID  = 67;
						}
						damage = (uint16)((m_PPet->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(m_PPet, m_PBattleTarget)) * DamageRatio);	
					}
				}
				if (m_PBattleTarget->objtype == TYPE_PC)
				{
					charutils::TrySkillUP((CCharEntity*)m_PBattleTarget, SKILL_EVA, m_PPet->GetMLevel());
				}
                Action.param = battleutils::TakePhysicalDamage(m_PPet, m_PBattleTarget, damage);

				m_PPet->m_ActionList.push_back(Action);

				m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CActionPacket(m_PPet));
				if(m_PPet->PMaster != NULL && m_PPet->PMaster->objtype == TYPE_PC){
					((CCharEntity*)m_PPet->PMaster)->pushPacket(new CPetSyncPacket((CCharEntity*)m_PPet->PMaster));
				}
			}
			m_LastActionTime = m_Tick;
		}
	}



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
	//TODO: Charmed pets do not die when their master kicks the bucket - so need a check for type of pet. PETTYPE_CHARMEDMOB
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
		if(m_PPet->PMaster!=NULL){
			if(m_PPet->PMaster->objtype == TYPE_PC && distance(m_PPet->loc.p, m_PPet->PMaster->loc.p) >= 50){
				//master won't get this despawn packet, so send it directly
				((CCharEntity*)m_PPet->PMaster)->pushPacket(new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN));
			}
			m_PPet->PMaster->PPet = NULL;
			m_PPet->PMaster = NULL;
		}
		m_PPet->loc.zone->PushPacket(m_PPet, CHAR_INRANGE, new CEntityUpdatePacket(m_PPet, ENTITY_DESPAWN));	
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