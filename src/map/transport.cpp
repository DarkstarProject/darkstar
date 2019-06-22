﻿/*
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

#include "transport.h"

#include "entities/charentity.h"
#include "map.h"
#include "vana_time.h"
#include "zone.h"
#include "utils/zoneutils.h"
#include "../common/timer.h"
#include "packets/event.h"
#include "packets/entity_update.h"
#include <cstdlib>

std::unique_ptr<CTransportHandler> CTransportHandler::_instance;


CTransportHandler* CTransportHandler::getInstance()
{
    if (!_instance)
        _instance.reset(new CTransportHandler);

    return _instance.get();
}

void Transport_Ship::setVisible(bool visible)
{
    if (visible)
        this->npc->status = STATUS_NORMAL;
    else
        this->npc->status = STATUS_DISAPPEAR;
}

void Transport_Ship::animateSetup(uint8 animationID, uint32 horizonTime)
{
    this->npc->animation = animationID;
    this->setName(horizonTime);
}

void Transport_Ship::spawn()
{
    this->npc->loc = this->dock;
    this->setVisible(true);
}

void Transport_Ship::setName(uint32 value)
{
    ref<uint32>(&this->npc->name[0], 4) = value;
}

void TransportZone_Town::updateShip()
{
    this->ship.dock.zone->PushPacket(nullptr, CHAR_INZONE, new CEntityUpdatePacket(this->ship.npc, ENTITY_UPDATE, UPDATE_COMBAT));
}

void TransportZone_Town::openDoor(bool sendPacket)
{
    this->npcDoor->animation = ANIMATION_OPEN_DOOR;

    if (sendPacket)
        this->ship.dock.zone->PushPacket(this->npcDoor, CHAR_INRANGE, new CEntityUpdatePacket(this->npcDoor, ENTITY_UPDATE, UPDATE_COMBAT));
}

void TransportZone_Town::closeDoor(bool sendPacket)
{
    this->npcDoor->animation = ANIMATION_CLOSE_DOOR;

    if (sendPacket)
        this->ship.dock.zone->PushPacket(this->npcDoor, CHAR_INRANGE, new CEntityUpdatePacket(this->npcDoor, ENTITY_UPDATE, UPDATE_COMBAT));
}

void TransportZone_Town::depart()
{
    this->ship.dock.zone->TransportDepart(this->ship.npc->loc.boundary, this->ship.npc->loc.prevzone);
}

void Elevator_t::openDoor(CNpcEntity* npc)
{
    npc->animation = ANIMATION_OPEN_DOOR;
    zoneutils::GetZone(this->zoneID)->PushPacket(npc, CHAR_INRANGE, new CEntityUpdatePacket(npc, ENTITY_SPAWN, UPDATE_ALL_MOB));
}

void Elevator_t::closeDoor(CNpcEntity* npc)
{
    npc->animation = ANIMATION_CLOSE_DOOR;
    zoneutils::GetZone(this->zoneID)->PushPacket(npc, CHAR_INRANGE, new CEntityUpdatePacket(npc, ENTITY_SPAWN, UPDATE_ALL_MOB));
}

/************************************************************************
*                                                                       *
*  Loads transportation from the database table transport               *
*                                                                       *
************************************************************************/

