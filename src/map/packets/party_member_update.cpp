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

#include <string.h>

#include "party_member_update.h"

#include "../charentity.h"
#include "../alliance.h"
#include "../party.h"

CPartyMemberUpdatePacket::CPartyMemberUpdatePacket(CCharEntity* PChar, uint8 MemberNumber, uint8 ZoneID) 
{	

		this->type = 0xDD;
		this->size = 0x20;	


		DSP_DEBUG_BREAK_IF(PChar == NULL);

		WBUFL(data,(0x04)-4) = PChar->id;

		if (PChar->PParty != NULL)
		{
			WBUFW(data,(0x14)-4) = PChar->PParty->GetMemberFlags(PChar);
		}
		if (PChar->getZone() != ZoneID) 
		{
			WBUFW(data,(0x1F)-4) = PChar->getZone();
		} 
		else
		{
			WBUFL(data,(0x08)-4) = PChar->health.hp;
			WBUFL(data,(0x0C)-4) = PChar->health.mp; 
			WBUFW(data,(0x10)-4) = PChar->health.tp;
			WBUFW(data,(0x18)-4) = PChar->targid;
			WBUFB(data,(0x1D)-4) = PChar->GetHPP(); 
			WBUFB(data,(0x1E)-4) = PChar->GetMPP();
			WBUFB(data,(0x1A)-4) = MemberNumber;
		}
		memcpy(data+(0x22)-4, PChar->GetName(), PChar->name.size()); 
			
}


