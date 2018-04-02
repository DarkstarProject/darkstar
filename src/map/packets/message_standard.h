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
enum MSGSTD_ID : uint16
{
    MSGSTD_WAIT_LONGER          = 38, /* You must wait longer to perform that action. */
    /* Trusts */
    MSGSTD_TRUST_CANNOT_JOIN_PT = 265, /* You are unable to join a party whose leader currently has an alter ego present. */
    MSGSTD_TRUST_CANNOT_JOIN_AL = 266, /* You are unable to join an alliance whose leader currently has an alter ego present. */
    MSGSTD_TRUST_CANNOT_LFP     = 296, /* You cannot use Trust magic while seeking a party. */
    MSGSTD_TRUST_WAIT_PT        = 297, /* While inviting a party member, you must wait a while before using Trust magic. */
    MSGSTD_TRUST_LIMIT          = 298, /* You have called forth your maximum number of alter egos. */
    MSGSTD_TRUST_SAME           = 299, /* That alter ego has already been called forth. */
    MSGSTD_TRUST_ENMITY         = 300, /* You cannot use Trust magic while having gained enmity. */
    MSGSTD_TRUST_SOLO_OR_LEADER = 301  /* You cannot use Trust magic unless you are solo or the party leader. */

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

    CMessageStandardPacket(uint16 MessageID);
	CMessageStandardPacket(CCharEntity* PChar, uint32 param0, uint16 MessageID);
	CMessageStandardPacket(CCharEntity* PChar, uint32 param0, uint32 param1, uint16 MessageID);
	CMessageStandardPacket(uint32 param0, uint32 param1, uint32 param2, uint32 param3, uint16 MessageID);
};

#endif