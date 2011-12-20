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

#include "../common/cbasetypes.h"
#include "../common/blowfish.h"
#include "../common/md52.h"
#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/utils.h"

#include <winsock2.h>
#include <ws2tcpip.h>
#include <stdlib.h>
#include <stdio.h>

#include "auction_house.h"
#include "search.h"
#include "tcp_request.h"

#include "packets/auction_history.h"
#include "packets/ah_items_list.h"
#include "packets/search_list.h"

#define DEFAULT_PORT "54002"

#define DEFAULT_BUFLEN	1024

struct SearchCommInfo
{
	SOCKET socket;
	uint32 ip;
	uint16 port;
};

enum SEARCHTYPE
{
	SEARCH_NAME			 = 0x00,	// 00000 
	SEARCH_AREA			 = 0x01,	// 00001
	SEARCH_NATIONALITY	 = 0x02,	// 00010
	SEARCH_JOB			 = 0x03,	// 00011
	SEARCH_LEVEL		 = 0x04,	// 00100
	SEARCH_RACE			 = 0x05,	// 00101
	SEARCH_FLAGS1		 = 0x06,	// 00110
	SEARCH_UNKNOWN0x08	 = 0x08,	// 01000
	SEARCH_PARTY		 = 0x0A,	// 01010
	SEARCH_LINKSHELL	 = 0x0B,	// 01011
	SEARCH_FRIEND		 = 0x0C,	// 01100
	SEARCH_LINKSHELLRANK = 0x0D,	// 01101
	SEARCH_UNKNOWN0x0E	 = 0x0E,	// 01110
	SEARCH_RANK			 = 0x10,	// 10000
	SEARCH_COMMENT		 = 0x11,	// 10001
	SEARCH_FLAGS2		 = 0x14,	// 10100
	SEARCH_LANGUAGE		 = 0x15,	// 10101
};

ppuint32 __stdcall TCPComm(void* lpParam);

extern void HandleSearchRequest(CTCPRequestPacket* PTCPRequest);
extern void HandleSearchComment(CTCPRequestPacket* PTCPRequest);
extern void HandlePartyListRequest(CTCPRequestPacket* PTCPRequest);
extern void HandleAuctionHouseHistoru(CTCPRequestPacket* PTCPRequest);
extern void HandleAuctionHouseRequest(CTCPRequestPacket* PTCPRequest);

/************************************************************************
*																		*
*  Отображения содержимого входящего пакета в консоли					*
*																		*
************************************************************************/

