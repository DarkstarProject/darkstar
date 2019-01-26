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

#include "synth_message.h"
#include "synth_result.h"
#include "../entities/charentity.h"
#include "../trade_container.h"


CSynthResultMessagePacket::CSynthResultMessagePacket(CCharEntity* PChar, SYNTH_MESSAGE messageID, uint16 itemID, uint8 quantity)
{
	this->type = 0x70;
	this->size = 0x30;

	ref<uint8>(0x04) = messageID;
	
	ref<uint16>(0x1a) = PChar->id;
	if (itemID != 0)
	{
		ref<uint8>(0x06) = quantity;
		ref<uint16>(0x08) = itemID;
	}
	if (messageID == SYNTH_FAIL)
	{
		uint8 count = 0;
		for (uint8 slotID = 1; slotID <= 8; ++slotID)
		{
			uint32 quantity = PChar->CraftContainer->getQuantity(slotID);
			if (quantity == 0)
			{
				uint16 itemID = PChar->CraftContainer->getItemID(slotID);
				ref<uint16>(0x0A + (count * 2)) = itemID;
				count++;
			}
		}
	}
	memcpy(data + (0x1E) , PChar->GetName(), PChar->name.size());

}