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
#include "../common/malloc.h"
#include "../common/md52.h"
#include "../common/showmsg.h"
#include "../common/strlib.h"
#include "../common/timer.h"
#include "../common/utils.h"
#include "../common/version.h"
#include "../common/zlib.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "map.h"
#include "time_server.h"
#include "packet_system.h"

#include "battleutils.h"
#include "charutils.h"
#include "itemutils.h"
#include "guildutils.h"
#include "petutils.h"
#include "zoneutils.h"
#include "transport.h"
#include "vana_time.h"

#include "ai/ai_char_gm.h"
#include "ai/ai_char_normal.h"

#include "lua/luautils.h"

#include "packets/basic.h"


const int8* MAP_CONF_FILENAME = NULL;

int8*  g_PBuff = NULL;					// глобальный буфер обмена пакетами
Sql_t* SqlHandle = NULL;				// SQL descriptor

int32  map_fd = 0;						// main socket
uint32 map_amntplayers = 0;				// map amnt unique players

map_config_t map_config;				// map server settings
map_session_list_t map_session_list;

CCommandHandler CmdHandler;

/************************************************************************
*																		*
*  mapsession_getbyipp													*
*																		*
************************************************************************/

map_session_data_t* mapsession_getbyipp(uint64 ipp)
{
	map_session_list_t::iterator i = map_session_list.find(ipp);
	if( i == map_session_list.end() )
		return NULL;

	return (*i).second;
}

/************************************************************************
*																		*
*  mapsession_createsession												*
*																		*
************************************************************************/

map_session_data_t* mapsession_createsession(uint32 ip, uint16 port)
{
	map_session_data_t* map_session_data = new map_session_data_t;
	memset(map_session_data, 0, sizeof(map_session_data_t));

	CREATE(map_session_data->server_packet_data,char,map_config.uiBuffMaxSize);
		
	map_session_data->last_update = time(NULL);
	map_session_data->client_addr = ip;
	map_session_data->client_port = port;

	uint64 port64 = port;
	uint64 ipp = ip;
	ipp |= port64<<32;
	map_session_list[ipp] = map_session_data;

	ShowInfo(CL_WHITE"mapsession"CL_RESET":"CL_WHITE"%s"CL_RESET":"CL_WHITE"%u"CL_RESET" is coming to world...\n",ip2str(map_session_data->client_addr,NULL),map_session_data->client_port);
	return map_session_data;
}

/************************************************************************
*																		*
*  do_init																*
*																		*
************************************************************************/

int32 do_init(int32 argc, int8** argv)
{
	ShowStatus("do_init: begin server initialization...\n");

	MAP_CONF_FILENAME = "./conf/map_darkstar.conf";

	srand((uint32)time(NULL));

	map_config_default();
	map_config_read(MAP_CONF_FILENAME);
	ShowMessage("\t\t\t - "CL_GREEN"[OK]"CL_RESET"\n");
 	ShowStatus("do_init: map_config is reading");
	ShowMessage("\t\t - "CL_GREEN"[OK]"CL_RESET"\n");

	luautils::init();
	CmdHandler.init("conf/commands.conf",luautils::LuaHandle);
	SqlHandle = Sql_Malloc();

	ShowStatus("do_init: sqlhandle is allocating");
	if( Sql_Connect(SqlHandle,map_config.mysql_login,
							  map_config.mysql_password,
							  map_config.mysql_host,
							  map_config.mysql_port,
							  map_config.mysql_database) == SQL_ERROR )
	{
		exit(EXIT_FAILURE);
	}

	ShowMessage("\t\t - "CL_GREEN"[OK]"CL_RESET"\n");
	ShowStatus("do_init: zlib is reading");
	zlib_init();
	ShowMessage("\t\t\t - "CL_GREEN"[OK]"CL_RESET"\n");

	ShowStatus("do_init: loading items");
	itemutils::LoadItemList();
	ShowMessage("\t\t\t - "CL_GREEN"[OK]"CL_RESET"\n");

	// нужно будет написать один метод для инициализации всех данных в battleutils
	// и один метод для освобождения этих данных

	ShowStatus("do_init: loading spells");
	battleutils::LoadSpellList();
	ShowMessage("\t\t\t - "CL_GREEN"[OK]"CL_RESET"\n");

	guildutils::Initialize();
	charutils::LoadExpTable();
	battleutils::LoadSkillTable();
	battleutils::LoadAbilitiesList();
	battleutils::LoadWeaponSkillsList();
	battleutils::LoadTraitsList();
	battleutils::LoadMobSkillsList();
	battleutils::LoadEnmityTable();
	petutils::LoadPetList();

	ShowStatus("do_init: loading zones");
	zoneutils::LoadZoneList();
	ShowMessage("\t\t\t - "CL_GREEN"[OK]"CL_RESET"\n");

	luautils::OnServerStart();

	ShowStatus("do_init: server is binding with port %u",map_config.usMapPort);
	map_fd = makeBind_udp(map_config.uiMapIp,map_config.usMapPort);
	ShowMessage("\t - "CL_GREEN"[OK]"CL_RESET"\n");

	CTaskMgr::getInstance()->AddTask("time_server",gettick()+1000,NULL,CTaskMgr::TASK_INTERVAL,time_server,2400);
	CTaskMgr::getInstance()->AddTask("map_cleanup",gettick()+5000,NULL,CTaskMgr::TASK_INTERVAL,map_cleanup,map_config.max_time_lastupdate);

	CVanaTime::getInstance()->setCustomOffset(0);

	CREATE(g_PBuff,char,map_config.uiBuffMaxSize);
	ShowStatus("The map-server is "CL_GREEN"ready"CL_RESET" to work...\n");
	return 0;
}

