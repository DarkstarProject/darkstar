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

#ifndef _CAINPCDUMMY_H
#define _CAINPCDUMMY_H

/*
The AINpcPatrol allows npcs to use lua pathfind bindings and patrol around areas.
*/

#include "ai_general.h"

class CNpcEntity;

class CAINpcDummy : public CAIGeneral
{
public:

  virtual void CheckCurrentAction(uint32 tick);

  CAINpcDummy(CNpcEntity* PNpc);


protected:

  CNpcEntity* m_PNpc;

  void ActionRoaming();
  void ActionSpawn();
  void ActionWait();

private:

};

#endif