void CTransportHandler::InitializeTransport()
{
    DSP_DEBUG_BREAK_IF(townZoneList.size() != 0);

    const char* fmtQuery = "SELECT id, transport, door, dock_x, dock_y, dock_z, dock_rot, \
                            boundary, zone, anim_arrive, anim_depart, time_offset, time_interval, \
                            time_waiting, time_anim_arrive, time_anim_depart FROM transport LEFT JOIN \
                            zone_settings ON ((transport >> 12) & 0xFFF) = zoneid WHERE \
                            IF(%d <> 0, '%s' = zoneip AND %d = zoneport, TRUE);";

    int32 ret = Sql_Query(SqlHandle, fmtQuery, map_ip.s_addr, inet_ntoa(map_ip), map_port);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            TransportZone_Town zoneTown;

            zoneTown.ship.dock.zone = zoneutils::GetZone((Sql_GetUIntData(SqlHandle, 1) >> 12) & 0x0FFF);

            zoneTown.ship.dock.p.x = Sql_GetFloatData(SqlHandle, 3);
            zoneTown.ship.dock.p.y = Sql_GetFloatData(SqlHandle, 4);
            zoneTown.ship.dock.p.z = Sql_GetFloatData(SqlHandle, 5);
            zoneTown.ship.dock.p.rotation = (uint8)Sql_GetIntData(SqlHandle, 6);
            zoneTown.ship.dock.boundary = (uint16)Sql_GetIntData(SqlHandle, 7);
            zoneTown.ship.dock.prevzone = (uint8)Sql_GetIntData(SqlHandle, 8);

            zoneTown.npcDoor = zoneutils::GetEntity(Sql_GetUIntData(SqlHandle, 2), TYPE_NPC);
            zoneTown.ship.npc = zoneutils::GetEntity(Sql_GetUIntData(SqlHandle, 1), TYPE_SHIP);
            zoneTown.ship.npc->name.resize(8);

            zoneTown.ship.animationArrive = (uint8)Sql_GetIntData(SqlHandle, 9);
            zoneTown.ship.animationDepart = (uint8)Sql_GetIntData(SqlHandle, 10);

            zoneTown.ship.timeOffset = (uint16)Sql_GetIntData(SqlHandle, 11);
            zoneTown.ship.timeInterval = (uint16)Sql_GetIntData(SqlHandle, 12);
            zoneTown.ship.timeArriveDock = (uint16)Sql_GetIntData(SqlHandle, 14);
            zoneTown.ship.timeDepartDock = zoneTown.ship.timeArriveDock + (uint16)Sql_GetIntData(SqlHandle, 13);
            zoneTown.ship.timeVoyageStart = zoneTown.ship.timeDepartDock + (uint16)Sql_GetIntData(SqlHandle, 15) - 1;
            

            zoneTown.ship.state = STATE_TRANSPORT_INIT;
            zoneTown.ship.setVisible(false);
            zoneTown.closeDoor(false);

            if (zoneTown.npcDoor == nullptr || zoneTown.ship.npc == nullptr)
            {
                ShowError("Transport <%u>: transport or door not found\n", (uint8)Sql_GetIntData(SqlHandle, 0));
                continue;
            }
            if (zoneTown.ship.timeArriveDock < 10)
            {
                ShowError("Transport <%u>: time_anim_arrive must be > 10\n", (uint8)Sql_GetIntData(SqlHandle, 0));
                continue;
            }
            if (zoneTown.ship.timeInterval < zoneTown.ship.timeVoyageStart)
            {
                ShowError("Transport <%u>: time_interval must be > time_anim_arrive + time_waiting + time_anim_depart\n", (uint8)Sql_GetIntData(SqlHandle, 0));
                continue;
            }
            
            townZoneList.push_back(zoneTown);
        }
    }

    fmtQuery = "SELECT zone, time_offset, time_interval, time_waiting, time_anim_arrive, time_anim_depart \
                FROM transport LEFT JOIN \
                zone_settings ON zone = zoneid WHERE \
                IF(%d <> 0, '%s' = zoneip AND %d = zoneport, TRUE)";

    ret = Sql_Query(SqlHandle, fmtQuery, map_ip.s_addr, inet_ntoa(map_ip), map_port);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {

            TransportZone_Voyage voyageZone;

            voyageZone.voyageZone = nullptr;
            voyageZone.voyageZone = zoneutils::GetZone((uint8)Sql_GetUIntData(SqlHandle, 0));

            if (voyageZone.voyageZone != nullptr && voyageZone.voyageZone->GetID() > 0)
            {
                voyageZone.timeOffset = (uint16)Sql_GetIntData(SqlHandle, 1);
                voyageZone.timeInterval = (uint16)Sql_GetIntData(SqlHandle, 2);

                voyageZone.timeArriveDock = (uint16)Sql_GetIntData(SqlHandle, 4);
                voyageZone.timeDepartDock = voyageZone.timeArriveDock + (uint16)Sql_GetIntData(SqlHandle, 3);
                voyageZone.timeVoyageStart = voyageZone.timeDepartDock + (uint16)Sql_GetIntData(SqlHandle, 5);

                voyageZone.state = STATE_TRANSPORTZONE_INIT;

                voyageZoneList.push_back(voyageZone);
            }
            else
                ShowError("TransportZone <%u>: zone not found\n", (uint8)Sql_GetIntData(SqlHandle, 0));
        }
    }
}

