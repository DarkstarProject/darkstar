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
#include "../entities/charentity.h"
#include "../trade_container.h"


CSynthMessagePacket::CSynthMessagePacket(CCharEntity * PChar, SYNTH_MESSAGE messageID, std::uint16_t itemID, std::uint8_t quantity)
{
    id(0x6F);
    length(0x38);

    ref<std::uint8_t>(0x04) = messageID;

    if (itemID != 0)
    {
        ref<std::uint8_t>(0x06) = quantity;
        ref<std::uint16_t>(0x08) = itemID;
    } 

    for (std::uint8_t i = 0; i < 4; i++)
    {
        std::uint8_t skillValue = 0;
        for (std::uint8_t skillID = 49; skillID < 57; skillID++)
        {
            if (skillID == ref<std::uint8_t>(0x1A) || skillID == ref<std::uint8_t>(0x1B) ||
                skillID == ref<std::uint8_t>(0x1C) || skillID == ref<std::uint8_t>(0x1D))
                continue;
            if (PChar->CraftContainer->getQuantity(skillID - 40) > skillValue)
            {
                skillValue = PChar->CraftContainer->getQuantity(skillID - 40);
                ref<std::uint8_t>(0x1A + i) = skillID;
            }
        }
    }

    ref<std::uint16_t>(0x22) = PChar->CraftContainer->getItemID(0); //crystal

    for(std::uint8_t slotID = 1; slotID <= 8; ++slotID) //recipe materials
    {
        std::uint16_t itemID = PChar->CraftContainer->getItemID(slotID);
        ref<std::uint16_t>(0x24 + ((slotID - 1) * 2)) = itemID;

        if (PChar->CraftContainer->getQuantity(slotID) == 0)
            ref<std::uint16_t>(0x0A + ((slotID - 1) * 2)) = itemID;
    }

}