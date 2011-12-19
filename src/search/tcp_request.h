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

#ifndef _CTCPREQUESTPACKET_H_
#define _CTCPREQUESTPACKET_H_

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

#include <winsock2.h>

enum TCPREQUESTTYPE
{
	TCP_SEARCHALL_REQUEST	= 0x00,
	TCP_PARTY_LIST			= 0x02,
	TCP_SEARCH_REQUEST		= 0x03,
    TCP_AH_HISTORY_REQUEST  = 0x05,
    TCP_AH_REQUEST_MORE     = 0x10,
	TCP_AH_REQUEST          = 0x15,
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CTCPRequestPacket
{
public:

	CTCPRequestPacket();
   ~CTCPRequestPacket();

    int8*  GetKey();
	int8*  GetData();
	uint32 GetSize();
	uint8  GetPacketType();
	
	void ReceiveFromSocket(SOCKET* s);

private:

	int8* data;
    int32 size;

	blowfish_t blowfish;

	int8 key[24];

	void decipher();
	void CheckHash();
};

#endif