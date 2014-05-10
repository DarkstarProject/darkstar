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

#include "zone.h"

class CBaseEntity;
class CCharEntity;
class CZone;

class CInstance
{
public:

	void	WideScan(CCharEntity* PChar, uint16 radius);
	void	PushPacket(CBaseEntity*, GLOBAL_MESSAGE_TYPE, CBasicPacket*);

	void	SpawnPCs(CCharEntity* PChar);
	void	SpawnMOBs(CCharEntity* PChar);
	void	SpawnPETs(CCharEntity* PChar);
	void	SpawnNPCs(CCharEntity* PChar);
	void	SpawnMoogle(CCharEntity* PChar);
	void    SpawnTransport(CCharEntity* PChar);

	void	DecreaseInstanceCounter(CCharEntity* PChar);
	void	IncreaseInstanceCounter(CCharEntity* PChar);

	void	InsertNPC(CBaseEntity* PNpc);
	void	InsertMOB(CBaseEntity* PMob);
	void	InsertPET(CBaseEntity* PPet);
	void	DeletePET(CBaseEntity* PPet);

	void	TOTDChange(TIMETYPE TOTD);

	void    FindPartyForMob(CBaseEntity* PEntity);
	void    TransportDepart(CBaseEntity* PTransportNPC);

	void	ZoneServer(uint32 tick);
	void	ZoneServerRegion(uint32 tick);

	CInstance(CZone*);
	~CInstance();

private:
	CZone* m_zone;
};

#endif