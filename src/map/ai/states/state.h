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

#include <stdexcept>
#include <memory>
#include "../../../common/mmo.h"
#include "../../packets/message_basic.h"

class CBattleEntity;

class CStateInitException : std::exception
{
public:
    CStateInitException(std::unique_ptr<CMessageBasicPacket> _msg) : std::exception(),
        packet(std::move(_msg)) {}
    std::unique_ptr<CMessageBasicPacket> packet;
};

class CState
{
public:
    CState(CBaseEntity* PEntity, uint16 _targid);

    virtual ~CState() = default;

    CBaseEntity* GetTarget();
    void SetTarget(uint16 targid);

    bool HasErrorMsg();
    /* Releases ownership to the caller */
    CMessageBasicPacket* GetErrorMsg();

    bool DoUpdate(time_point tick);
    //try interrupt (on hit)
    virtual void TryInterrupt(CBattleEntity* PAttacker) {}

    //called when state completes
    virtual void Cleanup(time_point tick) = 0;
    //whether the state can be changed by normal means
    virtual bool CanChangeState() = 0;
    virtual bool CanFollowPath() = 0;
    //whether the state can be interrupted (including by stun/sleep)
    virtual bool CanInterrupt() = 0;
    bool IsCompleted();

protected:
    //state logic done per tick - returns whether to exit the state or not
    virtual bool Update(time_point tick) = 0;
    virtual void UpdateTarget(uint16 targid);

    uint16 GetTargetID();
    void Complete();
    time_point GetEntryTime();
    void ResetEntryTime();

    std::unique_ptr<CMessageBasicPacket> m_errorMsg;

    CBaseEntity* const m_PEntity;
    uint16 m_targid;
private:
    CBaseEntity* m_PTarget;
    bool m_completed {false};
    time_point m_entryTime {server_clock::now()};
};

#endif
