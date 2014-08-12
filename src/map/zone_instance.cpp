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
#include "../common/timer.h"
#include "entities/charentity.h"
#include "lua/luautils.h"
#include "utils/zoneutils.h"

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

CBaseEntity* CZoneInstance::GetEntity(uint16 targid, uint8 filter)
{
	CBaseEntity* PEntity = NULL;
	if (filter & TYPE_PC)
	{
		for (auto instance : instanceList)
		{
			PEntity = instance->GetEntity(targid, filter);
			if (PEntity) break;
		}
	}
	return PEntity;
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
	CInstance* instance = PChar->PInstance;

	if (instance)
	{
		instance->DecreaseZoneCounter(PChar);
		instance->DespawnPC(PChar);
		CharZoneOut(PChar);
		PChar->PInstance = NULL;

		if (instance->CharListEmpty())
		{
			if (instance->Failed() || instance->Completed())
			{
				instanceList.erase(std::find(instanceList.begin(), instanceList.end(), instance));
				delete instance;
			}
			else
			{
				instance->SetWipeTime(instance->GetElapsedTime(gettick()));
			}
		}
	}
}

void CZoneInstance::IncreaseZoneCounter(CCharEntity* PChar)
{
	DSP_DEBUG_BREAK_IF(PChar == NULL);
	DSP_DEBUG_BREAK_IF(PChar->loc.zone != NULL);
	DSP_DEBUG_BREAK_IF(PChar->PTreasurePool != NULL);

	//return char to instance (d/c or logout)
	if (!PChar->PInstance)
	{
		for (auto instance : instanceList)
		{
			if (instance->CharRegistered(PChar))
			{
				PChar->PInstance = instance;
			}
		}
		if (PChar->m_GMlevel > 0)
		{
			PChar->PInstance = new CInstance(this, 0);
		}
	}

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

		if (!PChar->PInstance->CharRegistered(PChar))
		{
			PChar->PInstance->RegisterChar(PChar);
			PChar->loc.p = PChar->PInstance->GetEntryLoc();
			CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("afterInstanceRegister", gettick() + 500, PChar, CTaskMgr::TASK_ONCE, luautils::AfterInstanceRegister));
		}
	}
	else
	{
		//instance no longer exists: put them outside (at exit)
		PChar->loc.prevzone = GetID();
		zoneutils::GetZone(luautils::OnInstanceLoadFailed(this))->IncreaseZoneCounter(PChar);
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
	if (PEntity)
	{
		if (PEntity->PInstance)
		{
			PEntity->PInstance->PushPacket(PEntity, message_type, packet);
		}
	}
	else
	{
		for (auto instance : instanceList)
		{
			instance->PushPacket(PEntity, message_type, packet);
		}
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
	auto it = instanceList.begin();
	while (it != instanceList.end())
	{
		CInstance* instance = *it;

		instance->ZoneServer(tick);
		instance->CheckTime(tick);

		if ((instance->Failed() || instance->Completed()) && instance->CharListEmpty())
		{
			it = instanceList.erase(it);
			delete instance;
			continue;
		}
		it++;
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

void CZoneInstance::ForEachMobInstance(CBaseEntity* PEntity, std::function<void(CMobEntity*)> func)
{
	for (auto PMob : PEntity->PInstance->m_mobList)
	{
		func((CMobEntity*)PMob.second);
	}
}

CInstance* CZoneInstance::CreateInstance(uint8 instanceid)
{
	CInstance* instance = new CInstance(this, instanceid);
	instanceList.push_back(instance);
	return instance;
}