/************************************************************************
*																		*
*  do_final																*
*																		*
************************************************************************/

void do_final(void)
{
	aFree(g_PBuff);

	aFree((void*)map_config.mysql_host);
	aFree((void*)map_config.mysql_login);
	aFree((void*)map_config.mysql_password);
	aFree((void*)map_config.mysql_database);

	itemutils::FreeItemList();
	battleutils::FreeSpellList();
	battleutils::FreeAbilitiesList();
	battleutils::FreeWeaponSkillsList();
	battleutils::FreeTraitsList();
	//battleutils::FreeMobSkillsList();
	
	petutils::FreePetList();
	zoneutils::FreeZoneList();
	luautils::free();

	delete CTaskMgr::getInstance();
	delete CVanaTime::getInstance();
	
	Sql_Query(SqlHandle,"TRUNCATE TABLE accounts_sessions;"); //cleanup the sessions table
	Sql_Free(SqlHandle);
}

/************************************************************************
*																		*
*  do_abort																*
*																		*
************************************************************************/

void do_abort(void)
{
	do_final();
}

/************************************************************************
*																		*
*  set_server_type														*
*																		*
************************************************************************/

void set_server_type()
{
	SERVER_TYPE = DARKSTAR_SERVER_MAP;
}

/************************************************************************
*																		*
*  do_sockets															*
*																		*
************************************************************************/

int32 do_sockets(int32 next)
{
	fd_set rfd;
	uint32 BuffMaxSize = map_config.uiBuffMaxSize;

	struct timeval timeout;
	int32 ret;
	memcpy(&rfd, &readfds, sizeof(rfd));

	timeout.tv_sec  = next/1000;
	timeout.tv_usec = next%1000*1000;
	
	ret = sSelect(fd_max, &rfd, NULL, NULL, &timeout);

	if( ret == SOCKET_ERROR )
	{
		if( sErrno != S_EINTR )
		{
			ShowFatalError("do_sockets: select() failed, error code %d!\n", sErrno);
			exit(EXIT_FAILURE);
		}
		return 0; // interrupted by a signal, just loop and try again
	}

	last_tick = time(NULL);

	if( sFD_ISSET(map_fd,&rfd) )
	{
		struct sockaddr_in from;
		socklen_t fromlen = sizeof(from);

		int32 ret = recvudp(map_fd,g_PBuff,BuffMaxSize,0,(struct sockaddr*)&from,&fromlen);
		if( ret != -1)
		{
			// find player char
		#	ifdef WIN32
			uint32 ip   = ntohl(from.sin_addr.S_un.S_addr);
		#	else
			uint32 ip   = ntohl(from.sin_addr.s_addr);
		#	endif

			uint64 port = ntohs(from.sin_port);
			uint64 ipp = ip;
			ipp |= port<<32;
			map_session_data_t* map_session_data = mapsession_getbyipp(ipp);

			if( map_session_data == NULL )
			{
				map_session_data = mapsession_createsession(ip,ntohs(from.sin_port));
				if( map_session_data == NULL )
				{
					return -1;
				}
			}

			map_session_data->last_update = time(NULL);
			size_t size = ret;

			if( recv_parse(g_PBuff,&size,&from,map_session_data) != -1 )
			{
				// если предыдущий пакет был потерян, то мы не собираем новый,
				// а отправляем предыдущий пакет повторно
				if (!parse(g_PBuff,&size,&from,map_session_data))
				{
					send_parse(g_PBuff,&size,&from,map_session_data);
				}

				ret = sendudp(map_fd,g_PBuff,size,0,(const struct sockaddr*)&from,fromlen);

				int8* data = g_PBuff;
				g_PBuff = map_session_data->server_packet_data;

				map_session_data->server_packet_data = data;
				map_session_data->server_packet_size = size;
			}
		}
	}

	return 0;
}

