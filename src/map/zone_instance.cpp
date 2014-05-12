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

#include "zone_instance.h"
#include "entities/charentity.h"

/************************************************************************
*																		*
*  Класс CZoneInstance													*
*																		*
************************************************************************/

CZoneInstance::CZoneInstance(ZONEID ZoneID, REGIONTYPE RegionID, CONTINENTTYPE ContinentID) 
: CZone(ZoneID, RegionID, ContinentID)
{
	createZoneTimer();
}

CZoneInstance::~CZoneInstance()
{
	for (auto instance : instanceList)
	{
		delete instance;
	}
}

void CZoneInstance::InsertMOB(CBaseEntity* PMob)
{
	if (PMob->PInstance)
	{
		PMob->PInstance->InsertMOB(PMob);
	}
}

void CZoneInstance::InsertNPC(CBaseEntity* PNpc)
{
	if (PNpc->PInstance)
	{
		PNpc->PInstance->InsertNPC(PNpc);
	}
}

void CZoneInstance::DeletePET(CBaseEntity* PPet)
{
	if (PPet->PInstance)
	{
		PPet->PInstance->DeletePET(PPet);
	}
}

void CZoneInstance::InsertPET(CBaseEntity* PPet)
{
	if (PPet->PInstance)
	{
		PPet->PInstance->InsertPET(PPet);
	}
}

void CZoneInstance::FindPartyForMob(CBaseEntity* PEntity)
{
	if (PEntity->PInstance)
	{
		PEntity->PInstance->FindPartyForMob(PEntity);
	}
}

void CZoneInstance::TransportDepart(CBaseEntity* PTransportNPC)
{
	if (PTransportNPC->PInstance)
	{
		PTransportNPC->PInstance->TransportDepart(PTransportNPC);
	}
}

void CZoneInstance::DecreaseZoneCounter(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->DecreaseZoneCounter(PChar);
		PChar->PInstance->DespawnPC(PChar);
		CharZoneOut(PChar);
		PChar->PInstance = NULL;
	}
}

void CZoneInstance::IncreaseZoneCounter(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->loc.zone != NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != NULL);

	//TEMP
	CInstance* newInstance = new CInstance(this);
	instanceList.push_back(newInstance);
	PChar->PInstance = newInstance;

	if (PChar->PInstance)
	{
		PChar->targid = PChar->PInstance->GetNewTargID();

		if (PChar->targid >= 0x700)
		{
			ShowError(CL_RED"CZone::InsertChar : targid is high (03hX)\n" CL_RESET, PChar->targid);
			return;
		}

		PChar->PInstance->InsertPC(PChar);
		CharZoneIn(PChar);
		//instance zonein script etc
	}
}

void CZoneInstance::SpawnMOBs(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->SpawnMOBs(PChar);
	}
}

void CZoneInstance::SpawnPETs(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->SpawnPETs(PChar);
	}
}

void CZoneInstance::SpawnNPCs(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->SpawnNPCs(PChar);
	}
}

void CZoneInstance::SpawnPCs(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->SpawnPCs(PChar);
	}
}

void CZoneInstance::SpawnMoogle(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->SpawnMoogle(PChar);
	}
}

void CZoneInstance::SpawnTransport(CCharEntity* PChar)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->SpawnTransport(PChar);
	}
}

void CZoneInstance::TOTDChange(TIMETYPE TOTD)
{
	for (auto instance : instanceList)
	{
		instance->TOTDChange(TOTD);
	}
}

void CZoneInstance::PushPacket(CBaseEntity* PEntity, GLOBAL_MESSAGE_TYPE message_type, CBasicPacket* packet)
{
	if (PEntity->PInstance)
	{
		PEntity->PInstance->PushPacket(PEntity, message_type, packet);
	}
}

void CZoneInstance::WideScan(CCharEntity* PChar, uint16 radius)
{
	if (PChar->PInstance)
	{
		PChar->PInstance->WideScan(PChar, radius);
	}
}

void CZoneInstance::ZoneServer(uint32 tick)
{
	for (auto instance : instanceList)
	{
		instance->ZoneServer(tick);
	}
}

void CZoneInstance::ZoneServerRegion(uint32 tick)
{
	for (auto instance : instanceList)
	{
		instance->ZoneServerRegion(tick);
	}
}

void CZoneInstance::ForEachChar(std::function<void(CCharEntity*)> func)
{
	for (auto instance : instanceList)
	{
		for (auto PChar : instance->GetCharList())
		{
			func((CCharEntity*)PChar.second);
		}
	}
}

void CZoneInstance::ForEachCharInstance(CBaseEntity* PEntity, std::function<void(CCharEntity*)> func)
{
	for (auto PChar : PEntity->PInstance->GetCharList())
	{
		func((CCharEntity*)PChar.second);
	}
}