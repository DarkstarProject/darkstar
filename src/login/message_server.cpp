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

#include <queue>
#include <mutex>

#include "message_server.h"
#include "../common/showmsg.h"
#include "login.h"

zmq::context_t zContext;
zmq::socket_t* zSocket = nullptr;
Sql_t* ChatSqlHandle = nullptr;
std::queue<chat_message_t> msg_queue;
std::mutex queue_mutex;

void queue_message(uint64 ipp, MSGSERVTYPE type, zmq::message_t* extra, zmq::message_t* packet)
{
    std::lock_guard<std::mutex>lk(queue_mutex);
    chat_message_t msg;
    msg.dest = ipp;

    msg.type = type;

    msg.data = new zmq::message_t(extra->size());
    memcpy(msg.data->data(), extra->data(), extra->size());

    msg.packet = new zmq::message_t(packet->size());
    memcpy(msg.packet->data(), packet->data(), packet->size());

    msg_queue.push(msg);
}

void message_server_send(uint64 ipp, MSGSERVTYPE type, zmq::message_t* extra, zmq::message_t* packet)
{
    try
    {
        zmq::message_t to(sizeof(uint64));
        memcpy(to.data(), &ipp, sizeof(uint64));
        zSocket->send(to, ZMQ_SNDMORE);

        zmq::message_t newType(sizeof(MSGSERVTYPE));
        WBUFB(newType.data(), 0) = type;
        zSocket->send(newType, ZMQ_SNDMORE);

        zmq::message_t newExtra(extra->size());
        memcpy(newExtra.data(), extra->data(), extra->size());
        zSocket->send(newExtra, ZMQ_SNDMORE);

        zmq::message_t newPacket(packet->size());
        memcpy(newPacket.data(), packet->data(), packet->size());
        zSocket->send(newPacket);
    }
    catch (zmq::error_t e)
    {
        ShowError("Message: %s", e.what());
    }
}

void message_server_parse(MSGSERVTYPE type, zmq::message_t* extra, zmq::message_t* packet, zmq::message_t* from)
{
    int ret;
    in_addr from_ip;
    uint16 from_port = 0;
    bool ipstring = false;
    if (from)
    {
        from_ip.s_addr = RBUFL(from->data(), 0);
        from_port = RBUFW(from->data(), 4);
    }
    switch (type)
    {
    case MSG_CHAT_TELL:
    case MSG_LINKSHELL_RANK_CHANGE:
    case MSG_LINKSHELL_REMOVE:
    {
        int8* query = "SELECT server_addr, server_port FROM accounts_sessions LEFT JOIN chars ON \
                      				accounts_sessions.charid = chars.charid WHERE charname = '%s' LIMIT 1; ";
        ret = Sql_Query(ChatSqlHandle, query, (int8*)extra->data() + 4);
        if (Sql_NumRows(ChatSqlHandle) == 0)
        {
            int8* query = "SELECT server_addr, server_port FROM accounts_sessions WHERE charid = %d LIMIT 1;";
            ret = Sql_Query(ChatSqlHandle, query, RBUFL(extra->data(), 0));
        }
        break;
    }
    case MSG_CHAT_PARTY:
    case MSG_PT_RELOAD:
    case MSG_PT_DISBAND:
    {
        int8* query = "SELECT server_addr, server_port, MIN(charid) FROM accounts_sessions JOIN accounts_parties USING (charid) \
                      							WHERE IF (allianceid <> 0, allianceid = (SELECT MAX(allianceid) FROM accounts_sessions WHERE partyid = %d), partyid = %d) GROUP BY server_addr, server_port; ";
        uint32 partyid = RBUFL(extra->data(), 0);
        ret = Sql_Query(ChatSqlHandle, query, partyid, partyid);
        break;
    }
    case MSG_CHAT_LINKSHELL:
    {
        int8* query = "SELECT server_addr, server_port FROM accounts_sessions \
                      						WHERE linkshellid1 = %d OR linkshellid2 = %d GROUP BY server_addr, server_port; ";
        ret = Sql_Query(ChatSqlHandle, query, RBUFL(extra->data(), 0), RBUFL(extra->data(), 0));
        break;
    }
    case MSG_CHAT_YELL:
    {
        int8* query = "SELECT zoneip, zoneport FROM zone_settings WHERE misc & 1024 GROUP BY zoneip, zoneport;";
        ret = Sql_Query(ChatSqlHandle, query);
        ipstring = true;
        break;
    }
    case MSG_CHAT_SERVMES:
    {
        int8* query = "SELECT zoneip, zoneport FROM zone_settings GROUP BY zoneip, zoneport;";
        ret = Sql_Query(ChatSqlHandle, query);
        ipstring = true;
        break;
    }
    case MSG_PT_INVITE:
    case MSG_PT_INV_RES:
    case MSG_DIRECT:
    {
        int8* query = "SELECT server_addr, server_port FROM accounts_sessions WHERE charid = %d; ";
        ret = Sql_Query(ChatSqlHandle, query, RBUFL(extra->data(), 0));
        break;
    }
    }

    if (ret != SQL_ERROR)
    {
        ShowDebug("Message: Received message %d from %s:%hu\n", type, inet_ntoa(from_ip), from_port);
        while (Sql_NextRow(ChatSqlHandle) == SQL_SUCCESS)
        {
            uint64 ip = 0;
            if (ipstring)
            {
                int8* ip_string = Sql_GetData(ChatSqlHandle, 0);
                ip = inet_addr(ip_string);
            }
            else
            {
                ip = Sql_GetUIntData(ChatSqlHandle, 0);
            }
            uint64 port = Sql_GetUIntData(ChatSqlHandle, 1);
            in_addr target;
            target.s_addr = ip;
            ShowDebug("Message:  -> rerouting to %s:%lu\n", inet_ntoa(target), port);
            ip |= (port << 32);
            if (type == MSG_CHAT_PARTY || type == MSG_PT_RELOAD || type == MSG_PT_DISBAND)
            {
                WBUFL(extra->data(), 0) = Sql_GetUIntData(ChatSqlHandle, 2);
            }
            message_server_send(ip, type, extra, packet);
        }
    }
}

