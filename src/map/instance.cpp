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
#include "entities/charentity.h"
#include "lua/luautils.h"

#include "../common/timer.h"

CInstance::CInstance(CZone* zone, uint8 instanceid) : CZoneEntities(zone)
{
	m_zone = zone;
	m_instanceid = instanceid;
	m_commander = 0;
	m_levelcap = 0;
	memset(&m_entryloc, 0, sizeof m_entryloc);

	LoadInstance();

	m_startTime = gettick();
}

CInstance::~CInstance()
{
	for (auto entity : m_mobList)
	{
		delete entity.second;
	}
	for (auto entity : m_npcList)
	{
		delete entity.second;
	}
}

void CInstance::LoadInstance()
{
	static const int8* Query =
		"SELECT "
		"instance_name, "
		"time_limit, "
		"entrance_zone, "
		"start_x, "
		"start_y, "
		"start_z, "
		"start_rot "
		"FROM instance_list "
		"WHERE instanceid = %u "
		"LIMIT 1";

	if (Sql_Query(SqlHandle, Query, m_instanceid) != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		m_instanceName.insert(0, Sql_GetData(SqlHandle, 0));

		m_timeLimit = Sql_GetUIntData(SqlHandle, 1);
		m_entrance = Sql_GetUIntData(SqlHandle, 2);
		m_entryloc.x = Sql_GetFloatData(SqlHandle, 3);
		m_entryloc.y = Sql_GetFloatData(SqlHandle, 4);
		m_entryloc.z = Sql_GetFloatData(SqlHandle, 5);
		m_entryloc.rotation = Sql_GetUIntData(SqlHandle, 6);
	}
	else
	{
		ShowFatalError(CL_RED"CZone::LoadInstance: Cannot load instance %u\n" CL_RESET, m_instanceid);
	}
}

void CInstance::RegisterChar(CCharEntity* PChar)
{
	if (m_registeredChars.empty())
	{
		m_commander = PChar->id;
	}
	m_registeredChars.push_back(PChar->id);
}

uint8 CInstance::GetLevelCap()
{
	return m_levelcap;
}

const int8* CInstance::GetName()
{
	return m_instanceName.c_str();
}

position_t CInstance::GetEntryLoc()
{
	return m_entryloc;
}

uint32 CInstance::GetTimeLimit()
{
	return m_timeLimit;
}

void CInstance::SetLevelCap(uint8 cap)
{
	m_levelcap = cap;
}

void CInstance::SetEntryLoc(float x, float y, float z, float rot)
{
	m_entryloc.x = x;
	m_entryloc.y = y;
	m_entryloc.z = z;
	m_entryloc.rotation = rot;
}

bool CInstance::CheckTime(uint32 tick)
{
	m_timeLimit = 11;
	if (tick > m_startTime + m_timeLimit * 60000)
	{
		return true;
	}
	if (m_lastTimeUpdate == 0 && m_timeLimit > 10 && tick > m_startTime + (m_timeLimit - 10) * 60000)
	{
		m_lastTimeUpdate = 600;
		luautils::OnInstanceTimeUpdate(m_zone, this, m_lastTimeUpdate);
	}
	else if (m_lastTimeUpdate == 10 && m_timeLimit > 5 && tick > m_startTime + (m_timeLimit - 5) * 60000)
	{
		m_lastTimeUpdate = 300;
		luautils::OnInstanceTimeUpdate(m_zone, this, m_lastTimeUpdate);
	}
	else if (m_lastTimeUpdate == 5 && tick > m_startTime + (m_timeLimit - 1) * 60000)
	{
		m_lastTimeUpdate = 60;
		luautils::OnInstanceTimeUpdate(m_zone, this, m_lastTimeUpdate);
	}
	else if (m_lastTimeUpdate == 5 && tick > m_startTime + (m_timeLimit - 1) * 60000 - 30000)
	{
		m_lastTimeUpdate = 30;
		luautils::OnInstanceTimeUpdate(m_zone, this, m_lastTimeUpdate);
	}
	else if (m_lastTimeUpdate == 5 && tick > m_startTime + (m_timeLimit - 1) * 60000 - 10000)
	{
		m_lastTimeUpdate = 10;
		luautils::OnInstanceTimeUpdate(m_zone, this, m_lastTimeUpdate);
	}
	return false;
}

bool CInstance::CharRegistered(CCharEntity* PChar)
{
	for (auto id : m_registeredChars)
	{
		if (PChar->id == id)
		{
			return true;
		}
	}
	return false;
}