/************************************************************************
*                                                                       *
*  Main transportation controller                                  *
*                                                                       *
************************************************************************/

void CTransportHandler::TransportTimer()
{

    uint32 vanaTime = CVanaTime::getInstance()->getDate();
    uint16 shipTimerOffset = 0;

    //Loop through town zones and update transportion accordingly
    for (uint32 i = 0; i < townZoneList.size(); ++i)
    {
        TransportZone_Town* townZone = &townZoneList.at(i);
 
        shipTimerOffset = ((vanaTime - townZone->ship.timeOffset) % townZone->ship.timeInterval);

        if (townZone->ship.state == STATE_TRANSPORT_AWAY)
        {
            if (shipTimerOffset < townZone->ship.timeArriveDock)
            {
                townZone->ship.state = STATE_TRANSPORT_ARRIVING;
                townZone->ship.animateSetup(townZone->ship.animationArrive, CVanaTime::getInstance()->getVanaTime());
                townZone->ship.spawn();

                townZone->updateShip();
            }
        }
        else if (townZone->ship.state == STATE_TRANSPORT_DEPARTING)
        {
            if (shipTimerOffset >= townZone->ship.timeVoyageStart)
            {
                townZone->ship.state = STATE_TRANSPORT_AWAY;
                townZone->ship.setVisible(false);

                townZone->updateShip();
            }
        }
        else if (townZone->ship.state == STATE_TRANSPORT_DOCKED)
        {
            if (shipTimerOffset >= townZone->ship.timeDepartDock)
            {
                townZone->ship.state = STATE_TRANSPORT_DEPARTING;
                townZone->ship.animateSetup(townZone->ship.animationDepart, CVanaTime::getInstance()->getVanaTime());

                townZone->closeDoor(true);
                townZone->depart();
                townZone->updateShip();
            }
        }
        else if (townZone->ship.state == STATE_TRANSPORT_ARRIVING)
        {
            if (shipTimerOffset >= townZone->ship.timeArriveDock)
            {
                townZone->ship.state = STATE_TRANSPORT_DOCKED;
                townZone->openDoor(true);

            }
        }
        else if (townZone->ship.state == STATE_TRANSPORT_INIT)
        {
            if (shipTimerOffset >= townZone->ship.timeVoyageStart)
                townZone->ship.state = STATE_TRANSPORT_AWAY;

            else if (shipTimerOffset >= townZone->ship.timeDepartDock)
            {
                uint32 departTime = shipTimerOffset - townZone->ship.timeDepartDock;
                townZone->ship.state = STATE_TRANSPORT_DEPARTING;
                townZone->ship.spawn();
                townZone->ship.animateSetup(townZone->ship.animationDepart, (uint32)(CVanaTime::getInstance()->getVanaTime() - departTime * 2.4));
            }
            else if (shipTimerOffset >= townZone->ship.timeArriveDock)
            {
                townZone->ship.state = STATE_TRANSPORT_DOCKED;
                townZone->openDoor(false);
                townZone->ship.spawn();
                townZone->ship.animateSetup(townZone->ship.animationArrive, (uint32)(CVanaTime::getInstance()->getVanaTime() - shipTimerOffset * 2.4));
            }
            else
            {
                townZone->ship.state = STATE_TRANSPORT_ARRIVING;

                townZone->ship.spawn();
                townZone->ship.animateSetup(townZone->ship.animationArrive, (uint32)(CVanaTime::getInstance()->getVanaTime() - shipTimerOffset * 2.4));
            }
        }
        else
            ShowError("Unexpected state reached for transportation %d\n", townZone->ship.npc->id);
    }

    //Loop through voyage zones and zone passengers accordingly
    for (uint32 i = 0; i < voyageZoneList.size(); i++)
    {
        TransportZone_Voyage* zoneIterator = &voyageZoneList.at(i);

        shipTimerOffset = ((vanaTime - zoneIterator->timeOffset) % zoneIterator->timeInterval);

        if (zoneIterator->state == STATE_TRANSPORTZONE_VOYAGE)
        {
            //Zone them out 10 Van minutes before the boat reaches the dock
            if (shipTimerOffset < zoneIterator->timeVoyageStart && shipTimerOffset > zoneIterator->timeArriveDock - 10)
                zoneIterator->state = STATE_TRANSPORTZONE_EVICT;

        }
        else if (zoneIterator->state == STATE_TRANSPORTZONE_EVICT)
        {
            zoneIterator->voyageZone->TransportDepart(0, zoneIterator->voyageZone->GetID());
            zoneIterator->state = STATE_TRANSPORTZONE_WAIT;
        }
        else if (zoneIterator->state == STATE_TRANSPORTZONE_WAIT)
        {
            if (shipTimerOffset < zoneIterator->timeDepartDock)
                zoneIterator->state = STATE_TRANSPORTZONE_EVICT;
            else
                zoneIterator->state = STATE_TRANSPORTZONE_DOCKED;
        }
        else if (zoneIterator->state == STATE_TRANSPORTZONE_DOCKED)
        {
            if (shipTimerOffset > zoneIterator->timeVoyageStart)
                zoneIterator->state = STATE_TRANSPORTZONE_VOYAGE;
        }
        else if (zoneIterator->state == STATE_TRANSPORTZONE_INIT)
        {
            if (shipTimerOffset < zoneIterator->timeVoyageStart)
                zoneIterator->state = STATE_TRANSPORTZONE_EVICT;
            else
                zoneIterator->state = STATE_TRANSPORTZONE_VOYAGE;
        }
        else
            ShowError("Unexpected state reached for travel zone %d\n", zoneIterator->voyageZone->GetID());

    }

    //Loop through elevators
    for (uint32 i = 0; i < ElevatorList.size(); ++i)
    {
        Elevator_t * elevator = &ElevatorList.at(i);

        if (elevator->activated)
        {
            if (elevator->state == STATE_ELEVATOR_TOP || elevator->state == STATE_ELEVATOR_BOTTOM)
            {
                if (vanaTime >= elevator->lastTrigger + elevator->interval)
                    startElevator(elevator);
            }
            else if (elevator->state == STATE_ELEVATOR_ASCEND || elevator->state == STATE_ELEVATOR_DESCEND)
            {
                if (vanaTime >= elevator->lastTrigger + elevator->movetime)
                    arriveElevator(elevator);
            }
            else
                ShowError("Unexpected state reached for elevator %d\n", elevator->Elevator->id);
        }
    }
}
/************************************************************************
*                                                                       *
*  Initializes an elevator                                              *
*                                                                       *
************************************************************************/

