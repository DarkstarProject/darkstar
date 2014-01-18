/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
	ELEVATOR_PSOXJA_ELVTR_1					= 1,
	ELEVATOR_PSOXJA_ELVTR_2					= 2,
	ELEVATOR_PSOXJA_ELVTR_3					= 3,
	ELEVATOR_PSOXJA_MVNG_FLR_4				= 4,
	ELEVATOR_PSOXJA_MVNG_FLR_3				= 5,
	ELEVATOR_PSOXJA_MVNG_FLR_1				= 6,
	ELEVATOR_PSOXJA_MVNG_FLR_2				= 7,
	ELEVATOR_PSOXJA_1						= 8,
	ELEVATOR_PSOXJA_2						= 9,
	ELEVATOR_PSOXJA_3						= 10,
	ELEVATOR_PSOXJA_4						= 11,
	ELEVATOR_PSOXJA_5						= 12,
	ELEVATOR_PSOXJA_6						= 13,
	ELEVATOR_PSOXJA_ELVTR_4					= 14,
	ELEVATOR_PSOXJA_ELVTR_5					= 15,
	ELEVATOR_PSOXJA_ELVTR_6					= 16,
	ELEVATOR_PSOXJA_ELVTR_7					= 17,
	ELEVATOR_PSOXJA_DSPPRNG_TLS_4			= 18,
	ELEVATOR_PSOXJA_DSPPRNG_TLS_1			= 19,
	ELEVATOR_PSOXJA_DSPPRNG_TLS_2			= 20,
	ELEVATOR_FORT_GHELSBA_ELVTR				= 21,
	ELEVATOR_PALBOROUGH_MINES_ELVTR			= 22,	// TODO: Verify NPC ID of upper and lower door
	ELEVATOR_DAVOI_ELVTR					= 23,	// in elevators.sql
	ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK		= 24,
	ELEVATOR_PORT_BASTOK_DRWBRDG			= 25,
	ELEVATOR_METALWORKS_ELVTR_1				= 26,
	ELEVATOR_METALWORKS_ELVTR_2				= 27
};

#define INTERVAL_KUFTAL_TUNNEL_DSPPRNG_RCK	360
#define INTERVAL_PORT_BASTOK_DRWBRDG		360

struct Transport_t
{
    location_t   Dock;

    uint8  AnimationArrive;
    uint8  AnimationDepart;

    uint16 TimeOffset;
    uint16 TimeAnimationArrive;
    uint16 TimeAnimationDepart;
    uint16 TimeInterval;
    uint16 TimeWaiting;

    CBaseEntity* PDoorNPC;
    CBaseEntity* PTransportNPC;
};

struct Elevator_t 
{
	uint8 id;
	uint16 zone;

	uint16 interval;
	uint16 movetime;

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
	void startElevator(int32 elevatorID);
	void TransportTimer();

private:

	static CTransportHandler * _instance;

	CTransportHandler();

    void InitializeTransport();
	void InitializeElevators();

	void startElevator(Elevator_t *);
	void arriveElevator(Elevator_t *);

	std::vector<Elevator_t> ElevatorList;
    std::vector<Transport_t*> TransportList;
};

#endif