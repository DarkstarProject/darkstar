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

#include <string.h>

#include "char_emotion.h"
#include "../entities/charentity.h"
#include "../item_container.h"
#include "../items/item_weapon.h"

CCharEmotionPacket::CCharEmotionPacket(CCharEntity* PChar, uint8* buff)
{
	this->type = 0x5a;
	this->size = 0x1C;								// new size to match retail packet

	ref<uint32>(0x04) = PChar->id;					// player Id
	ref<uint32>(0x08) = ::ref<uint32>(buff, 0x04);		// target Id
	ref<uint16>(0x0C) = PChar->targid;				// player's zone charList index
	ref<uint16>(0x0E) = ::ref<uint16>(buff, 0x08);		// target's zone mobList index (?)

	uint8 emoteID = ::ref<uint8>(buff, 0x0A);
	uint8 motion = ::ref<uint8>(buff, 0x0B);

	if (emoteID == 0x4A) { 							// [jobemote] sends job id as extra value
		uint8 offset = ::ref<uint8>(buff, 0x0C) - 0x1F;
		ref<uint8>(0x10) = emoteID + offset;		// emote Id
		ref<uint8>(0x12) = offset;				// job Id
	} else if (emoteID == 0x2B) { 					// [hurray] sends weapon as extra value
		ref<uint8>(0x10) = emoteID;				// emote Id
		CItem * weapon = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_MAIN]);
		if (weapon != nullptr && weapon->getID() != 0xFFFF) {
			ref<uint16>(0x12) = weapon->getID();	// main weapon Id
		}
	}else{											// [any other emote] no extra value
		ref<uint8>(0x10) = emoteID;				// emote Id
	}

	ref<uint8>(0x16) = motion;					// motion
}