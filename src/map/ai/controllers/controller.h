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

#ifndef _CONTROLLER_H
#define _CONTROLLER_H

#include "../ai_common.h"
#include "../../../common/cbasetypes.h"

class CBattleEntity;

class CController
{
public:
    CController(CBattleEntity* _POwner, bool _canUpdate = false);
    virtual void Tick(time_point tick) = 0;
    virtual void Cast(uint16 targid, uint16 spellid);
    virtual void Engage(uint16 targid);
    virtual void ChangeTarget(uint16 targid);
    virtual void Disengage();

    bool canUpdate;

protected:
    CBattleEntity* POwner;
};

#endif