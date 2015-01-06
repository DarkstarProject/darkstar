﻿/*
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

#include "transport.h"

#include "entities/charentity.h"
#include "map.h"
#include "vana_time.h"
#include "zone.h"
#include "utils/zoneutils.h"

#include "packets/event.h"
#include "packets/entity_update.h"

/************************************************************************
*                                                                       *
*  Создание глобальной ссылки на объект класса                          *
*                                                                       *
************************************************************************/

CTransportHandler* CTransportHandler::_instance = NULL;

CTransportHandler* CTransportHandler::getInstance() 
{
	if(_instance == NULL) {
		_instance = new CTransportHandler();
	}
	return _instance;
}

/************************************************************************
*                                                                       *
*  В конструкторе инициализируем всю транспортную систему               *
*                                                                       *
************************************************************************/

CTransportHandler::CTransportHandler() 
{

}


/************************************************************************
*                                                                       *
*  Все логика передвижения транспорта                                   *
*                                                                       *
************************************************************************/

void CTransportHandler::TransportTimer() 
{
	uint32 VanaTime = CVanaTime::getInstance()->getDate();

    // в портовых зонах необходимо написать макросы на случай, если персонаж вышел из игры в корабле. 
    // при входе в игру он должен оказаться на пристани

    for(uint32 i = 0; i < TransportList.size(); ++i)
    {
        Transport_t* PTransport = TransportList.at(i);

        uint16 ShipTimerOffset = ((VanaTime - PTransport->TimeOffset) % PTransport->TimeInterval);

        // корабль появляется на горизонте
        if (ShipTimerOffset == 0)
        {
            PTransport->PTransportNPC->status = STATUS_NORMAL;
            PTransport->PTransportNPC->animation = PTransport->AnimationArrive;
            PTransport->PTransportNPC->loc = PTransport->Dock;

            WBUFL(&PTransport->PTransportNPC->name[0],4) = CVanaTime::getInstance()->getVanaTime();

			PTransport->Dock.zone->PushPacket(NULL, CHAR_INZONE, new CEntityUpdatePacket(PTransport->PTransportNPC, ENTITY_SPAWN, UPDATE_ALL_MOB));
        }
        // персонажи видят корабль, иначе ждем следующего прибытия
        else if (PTransport->PTransportNPC->status == STATUS_NORMAL) 
        {
            // корабль причалил, открываем двери пассажирам
            if (ShipTimerOffset == PTransport->TimeAnimationArrive)
            {
                PTransport->PDoorNPC->animation = ANIMATION_OPEN_DOOR;
				PTransport->Dock.zone->PushPacket(PTransport->PDoorNPC, CHAR_INRANGE, new CEntityUpdatePacket(PTransport->PDoorNPC, ENTITY_UPDATE, UPDATE_COMBAT));
            }
            //корабль отчаливает
            else if (ShipTimerOffset == PTransport->TimeAnimationArrive + PTransport->TimeWaiting)
            {
                PTransport->PDoorNPC->animation = ANIMATION_CLOSE_DOOR;
                PTransport->PTransportNPC->animation = PTransport->AnimationDepart;
                PTransport->PTransportNPC->loc.boundary = PTransport->Dock.boundary;

                WBUFL(&PTransport->PTransportNPC->name[0],4) = CVanaTime::getInstance()->getVanaTime();

                PTransport->Dock.zone->TransportDepart(PTransport->PTransportNPC->loc.boundary, PTransport->PTransportNPC->loc.prevzone);
				PTransport->Dock.zone->PushPacket(PTransport->PDoorNPC, CHAR_INRANGE, new CEntityUpdatePacket(PTransport->PDoorNPC, ENTITY_UPDATE, UPDATE_COMBAT));
				PTransport->Dock.zone->PushPacket(NULL, CHAR_INZONE, new CEntityUpdatePacket(PTransport->PTransportNPC, ENTITY_UPDATE, UPDATE_COMBAT));
            }
            //корабль исчезает
            else if (ShipTimerOffset == PTransport->TimeAnimationArrive + PTransport->TimeWaiting + PTransport->TimeAnimationDepart)
            {
                PTransport->PTransportNPC->status = STATUS_DISAPPEAR;
                PTransport->Dock.zone->PushPacket(NULL, CHAR_INZONE, new CEntityUpdatePacket(PTransport->PTransportNPC, ENTITY_DESPAWN,UPDATE_NONE));
            }
        }
    }

    for (auto transportZone : TransportZoneList)
    {
        uint16 ShipTimerOffset = ((VanaTime - transportZone.TimeOffset) % transportZone.TimeInterval);

        if (ShipTimerOffset == transportZone.TimeAnimationArrive - 10)
        {
            CZone* PZone = zoneutils::GetZone(transportZone.zone);
            if (PZone)
                PZone->TransportDepart(0, transportZone.zone);
        }
    }

	for(uint32 i = 0; i < ElevatorList.size(); ++i) 
	{
		Elevator_t * elevator = &ElevatorList.at(i);

		if (elevator->isStarted)
		{
			uint16 TimerOffset = (VanaTime % elevator->interval);
			
			if (elevator->id == ELEVATOR_PORT_BASTOK_DRWBRDG)
			{
				TimerOffset = (VanaTime % INTERVAL_PORT_BASTOK_DRWBRDG);

				if (TimerOffset == 0 || TimerOffset == 76)
				{
					CZone* PZone = zoneutils::GetZone(elevator->zone);

					PZone->ForEachChar([](CCharEntity* PChar){
						if ((PChar->GetXPos() > 54 && PChar->GetXPos() < 66) && (PChar->GetZPos() > -160 && PChar->GetZPos() < -80))
						{
							PChar->pushPacket(new CEventPacket(PChar, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1));
						}
					});
				}
				else if (TimerOffset == 4 || TimerOffset == 80)
				{
					elevator->isMoving = true;
					startElevator(elevator);
				}
				else if (TimerOffset == 8 || TimerOffset == 84)
				{
					elevator->isMoving = true;
					startElevator(elevator);
				}
				else if (TimerOffset == 12 || TimerOffset == 88)
				{
					elevator->isMoving = false;
					arriveElevator(elevator);
				}
			}
			else if (elevator->id == ELEVATOR_KUFTAL_TUNNEL_DSPPRNG_RCK)
			{
				TimerOffset = (VanaTime % INTERVAL_KUFTAL_TUNNEL_DSPPRNG_RCK);

				if (TimerOffset == 60)
				{
					elevator->isMoving = true;
					startElevator(elevator);
				}
			}
			else
			{
				if (TimerOffset == 0)
				{
					elevator->isMoving = true;
					startElevator(elevator);
				}
				else if (TimerOffset == elevator->movetime)
				{
					if (elevator->isMoving)
					{
						if (!elevator->isPermanent)
						{
							elevator->isStarted = false;
						}
						elevator->isMoving = false;
						arriveElevator(elevator);
					}
				}
			}
		}
	}
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTransportHandler::insertTransport(Transport_t* transport)
{
    TransportZone_t TransportZone;

    TransportZone.zone = transport->Dock.zone->GetID();
    TransportZone.TimeOffset = transport->TimeOffset;
    TransportZone.TimeInterval = transport->TimeInterval;
    TransportZone.TimeAnimationArrive = transport->TimeAnimationArrive;

    TransportZoneList.push_back(TransportZone);
    TransportList.push_back(transport);
    return;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

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

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTransportHandler::insertElevator(Elevator_t elevator)
{
    Elevator_t* Elevator = &elevator;

    // check to see if this elevator already exists
    for (uint32 i = 0; i < ElevatorList.size(); ++i)
    {
        Elevator_t* PElevator = &ElevatorList.at(i);

        if (PElevator->Elevator->GetName() == Elevator->Elevator->GetName() && PElevator->zone == Elevator->zone)
        {
            DSP_DEBUG_BREAK_IF(true);
        }
    }

    ElevatorList.push_back(elevator);
    return;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTransportHandler::startElevator(Elevator_t * elevator)
{
	elevator->Elevator->animation ^= 1; 
	
	elevator->Elevator->name[8] = 8;
    WBUFL(&elevator->Elevator->name[0],4) = CVanaTime::getInstance()->getVanaTime();
  
	if ((elevator->LowerDoor != NULL) && (elevator->UpperDoor != NULL)) 
	{
		if (elevator->id == ELEVATOR_PORT_BASTOK_DRWBRDG)
		{
			elevator->LowerDoor->animation = ANIMATION_CLOSE_DOOR;
			zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
			elevator->UpperDoor->animation = ANIMATION_CLOSE_DOOR;
			zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
		}
		else
		{
			if (elevator->Elevator->animation == ANIMATION_ELEVATOR_DOWN) 
			{
				elevator->LowerDoor->animation = ANIMATION_CLOSE_DOOR;
				zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
				if (!elevator->isPermanent) 
				{
					elevator->UpperDoor->animation = ANIMATION_OPEN_DOOR;
					zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
				}
			}
			else
			{
				elevator->UpperDoor->animation = ANIMATION_CLOSE_DOOR;
				zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
				if (!elevator->isPermanent) 
				{
					elevator->LowerDoor->animation = ANIMATION_OPEN_DOOR;
					zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
				}
			}
		}
	}
	zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->Elevator,ENTITY_SPAWN,UPDATE_ALL_MOB));
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void CTransportHandler::arriveElevator(Elevator_t * elevator)
{
	if (elevator->id == ELEVATOR_PORT_BASTOK_DRWBRDG)
	{
		elevator->LowerDoor->animation = ANIMATION_OPEN_DOOR;
		zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
		elevator->UpperDoor->animation = ANIMATION_OPEN_DOOR;
		zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN,UPDATE_ALL_MOB));
	}
	else
	{
		if (elevator->Elevator->animation == ANIMATION_ELEVATOR_DOWN)
		{
			elevator->LowerDoor->animation = ANIMATION_OPEN_DOOR;
			zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->LowerDoor,ENTITY_SPAWN, UPDATE_ALL_MOB));
		}
		else
		{
			elevator->UpperDoor->animation = ANIMATION_OPEN_DOOR;
			zoneutils::GetZone(elevator->zone)->PushPacket(NULL,CHAR_INZONE, new CEntityUpdatePacket(elevator->UpperDoor,ENTITY_SPAWN, UPDATE_ALL_MOB));
		}
	}
}