void CTransportHandler::insertElevator(Elevator_t elevator)
{    
    // check to see if this elevator already exists
    for (uint32 i = 0; i < ElevatorList.size(); ++i)
    {
        Elevator_t* PElevator = &ElevatorList.at(i);

        if (PElevator->Elevator->GetName() == elevator.Elevator->GetName() && PElevator->zoneID == elevator.zoneID)
        {
            DSP_DEBUG_BREAK_IF(true);
        }
    }

    //Double check that the NPC entities all exist
    if (elevator.LowerDoor == nullptr || elevator.UpperDoor == nullptr || elevator.Elevator == nullptr)
    {
        ShowError("Elevator %d could not load NPC entity. Ignoring this elevator.\n", elevator.Elevator->id);
        return;
    }

    //Have permanent elevators wait until their next cycle to begin moving
    uint32 VanaTime = CVanaTime::getInstance()->getDate();
    elevator.lastTrigger = VanaTime - (VanaTime % elevator.interval) + elevator.interval;
    elevator.Elevator->name[8] = 8;

    //Initialize the elevator into the correct state based on
    //its animation value in the database. 
    if (elevator.Elevator->animation == ANIMATION_ELEVATOR_DOWN)
        elevator.state = STATE_ELEVATOR_BOTTOM;
    else if (elevator.Elevator->animation == ANIMATION_ELEVATOR_UP)
        elevator.state = STATE_ELEVATOR_TOP;
    else
    {
        ShowError("Elevator %d has unexpected animation. Ignoring this elevator.\n", elevator.Elevator->id);
        return;
    }

    //Inconsistant animations throughout the elevators
    if (elevator.animationsReversed)
        elevator.state ^= 1;

    //Ensure that the doors start in the correct positions
    //regardless of their values in the database.

    elevator.LowerDoor->animation = (elevator.state == STATE_ELEVATOR_TOP) ? ANIMATION_CLOSE_DOOR : ANIMATION_OPEN_DOOR;
    elevator.UpperDoor->animation = (elevator.state == STATE_ELEVATOR_TOP) ? ANIMATION_OPEN_DOOR : ANIMATION_CLOSE_DOOR;

    ElevatorList.push_back(elevator);
    return;
}

