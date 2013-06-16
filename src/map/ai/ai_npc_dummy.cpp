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

#include "../npcentity.h"
#include "ai_npc_dummy.h"

#include "../pathfind.h"
#include "../lua/luautils.h"
#include "../../common/showmsg.h"

#include "../packets/entity_update.h"

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
    case ACTION_ROAMING:  ActionRoaming();  break;
    case ACTION_WAIT: ActionWait(); break;
    default : DSP_DEBUG_BREAK_IF(true);
  }
}

void CAINpcDummy::ActionRoaming()
{
  if(m_PPathFind->IsFollowingPath())
  {

    m_PPathFind->FollowPath();

    if(!m_PPathFind->IsFollowingPath())
    {
      luautils::OnNpcPathFinish(m_PNpc);
    }

    m_PNpc->loc.zone->PushPacket(m_PNpc,CHAR_INRANGE, new CEntityUpdatePacket(m_PNpc,ENTITY_UPDATE));

  }
}

void CAINpcDummy::ActionWait()
{

}