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

#include "linkshell_message.h"

#include <string.h>

CLinkshellMessagePacket::CLinkshellMessagePacket(CLinkshell* PLinkshell, uint8 lsNum)
{
    this->type = 0xCC;
	this->size = 0x58;

    ref<uint8>(0x04) = 0x03;
    ref<uint8>(0x05) = 0x90;

    if (PLinkshell != nullptr)
    {
        ref<uint8>(0x04) = 0x70;
        ref<uint8>(0x05) = 0x06;

        if (lsNum == 2)
        {
            ref<uint8>(0x05) |= 0x40; //LS2
        }

        memcpy(data+(0x08), PLinkshell->getMessage(), dsp_min(strlen(PLinkshell->getMessage()), 115));
        memcpy(data+(0x8C), PLinkshell->getPoster(), dsp_min(strlen(PLinkshell->getPoster()), 15));
        memcpy(data+(0xA0), PLinkshell->getName(), dsp_min(strlen(PLinkshell->getName()), 16));

        ref<uint32>(0x88) = PLinkshell->getMessageTime();
    }
    ref<uint32>(0x9C) = 0x02;
}