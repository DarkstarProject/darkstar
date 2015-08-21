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

#ifndef _CSTATE_H
#define _CSTATE_H

#include "../ai_base.h"

class CBattleEntity;
class CTargetFind;

class CState
{
public:
    CState(CBaseEntity* PEntity, CTargetFind* PTargetFind) :
        m_PEntity(PEntity),
        m_PTarget(nullptr),
        m_PTargetFind(PTargetFind) {}

    virtual ~CState() = default;

    CBaseEntity* GetTarget() { return m_PTarget; }

    //state logic done per tick
    virtual bool Update(time_point tick) = 0;
    virtual void TryInterrupt(CBattleEntity* PAttacker) = 0;

    //reset/cancel the state
    virtual void Clear() = 0;
    virtual bool CanChangeState() = 0;

protected:
    CBaseEntity* m_PEntity;
    CBaseEntity* m_PTarget;

    CTargetFind* m_PTargetFind;
};

#endif
