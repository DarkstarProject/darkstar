/*
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

#include "../instance_loader.h"

#include "instanceutils.h"
#include "zoneutils.h"

#include "../lua/luautils.h"

CInstanceLoader* Loader = nullptr;

namespace instanceutils
{
	void CheckInstance()
	{
		if (Loader)
		{
			if (Loader->Check())
			{
				delete Loader;
				Loader = nullptr;
			}
		}
	}

	void LoadInstance(uint8 instanceid, uint16 zoneid, CCharEntity* PRequester)
	{
        CZone* PZone = zoneutils::GetZone(zoneid);
		if (!Loader && PZone)
		{
			Loader = new CInstanceLoader(instanceid, PZone, PRequester);
		}
		else
		{
			luautils::OnInstanceCreated(PRequester, nullptr);
		}
	}
};