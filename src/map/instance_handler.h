/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#ifndef _CINSTANCEHANDLER_H
#define _CINSTANCEHANDLER_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include "instance.h"
#include <vector>

class CCharEntity;
class CMobEntity;

class CInstanceHandler
{
public:

	CInstanceHandler(uint8 zoneid);
	void	handleInstances(uint32 tick); //called every tick to handle win/lose conditions, locking the bcnm, etc
	int		registerBcnm(uint16 bcnmid, CCharEntity* PChar); //returns the instance id of the registration, -1 if no free bcnm.
														//also registers all people in the characters PT, etc.
	bool	hasFreeInstance(uint16 bcnmid); //returns true if there is a free instance available
	uint32	pollTimeLeft(uint16 bcnmid); //returns the shortest time left of all 3 instances of the given BCNM ID

	void	storeInstance(CInstance* inst);
private:
	uint8					m_ZoneId;
	std::vector<CInstance*>	m_Instances;
};

#endif