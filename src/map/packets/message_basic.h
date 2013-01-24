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

#ifndef _CMESSAGEBASICPACKET_H
#define _CMESSAGEBASICPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

/*
 * This contains a list of message IDs for this type of packet. They should be used
 * in the messageID parameter. 
 */
enum MSGBASIC_ID : uint16 
{
	MSGBASIC_ALREADY_CLAIMED		= 12, /* Cannot attack. Your target is already claimed. */
	MSGBASIC_IS_INTERRUPTED			= 16, /* The <player>'s casting is interrupted. */
	MSGBASIC_UNABLE_TO_CAST			= 18, /* Unable to cast spells at this time. */
	MSGBASIC_IS_PARALYZED			= 29, /* The <player> is paralyzed. */
	MSGBASIC_NO_NINJA_TOOLS			= 35, /* The <player> lacks the ninja tools to cast (NULL). */
	MSGBASIC_TOO_FAR_AWAY			= 78, /* <target> is too far away. */
	MSGBASIC_WAIT_LONGER			= 94, /* You must wait longer to perform that action. */
	MSGBASIC_IS_INTIMIDATED			= 106, /* The <player> is intimidated by <target>'s presence. */
	MSGBASIC_CANNOT_ATTACK_TARGET	= 446, /* You cannot attack that target */
	/* Items */
	MSGBASIC_CANNOT_USE_ITEM_ON		= 92, /* Cannot use the <item> on <target>. */
	MSGBASIC_ITEM_FAILS_TO_ACTIVATE = 62, /* The <item> fails to activate. */
	/* Ranged */
	MSGBASIC_NO_RANGED_WEAPON		= 216, /* You do not have an appropriate ranged weapon equipped. */
	MSGBASIC_CANNOT_SEE				= 217, /* You cannot see <target>. */
	MSGBASIC_MOVE_AND_INTERRUPT		= 218 /* You move and interrupt your aim. */
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CBaseEntity;

class CMessageBasicPacket : public CBasicPacket
{
public:

	CMessageBasicPacket(CBaseEntity* PSender, CBaseEntity* PTarget, int32 param, int32 value, uint16 messageID);
};

#endif