/************************************************************************
*																		*
*  parse_console														*
*																		*
************************************************************************/

int32 parse_console(int8* buf)
{
	return 0;
}

/************************************************************************
*																		*
*  map_decipher_packet													*
*																		*
************************************************************************/

int32 map_decipher_packet(int8* buff, size_t size, sockaddr_in* from, map_session_data_t* map_session_data)
{
	uint16 tmp, i;

	// counting blocks whose size = 4 byte
	tmp = (size-FFXI_HEADER_SIZE)/4;
	tmp -= tmp%2;

#	ifdef WIN32
	uint32 ip   = ntohl(from->sin_addr.S_un.S_addr);
#	else
	uint32 ip   = ntohl(from->sin_addr.s_addr);
#	endif

	blowfish_t *pbfkey = &map_session_data->blowfish;

	for(i = 0; i < tmp; i += 2) 
	{
		blowfish_decipher((uint32*)buff+i+7,(uint32*)buff+i+8, pbfkey->P, pbfkey->S[0]);
	}

	if( checksum((uint8*)(buff+FFXI_HEADER_SIZE),size-(FFXI_HEADER_SIZE+16),buff+size-16) == 0)
	{
		return 0;
	}

	int8 ip_str[16];
	ShowError("map_encipher_packet: bad packet from <%s>\n",ip2str(ip,ip_str));
	return -1;
}

/************************************************************************
*																		*
*  main function to parse recv packets									*
*																		*
************************************************************************/

int32 recv_parse(int8* buff, size_t* buffsize, sockaddr_in* from, map_session_data_t* map_session_data)
{
	size_t size = *buffsize;
	if( checksum((uint8*)(buff+FFXI_HEADER_SIZE),size-(FFXI_HEADER_SIZE+16),buff+*buffsize-16) == 0)
	{
		if (map_session_data->PChar == NULL) 
		{
			uint32 CharID = RBUFL(buff,FFXI_HEADER_SIZE+0x0C);

			const int8* fmtQuery = "SELECT session_key FROM accounts_sessions WHERE charid = %u LIMIT 1;";

			int32 ret = Sql_Query(SqlHandle,fmtQuery,CharID);

			if (ret == SQL_ERROR || 
				Sql_NumRows(SqlHandle) == 0 ||
				Sql_NextRow(SqlHandle) != SQL_SUCCESS) 
			{
				ShowError(CL_RED"recv_parse: Cannot load session_key for charid %u"CL_RESET, CharID);
			}
			else
			{
				int8* strSessionKey = NULL;
				Sql_GetData(SqlHandle,0,&strSessionKey,NULL);

				memcpy(map_session_data->blowfish.key,strSessionKey,20);
			}

			// наверное создание персонажа лучше вынести в метод charutils::LoadChar() и загрузку инвентаря туда же сунуть

			CCharEntity* PChar = new CCharEntity();

			PChar->id = CharID;
			PChar->PBattleAI = new CAICharNormal(PChar);

			charutils::LoadChar(PChar);
			charutils::LoadInventory(PChar);
			charutils::BuildingCharWeaponSkills(PChar);

			map_session_data->PChar = PChar;
		}

		map_session_data->client_packet_id = 0;
		map_session_data->server_packet_id = 0;
		return 0;
	}else{
		//char packets

		if( map_decipher_packet(buff,*buffsize,from,map_session_data) == -1)
		{
			*buffsize = 0;
			return -1;
		}
		// reading data size
		uint32 PacketDataSize = RBUFL(buff,*buffsize-sizeof(int32)-16);
		// creating buffer for decompress data
		int8* PacketDataBuff = NULL;
		CREATE(PacketDataBuff,int8,map_config.uiBuffMaxSize);
		// it's decompressing data and getting new size
		PacketDataSize = zlib_decompress(buff+FFXI_HEADER_SIZE,
										 PacketDataSize,
										 PacketDataBuff,
										 map_config.uiBuffMaxSize,
										 zlib_decompress_table);
		
		// it's making result buff
		// don't need memcpy header
		memcpy(buff+FFXI_HEADER_SIZE,PacketDataBuff,PacketDataSize);
		*buffsize = FFXI_HEADER_SIZE+PacketDataSize;

		aFree(PacketDataBuff);
		return 0;
	}
	return -1;
}

