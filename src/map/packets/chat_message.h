/*
===========================================================================

  Copyright (c) 2010-2011 Darkstar Dev Teams

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

#ifndef _CCHATMESSAGEPACKET_H
#define _CCHATMESSAGEPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

enum CHAT_MESSAGE_TYPE
{
	MESSAGE_SAY			= 0,
	MESSAGE_SHOUT		= 1,
	MESSAGE_UNKNOWN		= 2,
	MESSAGE_TELL		= 3,
	MESSAGE_PARTY		= 4,
	MESSAGE_LINKSHELL	= 5,
	MESSAGE_SYSTEM_1	= 6,
	MESSAGE_SYSTEM_2	= 7,
	MESSAGE_EMOTION		= 8
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CChatMessagePacket : public CBasicPacket
{
public:

	CChatMessagePacket(CCharEntity* PChar, CHAT_MESSAGE_TYPE MessageType, int8* buff);
};

#endif