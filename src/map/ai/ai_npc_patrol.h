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

#ifndef _CAINPCPATROL_H
#define _CAINPCPATROL_H

#include "../../common/showmsg.h"

#include "ai_general.h"

class CNpcEntity;

struct patrol_t
{
  position_t p;
  bool look; // look at position instead of moving
  uint16 wait; // wait time after patrol action
  uint8 msgId; // message to output
};

class CAINpcPatrol : public CAIGeneral
{
public:

  virtual void CheckCurrentAction(uint32 tick);

  CAINpcPatrol(CNpcEntity* PNpc);

  patrol_t m_patrols[20];

protected:

  CNpcEntity* m_PNpc;
  uint8 m_currentPoint;

  void ActionRoaming();
  void ActionWait();

private:

};

#endif