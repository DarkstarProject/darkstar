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

#include "../../common/socket.h"
#include "../map.h"

#include "synth_suggestion.h"


CSynthSuggestionPacket::CSynthSuggestionPacket(uint32 synthID)
{
	this->type = 0x31;
	this->size = 0x1A;

	const char* fmtQuery =

		"SELECT KeyItem, Wood, Smith, Gold, Cloth, Leather, Bone, Alchemy, Cook, Crystal, \
			Result, Ingredient1, Ingredient2, Ingredient3, Ingredient4, Ingredient5, Ingredient6, Ingredient7, Ingredient8 \
		FROM synth_recipes \
		WHERE ID = %u \
		LIMIT 1";

	int32 ret = Sql_Query(
		SqlHandle,
		fmtQuery,
		synthID);

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		WBUFW(data,(0x04)) = Sql_GetUIntData(SqlHandle,10);
		//words 0x06, 0x08, 0x0A are subcraft number
		WBUFW(data,(0x0C)) = Sql_GetUIntData(SqlHandle,9);
		WBUFW(data,(0x0E)) = Sql_GetUIntData(SqlHandle,0);
		WBUFW(data,(0x10)) = Sql_GetUIntData(SqlHandle,11);
		WBUFW(data,(0x12)) = Sql_GetUIntData(SqlHandle,12);
		WBUFW(data,(0x14)) = Sql_GetUIntData(SqlHandle,13);
		WBUFW(data,(0x16)) = Sql_GetUIntData(SqlHandle,14);
		WBUFW(data,(0x18)) = Sql_GetUIntData(SqlHandle,15);
		WBUFW(data,(0x1A)) = Sql_GetUIntData(SqlHandle,16);
		WBUFW(data,(0x1C)) = Sql_GetUIntData(SqlHandle,17);
		WBUFW(data,(0x1E)) = Sql_GetUIntData(SqlHandle,18);
		//TODO: words 0x20 through 0x2E are the quantity per material
		WBUFW(data,(0x30)) = 0x01;
	}
}
