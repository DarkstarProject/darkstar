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

#include "../lua/luautils.h"

#include "../packets/entity_update.h"

#include "../entities/npcentity.h"
#include "../zone.h"

#include "ai_npc_dummy.h"


CAINpcDummy::CAINpcDummy(CNpcEntity* PNpc)
{
  m_PNpc = PNpc;
  m_PPathFind = new CPathFind(PNpc);
}

void CAINpcDummy::CheckCurrentAction(uint32 tick)
{
  m_Tick = tick;

  switch(m_ActionType)
  {
    case ACTION_NONE: break;
    case ACTION_SPAWN:  ActionSpawn();  break;
    case ACTION_ROAMING:  ActionRoaming();  break;
    default : DSP_DEBUG_BREAK_IF(true);
  }
}

void CAINpcDummy::WeatherChange(WEATHER weather, uint8 element)
{

}

void CAINpcDummy::ActionSpawn()
{
  m_ActionType = ACTION_ROAMING;
}

void CAINpcDummy::ActionRoaming()
{

  // wait my time
  if(m_Tick < m_LastWaitTime + m_WaitTime){
    return;
  }

  if(m_PPathFind->IsFollowingPath())
  {

    // stop npc from looking at other things while walking
    m_PNpc->m_TargID = 0;

    m_PPathFind->FollowPath();

    if(m_PPathFind->OnPoint())
    {
      luautils::OnNpcPath(m_PNpc);
    }

    m_PNpc->loc.zone->PushPacket(m_PNpc,CHAR_INRANGE, new CEntityUpdatePacket(m_PNpc,ENTITY_UPDATE, UPDATE_POS));

  }
}

void CAINpcDummy::TransitionBack(bool skipWait)
{
  m_ActionType = ACTION_ROAMING;
}
