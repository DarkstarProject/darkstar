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
	MSGBASIC_DEFEATS_TARG			= 6, /* The <player> defeats <target>. */
	MSGBASIC_ALREADY_CLAIMED		= 12, /* Cannot attack. Your target is already claimed. */
	MSGBASIC_IS_INTERRUPTED			= 16, /* The <player>'s casting is interrupted. */
	MSGBASIC_UNABLE_TO_CAST			= 18, /* Unable to cast spells at this time. */
	MSGBASIC_UNABLE_TO_USE_JA		= 87, /* Unable to use job ability. */
	MSGBASIC_UNABLE_TO_USE_JA2		= 88, /* Unable to use job ability. */
	MSGBASIC_IS_PARALYZED			= 29, /* The <player> is paralyzed. */
	MSGBASIC_SHADOW_ABSORB			= 31, /* .. of <target>'s shadows absorb the damage and disappear. */
	MSGBASIC_NOT_ENOUGH_MP			= 34, /* The <player> does not have enough MP to cast (NULL). */
	MSGBASIC_NO_NINJA_TOOLS			= 35, /* The <player> lacks the ninja tools to cast (NULL). */
	MSGBASIC_UNABLE_TO_CAST_SPELLS  = 49, /* The <player> is unable to cast spells. */
	MSGBASIC_WAIT_LONGER			= 94, /* You must wait longer to perform that action. */
	MSGBASIC_USES_JA				= 100, /* The <player> uses .. */
	MSGBASIC_USES_JA2				= 101, /* The <player> uses .. */
	MSGBASIC_USES_RECOVERS_HP		= 102, /* The <player> uses .. <target> recovers .. HP. */
	MSGBASIC_USES_JA_TAKE_DAMAGE	= 317, /* The <player> uses .. <target> takes .. points of damage. */		
	MSGBASIC_IS_INTIMIDATED			= 106, /* The <player> is intimidated by <target>'s presence. */
	MSGBASIC_CANNOT_ON_THAT_TARG	= 155, /* You cannot perform that action on the specified target. */
	MSGBASIC_CANNOT_ATTACK_TARGET	= 446, /* You cannot attack that target */
	MSGBASIC_NEEDS_2H_WEAPON		= 307, /* That action requires a two-handed weapon. */
	MSGBASIC_USES_BUT_MISSES		= 324, /* The <player> uses .. but misses <target>. */
	MSGBASIC_CANT_BE_USED_IN_AREA	= 316, /* That action cannot be used in this area. */		
	/* Distance */
	MSGBASIC_TARG_OUT_OF_RANGE		= 4, /* <target> is out of range. */
	MSGBASIC_UNABLE_TO_SEE_TARG		= 5, /* Unable to see <target>. */
	MSGBASIC_LOSE_SIGHT				= 36, /* You lose sight of <target>. */
	MSGBASIC_TOO_FAR_AWAY			= 78, /* <target> is too far away. */
	/* Weaponskills */
	MSGBASIC_CANNOT_USE_WS			= 190, /* The <player> cannot use that weapon ability. */
	MSGBASIC_NOT_ENOUGH_TP			= 192, /* The <player> does not have enough TP. */
	/* Pets */
	MSGBASIC_REQUIRES_A_PET			= 215, /* That action requires a pet. */
	MSGBASIC_THAT_SOMEONES_PET		= 235, /* That is someone's pet. */
	MSGBASIC_ALREADY_HAS_A_PET		= 315, /* The <player> already has a pet. */
	MSGBASIC_NO_EFFECT_ON_PET		= 336, /* No effect on that pet. */
	MSGBASIC_NO_JUG_PET_ITEM		= 337, /* You do not have the necessary item equipped to call a beast. */
	MSGBASIC_MUST_HAVE_FOOD			= 347, /* You must have pet food equipped to use that command. */
	MSGBASIC_PET_CANNOT_DO_ACTION	= 574, /* <player>'s pet is currently unable to perform that action. */
	MSGBASIC_PET_NOT_ENOUGH_TP		= 575, /* <player>'s pet does not have enough TP to perform that action. */
	/* Items */
	MSGBASIC_CANNOT_USE_ITEM_ON		= 92, /* Cannot use the <item> on <target>. */
	MSGBASIC_ITEM_FAILS_TO_ACTIVATE = 62, /* The <item> fails to activate. */
	/* Ranged */
	MSGBASIC_NO_RANGED_WEAPON		= 216, /* You do not have an appropriate ranged weapon equipped. */
	MSGBASIC_CANNOT_SEE				= 217, /* You cannot see <target>. */
	MSGBASIC_MOVE_AND_INTERRUPT		= 218, /* You move and interrupt your aim. */
	/* Charm */
	MSGBASIC_CANNOT_CHARM			= 210, /* The <player> cannot charm <target>! */
	MSGBASIC_VERY_DIFFICULT_CHARM	= 211, /* It would be very difficult for the <player> to charm <target>. */
	MSGBASIC_DIFFICULT_TO_CHARM		= 212, /* It would be difficult for the <player> to charm <target>. */
	MSGBASIC_MIGHT_BE_ABLE_CHARM	= 213, /* The <player> might be able to charm <target>. */
	MSGBASIC_SHOULD_BE_ABLE_CHARM	= 214, /* The <player> should be able to charm <target>. */
	/* BLU */
	MSGBASIC_LEARNS_SPELL			= 419 /* <target> learns (NULL)! */
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