/************************************************************************
*																		*
*  main function parsing the packets									*
*																		*
************************************************************************/

int32 parse(int8* buff, size_t* buffsize, sockaddr_in* from, map_session_data_t* map_session_data)
{
	// начало обработки входящего пакета

	int8* PacketData_Begin = &buff[FFXI_HEADER_SIZE];
	int8* PacketData_End   = &buff[*buffsize];

	CCharEntity *PChar = map_session_data->PChar;

	uint16 SmallPD_Size = 0;
	uint16 SmallPD_Type = 0;
	uint16 SmallPD_Code = RBUFW(buff,0);

	for(int8* SmallPD_ptr = PacketData_Begin;
		SmallPD_ptr + (RBUFB(SmallPD_ptr,1) & 0xFE)*2 <= PacketData_End && (RBUFB(SmallPD_ptr,1) & 0xFE); 
		SmallPD_ptr = SmallPD_ptr + SmallPD_Size*2)
	{
		SmallPD_Size = (RBUFB(SmallPD_ptr,1) & 0x0FE);
		SmallPD_Type = (RBUFW(SmallPD_ptr,0) & 0x1FF);

		// если код текущего пакета меньше либо равен последнему полученному
		// или больше глобального то игнорируем пакет

		if ((RBUFW(SmallPD_ptr,2) <= map_session_data->client_packet_id) ||
			(RBUFW(SmallPD_ptr,2) >  SmallPD_Code))
			continue;

		int32 result = -1;

		if (SmallPD_Type != 0x15) 
		{
			ShowInfo("parse: Incoming Packet: %03hX | %02hX from user: %s\n", SmallPD_Type, SmallPD_Size, PChar->GetName());
		}

		switch(SmallPD_Type) 
		{
			case 0x00A: result = SmallPacket0x00A(PChar, SmallPD_ptr, map_session_data); break;
			case 0x00B:	break;
			case 0x00C: result = SmallPacket0x00C(PChar, SmallPD_ptr); break;
			case 0x00D:	result = SmallPacket0x00D(PChar, SmallPD_ptr, map_session_data); break;
			case 0x00F:	result = SmallPacket0x00F(PChar, SmallPD_ptr); break;
			case 0x011:	result = SmallPacket0x011(PChar, SmallPD_ptr); break;
			case 0x015:	result = SmallPacket0x015(PChar, SmallPD_ptr); break;
			case 0x016:	result = SmallPacket0x016(PChar, SmallPD_ptr); break;
			case 0x017:	result = SmallPacket0x017(PChar, SmallPD_ptr); break;
			case 0x01A:	result = SmallPacket0x01A(PChar, SmallPD_ptr); break;
			case 0x01C: result = SmallPacket0x01C(PChar, SmallPD_ptr); break;
			case 0x028:	result = SmallPacket0x028(PChar, SmallPD_ptr); break;
			case 0x029:	result = SmallPacket0x029(PChar, SmallPD_ptr); break;
			case 0x032:	break;
			case 0x033:	break;
			case 0x034:	break;
			case 0x036:	result = SmallPacket0x036(PChar, SmallPD_ptr); break;
			case 0x037:	result = SmallPacket0x037(PChar, SmallPD_ptr); break;
			case 0x03A:	result = SmallPacket0x03A(PChar, SmallPD_ptr); break;
			case 0x03C:	result = SmallPacket0x03C(PChar, SmallPD_ptr); break;
			case 0x041:	result = SmallPacket0x041(PChar, SmallPD_ptr); break;
			case 0x042:	result = SmallPacket0x042(PChar, SmallPD_ptr); break;
			case 0x04B: result = SmallPacket0x04B(PChar, SmallPD_ptr); break; 
			case 0x04D:	result = SmallPacket0x04D(PChar, SmallPD_ptr); break;
			case 0x04E:	break;
			case 0x050:	result = SmallPacket0x050(PChar, SmallPD_ptr); break;
			case 0x059:	result = SmallPacket0x059(PChar, SmallPD_ptr); break;
			case 0x05A:	result = SmallPacket0x05A(PChar, SmallPD_ptr); break;
			case 0x05B:	result = SmallPacket0x05B(PChar, SmallPD_ptr); break;
			case 0x05C: result = SmallPacket0x05C(PChar, SmallPD_ptr); break;
			case 0x05D:	result = SmallPacket0x05D(PChar, SmallPD_ptr); break;
			case 0x05E:	result = SmallPacket0x05E(PChar, SmallPD_ptr); break;
			case 0x061:	result = SmallPacket0x061(PChar, SmallPD_ptr); break;
			case 0x063:	result = SmallPacket0x063(PChar, SmallPD_ptr); break;
			case 0x064:	result = SmallPacket0x064(PChar, SmallPD_ptr); break;
			case 0x066:	result = SmallPacket0x066(PChar, SmallPD_ptr); break;
			case 0x06E:	result = SmallPacket0x06E(PChar, SmallPD_ptr); break;
			case 0x06F:	result = SmallPacket0x06F(PChar, SmallPD_ptr); break;
			case 0x070:	result = SmallPacket0x070(PChar, SmallPD_ptr); break;
			case 0x071:	result = SmallPacket0x071(PChar, SmallPD_ptr); break;
			case 0x074:	result = SmallPacket0x074(PChar, SmallPD_ptr); break;
			case 0x076:	result = SmallPacket0x076(PChar, SmallPD_ptr); break;
			case 0x077:	result = SmallPacket0x077(PChar, SmallPD_ptr); break;
			case 0x078:	result = SmallPacket0x078(PChar, SmallPD_ptr); break;
			case 0x083:	result = SmallPacket0x083(PChar, SmallPD_ptr); break;
			case 0x084:	result = SmallPacket0x084(PChar, SmallPD_ptr); break;
			case 0x085:	result = SmallPacket0x085(PChar, SmallPD_ptr); break;
			case 0x096:	result = SmallPacket0x096(PChar, SmallPD_ptr); break;
			case 0x0A0:	break;
			case 0x0A1:	break;
			case 0x0A2:	result = SmallPacket0x0A2(PChar, SmallPD_ptr); break;
			case 0x0AA:	break;
			case 0x0AB:	result = SmallPacket0x0AB(PChar, SmallPD_ptr); break;
			case 0x0AC:	break;
			case 0x0AD:	result = SmallPacket0x0AD(PChar, SmallPD_ptr); break;
			case 0x0B5:	result = SmallPacket0x0B5(PChar, SmallPD_ptr); break;
			case 0x0B6:	result = SmallPacket0x0B6(PChar, SmallPD_ptr); break;
			case 0x0BE:	break;
			case 0x0C3:	break;
			case 0x0C4:	break;
			case 0x0CB:	break;
			case 0x0D2:	result = SmallPacket0x0D2(PChar, SmallPD_ptr); break;
			case 0x0D3:	result = SmallPacket0x0D3(PChar, SmallPD_ptr); break;
			case 0x0D4:	break;
			case 0x0DB:	result = SmallPacket0x0DB(PChar, SmallPD_ptr); break;
			case 0x0DC:	result = SmallPacket0x0DC(PChar, SmallPD_ptr); break;
			case 0x0DD:	result = SmallPacket0x0DD(PChar, SmallPD_ptr); break;
			case 0x0DE:	result = SmallPacket0x0DE(PChar, SmallPD_ptr); break;
			case 0x0E0:	result = SmallPacket0x0E0(PChar, SmallPD_ptr); break;
			case 0x0E1:	break;
			case 0x0E2:	break;
			case 0x0E7:	result = SmallPacket0x0E7(PChar, SmallPD_ptr); break;
			case 0x0E8:	result = SmallPacket0x0E8(PChar, SmallPD_ptr); break;
			case 0x0EA:	result = SmallPacket0x0EA(PChar, SmallPD_ptr); break;
			case 0x0F1:	result = SmallPacket0x0F1(PChar, SmallPD_ptr); break;
			case 0x0F2:	result = SmallPacket0x0F2(PChar, SmallPD_ptr); break;
			case 0x0F4:	result = SmallPacket0x0F4(PChar, SmallPD_ptr); break;
			case 0x0F5:	result = SmallPacket0x0F5(PChar, SmallPD_ptr); break;
			case 0x0F6: result = SmallPacket0x0F6(PChar, SmallPD_ptr); break;
			case 0x0FA:	result = SmallPacket0x0FA(PChar, SmallPD_ptr); break;
			case 0x0FB:	result = SmallPacket0x0FB(PChar, SmallPD_ptr); break;
			case 0x100:	result = SmallPacket0x100(PChar, SmallPD_ptr); break;
			case 0x102:	break;
			case 0x104:	result = SmallPacket0x104(PChar, SmallPD_ptr); break;
			case 0x105: result = SmallPacket0x105(PChar, SmallPD_ptr); break;
			case 0x106: break;
			case 0x109:	result = SmallPacket0x109(PChar, SmallPD_ptr); break;
			case 0x10A:	result = SmallPacket0x10A(PChar, SmallPD_ptr); break;
			case 0x10B:	result = SmallPacket0x10B(PChar, SmallPD_ptr); break;
			default:
			{
				result = 0;
				ShowWarning(CL_YELLOW"parse: Unhandled game packet %03hX from user: %s\n"CL_RESET, SmallPD_Type, PChar->GetName());
			}
		}
		if (result != 0)
		{
			ShowDebug(CL_CYAN"parse: SmallPacket is not implemented Type<%03hX>\n"CL_RESET, SmallPD_Type);
		}
	}

	map_session_data->client_packet_id = SmallPD_Code;

	// здесь мы проверяем, получил ли клиент предыдущий пакет
	// если не получил, то мы не создаем новый, а отправляем предыдущий

	if (RBUFW(buff,2) != map_session_data->server_packet_id) 
	{
		WBUFW(map_session_data->server_packet_data,2) = SmallPD_Code;
		WBUFW(map_session_data->server_packet_data,8) = (uint32)time(NULL);

		g_PBuff	  = map_session_data->server_packet_data;
		*buffsize = map_session_data->server_packet_size;

		map_session_data->server_packet_data = buff;

		return -1;
	}

	// увеличиваем номер отправленного пакета только в случае отправки новых данных

	map_session_data->server_packet_id += 1;

	// собираем нормальный пакет

	CBasicPacket* PSmallPacket = NULL;

	*buffsize = FFXI_HEADER_SIZE;

	while(!PChar->isPacketListEmpty() && 
		  *buffsize + PChar->firstPacketSize()*2 < map_config.uiBuffMaxSize )
	{
		PSmallPacket = PChar->popPacket();

		PSmallPacket->setCode(map_session_data->server_packet_id);
		memcpy(buff+*buffsize, PSmallPacket, PSmallPacket->getSize()*2);

		*buffsize += PSmallPacket->getSize()*2;

		delete PSmallPacket;
	}

	return 0;
}

