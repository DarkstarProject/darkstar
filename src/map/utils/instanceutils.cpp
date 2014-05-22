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

#include "../instance_loader.h"

#include "instanceutils.h"

#include "../lua/luautils.h"

CInstanceLoader* Loader = NULL;

namespace instanceutils
{
	void CheckInstance()
	{
		if (Loader)
		{
			Loader->Check();
		}
	}

	void LoadInstance(uint8 instanceid, uint16 zoneid, CCharEntity* PRequester)
	{
		if (!Loader->RequestInstance(instanceid, zoneid, PRequester))
		{
			luautils::OnInstanceCreated(PRequester, NULL);
		}
	}

	void CreateLoader(const int8* login, const int8* pass, const int8* host, uint16 port, const int8* db)
	{
		Loader = new CInstanceLoader(login, pass, host, port, db);
	}
};