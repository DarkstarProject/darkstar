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

CInstance::CInstance(CZone* zone, uint8 instanceid) : CZoneEntities(zone)
{
	m_zone = zone;
	m_instanceid = instanceid;
	m_commander = 0;
	m_levelcap = 0;
	memset(&m_entryloc, 0, sizeof m_entryloc);
}

CInstance::~CInstance()
{

}

bool CInstance::RegisterChar(CCharEntity* PChar)
{
	if (PChar->PInstance == NULL)
	{
		if (m_registeredChars.empty())
		{
			m_commander = PChar->id;
		}
		m_registeredChars.push_back(PChar->id);
		PChar->PInstance = this;
		return true;
	}
	return false;
}

uint8 CInstance::GetLevelCap()
{
	return m_levelcap;
}

position_t CInstance::GetEntryLoc()
{
	return m_entryloc;
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