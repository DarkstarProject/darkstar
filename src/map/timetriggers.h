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

#ifndef _CTIMETRIGGERS_H
#define _CTIMETRIGGERS_H

#include "../common/cbasetypes.h"
#include <vector>
#include "entities/npcentity.h"

enum TRIGGERSTATE
{
    STATE_TRIGGER_LOADED = 0,
    STATE_TRIGGER_FIRED
};
struct Trigger_t
{
    uint8 id;
    uint8 state;

    CNpcEntity* npc;

    uint16 period;                  //The time 
    uint16 minuteOffset;
    uint16 triggerOffset;

    uint32 lastTrigger;             //Used to store the last firing of the trigger

    bool retroactive;
};

class CTriggerHandler
{
public:
    static	CTriggerHandler * getInstance();
    
    void insertTrigger(Trigger_t*);
    void triggerTimer();
private:

    static CTriggerHandler * _instance;

    CTriggerHandler();

    std::vector<Trigger_t*> triggerList;
};
#endif