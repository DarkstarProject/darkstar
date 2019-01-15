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

#ifndef _CTRANSPORT_H
#define _CTRANSPORT_H

#include "../common/cbasetypes.h"

#include <vector>

#include "entities/npcentity.h"

enum ELEVATOR
{
    ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK = 1,
    ELEVATOR_PORT_BASTOK_DRWBRDG = 2
};

enum TRANSPORTSTATE {
    STATE_TRANSPORT_INIT = 0,
    STATE_TRANSPORT_ARRIVING,
    STATE_TRANSPORT_DOCKED,
    STATE_TRANSPORT_DEPARTING,
    STATE_TRANSPORT_AWAY
};

enum TRANSPORTZONESTATE {
    STATE_TRANSPORTZONE_INIT = 0,
    STATE_TRANSPORTZONE_VOYAGE,
    STATE_TRANSPORTZONE_EVICT,
    STATE_TRANSPORTZONE_WAIT,
    STATE_TRANSPORTZONE_DOCKED
};

enum ELEVATORSTATE {
    STATE_ELEVATOR_BOTTOM =0,
    STATE_ELEVATOR_TOP,
    STATE_ELEVATOR_ASCEND,
    STATE_ELEVATOR_DESCEND
};
#define INTERVAL_KUFTAL_TUNNEL_DSPPRNG_RCK	360
#define INTERVAL_PORT_BASTOK_DRWBRDG		360

struct Transport_Time
{
    uint16 timeOffset;
    uint16 timeInterval;
    uint16 timeArriveDock;
    uint16 timeDepartDock;
    uint16 timeVoyageStart;
};
struct Transport_Ship : Transport_Time
{
    uint8  animationArrive;
    uint8  animationDepart;
    uint8  state;

    CBaseEntity* npc;
    location_t   dock;

    void setVisible(bool);
    void animateSetup(uint8, uint32);
    void spawn();
    //void Despawn();
    void setName(uint32);
};

struct TransportZone_Town
{
    Transport_Ship ship;

    CBaseEntity* npcDoor;

    void updateShip();
    void openDoor(bool);
    void closeDoor(bool);
    void depart();
};

struct TransportZone_Voyage : Transport_Time
{
    CZone* voyageZone;
    uint8 state;
};

struct Elevator_t
{
    uint8 id;
    uint8 state;

    uint16 zoneID;
    uint32 lastTrigger;

    uint16 interval;
    uint16 movetime;

    CNpcEntity * Elevator;
    CNpcEntity * LowerDoor;
    CNpcEntity * UpperDoor;

    bool activated;
    bool isPermanent;

    void closeDoor(CNpcEntity*);
    void openDoor(CNpcEntity*);
};


class CTransportHandler
{
public:
    static	CTransportHandler * getInstance();
    void startElevator(int32 elevatorID);
    void TransportTimer();
    void insertElevator(Elevator_t* elevator);

    void InitializeTransport();

private:

    static CTransportHandler * _instance;

    CTransportHandler();


    void startElevator(Elevator_t *);
    void arriveElevator(Elevator_t *);

    std::vector<Elevator_t*> ElevatorList;
    std::vector<Transport_Ship*> shipList;
    std::vector<TransportZone_Town*> townZoneList;
    std::vector<TransportZone_Voyage*> voyageZoneList;
};

#endif