/************************************************************************
*																		*
*  main function is building big packet									*
*																		*
************************************************************************/

int32 send_parse(int8 *buff, size_t* buffsize, sockaddr_in* from, map_session_data_t* map_session_data)
{
	// Модификация заголовка исходящего пакета
	// Суть преобразований: 
	//  - отправить клиенту номер последнего полученного от него пакета
	//  - присвоить исходящему пакету номер последнего отправленного клиенту пакета +1
	//  - записать текущее время отправки пакета

	WBUFW(buff,0) = map_session_data->server_packet_id;
	WBUFW(buff,2) = map_session_data->client_packet_id;

	// сохранение текущего времени (32 BIT!)
	WBUFL(buff,8) = (uint32)time(NULL);

	int8* tempbuff = NULL;
	CREATE(tempbuff,int8,*buffsize);

	//Сжимаем данные без учета заголовка
	//Возвращаемый размер в 8 раз больше реальных данных
	uint32 PacketSize = zlib_compress(buff+FFXI_HEADER_SIZE, *buffsize-FFXI_HEADER_SIZE, tempbuff, *buffsize, zlib_compress_table);

	//Запись размера данных без учета заголовка
	WBUFL(tempbuff,(PacketSize+7)/8) = PacketSize;

	//Расчет hash'a также без учета заголовка, но с учетом записанного выше размера данных
	PacketSize = (PacketSize+7)/8+4;
	uint8 hash[16];
	md5((uint8*)tempbuff,hash, PacketSize);
	memcpy(tempbuff+PacketSize, hash, 16);
	PacketSize += 16;

	//making total packet
	memcpy(buff+FFXI_HEADER_SIZE,tempbuff,PacketSize);

	uint32 CypherSize = (PacketSize/4)&-2;

	blowfish_t* pbfkey = &map_session_data->blowfish;

	for(uint32 j = 0; j < CypherSize; j += 2)
	{
		blowfish_encipher((uint32*)(buff)+j+7, (uint32*)(buff)+j+8, pbfkey->P, pbfkey->S[0]);
	}

	// контролируем размер отправляемого пакета. в случае, 
	// если его размер превышает 1400 байт (размер данных + 42 байта IP заголовок),
	// то клиент игнорирует пакет и возвращает сообщение о его потере

	// в случае возникновения подобной ситуации выводим предупреждующее сообщение и 
	// уменьшаем размер BuffMaxSize с шагом в 4 байта до ее устранения (вручную) 

	*buffsize = PacketSize+FFXI_HEADER_SIZE;

	if (*buffsize > 1350)
	{
		ShowWarning(CL_YELLOW"send_parse: packet is very big <%u>\n"CL_RESET,*buffsize);
	}

	aFree(tempbuff);
	return 0;
}

