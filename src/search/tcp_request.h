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
	TCP_SEARCHALL_REQUEST	= 0,
	TCP_PARTY_LIST			= 2,
	TCP_SEARCH_REQUEST		= 3,
	TCP_AH_REQUEST,
	TCP_AH_REQUEST_MORE,
	TCP_AH_HISTORY_REQUEST 
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

	int8*	GetData();
	uint32	GetSize();
	uint8	GetPacketType();
	
	void ReceiveFromSocket(SOCKET* s);

private:

	int8* data;

	blowfish_t blowfish;

	int8 key[24];
	int32 size;

	void decipher();
	void CheckHash();
};

#endif