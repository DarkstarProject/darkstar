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

#include "../../common/socket.h"

#include "party_define.h"

#include "../charentity.h"
#include "../party.h"


CPartyDefinePacket::CPartyDefinePacket(CParty* PParty) 
{
	this->type = 0xC8;
	this->size = 0x54;

	if (PParty != NULL)
	{
		DSP_DEBUG_BREAK_IF(PParty->members.size() > 6);

		for (int32 i = 0; i < PParty->members.size(); ++i) 
		{
			uint16 PartyFlags = 0;

			CBattleEntity* PChar = PParty->members.at(i);

			DSP_DEBUG_BREAK_IF(PChar == NULL);
					
			if (PParty->GetLeader() == PChar)
			{
				PartyFlags += PARTY_LEADER;
			}
			if (PParty->GetQuaterMaster() == PChar)
			{
				PartyFlags += PARTY_QM;
			}
			if (PParty->GetSyncTarget() == PChar)
			{
				PartyFlags += PARTY_SYNC;
			}

			WBUFL(data,8*i+(0x08)-4) = PChar->id;
			WBUFW(data,8*i+(0x0C)-4) = PChar->targid;
			WBUFB(data,8*i+(0x0E)-4) = PartyFlags;
			WBUFB(data,8*i+(0x0F)-4) = PChar->getZone();
		}
	}
}