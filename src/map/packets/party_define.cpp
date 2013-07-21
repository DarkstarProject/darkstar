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

#include "../entities/charentity.h"
#include "../party.h"
#include "../alliance.h"


CPartyDefinePacket::CPartyDefinePacket(CParty* PParty) 
{
	this->type = 0xC8;
	this->size = 0x7C;

	//party is an alliance do the double loop
	if (PParty != NULL)
	{
		if (PParty->m_PAlliance!= NULL)
		{
            uint8 offset = 0;
            
			for (uint8 a = 0; a < PParty->m_PAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < PParty->m_PAlliance->partyList.at(a)->members.size(); ++i) 
				{
					CBattleEntity* PChar = PParty->m_PAlliance->partyList.at(a)->members.at(i);
                    
					WBUFL(data,12*offset+(0x08)-4) = PChar->id;
					WBUFW(data,12*offset+(0x0C)-4) = PChar->targid;
                    WBUFW(data,12*offset+(0x0E)-4) = PChar->PParty->GetMemberFlags(PChar);
					WBUFW(data,12*offset+(0x10)-4) = PChar->getZone();
                    
					offset++;
				}
			}
		}
        else //regular party
        {
			DSP_DEBUG_BREAK_IF(PParty->members.size() > 6);

			for (uint8 i = 0; i < PParty->members.size(); ++i) 
			{
				CBattleEntity* PChar = PParty->members.at(i);

				WBUFL(data,12*i+(0x08)-4) = PChar->id;
				WBUFW(data,12*i+(0x0C)-4) = PChar->targid;
				WBUFW(data,12*i+(0x0E)-4) = PChar->PParty->GetMemberFlags(PChar);
				WBUFW(data,12*i+(0x10)-4) = PChar->getZone();
			}
        }
	}
}