/************************************************************************
*																		*
*  Таймер для завершения сессии (без таймера мы этого сделать не можем,	*
*  т.к. сессия продолжает использоваться в do_sockets)					*
*																		*
************************************************************************/

int32 map_close_session(uint32 tick, CTaskMgr::CTask* PTask)
{
	map_session_data_t* map_session_data = (map_session_data_t*)PTask->m_data;

	if (map_session_data != NULL)
	{
		Sql_Query(SqlHandle,"DELETE FROM accounts_sessions WHERE charid = %u",map_session_data->PChar->id);

		uint64 port64 = map_session_data->client_port;
		uint64 ipp	  = map_session_data->client_addr;
		ipp |= port64<<32;

		map_session_data->PChar->StatusEffectContainer->SaveStatusEffects();

		aFree(map_session_data->server_packet_data);
		delete map_session_data->PChar;
		delete map_session_data;

		map_session_list.erase(ipp);
		ShowDebug(CL_CYAN"map_close_session: session closed\n"CL_RESET);
		return 0;
	}
	
	ShowError(CL_RED"map_close_session: cannot close session, session not found\n"CL_RESET);
	return 1;
}

/************************************************************************
*																		*
*  Timer function that clenup all timed out players						*
*																		*
************************************************************************/

int32 map_cleanup(uint32 tick, CTaskMgr::CTask* PTask)
{
	map_session_list_t::iterator it = map_session_list.begin();

	while(it != map_session_list.end())
	{
		map_session_data_t* map_session_data = it->second;

		if( (time(NULL) - map_session_data->last_update) > (map_config.max_time_lastupdate/1000) )
		{
			if (map_session_data->PChar) 
			{
				ShowWarning("map_cleanup: "CL_WHITE"%s"CL_RESET" timed out, session closed\n",map_session_data->PChar->GetName());

				map_session_data->PChar->status = STATUS_SHUTDOWN;
				SmallPacket0x00D(map_session_data->PChar, 0, map_session_data);
			} else {
				ShowWarning("map_cleanup: "CL_WHITE"WHITHOUT CHAR"CL_RESET" timed out, session closed\n");

				const int8* fmtQuery = "DELETE FROM accounts_sessions WHERE client_addr = %u AND client_port = %u";
				Sql_Query(SqlHandle,fmtQuery,map_session_data->client_addr,map_session_data->client_port);

				aFree(map_session_data->server_packet_data);
				delete map_session_data;
				map_session_list.erase(it++);
				continue;
			}
		}
		++it;
	}
	return 0;
}

