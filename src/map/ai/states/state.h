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
#include "../../packets/message_basic.h"

class CBattleEntity;
class CTargetFind;

class CState
{
public:
    CState(CBaseEntity* PEntity, uint16 _targid);

    virtual ~CState() = default;

    CBaseEntity* GetTarget();
    void SetTarget(uint16 targid);

    /* Releases ownership to the caller */
    CMessageBasicPacket* GetErrorMsg();

    bool DoUpdate(time_point tick);
    //try interrupt (on hit)
    virtual void TryInterrupt(CBattleEntity* PAttacker) = 0;

    //reset/cancel the state (forced exit)
    virtual void Clear() = 0;
    //whether the state can be changed by normal means
    virtual bool CanChangeState() = 0;

protected:
    //state logic done per tick - returns whether to exit the state or not
    virtual bool Update(time_point tick) = 0;

    std::unique_ptr<CMessageBasicPacket> m_errorMsg;

    CBaseEntity* const m_PEntity;
    uint16 targid;
private:
    void UpdateTarget();
    CBaseEntity* m_PTarget;
};

#endif
