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

#include "ai_char.h"

#include "../entities/baseentity.h"
#include "../entities/battleentity.h"
#include "../spell.h"

CAIChar::CAIChar(CBaseEntity* PEntity) : CAIBase(PEntity),
    m_TargetFind(static_cast<CBattleEntity*>(m_PEntity)),
    m_MagicState(static_cast<CBattleEntity*>(m_PEntity), &m_TargetFind)
{

}

bool CAIChar::MoveAction(aiEventMove*)
{
    return true;
}

bool CAIChar::AttackAction(aiEventAttack*)
{
    return false;
}

bool CAIChar::MagicStartAction(aiEventMagicStart* event)
{
    if (m_MagicState.IsOnCoolDown(m_tick))
    {
        //TODO: transitionback?
        return true;
    }

    CSpell* PSpell = spell::GetSpell(event->spellid);

    STATESTATUS status = m_MagicState.CastSpell(PSpell, m_TargetFind.getValidTarget(event->targetID, PSpell->getValidTarget()));

    if (status == STATESTATUS_START)
    {
        //m_ActionTargetID = 0;
        //m_LastActionTime = m_tick;
        //m_ActionType = ACTION_MAGIC_CASTING;
    }
    //TODO: else: transitionback?

    return true;
}

bool CAIChar::MagicFinishAction(aiEventMagicFinish*)
{
    return false;
}

bool CAIChar::RangedStartAction(aiEventRangedStart*)
{
    return false;
}

bool CAIChar::RangedFinishAction(aiEventRangedFinish*)
{
    return false;
}

bool CAIChar::WeaponskillStartAction(aiEventWeaponskillStart*)
{
    return false;
}

bool CAIChar::WeaponskillFinishAction(aiEventWeaponskillFinish*)
{
    return false;
}

bool CAIChar::JobabilityStartAction(aiEventJobAbilityStart*)
{
    return false;
}

bool CAIChar::JobabilityFinishAction(aiEventJobAbilityFinish*)
{
    return false;
}

bool CAIChar::ItemStartAction(aiEventItemStart*)
{
    return false;
}

bool CAIChar::ItemFinishAction(aiEventItemFinish*)
{
    return false;
}
