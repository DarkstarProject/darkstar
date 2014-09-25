/*
===========================================================================

Copyright (c) 2010-2014 Darkstar Dev Teams

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

#include "chat_server.h"
#include "../common/showmsg.h"
#include "login.h"

zmq::context_t zContext;
zmq::socket_t* zSocket = NULL;
Sql_t* ChatSqlHandle = NULL;

void chat_init()
{
	ChatSqlHandle = Sql_Malloc();

	if (Sql_Connect(ChatSqlHandle, login_config.mysql_login,
		login_config.mysql_password,
		login_config.mysql_host,
		login_config.mysql_port,
		login_config.mysql_database) == SQL_ERROR)
	{
		exit(EXIT_FAILURE);
	}
	Sql_Keepalive(ChatSqlHandle);

	zContext = zmq::context_t(1);
	zSocket = new zmq::socket_t(zContext, ZMQ_ROUTER);

	string_t server = "tcp://";
	server.append(login_config.chatIp);
	server.append(":");
	server.append(std::to_string(login_config.chatPort));

	try
	{
		zSocket->bind(server.c_str());
	}
	catch (zmq::error_t err)
	{
		ShowFatalError("Unable to bind chat socket: %s\n", err.what());
	}

	chat_listen();
}

void chat_listen()
{
	while (true)
	{
		zmq::message_t from;
		zSocket->recv(&from);

		zmq::message_t type;
		zSocket->recv(&type);

		zmq::message_t extra;
		zSocket->recv(&extra);

		zmq::message_t packet;
		zSocket->recv(&packet);

		chat_parse((CHATTYPE)RBUFB(type.data(), 0), &extra, &packet);
	}
}
void chat_parse(CHATTYPE type, zmq::message_t* extra, zmq::message_t* packet)
{
	int ret;
	switch (type)
	{
		case CHAT_TELL:
		{
			int8* query = "SELECT server_addr, server_port FROM accounts_sessions LEFT JOIN chars ON \
				accounts_sessions.charid = chars.charid WHERE charname = '%s' LIMIT 1; ";
			ret = Sql_Query(ChatSqlHandle, query, (int8*)extra->data()+4);
			if (Sql_NumRows(ChatSqlHandle) == 0)
			{
				int8* query = "SELECT server_addr, server_port FROM accounts_sessions WHERE charid = %d LIMIT 1;";
				ret = Sql_Query(ChatSqlHandle, query, RBUFL(extra->data(), 0));
			}
			break;
		}
		case CHAT_PARTY:
		case CHAT_PT_RELOAD:
        case CHAT_PT_DISBAND:
		{
			int8* query = "SELECT server_addr, server_port, MIN(charid) FROM accounts_sessions \
							WHERE IF (allianceid <> 0, allianceid = %d, partyid = %d) GROUP BY server_addr, server_port; ";
			uint32 partyid = RBUFL(extra->data(), 0);
			ret = Sql_Query(ChatSqlHandle, query, partyid, partyid);
			break;
		}
		case CHAT_LINKSHELL:
		{
			int8* query = "SELECT server_addr, server_port FROM accounts_sessions \
						WHERE linkshellid = %d GROUP BY server_addr, server_port; ";
			ret = Sql_Query(ChatSqlHandle, query, RBUFL(extra->data(), 0));
			break;
		}
		case CHAT_YELL:
		{
			int8* query = "SELECT zoneip, zoneport FROM zone_settings WHERE misc & 1024 GROUP BY zoneip, zoneport;";
			ret = Sql_Query(ChatSqlHandle, query);
			break;
		}
		case CHAT_SERVMES:
		{
			int8* query = "SELECT zoneip, zoneport FROM zone_settings GROUP BY zoneip, zoneport;";
			ret = Sql_Query(ChatSqlHandle, query);
			break;
		}
		case CHAT_PT_INVITE:
		case CHAT_PT_INV_RES:
		case CHAT_MSG_DIRECT:
		{
			int8* query = "SELECT server_addr, server_port FROM accounts_sessions WHERE charid = %d; ";
			ret = Sql_Query(ChatSqlHandle, query, RBUFL(extra->data(),0));
			break;
		}
	}

	if (ret != SQL_ERROR)
	{
		while (Sql_NextRow(ChatSqlHandle) == SQL_SUCCESS)
		{
			uint64 ip = Sql_GetUIntData(ChatSqlHandle, 0);
			uint64 port = Sql_GetUIntData(ChatSqlHandle, 1);
			ip |= (port << 32);
			if (type == CHAT_PARTY || type == CHAT_PT_RELOAD || type == CHAT_PT_DISBAND)
			{
				WBUFL(extra->data(), 0) = Sql_GetUIntData(ChatSqlHandle, 2);
			}
			chat_send(ip, type, extra, packet);
		}
	}
}
void chat_send(uint64 ipp, CHATTYPE type, zmq::message_t* extra, zmq::message_t* packet)
{
	zmq::message_t to(sizeof(uint64));
	memcpy(to.data(), &ipp, sizeof(uint64));
	zSocket->send(to, ZMQ_SNDMORE);

	zmq::message_t newType(sizeof(CHATTYPE));
	WBUFB(newType.data(), 0) = type;
	zSocket->send(newType, ZMQ_SNDMORE);

	zmq::message_t newExtra(extra->size());
	memcpy(newExtra.data(), extra->data(), extra->size());
	zSocket->send(newExtra, ZMQ_SNDMORE);

	zmq::message_t newPacket(packet->size());
	memcpy(newPacket.data(), packet->data(), packet->size());
	zSocket->send(newPacket);
}
