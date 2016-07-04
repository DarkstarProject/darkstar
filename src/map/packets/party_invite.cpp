﻿/*
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

#include <string.h>

#include "party_invite.h"

#include "../entities/charentity.h"


CPartyInvitePacket::CPartyInvitePacket(uint32 id, uint16 targid, CCharEntity* PInviter, INVITETYPE InviteType)
{
	this->type = 0xDC;
	this->size = 0x10; 

	//DSP_DEBUG_BREAK_IF(PInviter->name.size() > 15);
	
	WBUFL(data,(0x04)) = id;
	WBUFW(data,(0x08)) = targid;

	WBUFB(data,(0x0B)) = InviteType;

	memcpy(data+(0x0C), PInviter->GetName(), PInviter->name.size()); 
}