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

#include "../common/blowfish.h"
#include "../common/md52.h"
#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/utils.h"

#include <winsock2.h>
#include <ws2tcpip.h>
#include <vector>
#include <string.h>

#include "tcp_request.h" 

#define DEFAULT_BUFLEN	1024

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

CTCPRequestPacket::CTCPRequestPacket()
{
	data = NULL;

    blowfish.key[0] = 0x6D3D7330; // { 0x30, 0x73, 0x3D, 0x6D }
    blowfish.key[1] = 0x5A49313C; // { 0x3C, 0x31, 0x49, 0x5A }
    blowfish.key[2] = 0x43427A32; // { 0x32, 0x7A, 0x42, 0x43 }
    blowfish.key[3] = 0x7E7B3863; // { 0x63, 0x38, 0x7B, 0x7E }
    blowfish.key[4] = 0x00000000; // { 0x00, 0x00, 0x00, 0x00 }

	char keys[24] = {0x30, 0x73, 0x3D, 0x6D, 0x3C, 0x31, 0x49, 0x5A, 0x32, 0x7A, 0x42, 0x43, 0x63, 0x38, 0x7B, 0x7E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
    
    memcpy(&key[0],&keys[0], 24);
}

CTCPRequestPacket::~CTCPRequestPacket()
{
    delete[] data;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int8* CTCPRequestPacket::GetKey()
{
	return &key[0];
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int8* CTCPRequestPacket::GetData()
{
	return data;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

uint32 CTCPRequestPacket::GetSize()
{
	return size;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTCPRequestPacket::ReceiveFromSocket(SOCKET* s)
{
	int8 recvbuf[DEFAULT_BUFLEN];

	size = recv(*s, recvbuf, DEFAULT_BUFLEN, 0);
	if (size == -1) 
	{
		ShowError(CL_RED"recv failed with error: %d\n"CL_RESET, WSAGetLastError());
		closesocket(*s);
		WSACleanup();
		return;
	}
    if (size == 0) 
	{
		ShowError("TCP Connection closing...\n");
		return;
	}
	if (size != RBUFW(recvbuf,(0x00))) 
	{
		ShowError(CL_RED"Search packetsize wrong. Size %d should be %d.\n"CL_RESET, size, RBUFW(recvbuf,(0x00)));
		return;
	}
    delete[] data; 
    data = new int8[size];

	memcpy(&data[0], &recvbuf[0], size);
	memcpy(key+16, data+size-4, 4);

	decipher();
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTCPRequestPacket::CheckHash()
{
	uint8 PacketHash[16];

	int32 toHash = size;	// whole packet

	toHash -= 0x08;			// -headersize
	toHash -= 0x10;			// -hashsize
	toHash -= 0x04;			// -keysize

	md5((uint8*)(&data[8]), PacketHash, toHash);

	for(uint8 i = 0; i < 16; ++i)
	{
		if((uint8)data[size-0x14+i] != PacketHash[i])
		{
			ShowError("Search hash wrong byte %d: 0x%.2X should be 0x%.2x\n", i, PacketHash[i], (uint8)data[size-0x14+i]);
		}
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

uint8 CTCPRequestPacket::GetPacketType() 
{
	DSP_DEBUG_BREAK_IF(data == NULL)

	return data[0x0B];
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void CTCPRequestPacket::decipher()
{
	md5((uint8*)(key), blowfish.hash, 20);

	blowfish_init((int8*)blowfish.hash, 16, blowfish.P, blowfish.S[0]);

	uint8 tmp = (size-12)/4;
	tmp -= tmp%2;

	for(uint8 i = 0; i < tmp; i += 2) 
	{
		blowfish_decipher((uint32*)data+i+2, (uint32*)data+i+3, blowfish.P, blowfish.S[0]);
	}

	CheckHash();
	memcpy(key+20,data+(size-0x18),4);
}