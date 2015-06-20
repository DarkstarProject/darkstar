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

#include "ai_npc.h"

#include "../lua/luautils.h"
#include "../entities/charentity.h"

CAINpc::CAINpc(CBaseEntity* _PEntity) :
    CAIBase(_PEntity,std::unique_ptr<CPathFind>(new CPathFind(_PEntity)))
{
}

void CAINpc::Trigger(CBaseEntity* PTarget)
{
    if (m_transitionable)
    {
        pathfind->Clear(); //#TODO: pause/resume after?
        PActionTarget = PTarget;
        m_state = AIState::Trigger;
    }
}

void CAINpc::ActionTrigger()
{
    luautils::OnTrigger(dynamic_cast<CCharEntity*>(PActionTarget), PEntity);
}