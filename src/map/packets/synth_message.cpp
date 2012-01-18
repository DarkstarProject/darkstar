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

#include "synth_message.h"
#include "../charentity.h"


CSynthMessagePacket::CSynthMessagePacket(CCharEntity * PChar, SYNTH_MESSAGE messageID, uint16 itemID, uint8 quantity)
{
	this->type = 0x6F;
	this->size = 0x12;

	WBUFB(data,(0x04)-4) = messageID;

	if (itemID != 0)
	{
		WBUFB(data,(0x06)-4) = quantity;
		WBUFW(data,(0x08)-4) = itemID;
	} 
		
	if( messageID == SYNTH_FAIL) 
	{
		uint8 count = 0;
		for(uint8 slotID = 1; slotID <= 8; ++slotID) 
		{
			uint32 quantity = PChar->Container->getQuantity(slotID);
			if (quantity == 0) 
			{
				uint16 itemID = PChar->Container->getItemID(slotID);
				WBUFW(data,(0x0A+(count*2))-4) = itemID;
				count++;
			}
		}
	}
}