/************************************************************************
*																		*
*  Map-Server Version Screen [venom] 									*
*																		*
************************************************************************/

void map_helpscreen(int32 flag)
{
	ShowMessage("Usage: map-server [options]\n");
	ShowMessage("Options:\n");
	ShowMessage(CL_WHITE"  Commands\t\t\tDescription\n"CL_RESET);
	ShowMessage("-----------------------------------------------------------------------------\n");
	ShowMessage("  --help, --h, --?, /?		Displays this help screen\n");
	ShowMessage("  --map-config <file>		Load map-server configuration from <file>\n");
	ShowMessage("  --version, --v, -v, /v	Displays the server's version\n");
	ShowMessage("\n");
	if (flag) exit(EXIT_FAILURE);
}

/************************************************************************
*																		*
*  Map-Server Version Screen [venom] 									*
*																		*
************************************************************************/

void map_versionscreen(int32 flag)
{
	ShowInfo(CL_WHITE "Darkstar version %d.%02d.%02d" CL_RESET"\n",
		DARKSTAR_MAJOR_VERSION, DARKSTAR_MINOR_VERSION, DARKSTAR_REVISION);
	if (flag) exit(EXIT_FAILURE);
}

/************************************************************************
*																		*
*  map_config_default													*
*																		*
************************************************************************/

