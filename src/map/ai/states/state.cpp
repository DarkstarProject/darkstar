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

#include "state.h"
#include "../../entities/baseentity.h"

CState::CState(CBaseEntity* PEntity, uint16 _targid) :
    m_PEntity(PEntity),
    m_targid(_targid) {}

void CState::UpdateTarget(uint16 targid)
{
    m_PTarget = m_PEntity->GetEntity(targid);
}

CBaseEntity* CState::GetTarget()
{
    return m_PTarget;
}

uint16 CState::GetTargetID()
{
    return m_targid;
}

void CState::Complete()
{
    m_completed = true;
}

time_point CState::GetEntryTime()
{
    return m_entryTime;
}

void CState::ResetEntryTime()
{
    m_entryTime = server_clock::now();
}

void CState::SetTarget(uint16 _targid)
{
    if (_targid != m_targid)
    {
        m_targid = _targid;
        UpdateTarget(_targid);
    }
}

bool CState::HasErrorMsg()
{
    return m_errorMsg != nullptr;
}

CMessageBasicPacket* CState::GetErrorMsg()
{
    return m_errorMsg.release();
}

bool CState::DoUpdate(time_point tick)
{
    UpdateTarget(m_targid);
    return Update(tick);
}

bool CState::IsCompleted()
{
    return m_completed;
}
