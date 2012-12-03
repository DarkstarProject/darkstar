/*
===========================================================================

  Copyright //(c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  //(at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include <string.h>

#include "merit_list.h"
#include "merit.h"
#include "map.h"



/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

namespace meritEntries
{
	static MeritEntry MeritList[MCATEGORY_COUNT];

	void LoadMeritList()
	{
	    const int8* Query = "SELECT meritid, upgrade, value, jobs \
							 FROM merits \
                             WHERE meritid < %u";

	    int32 ret = Sql_Query(SqlHandle, Query, MCATEGORY_COUNT);

	    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
			uint16 i = 0;

		    while (Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		    {
				uint16 id = Sql_GetUIntData(SqlHandle,0);
				MeritList[id].m_meritid = id;
				MeritList[id].m_numberOfUpgrades = Sql_GetUIntData(SqlHandle,1);
				MeritList[id].m_value = Sql_GetUIntData(SqlHandle,2);
				MeritList[id].m_jobs = Sql_GetUIntData(SqlHandle,3);
				i++;
		    }
	    }
	}


	MeritEntry* GetMeritEntry(uint16 id)
	{
		return &MeritList[id];
	}


};