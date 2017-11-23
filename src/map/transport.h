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
	ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK		= 1,
	ELEVATOR_PORT_BASTOK_DRWBRDG			= 2
};

#define INTERVAL_KUFTAL_TUNNEL_DSPPRNG_RCK	360
#define INTERVAL_PORT_BASTOK_DRWBRDG		360

struct Transport_t
{
    location_t   Dock;

    uint8  AnimationArrive;
    uint8  AnimationDepart;

    std::uint16_t TimeOffset;
    std::uint16_t TimeAnimationArrive;
    std::uint16_t TimeAnimationDepart;
    std::uint16_t TimeInterval;
    std::uint16_t TimeWaiting;

    CBaseEntity* PDoorNPC;
    CBaseEntity* PTransportNPC;
};

struct TransportZone_t
{
    std::uint16_t zone;
    std::uint16_t TimeOffset;
    std::uint16_t TimeInterval;
    std::uint16_t TimeAnimationArrive;
};

struct Elevator_t 
{
	uint8 id;
	std::uint16_t zone;

	std::uint16_t interval;
	std::uint16_t movetime;

	CNpcEntity * Elevator;
	CNpcEntity * LowerDoor;
	CNpcEntity * UpperDoor;

	bool isMoving;
	bool isStarted;
	bool isPermanent;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

class CTransportHandler
{
public:

	static	CTransportHandler * getInstance();
	void startElevator(std::int32_t elevatorID);
	void TransportTimer();
    void insertElevator(Elevator_t elevator);
    void InitializeTransport();

private:

	static CTransportHandler * _instance;

	CTransportHandler();


	void startElevator(Elevator_t *);
	void arriveElevator(Elevator_t *);

	std::vector<Elevator_t> ElevatorList;
    std::vector<Transport_t*> TransportList;
    std::vector<TransportZone_t> TransportZoneList;
};

#endif