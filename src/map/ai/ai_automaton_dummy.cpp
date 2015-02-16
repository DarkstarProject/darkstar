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

#include "ai_automaton_dummy.h"
#include "../entities/petentity.h"

CAIAutomatonDummy::CAIAutomatonDummy(CPetEntity* PPet)
    : CAIPetDummy(PPet)
{

}

void CAIAutomatonDummy::CheckCurrentAction(uint32 tick)
{
    m_Tick = tick;

    CBattleEntity* PSelf = m_PPet;

    switch (m_ActionType)
    {
    case ACTION_NONE:							                    break;
    case ACTION_ROAMING:	            ActionRoaming();	        break;
    case ACTION_DEATH:		            ActionDeath();		        break;
    case ACTION_SPAWN:		            ActionSpawn();		        break;
    case ACTION_FALL:		            ActionFall();		        break;
    case ACTION_ENGAGE:		            ActionEngage();		        break;
    case ACTION_ATTACK:		            ActionAttack();		        break;
    case ACTION_SLEEP:		            ActionSleep();		        break;
    case ACTION_DISENGAGE:	            ActionDisengage();	        break;
    case ACTION_MOBABILITY_START:	    ActionAbilityStart();	    break;
    case ACTION_MOBABILITY_USING:       ActionAbilityUsing();       break;
    case ACTION_MOBABILITY_FINISH:      ActionAbilityFinish();      break;
    case ACTION_MOBABILITY_INTERRUPT:   ActionAbilityInterrupt();   break;
    case ACTION_MAGIC_START:            ActionMagicStart();         break;
    case ACTION_MAGIC_CASTING:          ActionMagicCasting();       break;
    case ACTION_MAGIC_FINISH:           ActionMagicFinish();        break;

    default: DSP_DEBUG_BREAK_IF(true);
    }

    //check if this AI was replaced (the new AI will update if this is the case)
    if (m_PPet && PSelf->PBattleAI == this)
    {
        m_PPet->UpdateEntity();
    }
}

void CAIAutomatonDummy::ActionFall()
{
    m_PPet->PMaster->StatusEffectContainer->RemoveAllManeuvers();
    CAIPetDummy::ActionFall();
}