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

#ifndef _CBATTLEFIELDHANDLER_H
#define _CBATTLEFIELDHANDLER_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "battlefield.h"
#include <vector>

class CCharEntity;
class CMobEntity;

class CBattlefieldHandler
{
public:
    CBattlefieldHandler(uint16 zoneid);

    void    handleBattlefields(time_point tick);    // called every tick to handle win/lose conditions, locking the bcnm, etc

    bool    isBattlefieldFree(uint16 bnum);                             // is battlefield with given number free
    int     registerBattlefield(uint16 bnum, uint16 id, CCharEntity* PChar);   // registers to PChar and allies a battlefield in arena bnum with content id
    bool    enterBcnm(uint16 bnum, CCharEntity* PChar);                 // enter battlefield arena bnum if you are registered
    bool    leaveBcnm(uint16 bnum, CCharEntity* PChar);                 // leave battlefield arena bnum if you are registered
    bool    disconnectFromBattlefield(CCharEntity* PChar);              // Disconnects/Warps you from a BCNM
    bool    winBcnm(uint16 bcnmid, CCharEntity* PChar);                 // Wins a BCNM battlefield (e.g. the player opening the chest)

    uint8   findBattlefieldIDFor(CCharEntity* PChar);                   // returns 1 2 3 or 255 if non-existent
    bool    hasFreeBattlefield();                                       // returns true if there is a free battlefield available
    duration     getBattlefieldTimeLeft(uint16 bnum, time_point tick);  // return left Time of the specific battlefield
    int     GiveTimeToBattlefield(uint16 bnum, duration Time);          // give time to specific battlefield
    void    SetLootToBCNM(uint16 LootID, uint16 bnum, uint32 npcID);
    void    RestoreOnBattlefield(uint16 bnum);                          // restore MP HP ability on a specific battlefield
    void    wipeBattlefield(CBattlefield* inst);

    CBattlefield* getBattlefield(uint16 bnum);                              // return battlefield of given arena
    int     addPlayerToBattlefield(uint16 bnum, CCharEntity* PChar);        // add a player to given arena

    //Dynamis Functions
    int     registerDynamis(uint16 bnum, uint16 id, CCharEntity* PChar);    // registers to PChar a dynamis in arena bnum with content id
    int     dynamisMessage(uint16 Param1, uint16 Param2);                   // Add message on dynamis param1: messageid, param2: parameter
    void    launchDynamisSecondPart();
    void    insertMonsterInList(CMobEntity* PMob);
    bool    checkMonsterInList(CMobEntity* PMob);

    uint16          m_ZoneId;

private:
    uint8           m_MaxBattlefields;
    CBattlefield*   m_Battlefields[8];
};

#endif