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

#ifndef _CINSTANCE_H
#define _CINSTANCE_H

#include "zone_entities.h"

class CInstance : public CZoneEntities
{
public:

	bool RegisterChar(CCharEntity*);

	uint8 GetLevelCap();
	position_t GetEntryLoc();
	void SetLevelCap(uint8 cap);
	void SetEntryLoc(float x, float y, float z, float rot);
	void CheckTime(uint32 tick);

	CInstance(CZone*, uint8 instanceid);
	~CInstance();

private:
	void LoadInstance();

	CZone* m_zone;
	uint8 m_instanceid;
	uint16 m_entrance;
	string_t m_instanceName;
	uint32 m_commander;
	uint8 m_levelcap;
	uint8 m_timeLimit;
	uint32 m_startTime;
	position_t m_entryloc;
	std::vector<uint32> m_registeredChars;
};

#endif