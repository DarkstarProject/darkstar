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

#include "party_define.h"

#include "../entities/charentity.h"
#include "../party.h"
#include "../alliance.h"
#include "../utils/zoneutils.h"


CPartyDefinePacket::CPartyDefinePacket(CParty* PParty) 
{
	this->type = 0xC8;
	this->size = 0x7C;

	if (PParty)
	{
		uint32 allianceid = 0;
		if (PParty->m_PAlliance)
		{
			allianceid = PParty->m_PAlliance->m_AllianceID;
		}

		int ret = Sql_Query(SqlHandle, "SELECT chars.charid, partyflag, pos_zone, pos_prevzone FROM accounts_parties \
									   	LEFT JOIN chars ON accounts_parties.charid = chars.charid WHERE \
										IF (allianceid <> 0, allianceid = %d, partyid = %d) ORDER BY partyflag & %u, timestamp;", 
										allianceid, PParty->GetPartyID(), PARTY_SECOND | PARTY_THIRD);
		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0)
		{
			uint8 i = 0;
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint16 targid = 0;
				CCharEntity* PChar = zoneutils::GetChar(Sql_GetUIntData(SqlHandle, 0));
				if (PChar) targid = PChar->targid;
				WBUFL(data, 12 * i + (0x08) ) = Sql_GetUIntData(SqlHandle, 0);
				WBUFW(data, 12 * i + (0x0C) ) = targid;
				WBUFW(data, 12 * i + (0x0E) ) = Sql_GetUIntData(SqlHandle, 1);
                WBUFW(data, 12 * i + (0x10) ) = Sql_GetUIntData(SqlHandle, 2) ? Sql_GetUIntData(SqlHandle, 2) : Sql_GetUIntData(SqlHandle, 3);
				i++;
			}
		}
	}
}