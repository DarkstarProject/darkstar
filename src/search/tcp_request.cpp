﻿/*
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

#include "../common/blowfish.h"
#include "../common/md52.h"
#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/utils.h"

#ifdef WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <errno.h>
typedef u_int SOCKET;
#define INVALID_SOCKET  (SOCKET)(~0)
#define SOCKET_ERROR            (-1)
#endif

#include <vector>
#include <string.h>

#include "tcp_request.h"

#define DEFAULT_BUFLEN  1024

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

CTCPRequestPacket::CTCPRequestPacket(SOCKET* socket) : m_data(nullptr), m_size(0), m_socket(socket), blowfish(blowfish_t())
{
    uint8 keys[24] =
    {
        0x30, 0x73, 0x3D, 0x6D,
        0x3C, 0x31, 0x49, 0x5A,
        0x32, 0x7A, 0x42, 0x43,
        0x63, 0x38, 0x7B, 0x7E,
        0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00
    };

    memcpy(&key[0], &keys[0], 24);
}

CTCPRequestPacket::~CTCPRequestPacket()
{
    delete[] m_data;

#ifdef WIN32
    shutdown(*m_socket, SD_SEND);
    closesocket(*m_socket);
#else
    shutdown(*m_socket,SHUT_WR);
    close(*m_socket);
#endif
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8* CTCPRequestPacket::GetData()
{
    return m_data;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 CTCPRequestPacket::GetSize()
{
    return m_size;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 CTCPRequestPacket::ReceiveFromSocket()
{
    char recvbuf[DEFAULT_BUFLEN];

    m_size = recv(*m_socket, recvbuf, DEFAULT_BUFLEN, 0);
    if (m_size == -1)
    {
#ifdef WIN32
        ShowError(CL_RED"recv failed with error: %d\n" CL_RESET, WSAGetLastError());
#else
        ShowError(CL_RED"recv failed with error: %d\n" CL_RESET, errno);
#endif
        return 0;
    }
    if (m_size == 0)
    {
        //ShowError("TCP Connection closing...\n");
        return 0;
    }
    if (m_size != ref<uint16>(recvbuf, (0x00)) || m_size < 28)
    {
        ShowError(CL_RED"Search packetsize wrong. Size %d should be %d.\n" CL_RESET, m_size, ref<uint16>(recvbuf, (0x00)));
        return 0;
    }
    delete[] m_data;
    m_data = new uint8[m_size];

    memcpy(&m_data[0], &recvbuf[0], m_size);
    ref<uint32>(key, (16)) = ref<uint32>(m_data, (m_size - 4));

    return decipher();
}

/************************************************************************
*                                                                       *
*  Отправляем данные без шифрования                                     *
*                                                                       *
************************************************************************/

int32 CTCPRequestPacket::SendRawToSocket(uint8* data, uint32 length)
{
    int32 iResult;

    iResult = send(*m_socket, (const char*)data, length, 0);
    if (iResult == SOCKET_ERROR)
    {
#ifdef WIN32
        ShowError("send failed with error: %d\n", WSAGetLastError());
#else
        ShowError("send failed with error: %d\n", errno);
#endif
        return 0;
    }
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 CTCPRequestPacket::SendToSocket(uint8* data, uint32 length)
{
    int32 iResult;

    ref<uint16>(data, (0x00)) = length;          // packet size
    ref<uint32>(data, (0x04)) = 0x46465849;      // "IXFF"

    md5((uint8*)(key), blowfish.hash, 24);

    blowfish_init((int8*)blowfish.hash, 16, blowfish.P, blowfish.S[0]);

    md5(data + 8, data + length - 0x18 + 0x04, length - 0x18 - 0x04);

    uint8 tmp = (length - 12) / 4;
    tmp -= tmp % 2;

    for (uint8 i = 0; i < tmp; i += 2)
    {
        blowfish_encipher((uint32*)data + i + 2, (uint32*)data + i + 3, blowfish.P, blowfish.S[0]);
    }

    memcpy(&data[length] - 0x04, key + 16, 4);

    iResult = send(*m_socket, (const char*)data, length, 0);
    if (iResult == SOCKET_ERROR)
    {
#ifdef WIN32
        ShowError("send failed with error: %d\n", WSAGetLastError());
#else
        ShowError("send failed with error: %d\n", errno);
#endif
        return 0;
    }
    return ReceiveFromSocket();
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 CTCPRequestPacket::CheckPacketHash()
{
    uint8 PacketHash[16];

    int32 toHash = m_size;  // whole packet

    toHash -= 0x08;         // -headersize
    toHash -= 0x10;         // -hashsize
    toHash -= 0x04;         // -keysize

    md5((uint8*)(&m_data[8]), PacketHash, toHash);

    for (uint8 i = 0; i < 16; ++i)
    {
        if ((uint8)m_data[m_size - 0x14 + i] != PacketHash[i])
        {
            ShowError("Search hash wrong byte %d: 0x%.2X should be 0x%.2x\n", i, PacketHash[i], (uint8)m_data[m_size - 0x14 + i]);
            return 0;
        }
    }
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

uint8 CTCPRequestPacket::GetPacketType()
{
    DSP_DEBUG_BREAK_IF(m_data == nullptr)

        return m_data[0x0B];
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 CTCPRequestPacket::decipher()
{
    md5((uint8*)(key), blowfish.hash, 20);

    blowfish_init((int8*)blowfish.hash, 16, blowfish.P, blowfish.S[0]);

    uint8 tmp = (m_size - 12) / 4;
    tmp -= tmp % 2;

    for (uint8 i = 0; i < tmp; i += 2)
    {
        blowfish_decipher((uint32*)m_data + i + 2, (uint32*)m_data + i + 3, blowfish.P, blowfish.S[0]);
    }
    ref<uint32>(key, (20)) = ref<uint32>(m_data, (m_size - 0x18));

    return CheckPacketHash();
}
