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

enum INSTANCE_STATUS
{
	INSTANCE_NORMAL,
	INSTANCE_FAILED,
	INSTANCE_COMPLETE
};

class CInstance : public CZoneEntities
{
public:

	void RegisterChar(CCharEntity*);

	uint8 GetID();
	uint8 GetLevelCap();
	const int8* GetName();
	position_t GetEntryLoc();
	uint32 GetTimeLimit();
	uint32 GetLastTimeUpdate();
	CZone* GetZone();
	uint32 GetProgress();
	uint32 GetWipeTime();
	uint32 GetElapsedTime(uint32 tick);

	void SetLevelCap(uint8 cap);
	void SetEntryLoc(float x, float y, float z, float rot);
	void SetLastTimeUpdate(uint32 time);
	void SetProgress(uint32 progress);
	void SetWipeTime(uint32 time);

	void CheckTime(uint32 tick);
	bool CharRegistered(CCharEntity* PChar);
	void Fail();
	bool Failed();
	void Complete();
	bool Completed();

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
	uint32 m_lastTimeUpdate;
	uint32 m_lastTimeCheck;
	uint32 m_wipeTimer;
	uint32 m_progress;
	position_t m_entryloc;
	INSTANCE_STATUS m_status;
	std::vector<uint32> m_registeredChars;
};

#endif