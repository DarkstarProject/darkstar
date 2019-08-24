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

#include "despawn_state.h"
#include "../../entities/baseentity.h"
#include "../../entities/mobentity.h"
#include "../../entities/trustentity.h"
#include "../../packets/entity_animation.h"
#include "../ai_container.h"
#include "../../zone.h"

CDespawnState::CDespawnState(CBaseEntity* _PEntity, duration spawnTime) :
    CState(_PEntity, _PEntity->targid),
    m_spawnTime(spawnTime)
{
    if (_PEntity->status != STATUS_DISAPPEAR && !(static_cast<CMobEntity*>(_PEntity)->m_Behaviour & BEHAVIOUR_NO_DESPAWN))
    {
        _PEntity->loc.zone->PushPacket(_PEntity, CHAR_INRANGE, new CEntityAnimationPacket(_PEntity, CEntityAnimationPacket::Fade_Out));
    }
}

CDespawnState::CDespawnState(CBaseEntity* _PEntity) :
    CDespawnState(_PEntity, 0s)
{}

bool CDespawnState::Update(time_point tick)
{
    if (tick > GetEntryTime() + 3s && !IsCompleted() && !(static_cast<CMobEntity*>(m_PEntity)->m_Behaviour & BEHAVIOUR_NO_DESPAWN))
    {
        if (m_PEntity->objtype == TYPE_TRUST)
        {
            static_cast<CTrustEntity*>(m_PEntity)->OnDespawn(*this);
        }
        else
        {
            static_cast<CMobEntity*>(m_PEntity)->OnDespawn(*this);
        }
        Complete();
    }
    return IsCompleted();
}

void CDespawnState::Cleanup(time_point tick)
{
}

bool CDespawnState::CanChangeState()
{
    return false;
}