/************************************************************************
*                                                                       *
*  Called when a lever is pulled in the field.                          *
*                                                                       *
************************************************************************/

void CTransportHandler::startElevator(int32 elevatorID)
{
    for (uint32 i = 0; i < ElevatorList.size(); ++i)
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
*  Called when an elevator should start moving.                         *
*                                                                       *
************************************************************************/
void CTransportHandler::startElevator(Elevator_t * elevator)
{
    uint32 VanaTime = CVanaTime::getInstance()->getDate();

    //Take care of animation and state changes
    if (elevator->state == STATE_ELEVATOR_TOP)
    {
        elevator->state = STATE_ELEVATOR_DESCEND;
        elevator->Elevator->animation = elevator->animationsReversed ? ANIMATION_ELEVATOR_UP : ANIMATION_ELEVATOR_DOWN;
        elevator->closeDoor(elevator->UpperDoor);
    }
    else if (elevator->state == STATE_ELEVATOR_BOTTOM)
    {
        elevator->state = STATE_ELEVATOR_ASCEND;
        elevator->Elevator->animation = elevator->animationsReversed ? ANIMATION_ELEVATOR_DOWN : ANIMATION_ELEVATOR_UP;
        elevator->closeDoor(elevator->LowerDoor);
    }
    else
        return;

    //Update elevator params
    if (!elevator->isPermanent)
    {
        elevator->lastTrigger = VanaTime;
        elevator->activated = true;
    }
    else
        elevator->lastTrigger = VanaTime -  VanaTime % elevator->interval; //Keep the elevators synced to Vanadiel time

    ref<uint32>(&elevator->Elevator->name[0], 4) = CVanaTime::getInstance()->getVanaTime();

    zoneutils::GetZone(elevator->zoneID)->PushPacket(nullptr, CHAR_INZONE, new CEntityUpdatePacket(elevator->Elevator, ENTITY_UPDATE, UPDATE_COMBAT));
}

/************************************************************************
*                                                                       *
*  Called when an elevator has finished moving.                         *
*                                                                       *
************************************************************************/

void CTransportHandler::arriveElevator(Elevator_t * elevator)
{
    //Disable manual elevators
    if (!elevator->isPermanent)
        elevator->activated = false;

    //Update state
    elevator->state = (elevator->state == STATE_ELEVATOR_ASCEND) ? STATE_ELEVATOR_TOP : STATE_ELEVATOR_BOTTOM;

    //Take care of doors
    if (elevator->state == STATE_ELEVATOR_BOTTOM)
        elevator->openDoor(elevator->LowerDoor);
    else if (elevator->state == STATE_ELEVATOR_TOP)
        elevator->openDoor(elevator->UpperDoor);
    else
        ShowError("Elevator %d has malfunctioned\n", elevator->Elevator->id);
}