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

#include "instance.h"
#include "zone.h"
#include "entities\charentity.h"

CInstance::CInstance(CZone* zone)
{
	m_zone = zone;
}

CInstance::~CInstance()
{

}

void CInstance::InsertMOB(CBaseEntity* PMob)
{

}

void CInstance::InsertNPC(CBaseEntity* PNpc)
{

}

void CInstance::DeletePET(CBaseEntity* PPet)
{

}

void CInstance::InsertPET(CBaseEntity* PPet)
{

}

void CInstance::FindPartyForMob(CBaseEntity* PEntity)
{

}

void CInstance::TransportDepart(CBaseEntity* PTransportNPC)
{
	
}

void CInstance::DecreaseInstanceCounter(CCharEntity* PChar)
{

}

void CInstance::IncreaseInstanceCounter(CCharEntity* PChar)
{

}

void CInstance::SpawnMOBs(CCharEntity* PChar)
{

}

void CInstance::SpawnPETs(CCharEntity* PChar)
{

}

void CInstance::SpawnNPCs(CCharEntity* PChar)
{

}

void CInstance::SpawnPCs(CCharEntity* PChar)
{

}

void CInstance::SpawnMoogle(CCharEntity* PChar)
{

}

void CInstance::SpawnTransport(CCharEntity* PChar)
{

}

void CInstance::TOTDChange(TIMETYPE TOTD)
{

}

void CInstance::PushPacket(CBaseEntity* PEntity, GLOBAL_MESSAGE_TYPE message_type, CBasicPacket* packet)
{

}

void CInstance::WideScan(CCharEntity* PChar, uint16 radius)
{

}

void CInstance::ZoneServer(uint32 tick)
{

}

void CInstance::ZoneServerRegion(uint32 tick)
{

}