void message_server_listen()
{
    while (true)
    {
        zmq::message_t from;
        zmq::message_t type;
        zmq::message_t extra;
        zmq::message_t packet;

        try
        {
            if (!zSocket->recv(&from))
            {
                if (!msg_queue.empty())
                {
                    std::lock_guard<std::mutex>lk(queue_mutex);
                    while (!msg_queue.empty())
                    {
                        chat_message_t msg = msg_queue.front();
                        msg_queue.pop();
                        message_server_send(msg.dest, msg.type, msg.data, msg.packet);
                    }
                }
                continue;
            }
            int more;
            size_t size = sizeof(more);
            zSocket->getsockopt(ZMQ_RCVMORE, &more, &size);
            if (more)
            {
                zSocket->recv(&type);
                zSocket->getsockopt(ZMQ_RCVMORE, &more, &size);
                if (more)
                {
                    zSocket->recv(&extra);
                    zSocket->getsockopt(ZMQ_RCVMORE, &more, &size);
                    if (more)
                    {
                        zSocket->recv(&packet);
                    }
                }
            }
        }
        catch (zmq::error_t e)
        {
            if (!zSocket)
            {
                return;
            }
            ShowError("Message: %s\n", e.what());
            continue;
        }
        message_server_parse((MSGSERVTYPE)RBUFB(type.data(), 0), &extra, &packet, &from);
    }
}

void message_server_init()
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

    uint32 to = 500;
    zSocket->setsockopt(ZMQ_RCVTIMEO, &to, sizeof to);

	string_t server = "tcp://";
    server.append(login_config.msg_server_ip);
	server.append(":");
    server.append(std::to_string(login_config.msg_server_port));

	try
	{
		zSocket->bind(server.c_str());
	}
	catch (zmq::error_t err)
	{
		ShowFatalError("Unable to bind chat socket: %s\n", err.what());
	}

	message_server_listen();
}

void message_server_close()
{
    zContext.close();
    if (zSocket)
    {
        zSocket->close();
        delete zSocket;
        zSocket = nullptr;
    }
}