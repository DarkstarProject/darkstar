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

#ifndef _CMESSAGESTANDARTPACKET_H
#define _CMESSAGESTANDARTPACKET_H

#include "../../common/cbasetypes.h"

#include "basic.h"

/*
 * Valid MessageIDs
 * Complete list at 1/27/76.DAT
 */
enum class MsgStd
{
    InvitationDeclined      = 11, /* Your invitation was declined */
    CannotBeProcessed       = 14, /* That request cannot be processed */
    NotPartyLeader          = 21, /* You are not the party leader. */
    CannotInvite            = 23, /* You cannot invite that person at this time. */
    WaitLonger              = 38, /* You must wait longer to perform that action. */

    DiceRoll                = 88, /* Dice Roll! <player> rolls <roll>. */
    Examine                 = 89, /* <name> examines you. */
    /* Linkshells */
    LinkshellUnavailable    = 112, /* The linkshell name you entered is already in use or otherwise unavailable. */
    TellNotReceivedOffline  = 125, /* Your tell was not received.  The recipient is currently away. */
    ThrowAway               = 180, /* You throw away <item>. */
    TellNotReceivedAway     = 181, /* Your tell was not received.  The recipient is currently away. */
    ItemEx                  = 220, /* You cannot possess more than one of that item. */
    BlockingAid             = 225, /* Target is currently blocking outside magical assistance */
    Sell                    = 232, /* You sell <item>. */
    SellToShop              = 233, /* You sell <item> to the shop. */
    LevelSyncWarning        = 235, /* Warning! This is a Level Sync party ... */
    CannotInviteLevelSync   = 236, /* You cannot invite that person at this time. This player is either undergoing Level Sync... */
    CannotJoinLevelSync     = 237, /* You cannot join this party.  You are either underoing Level Sync... */
    Compass                 = 239, /* The compass reads: ...*/
    CannotHere              = 256, /* You cannot use that command in this area. */

    /* Style Lock*/
    HeadgearShow            = 260,
    HeadgearHide            = 261,
    StyleLockOn             = 267, /* Style lock mode enabled. */
    StyleLockOff            = 268, /* Style lock mode disabled. */
    StyleLockIsOn           = 269, /* Style lock mode is enabled. */
    StyleLockIsOff          = 270, /* Style lock mode is disabled. */

    /* Trusts */
    TrustCannotJoinParty    = 265, /* You are unable to join a party whose leader currently has an alter ego present. */
    TrustCannotJoinAlliance = 266, /* You are unable to join an alliance whose leader currently has an alter ego present. */
    TrustCannotLFP          = 296, /* You cannot use Trust magic while seeking a party. */
    WaitParty               = 297, /* While inviting a party member, you must wait a while before using Trust magic. */
    TrustLimit              = 298, /* You have called forth your maximum number of alter egos. */
    TrustSame               = 299, /* That alter ego has already been called forth. */
    TrustEnmity             = 300, /* You cannot use Trust magic while having gained enmity. */
    TrustSoloOrLeader       = 301  /* You cannot use Trust magic unless you are solo or the party leader. */
};

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CMessageStandardPacket : public CBasicPacket
{
public:

    CMessageStandardPacket(MsgStd MessageID);
	CMessageStandardPacket(CCharEntity* PChar, uint32 param0, MsgStd MessageID);
	CMessageStandardPacket(CCharEntity* PChar, uint32 param0, uint32 param1, MsgStd MessageID);
	CMessageStandardPacket(uint32 param0, uint32 param1, uint32 param2, uint32 param3, MsgStd MessageID);
};

#endif