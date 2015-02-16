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

#ifndef _CCHATMESSAGEPACKET_H
#define _CCHATMESSAGEPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

enum CHAT_MESSAGE_TYPE
{
    MESSAGE_SAY         = 0x00,
    MESSAGE_SHOUT       = 0x01,
    MESSAGE_UNKNOWN     = 0x02, // Does not work?
    MESSAGE_TELL        = 0x03,
    MESSAGE_PARTY       = 0x04,
    MESSAGE_LINKSHELL   = 0x05,
    MESSAGE_SYSTEM_1    = 0x06,
    MESSAGE_SYSTEM_2    = 0x07,
    MESSAGE_EMOTION     = 0x08,
    // MESSAGE_NONE        = 0x09, // Does not work?
    // MESSAGE_NONE        = 0x0A, // Does not work?
    // MESSAGE_NONE        = 0x0B, // Does not work?
    MESSAGE_GM_PROMPT   = 0x0C, // Menu prompt from GM
    MESSAGE_SYS_SAY     = 0x0D, // Same as MESSAGE_SAY but has no speaker object displayed
    MESSAGE_SYS_SHOUT   = 0x0E, // Same as MESSAGE_SHOUT but has no speaker object displayed
    MESSAGE_SYS_PARTY   = 0x0F, // Same as MESSAGE_PARTY but has no speaker object displayed
    MESSAGE_SYS_LS      = 0x10, // Same as MESSAGE_LINKSHELL but has no speaker object displayed
    // MESSAGE_UNKNOWN     = 0x11, // Echo
    // MESSAGE_UNKNOWN     = 0x12, // Echo
    // MESSAGE_UNKNOWN     = 0x13, // Echo
    MESSAGE_ECHO        = 0x14, // Echo
    // MESSAGE_UNKNOWN     = 0x15, // Echo
    // MESSAGE_UNKNOWN     = 0x16, // Echo
    // MESSAGE_UNKNOWN     = 0x17, // Echo
    // MESSAGE_UNKNOWN     = 0x18, // Say
    // MESSAGE_UNKNOWN     = 0x19, // Say
    MESSAGE_YELL        = 0x1A,
    MESSAGE_LINKSHELL2  = 0x1B, // Second LS color...Default is Green
    MESSAGE_SYS_LS2     = 0x1C, // Same as MESSAGE_LINKSHELL2 but has but has no speaker object displayed
    // MESSAGE_LINKSHELL3  = 0x1E, // Third LS color...Default is same shade of yellow as the echo text default.
    // MESSAGE_SYS_LS3     = 0x1F, // Same as MESSAGE_LINKSHELL_3 but has but has no speaker object displayed?
    // MESSAGE_UNKNOWN     = 0x20, // Echo
    MESSAGE_UNITY       = 0x21,
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

class CSpoofMessagePacket : public CBasicPacket
{
public:
	CSpoofMessagePacket(CCharEntity* PChar, int8* name, CHAT_MESSAGE_TYPE MessageType, int8* buff);
};
#endif