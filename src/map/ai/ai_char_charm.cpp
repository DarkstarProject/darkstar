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

#include "ai_char_charm.h"

#include "ai_pet_dummy.h"

#include "../attackround.h"

#include "../entities/charentity.h"

#include "../lua/luautils.h"

#include "../packets/char.h"

#include "../utils/battleutils.h"

/************************************************************************
*																		*
*  Constructor                              							*
*																		*
************************************************************************/

CAICharCharm::CAICharCharm(CCharEntity* PChar) : CAICharNormal(PChar)
{
    m_PPathFind = new CPathFind(PChar);
    m_previousallegiance = PChar->allegiance;
    PChar->allegiance = ALLEGIANCE_MOB; //todo: charmed by another player in ballista?
}

CAICharCharm::~CAICharCharm()
{
    m_PChar->allegiance = m_previousallegiance;
    //Pathfind is deleted in ai_char_general
}

void CAICharCharm::CheckCurrentAction(uint32 tick)
{
    m_Tick = tick;

    switch (m_ActionType)
    {
        case ACTION_NONE:			  		ActionRoaming();			break;
        case ACTION_ROAMING:                ActionRoaming();            break;
        case ACTION_ATTACK:					ActionAttack();				break;
        case ACTION_ENGAGE:					ActionEngage();				break;
        case ACTION_DISENGAGE:				ActionDisengage();	 		break;
        case ACTION_FALL:					ActionFall();				break;
        case ACTION_SLEEP:                  ActionSleep();              break;

        default: DSP_DEBUG_BREAK_IF(true);
    }
}

void CAICharCharm::ActionRoaming()
{
    if (m_PChar->PMaster->PBattleAI->GetBattleTarget() != NULL){
        m_PBattleTarget = m_PChar->PMaster->PBattleAI->GetBattleTarget();
        m_ActionType = ACTION_ENGAGE;
        ActionEngage();
        return;
    }
    m_PChar->m_TargID = m_PChar->PMaster->targid;
    float currentDistance = distance(m_PChar->loc.p, m_PChar->PMaster->loc.p);

    if (currentDistance > PET_ROAM_DISTANCE)
    {
        if (currentDistance < 35.0f && m_PPathFind->PathAround(m_PChar->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
        {
            m_PPathFind->FollowPath();
        }
        else if (m_PChar->GetSpeed() > 0)
        {
            m_PPathFind->WarpTo(m_PChar->PMaster->loc.p, PET_ROAM_DISTANCE);
        }
    }

    m_PChar->pushPacket(new CCharPacket(m_PChar, ENTITY_UPDATE));
}

void CAICharCharm::ActionEngage()
{
    m_ActionType = ACTION_ATTACK;
    m_LastMeleeTime = m_Tick - m_PChar->m_Weapons[SLOT_MAIN]->getDelay() + 1500;

    m_PChar->status = STATUS_UPDATE;
    m_PChar->animation = ANIMATION_ATTACK;
    m_PChar->pushPacket(new CCharPacket(m_PChar, ENTITY_UPDATE));
    return;
}

void CAICharCharm::ActionDisengage()
{
    m_ActionType = ACTION_NONE;
    m_LastActionTime = m_Tick;
    m_PBattleTarget = NULL;
    m_PBattleSubTarget = NULL;

    if (m_PChar->status != STATUS_DISAPPEAR)
        m_PChar->status = STATUS_UPDATE;
    m_PChar->animation = ANIMATION_NONE;
    m_PChar->pushPacket(new CCharPacket(m_PChar, ENTITY_UPDATE));

    if (m_PChar->PPet != NULL && m_PChar->PPet->objtype == TYPE_PET && ((CPetEntity*)m_PChar->PPet)->getPetType() == PETTYPE_WYVERN)
    {
        m_PChar->PPet->PBattleAI->SetBattleTarget(NULL);
    }
}

void CAICharCharm::ActionAttack()
{
    DSP_DEBUG_BREAK_IF(m_PBattleTarget == NULL);

    SetBattleTarget(m_PChar->PMaster->PBattleAI->GetBattleTarget());

    if (m_PBattleTarget == NULL)
    {
        m_ActionType = ACTION_DISENGAGE;
        ActionDisengage();
        return;
    }

    m_PPathFind->LookAt(m_PBattleTarget->loc.p);

    float currentDistance = distance(m_PChar->loc.p, m_PBattleTarget->loc.p);

    if (currentDistance > m_PBattleTarget->m_ModelSize)
    {
        if (m_PChar->speed != 0)
        {
            m_PPathFind->PathAround(m_PBattleTarget->loc.p, 2.0f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
            // m_PPathFind->CurvePath(0.5f);
            m_PPathFind->FollowPath();

            // recalculate
            currentDistance = distance(m_PChar->loc.p, m_PBattleTarget->loc.p);
        }
    }

    uint16 WeaponDelay = m_PChar->GetWeaponDelay(false);

    if (m_Tick > m_LastMeleeTime + WeaponDelay)
    {
        if (currentDistance < m_PBattleTarget->m_ModelSize)
        {
            m_LastMeleeTime = m_Tick;
            if (battleutils::IsParalyzed(m_PChar))
            {
                m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_IS_PARALYZED));
            }
            else if (battleutils::IsIntimidated(m_PChar, m_PBattleTarget))
            {
                m_PChar->loc.zone->PushPacket(m_PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PChar, m_PBattleTarget, 0, 0, MSGBASIC_IS_INTIMIDATED));
            }
            else
            {
                DoAttack();
            }
        }
    }
    m_PChar->pushPacket(new CCharPacket(m_PChar, ENTITY_UPDATE));
}

void CAICharCharm::ActionFall()
{
    m_PChar->setMijinGakure(true);
    m_PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CHARM);
}