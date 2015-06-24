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
    CState(CBattleEntity* PEntity, CTargetFind* PTargetFind) :
        m_PEntity(PEntity), 
        m_PTarget(nullptr),
        m_PTargetFind(PTargetFind) {}

    //state logic done per tick
    virtual STATESTATUS Update(time_point tick) = 0;

    //reset the state (probably not needed)
    virtual void Clear() = 0;

    //cancels the current action (if possible) - returns false if not possible
    virtual bool Cancel() = 0;

  protected:
    CBattleEntity* m_PEntity;
    CBattleEntity* m_PTarget;

    CTargetFind* m_PTargetFind;
};

#endif