int32 map_config_default()
{
	map_config.uiMapIp        = INADDR_ANY;
	map_config.usMapPort      = 54230;
	map_config.mysql_host     = "127.0.0.1";
	map_config.mysql_login    = "root";
	map_config.mysql_password = "root";
	map_config.mysql_database = "dspdb";
	map_config.mysql_port     = 3306;
	map_config.uiBuffMaxSize  = 1874;
	map_config.time_wait_between2recv = 10;		// 100ms;
	map_config.max_time_lastupdate = 60000;		// 1 minutes;
	return 0;
}

/************************************************************************
*																		*
*  Map-Server Config [venom] 											*
*																		*
************************************************************************/

int32 map_config_read(const int8* cfgName)
{
	int8 line[1024], w1[1024], w2[1024];
	FILE* fp;

	fp = fopen(cfgName,"r");
	if( fp == NULL )
	{
		ShowError("Map configuration file not found at: %s\n", cfgName);
		return 1;
	}

	while( fgets(line, sizeof(line), fp) )
	{
		int8* ptr;

		if( line[0] == '/' && line[1] == '/' )
			continue;
		if( (ptr = strstr(line, "//")) != NULL )
			*ptr = '\n'; //Strip comments
		if( sscanf(line, "%[^:]: %[^\t\r\n]", w1, w2) < 2 )
			continue;

		//Strip trailing spaces
		ptr = w2 + strlen(w2);
		while (--ptr >= w2 && *ptr == ' ');
		ptr++;
		*ptr = '\0';
			
		if(strcmpi(w1,"timestamp_format") == 0)
		{
			strncpy(timestamp_format, w2, 20);
		}
		else if(strcmpi(w1,"stdout_with_ansisequence") == 0)
		{
			stdout_with_ansisequence = config_switch(w2);
		}
		else if(strcmpi(w1,"console_silent") == 0) 
		{
			ShowInfo("Console Silent Setting: %d", atoi(w2));
			msg_silent = atoi(w2);
		} 
		else if (strcmpi(w1, "map_port") == 0) 
		{
			map_config.usMapPort = (atoi(w2));
		} 
		else if (strcmp(w1, "buff_maxsize") == 0)
		{
			map_config.uiBuffMaxSize = atoi(w2);
		} 
		else if (strcmp(w1, "time_wait_between2recv") == 0)
		{
			map_config.time_wait_between2recv = atoi(w2);
		} 
		else if (strcmp(w1,"max_time_lastupdate") == 0)
		{
			map_config.max_time_lastupdate = atoi(w2);
		}
		else if (strcmp(w1, "mysql_host") == 0)
		{
			map_config.mysql_host = aStrdup(w2);
		}
		else if (strcmp(w1, "mysql_login") == 0)
		{
			map_config.mysql_login = aStrdup(w2);
		}
		else if (strcmp(w1, "mysql_password") == 0)
		{
			map_config.mysql_password = aStrdup(w2);
		}
		else if (strcmp(w1, "mysql_port") == 0)
		{
			map_config.mysql_port = atoi(w2);
		}
		else if (strcmp(w1,"mysql_database") == 0)
		{
			map_config.mysql_database = aStrdup(w2);
		}
		else if (strcmpi(w1, "import") == 0)
		{
			map_config_read(w2);
		}
		else
		{
			ShowWarning(CL_YELLOW"Unknown setting '%s' in file %s\n"CL_RESET, w1, cfgName);
		}
	}

	fclose(fp);
	return 0;
}
