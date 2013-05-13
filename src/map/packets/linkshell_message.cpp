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

#include "../../common/utils.h"

#include "linkshell_message.h"

#include <string.h>

CLinkshellMessagePacket::CLinkshellMessagePacket(CLinkshell* PLinkshell)
{
    this->type = 0xCC;
	this->size = 0x58;

    WBUFB(data,(0x04)-4) = 0x03;
	WBUFB(data,(0x05)-4) = 0x90;

    if (PLinkshell != NULL)
    {
        WBUFB(data,(0x04)-4) = 0x70;
	    WBUFB(data,(0x05)-4) = 0x86; // +0x80 - show,  +0x40 - set

		int8 linkshellName[15];
		memset(linkshellName,0,sizeof linkshellName);
		EncodeStringLinkshell((int8*)PLinkshell->getName(),linkshellName);

        memcpy(data+(0x08)-4, PLinkshell->getMessage(), dsp_min(strlen(PLinkshell->getMessage()), 115));
        memcpy(data+(0x8C)-4, PLinkshell->getPoster(), dsp_min(strlen(PLinkshell->getPoster()), 15));
        memcpy(data+(0xA0)-4, linkshellName, dsp_min(strlen(linkshellName), 16));

        WBUFL(data,(0x88)-4) = PLinkshell->getMessageTime();
    }
    WBUFL(data,(0x9C)-4) = 0x01;
}