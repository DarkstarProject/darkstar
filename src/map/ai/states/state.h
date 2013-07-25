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

#ifndef _CSTATE_H
#define _CSTATE_H

#include "../../../common/utils.h"
#include "../../packets/message_basic.h"
#include "../../packets/action.h"

class CBattleEntity;
class CTargetFind;

enum STATESTATUS {
  STATESTATUS_NONE,
  STATESTATUS_START,
  STATESTATUS_TICK,
  STATESTATUS_FINISH,
  STATESTATUS_ERROR,
  STATESTATUS_INTERRUPT
};

class CState
{

  public:
    CState(CBattleEntity* PEntity, CTargetFind* PTargetFind);
    ~CState();

    virtual STATESTATUS Update(uint32 tick);
    virtual void Clear();

    CBattleEntity* GetTarget();
    bool CheckValidTarget(CBattleEntity* PTarget);
    bool TooFar(position_t* point, float maxDistance);

  protected:
    void PushMessage(MSGBASIC_ID msgID, int32 param = 0, int32 value = 0, bool personal = false);

    CBattleEntity* m_PEntity;
    CBattleEntity* m_PTarget;

    CTargetFind* m_PTargetFind;
    uint8 m_flags;

  private:

};

#endif