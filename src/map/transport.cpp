/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#include "transport.h"

#include "map.h"
#include "vana_time.h"
#include "zoneutils.h"

#include "packets/entity_update.h"


CTransportHandler* CTransportHandler::_instance = NULL;

CTransportHandler* CTransportHandler::getInstance() 
{
	if(_instance == NULL) {
		_instance = new CTransportHandler();
	}
	return _instance;
}

CTransportHandler::CTransportHandler() 
{
	InitializeElevators();
}

void CTransportHandler::InitializeElevators()
{
	ElevatorList.clear();

	const int8 *fmtQuery = "SELECT id, elevator, lowerDoor, upperDoor, status, regime FROM elevators ;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			Elevator_t elevator;

			elevator.id = (uint8)Sql_GetUIntData(SqlHandle,0);
			elevator.zone = (uint8)(Sql_GetUIntData(SqlHandle,1) >> 12);

			elevator.Elevator  = (CNpcEntity*)zoneutils::GetZone(elevator.zone)->GetEntity(Sql_GetUIntData(SqlHandle,1) & 0x0FFF, TYPE_NPC);
			elevator.LowerDoor = (CNpcEntity*)zoneutils::GetZone(elevator.zone)->GetEntity(Sql_GetUIntData(SqlHandle,2) & 0x0FFF, TYPE_NPC);
			elevator.UpperDoor = (CNpcEntity*)zoneutils::GetZone(elevator.zone)->GetEntity(Sql_GetUIntData(SqlHandle,3) & 0x0FFF, TYPE_NPC);

			elevator.isMoving    = false;
			elevator.isStarted   = (Sql_GetUIntData(SqlHandle,4) != 0);
			elevator.isPermanent = (Sql_GetUIntData(SqlHandle,5) != 0);

			elevator.movetime = ((elevator.UpperDoor == NULL)||(elevator.LowerDoor == NULL) ? 0 : 3);
			elevator.interval = ((elevator.UpperDoor == NULL)||(elevator.LowerDoor == NULL)||(!elevator.isPermanent) ? 8 : 8);

			if (elevator.Elevator != NULL)
			{
				elevator.Elevator->name.resize(10);
				ElevatorList.push_back(elevator);
			}
		}
	}
}

void CTransportHandler::TransportTimer() 
{
	uint32 VanaTime = CVanaTime::getInstance()->getDate();

	for(uint32 i = 0; i < ElevatorList.size(); ++i) 
	{
		Elevator_t * elevator = &ElevatorList.at(i);

		if (elevator->isStarted)
		{
			uint16 elevatorTimerOffset = (VanaTime % elevator->interval);
		
			if(elevatorTimerOffset == 0){
				elevator->isMoving = true;
				startElevator(elevator);
			}else if (elevatorTimerOffset == elevator->movetime){
				if (elevator->isMoving)
				{
					if (!elevator->isPermanent)
					{
						elevator->isStarted = false;
					}
					elevator->isMoving = false;
					arrivElevator(elevator);
				}
			}
		}
	}
}


void CTransportHandler::startElevator(int32 elevatorID)
{
		for(uint32 i = 0; i < ElevatorList.size(); ++i) 
		{
			
			Elevator_t * elevator = &ElevatorList.at(i);

			if (elevator->id == elevatorID)
			{
				CTransportHandler::startElevator(elevator);
				return;
			}
		}
}

void CTransportHandler::startElevator(Elevator_t * elevator)
{
	uint32 timestamp = CVanaTime::getInstance()->getSysTime() - 1009810800;

	elevator->Elevator->animation ^= 1; 
	
	elevator->Elevator->name[8] = 8;
	WBUFL(&elevator->Elevator->name[0],4) = timestamp;
	//elevator->Elevator->name.replace(4,4,(const char*)&(timestamp),0,4); // 
  
	if ((elevator->LowerDoor != NULL) && (elevator->UpperDoor != NULL)) 
	{
		if (elevator->Elevator->animation == ANIMATION_ELEVATOR_DOWN) 
		{
			elevator->LowerDoor->animation = ANIMATION_CLOSE_DOOR;
			zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN));
	        if (!elevator->isPermanent) 
			{
				elevator->UpperDoor->animation = ANIMATION_OPEN_DOOR;
				zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN));
			}
		} else {
			elevator->UpperDoor->animation = ANIMATION_CLOSE_DOOR;
			zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN));
			if (!elevator->isPermanent) 
			{
				elevator->LowerDoor->animation = ANIMATION_OPEN_DOOR;
				zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN));
			}
		}
	}
	zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->Elevator,ENTITY_SPAWN));
}

void CTransportHandler::arrivElevator(Elevator_t * elevator)
{
	
	
	if (elevator->id == 17)
	{
		elevator->interval = elevator->interval;
	}
	if (elevator->Elevator->animation == ANIMATION_ELEVATOR_DOWN)
	{
		elevator->LowerDoor->animation = ANIMATION_OPEN_DOOR;
		zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN));
	} else {
		elevator->UpperDoor->animation = ANIMATION_OPEN_DOOR;
		zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN));
	}
}