void PrintPacket(char* data, int size)
{
	int8 message[50];
	memset(&message,0,50);

	printf("\n");

	for (int32 y = 0; y < size; y++) 
	{
		sprintf(message,"%s %02hx",message,(uint8)data[y]);
		if (((y+1)%16) == 0) 
		{
			message[48] = '\n';
			printf(message);
			memset(&message,0,50);
		}
	}
	if (strlen(message) > 0) 
	{
		message[strlen(message)] = '\n';
		printf(message);
	}
	printf("\n");
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 main (int32 argc, int8 **argv) 
{
    WSADATA wsaData;

    int iResult;

    SOCKET ListenSocket = INVALID_SOCKET;
    SOCKET ClientSocket = INVALID_SOCKET;

    struct addrinfo *result = NULL;
    struct addrinfo  hints;

    // Initialize Winsock
    iResult = WSAStartup(MAKEWORD(2,2), &wsaData);
    if (iResult != 0) 
	{
        ShowError("WSAStartup failed with error: %d\n", iResult);
        return 1;
    }

    ZeroMemory(&hints, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_TCP;
    hints.ai_flags = AI_PASSIVE;

    // Resolve the server address and port
    iResult = getaddrinfo(NULL, DEFAULT_PORT, &hints, &result);
    if (iResult != 0)
	{
        ShowError("getaddrinfo failed with error: %d\n", iResult);
        WSACleanup();
        return 1;
    }

    // Create a SOCKET for connecting to server
    ListenSocket = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
    if (ListenSocket == INVALID_SOCKET) 
	{
        ShowError("socket failed with error: %ld\n", WSAGetLastError());
        freeaddrinfo(result);
        WSACleanup();
        return 1;
    }

    // Setup the TCP listening socket
    iResult = bind( ListenSocket, result->ai_addr, (int)result->ai_addrlen);
    if (iResult == SOCKET_ERROR) 
	{
        ShowError("bind failed with error: %d\n", WSAGetLastError());
        freeaddrinfo(result);
        closesocket(ListenSocket);
        WSACleanup();
        return 1;
    }

    freeaddrinfo(result);

	iResult = listen(ListenSocket, SOMAXCONN);
	if (iResult == SOCKET_ERROR) 
	{
		ShowError("listen failed with error: %d\n", WSAGetLastError());
		closesocket(ListenSocket);
		WSACleanup();
		return 1;
	}

    ShowMessage(CL_WHITE"========================================================\n\n"CL_RESET);
    ShowMessage(CL_WHITE"DSSearch-server\n\n");
    ShowMessage(CL_WHITE"========================================================\n\n"CL_RESET);

	while (true)
	{
		// Accept a client socket
		ClientSocket = accept(ListenSocket, NULL, NULL);
		if (ClientSocket == INVALID_SOCKET) 
		{
			ShowError("accept failed with error: %d\n", WSAGetLastError());
			continue;
		}
		SearchCommInfo CommInfo;

		CommInfo.socket = ClientSocket;
		CommInfo.ip = 0;
		CommInfo.port = 0;

		CreateThread(0,0,TCPComm,&CommInfo,0,0);
	}
    // TODO: сейчас мы никогда сюда не попадем

    // shutdown the connection since we're done
    iResult = shutdown(ClientSocket, SD_SEND);
    if (iResult == SOCKET_ERROR) 
	{
        ShowError("shutdown failed with error: %d\n", WSAGetLastError());
        closesocket(ClientSocket);
        WSACleanup();
        return 1;
    }

    // cleanup
    closesocket(ClientSocket);
    WSACleanup();
    return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

ppuint32 __stdcall TCPComm(void* lpParam)
{
	SearchCommInfo CommInfo = *((SearchCommInfo*)lpParam);

	ShowMessage("TCP connection from client with port: %u\n", htons(CommInfo.port));
	
	CTCPRequestPacket* PTCPRequest = new CTCPRequestPacket(&CommInfo.socket);
	PTCPRequest->ReceiveFromSocket();

	PrintPacket(PTCPRequest->GetData(), PTCPRequest->GetSize());

	ShowMessage("PacketType %u\n", PTCPRequest->GetPacketType());

	switch(PTCPRequest->GetPacketType()) 
	{
		case TCP_SEARCH:
		case TCP_SEARCH_ALL:
        {
            HandleSearchRequest(PTCPRequest);
        }
        break;
        case TCP_SEARCH_COMMENT:
		{
            HandleSearchComment(PTCPRequest);
		}
		break;
		case TCP_PARTY_LIST:
		{
			HandlePartyListRequest(PTCPRequest);
		}
		break;
		case TCP_AH_REQUEST: 
        case TCP_AH_REQUEST_MORE:
        {
            HandleAuctionHouseRequest(PTCPRequest);
		}
		break;
		case TCP_AH_HISTORY: 
		{
            HandleAuctionHouseHistoru(PTCPRequest);
		}
		break;
	}

	delete PTCPRequest;
	return 1;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void HandlePartyListRequest(CTCPRequestPacket* PTCPRequest)
{
	uint8* data = (uint8*)PTCPRequest->GetData();

	ShowMessage("SEARCH::PartyID = %u\n", RBUFL(data,(0x10)));
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void HandleSearchComment(CTCPRequestPacket* PTCPRequest)
{
    uint8 packet[] = 
    {
        0xCC, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x20, 0x9B, 0x16, 0xC8, 0x4C, 0x76, 0x07, 0x02, 
        0x17, 0x71, 0xB9, 0xA8, 0xF5, 0xB6, 0xCF, 0xED, 0xF1, 0xFF, 0x70, 0x52, 0xA9, 0xAE, 0x81, 0xB6, 
        0x1B, 0x2B, 0x7B, 0xA0, 0xC1, 0xD2, 0xD1, 0xFD, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 
        0x61, 0x43, 0x80, 0x37, 0x08, 0x74, 0xC5, 0x8D, 0x0C, 0x04, 0x13, 0xC0, 0x89, 0x17, 0x8F, 0x72, 
        0x93, 0xD6, 0x90, 0xF1, 0x21, 0x7A, 0xA5, 0xAC, 0x93, 0xD6, 0x90, 0xF1, 0x21, 0x7A, 0xA5, 0xAC, 
        0x93, 0xD6, 0x90, 0xF1, 0x21, 0x7A, 0xA5, 0xAC, 0x38, 0x25, 0x69, 0x79, 0x00, 0xC6, 0x7E, 0xDC, 
        0x80, 0x3D, 0x99, 0x85, 0xF4, 0xDF, 0xCF, 0xFC, 0x1A, 0x72, 0xE2, 0x0D 
    };
    PTCPRequest->SendRawToSocket(packet, 204);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void HandleSearchRequest(CTCPRequestPacket* PTCPRequest)
{
    uint8 packet[] = 
    {
        0x8C, 0x00, 0x00, 0x00, 0x49, 0x58, 0x46, 0x46, 0x97, 0x8B, 0xCD, 0xFC, 0xEC, 0x89, 0xDA, 0xAF, 
        0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 0x32, 0x27, 0xA9, 0x9C, 0x97, 0x0F, 0x55, 0x42, 
        0x03, 0xC9, 0x99, 0x2F, 0x62, 0x50, 0xB8, 0x09, 0xA6, 0xDF, 0x5B, 0xD8, 0x60, 0xE0, 0x16, 0x91, 
        0xD9, 0x64, 0xFD, 0x4E, 0x97, 0xBC, 0xFD, 0x39, 0x20, 0x2A, 0x01, 0x4E, 0xD0, 0x35, 0x9E, 0x7C, 
        0x7E, 0xA7, 0x25, 0x7D, 0x31, 0x5D, 0xBD, 0x60, 0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 
        0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 
        0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 
        0xB8, 0xBF, 0x2A, 0xC3, 0x4B, 0x5E, 0x2E, 0xAF, 0x3D, 0x83, 0xD6, 0x51, 0x78, 0x9F, 0x82, 0x67, 
        0xDB, 0xE7, 0x37, 0x0E, 0x33, 0x91, 0x97, 0xCE, 0x5A, 0x7C, 0xB7, 0x75
    };
    PTCPRequest->SendRawToSocket(packet, 140);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void HandleAuctionHouseRequest(CTCPRequestPacket* PTCPRequest)
{
    uint8* data    = (uint8*)PTCPRequest->GetData();                            
	uint8  AHCatID = RBUFB(data,(0x16));                                        

	CAuctionHouse* PAuctionHouse = new CAuctionHouse(0);                        
    std::vector<ahItem*> ItemList = PAuctionHouse->GetItemsToCategry(AHCatID);

    uint8 PacketsCount = (ItemList.size() / 20) + (ItemList.size() % 20 != 0) + (ItemList.size() == 0);

    for(uint8 i = 0; i < PacketsCount; ++i) 
    {
        CAHItemsListPacket* PAHPacket = new CAHItemsListPacket(20*i);

        PAHPacket->SetItemCount(ItemList.size());  

        for (uint16 y = 20*i; (y != 20*(i+1)) && (y < ItemList.size()); ++y)
        {
            PAHPacket->AddItem(ItemList.at(y));
        }

        PTCPRequest->SendToSocket(PAHPacket->GetData(), PAHPacket->GetSize());
        delete PAHPacket;
    }
    delete PAuctionHouse;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void HandleAuctionHouseHistoru(CTCPRequestPacket* PTCPRequest)
{
    uint8* data   = (uint8*)PTCPRequest->GetData();                            
	uint16 ItemID = RBUFW(data,(0x12));

    CAHHistoryPacket* PAHPacket = new CAHHistoryPacket();

    CAuctionHouse* PAuctionHouse = new CAuctionHouse(0);                        
    std::vector<ahHistory*> HistoryList = PAuctionHouse->GetItemHystory(ItemID);

    for (uint8 i = 0; i < HistoryList.size(); ++i)
    {
        PAHPacket->AddItem(HistoryList.at(i));
    }
    
    PTCPRequest->SendToSocket(PAHPacket->GetData(), PAHPacket->GetSize());

    delete PAuctionHouse;
    delete PAHPacket;
    return;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void _HandleSearchRequest(CTCPRequestPacket* PTCPRequest, SOCKET socket)
{
	// суть в том, чтобы заполнить некоторую структуру, на основании которой будет создан запрос к базе
	// результат поиска в базе отправляется клиенту

	uint32 bitOffset = 0;

	unsigned char sortDescending = 0;
	unsigned char isPresent = 0;
	unsigned char areaCount = 0;

	uint8 name[16];

	uint8* data = (uint8*)PTCPRequest->GetData();
	uint8  size = RBUFB(data,(0x10));

	uint16 workloadBits = size * 8;

	ShowMessage("Received a search packet with size %u byte\n", size);
	
	while(bitOffset < workloadBits)
	{
		if ((bitOffset+5) >= workloadBits)
		{
			bitOffset = workloadBits;
			break;
		}

		uint8 EntryType = (uint8)unpackBitsLE(&data[0x11], bitOffset, 5);
		bitOffset+=5;

		if ((EntryType != SEARCH_FRIEND) &&
			(EntryType != SEARCH_LINKSHELL) &&
			(EntryType != SEARCH_COMMENT) &&
			(EntryType != SEARCH_FLAGS2))		
		{
			if ((bitOffset+3) >= workloadBits) //so 0000000 at the end does not get interpretet as name entry ...
			{
				bitOffset=workloadBits;
				break;
			}
			sortDescending = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,1);
			bitOffset+=1;

			isPresent = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,1);
			bitOffset+=1;
		}

		switch(EntryType)
		{
			case SEARCH_NAME:
			{
				if (isPresent==0x1) //Name send
				{
					if ((bitOffset+5) >= workloadBits)
					{
						bitOffset=workloadBits;
						break;
					}
					uint8 nameLen = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,5);
					name[nameLen]='\0';
					
					bitOffset+=5;

					for (unsigned char i = 0; i < nameLen; i++)
					{
						name[i] = (char)unpackBitsLE(&data[0x11],bitOffset,7);
						bitOffset+=7;
					}	
					printf("SEARCH::Name Entry Found. (%s).\n",name);
				}
				printf("SEARCH::SortByName: %s.\n",(sortDescending == 0 ? "ascending" : "descending"));
				//packetData.sortDescendingByName=sortDescending;
				break;
			}			
			case SEARCH_AREA: //Area Code Entry - 8 bit
			{
				if (isPresent == 0) //no more Area entries
				{
					printf("SEARCH::Area List End found.\n");
				}
				else // 8 Bit = 1 Byte per Area Code
				{
					unsigned char areas[10];
					areas[areaCount] = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,8);
					areaCount++;
					bitOffset+=8;

					printf("SEARCH::Area List Entry found(%2X)!\n",areas[areaCount-1]);
				}
				break;
			}
			case SEARCH_NATIONALITY: //Country - 2 bit
			{
				if (isPresent==0x1)
				{
					unsigned char country = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,2);
					bitOffset+=2;

					printf("SEARCH::Nationality Entry found. (%2X) Sorting: (%s).\n",country,(sortDescending==0x00)?"ascending":"descending");
				}
				break;
			}
			case SEARCH_JOB: //Job - 5 bit
			{
				if (isPresent==0x1)
				{
					unsigned char job = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,5);
					bitOffset+=5;

					printf("SEARCH::Job Entry found. (%2X) Sorting: (%s).\n",job,(sortDescending==0x00)?"ascending":"descending");
				}
				//packetData.sortDescendingByJob=sortDescending;
				printf("SEARCH::SortByJob: %s.\n",(sortDescending==0x00)?"ascending":"descending");
				break;
			}
			case SEARCH_LEVEL: //Level- 16 bit
			{
				if (isPresent==0x1)
				{
					unsigned char fromLvl = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,8);
					bitOffset+=8;
					unsigned char toLvl = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,8);
					bitOffset+=8;

					printf("SEARCH::Level Entry found. (%d - %d) Sorting: (%s).\n",fromLvl,toLvl,(sortDescending==0x00)?"ascending":"descending");
				}
				//packetData.sortDescendingByLevel=sortDescending;
				printf("SEARCH::SortByLevel: %s.\n",(sortDescending==0x00)?"ascending":"descending");
				break;
			}
			case SEARCH_RACE: //Race - 4 bit
			{
				if (isPresent==0x1)
				{
					unsigned char race = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,4);
					bitOffset+=4;
					printf("SEARCH::Race Entry found. (%2X) Sorting: (%s).\n",race,(sortDescending==0x00)?"ascending":"descending");
				}
				printf("SEARCH::SortByRace: %s.\n",(sortDescending==0x00)?"ascending":"descending");
				//packetData.sortDescendingByRace=sortDescending;
				break;
			}
			case SEARCH_RANK: //Rank - 2 byte
			{
				if (isPresent==0x1)
				{
					unsigned char fromRank = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,8);
					bitOffset+=8;
					unsigned char toRank = (unsigned char)unpackBitsLE(&data[0x11],bitOffset,8);
					bitOffset+=8;

					printf("SEARCH::Rank Entry found. (%d - %d) Sorting: (%s).\n",fromRank,toRank,(sortDescending==0x00)?"ascending":"descending");
				}
				printf("SEARCH::SortByRank: %s.\n",(sortDescending==0x00)?"ascending":"descending");
				//packetData.sortDescendingByRank=sortDescending;
				break;
			}
			case SEARCH_COMMENT: //4 Byte
			{
				unsigned int comment = (unsigned int)unpackBitsLE(&data[0x11],bitOffset,32); 
				bitOffset+=32;

				printf("SEARCH::Comment Entry found. (%8X).\n",comment);
				break;
			}
			//the following 4 Entries were generated with /sea (ballista|friend|linkshell|away|inv) 
			//so they may be off
			case SEARCH_LINKSHELL: // 4 Byte
			{
				unsigned int lsId= (unsigned int)unpackBitsLE(&data[0x11],bitOffset,32);
				bitOffset+=32;

				printf("SEARCH::Linkshell Entry found. Value: %.8X\n",lsId);
				break;
			}
			case SEARCH_FRIEND: // Friend Packet, 0 byte
			{
				printf("SEARCH::Friend Entry found.\n");
				break;
			}
			case SEARCH_FLAGS1: // Flag Entry #1, 2 byte, 
			{ 
				if (isPresent==0x1)
				{
					unsigned short flags1 = (unsigned short)unpackBitsLE(&data[0x11],bitOffset,16);
					bitOffset+=16;

					printf("SEARCH::Flag Entry #1 (%.4X) found. Sorting: (%s).\n",flags1,(sortDescending==0x00)?"ascending":"descending");
				}
				printf("SEARCH::SortByFlags: %s\n",(sortDescending == 0? "ascending" : "descending"));
				//packetData.sortDescendingByFlags=sortDescending;
				break;
			}
			case SEARCH_FLAGS2: // Flag Entry #2 - 4 byte
			{
				unsigned int flags=(unsigned int)unpackBitsLE(&data[0x11],bitOffset,32);

				bitOffset+=32;
				/*
				if ((flags & 0xFFFF)!=(packetData.flags1))
				{
					printf("SEARCH::Flag mismatch: %.8X != %.8X\n",flags,packetData.flags1&0xFFFF);
				}
				packetData.flags2=flags;
				printf("SEARCH::Flag Entry #2 (%.8X) found.\n",packetData.flags2);
				*/
				break;
			}
			default:
			{
				printf("SEARCH::Unknown Search Param %.2X!\n",EntryType);
				//outputPacket=true;
				break;
			}
		}
	}
	printf("\n");

	// не обрабатываем последние биты, что мешает в одну кучу например "/blacklist delete Name" и "/sea all Name"
}