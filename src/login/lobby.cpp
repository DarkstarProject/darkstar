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

#include "../common/malloc.h"
#include "../common/socket.h"
#include "../common/showmsg.h"
#include "../common/strlib.h"
#include "../common/utils.h"
#include "../common/md52.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "login.h"
#include "lobby.h"


int32 login_lobbydata_fd;
int32 login_lobbyview_fd;

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 connect_client_lobbydata(int32 listenfd)
{
    int32 fd = 0;
    struct sockaddr_in client_address;
    if ((fd = connect_client(listenfd, client_address)) != -1)
    {
        create_session(fd, recv_to_fifo, send_from_fifo, lobbydata_parse);
        session[fd]->client_addr = ntohl(client_address.sin_addr.s_addr);
        session[fd]->wdata[0] = 0x01;
        WFIFOSET(fd, 5);
        return fd;
    }
    return -1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 lobbydata_parse(int32 fd)
{
    login_session_data_t* sd = (login_session_data_t*)session[fd]->session_data;

    if (sd == nullptr)
    {
        if (RFIFOREST(fd) >= 5 &&
            RBUFB(session[fd]->rdata, 0) == 0xA1)
        {
            char* buff = session[fd]->rdata;

            int32 accid = RBUFL(buff, 1);

            sd = find_loginsd_byaccid(accid);
            if (sd == nullptr)
            {
                do_close_tcp(fd);
                return -1;
            }

            sd->login_lobbydata_fd = fd;
            session[fd]->session_data = sd;
            return 0;
        }

        if (sd == nullptr)
        {
            do_close_tcp(fd);
            return -1;
        }
    }


    if (session[fd]->flag.eof)
    {
        do_close_lobbydata(sd, fd);
        return 0;
    }

    if (RFIFOREST(fd) >= 1)
    {
        char* buff = session[fd]->rdata;
        if (RBUFB(buff, 0) == 0x0d) ShowDebug(CL_RED"Posible Crash Attempt from IP: " CL_WHITE"<%s>\n" CL_RESET, ip2str(session[fd]->client_addr, nullptr), nullptr);
        ShowDebug("lobbydata_parse:Incoming Packet:" CL_WHITE"<%x>" CL_RESET" from ip:<%s>\n", RBUFB(buff, 0), ip2str(sd->client_addr, nullptr));

        int32 code = RBUFB(buff, 0);
        switch (code)
        {
        case 0xA1:
        {
            if (RFIFOREST(fd) < 9)
            {
                ShowError("lobbydata_parse:" CL_WHITE"<%s>" CL_RESET" sent less then 9 bytes\n", ip2str(session[fd]->client_addr, nullptr));
                do_close_lobbydata(sd, fd);
                return -1;
            }
            char uList[500];
            memset(uList, 0, sizeof(uList));

            sd->servip = RBUFL(buff, 5);

            unsigned char CharList[2500];
            memset(CharList, 0, sizeof(CharList));
            //запись зарезервированных чисел
            CharList[0] = 0xE0; CharList[1] = 0x08;
            CharList[4] = 0x49; CharList[5] = 0x58; CharList[6] = 0x46; CharList[7] = 0x46; CharList[8] = 0x20;

            CharList[28] = 16; // количество ячеек, доступных для создания персонажей (0-16)

            const char *pfmtQuery = "SELECT charid, charname, pos_zone, pos_prevzone, mjob,\
												 race, face, head, body, hands, legs, feet, main, sub,\
												 war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng,\
												 sam, nin, drg, smn, blu, cor, pup, dnc, sch, geo, run \
										  FROM chars \
											INNER JOIN char_stats USING(charid)\
											INNER JOIN char_look  USING(charid) \
											INNER JOIN char_jobs  USING(charid) \
										  WHERE accid = %i \
										  LIMIT 16;";

            int32 ret = Sql_Query(SqlHandle, pfmtQuery, sd->accid);
            if (ret == SQL_ERROR)
            {
                do_close_lobbydata(sd, fd);
                return -1;
            }

            LOBBY_A1_RESERVEPACKET(ReservePacket);

            //server's name that shows in lobby menu
            memcpy(ReservePacket + 60, login_config.servername, dsp_cap(strlen(login_config.servername), 0, 15));

            // Prepare the character list data..
            for (int j = 0; j < 16; ++j)
            {
                memcpy(CharList + 32 + 140 * j, ReservePacket + 32, 140);
                memset(CharList + 32 + 140 * j, 0x00, 4);
                memset(uList + 16 * (j + 1), 0x00, 4);
            }

            uList[0] = 0x03;

            int i = 0;
            //Считывание информации о конкректном персонаже
            //Загрузка всей необходимой информации о персонаже из базы
            while (Sql_NextRow(SqlHandle) != SQL_NO_DATA)
            {
                char* strCharName = nullptr;

                Sql_GetData(SqlHandle, 1, &strCharName, nullptr);

                uint32 CharID = Sql_GetIntData(SqlHandle, 0);

                uint16 zone = (uint16)Sql_GetIntData(SqlHandle, 2);
                uint16 prevzone = (uint16)Sql_GetIntData(SqlHandle, 3);

                uint8 MainJob = (uint8)Sql_GetIntData(SqlHandle, 4);
                uint8 lvlMainJob = (uint8)Sql_GetIntData(SqlHandle, 13 + MainJob);

                // Update the character and user list content ids..
                WBUFL(uList, 16 * (i + 1)) = CharID;
                WBUFL(CharList, 32 + 140 * i) = CharID;

                WBUFL(uList, 20 * (i + 1)) = CharID;

                ////////////////////////////////////////////////////
                WBUFL(CharList, 4 + 32 + i * 140) = CharID;

                memcpy(CharList + 12 + 32 + i * 140, strCharName, 15);

                WBUFB(CharList, 46 + 32 + i * 140) = MainJob;
                WBUFB(CharList, 73 + 32 + i * 140) = lvlMainJob;

                WBUFB(CharList, 44 + 32 + i * 140) = (uint8)Sql_GetIntData(SqlHandle, 5); // race;
                WBUFB(CharList, 56 + 32 + i * 140) = (uint8)Sql_GetIntData(SqlHandle, 6); // face;
                WBUFW(CharList, 58 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 7); // head;
                WBUFW(CharList, 60 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 8); // body;
                WBUFW(CharList, 62 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 9); // hands;
                WBUFW(CharList, 64 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 10); // legs;
                WBUFW(CharList, 66 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 11); // feet;
                WBUFW(CharList, 68 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 12); // main;
                WBUFW(CharList, 70 + 32 + i * 140) = (uint16)Sql_GetIntData(SqlHandle, 13); // sub;

                // todo: cap login packet for zones > 255
                WBUFB(CharList, 72 + 32 + i * 140) = (uint8)(zone == 0 ? prevzone : zone);      // если персонаж в MogHouse
                ///////////////////////////////////////////////////
                ++i;
            }

            if (session[sd->login_lobbyview_fd] != nullptr) {
                // write into lobbydata
                uList[1] = 0x10;
                memcpy(session[fd]->wdata, uList, 0x148);
                WFIFOSET(fd, 0x148);
                RFIFOSKIP(fd, session[fd]->rdata_size);
                RFIFOFLUSH(fd);
                ////////////////////////////////////////

                unsigned char hash[16];
                md5((unsigned char*)(CharList), hash, 2272);

                memcpy(CharList + 12, hash, 16);
                // write into lobbyview
                memcpy(session[sd->login_lobbyview_fd]->wdata, CharList, 2272);
                WFIFOSET(sd->login_lobbyview_fd, 2272);
                RFIFOSKIP(sd->login_lobbyview_fd, session[sd->login_lobbyview_fd]->rdata_size);
                RFIFOFLUSH(sd->login_lobbyview_fd);
            }
            else { //cleanup
                ShowWarning("lobbydata_parse: char:(%i) login data corrupt (0xA1). Disconnecting client.\n", sd->accid);
                do_close_lobbydata(sd, fd);
                return -1;
            }
            /////////////////////////////////////////

            break;
        }
        case 0xA2:
        {
            LOBBY_A2_RESERVEPACKET(ReservePacket);
            uint8 key3[20];
            memset(key3, 0, sizeof(key3));
            memcpy(key3, buff + 1, sizeof(key3));
            key3[16] -= 2;
            uint8 MainReservePacket[0x48];

            RFIFOSKIP(fd, session[fd]->rdata_size);
            RFIFOFLUSH(fd);

            if (session[sd->login_lobbyview_fd] == nullptr) {
                ShowWarning("lobbydata_parse: char:(%i) login data corrupt (0xA2). Disconnecting client.\n", sd->accid);
                do_close_lobbydata(sd, fd);
                return -1;
            }

            uint32 charid = RBUFL(session[sd->login_lobbyview_fd]->rdata, 32);

            const char *fmtQuery = "SELECT zoneip, zoneport, zoneid, pos_prevzone \
									    FROM zone_settings, chars \
										WHERE IF(pos_zone = 0, zoneid = pos_prevzone, zoneid = pos_zone) AND charid = %u;";
            uint32 ZoneIP = sd->servip;
            uint16 ZonePort = 54230;
            uint16 ZoneID = 0;
            uint16 PrevZone = 0;

            if (Sql_Query(SqlHandle, fmtQuery, charid) != SQL_ERROR &&
                Sql_NumRows(SqlHandle) != 0)
            {
                Sql_NextRow(SqlHandle);

                ZoneID = (uint16)Sql_GetUIntData(SqlHandle, 2);
                PrevZone = (uint16)Sql_GetUIntData(SqlHandle, 3);

                //new char only (first login from char create)
                if (PrevZone == 0)  key3[16] += 6;

                ZoneIP = inet_addr(Sql_GetData(SqlHandle, 0));
                ZonePort = (uint16)Sql_GetUIntData(SqlHandle, 1);
                WBUFL(ReservePacket, (0x38)) = ZoneIP;
                WBUFW(ReservePacket, (0x3C)) = ZonePort;
                ShowInfo("lobbydata_parse: zoneid:(%u),zoneip:(%s),zoneport:(%u) for char:(%u)\n", ZoneID, ip2str(ntohl(ZoneIP), nullptr), ZonePort, charid);
            }
            else
            {
                ShowWarning("lobbydata_parse: zoneip:(%s) for char:(%u) is standard\n", ip2str(sd->servip, nullptr), charid);
                WBUFL(ReservePacket, (0x38)) = sd->servip;  // map-server ip
              //WBUFW(ReservePacket,(0x3C)) = port;         // map-server port
            }

            if (PrevZone == 0)
                Sql_Query(SqlHandle, "UPDATE chars SET pos_prevzone = %d WHERE charid = %u;", ZoneID, charid);

            WBUFL(ReservePacket, (0x40)) = sd->servip;                                  // search-server ip
            WBUFW(ReservePacket, (0x44)) = login_config.search_server_port;             // search-server port

            memcpy(MainReservePacket, ReservePacket, RBUFB(ReservePacket, 0));

            // необходиму одалять сессию, необработанную игровым сервером
            Sql_Query(SqlHandle, "DELETE FROM accounts_sessions WHERE accid = %u and client_port = 0", sd->accid);

            int8 session_key[sizeof(key3) * 2 + 1];
            bin2hex(session_key, key3, sizeof(key3));

            fmtQuery = "INSERT INTO accounts_sessions(accid,charid,session_key,server_addr,server_port,client_addr) VALUES(%u,%u,x'%s',%u,%u,%u)";

            if (Sql_Query(SqlHandle, fmtQuery, sd->accid, charid, session_key, ZoneIP, ZonePort, sd->client_addr) == SQL_ERROR)
            {
                //отправляем клиенту сообщение об ошибке
                LOBBBY_ERROR_MESSAGE(ReservePacket);
                // устанавливаем код ошибки
                // Unable to connect to world server. Specified operation failed
                WBUFW(ReservePacket, 32) = 305;
                memcpy(MainReservePacket, ReservePacket, RBUFB(ReservePacket, 0));
            }

            // disallow change of pos while 'zoning'
            fmtQuery = "UPDATE char_stats SET zoning = 2 WHERE charid = %u";
            Sql_Query(SqlHandle, fmtQuery, charid);

            unsigned char Hash[16];
            uint8 SendBuffSize = RBUFB(MainReservePacket, 0);

            memset(MainReservePacket + 12, 0, sizeof(Hash));
            md5(MainReservePacket, Hash, SendBuffSize);

            memcpy(MainReservePacket + 12, Hash, sizeof(Hash));
            memcpy(session[sd->login_lobbyview_fd]->wdata, MainReservePacket, SendBuffSize);
            WFIFOSET(sd->login_lobbyview_fd, SendBuffSize);

            RFIFOSKIP(sd->login_lobbyview_fd, session[sd->login_lobbyview_fd]->rdata_size);
            RFIFOFLUSH(sd->login_lobbyview_fd);

            if (SendBuffSize == 0x24)
            {
                // выходим в случае ошибки без разрыва соединения
                return -1;
            }

            do_close_tcp(sd->login_lobbyview_fd);

            if (login_config.log_user_ip == true)
            {
                // Log clients IP info when player spawns into map server

                time_t rawtime;
                tm*    convertedTime;
                time(&rawtime);
                convertedTime = localtime(&rawtime);

                char timeAndDate[128];
                strftime(timeAndDate, sizeof(timeAndDate), "%Y:%m:%d %H:%M:%S", convertedTime);

                fmtQuery = "INSERT INTO account_ip_record(login_time,accid,charid,client_ip)\
                            VALUES ('%s', %u, %u, '%s');";

                if (Sql_Query(SqlHandle, fmtQuery, timeAndDate, sd->accid, charid, ip2str(sd->client_addr, nullptr)) == SQL_ERROR)
                {
                    ShowError("lobbyview_parse: Could not write info to account_ip_record.\n");
                }
            }

            ShowStatus("lobbydata_parse: client %s finished work with " CL_GREEN"lobbyview" CL_RESET"\n", ip2str(sd->client_addr, nullptr));
            break;
        }
        default:

            break;
        }
    }
    return 0;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 do_close_lobbydata(login_session_data_t *loginsd, int32 fd)
{
    if (loginsd != nullptr)
    {
        ShowInfo("lobbydata_parse: " CL_WHITE"%s" CL_RESET" shutdown the socket\n", loginsd->login);
        if (session_isActive(loginsd->login_lobbyview_fd))
        {
            do_close_tcp(loginsd->login_lobbyview_fd);
        }
        erase_loginsd_byaccid(loginsd->accid);
        ShowInfo("lobbydata_parse: " CL_WHITE"%s" CL_RESET"'s login_session_data is deleted\n", loginsd->login);
        if (session[fd]->session_data)
            aFree(session[fd]->session_data);
        do_close_tcp(fd);
        return 0;
    }
    else
    {
        ShowInfo("lobbydata_parse: " CL_WHITE"%s" CL_RESET" shutdown the socket\n", ip2str(session[fd]->client_addr, nullptr));
        do_close_tcp(fd);
        return 0;
    }
    return -1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 connect_client_lobbyview(int32 listenfd)
{
    int32 fd = 0;
    struct sockaddr_in client_address;
    if ((fd = connect_client(listenfd, client_address)) != -1)
    {
        create_session(fd, recv_to_fifo, send_from_fifo, lobbyview_parse);
        session[fd]->client_addr = ntohl(client_address.sin_addr.s_addr);
        return fd;
    }
    return -1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 lobbyview_parse(int32 fd)
{
    login_session_data_t* sd = (login_session_data_t*)session[fd]->session_data;

    if (sd == nullptr)
    {
        sd = find_loginsd_byip(session[fd]->client_addr);
        if (sd == nullptr)
        {
            do_close_tcp(fd);
            return -1;
        }
        session[fd]->session_data = sd;
        sd->login_lobbyview_fd = fd;
    }

    if (session[fd]->flag.eof)
    {
        do_close_lobbyview(sd, fd);
        return 0;
    }

    if (RFIFOREST(fd) >= 9)
    {
        char* buff = session[fd]->rdata;
        ShowDebug("lobbyview_parse:Incoming Packet:" CL_WHITE"<%x>" CL_RESET" from ip:<%s>\n", RBUFB(buff, 8), ip2str(sd->client_addr, nullptr));
        uint8 code = RBUFB(buff, 8);
        switch (code)
        {
        case 0x26:
        {
            int32 sendsize = 0x28;
            unsigned char MainReservePacket[0x28];

            string_t client_ver_data((char*)(buff + 0x74), 6); // Full length is 10 but we drop last 4
            client_ver_data = client_ver_data+"xx_x";          // And then we replace those last 4..

            string_t expected_version(version_info.CLIENT_VER, 6); // Same deal here!
            expected_version = expected_version+"xx_x";

            if (expected_version != client_ver_data)
            {
                sendsize = 0x24;
                LOBBBY_ERROR_MESSAGE(ReservePacket);

                WBUFW(ReservePacket, 32) = 331;
                memcpy(MainReservePacket, ReservePacket, sendsize);
                ShowError("lobbyview_parse: Incorrect client version: got %s, expected %s\n", client_ver_data.c_str(), expected_version.c_str());
                if (expected_version < client_ver_data)
                {
                    ShowError("lobbyview_parse: The server must be updated to support this client version\n");
                }
                else
                {
                    ShowError("lobbyview_parse: The client must be updated to support this server version\n");
                }
            }
            else
            {
                LOBBY_026_RESERVEPACKET(ReservePacket);
                WBUFW(ReservePacket, 32) = login_config.expansions; // BitMask for expansions;
                memcpy(MainReservePacket, ReservePacket, sendsize);
            }
            //Хеширование пакета, и запись значения Хеш функции в пакет
            unsigned char Hash[16];
            md5(MainReservePacket, Hash, sendsize);
            memcpy(MainReservePacket + 12, Hash, 16);
            //Запись итогового пакета
            memcpy(session[fd]->wdata, MainReservePacket, sendsize);

            RFIFOSKIP(fd, session[fd]->rdata_size);
            RFIFOFLUSH(fd);
            WFIFOSET(fd, sendsize);
        }
        break;
        case 0x14:
        {
            //delete char
            uint32 ContentID = RBUFL(session[fd]->rdata, 0x1C);
            uint32 CharID = RBUFL(session[fd]->rdata, 0x20);

            ShowInfo(CL_WHITE"lobbyview_parse" CL_RESET":attempt to delete char:<" CL_WHITE"%d" CL_RESET"> from ip:<%s>\n", CharID, ip2str(sd->client_addr, nullptr));

            uint8 sendsize = 0x20;

            LOBBY_ACTION_DONE(ReservePacket);
            unsigned char hash[16];

            md5(ReservePacket, hash, sendsize);
            memcpy(ReservePacket + 12, hash, 16);

            memcpy(session[fd]->wdata, ReservePacket, sendsize);
            WFIFOSET(fd, sendsize);
            RFIFOSKIP(fd, session[fd]->rdata_size);
            RFIFOFLUSH(fd);

            //Выполнение удаления персонажа из основных таблиц
            //Достаточно удалить значение из таблицы chars, все остальное сделает mysql-сервер

            const char *pfmtQuery = "DELETE FROM chars WHERE charid = %i AND accid = %i";
            Sql_Query(SqlHandle, pfmtQuery, CharID, sd->accid);

            break;
        }
        case 0x1F:
        {
            if (session[sd->login_lobbydata_fd] == nullptr) {
                ShowInfo("0x1F nullptr pointer: fd %i lobbydata fd %i lobbyview fd %i . Closing session. \n",
                    fd, sd->login_lobbydata_fd, sd->login_lobbyview_fd);
                uint32 val = 1337;
                if (sd->login_lobbydata_fd - 1 >= 0 && session[sd->login_lobbydata_fd - 1] != nullptr) {
                    val = session[sd->login_lobbydata_fd - 1]->client_addr;
                }
                ShowInfo("Details: %s ip %i and lobbydata-1 fd ip is %i\n", sd->login, sd->client_addr, val);
                do_close_tcp(fd);
                return -1;
            }
            memset(session[sd->login_lobbydata_fd]->wdata, 0, 5);
            WBUFB(session[sd->login_lobbydata_fd]->wdata, 0) = 0x01;
            WFIFOSET(sd->login_lobbydata_fd, 5);
        }
        break;
        case 0x24:
        {
            LOBBY_024_RESERVEPACKET(ReservePacket);
            memcpy(ReservePacket + 36, login_config.servername, dsp_cap(strlen(login_config.servername), 0, 15));

            unsigned char Hash[16];

            md5((unsigned char*)(ReservePacket), Hash, 64);

            memcpy(ReservePacket + 12, Hash, 16);
            uint8 SendBuffSize = 64;
            memcpy(session[fd]->wdata, ReservePacket, SendBuffSize);
            RFIFOSKIP(fd, session[fd]->rdata_size);
            RFIFOFLUSH(fd);
            WFIFOSET(fd, SendBuffSize);

        }
        break;
        case 0x07:
        {
            if (session[sd->login_lobbydata_fd] == nullptr) {
                ShowInfo("0x07 nullptr pointer: fd %i lobbydata fd %i lobbyview fd %i . Closing session. \n",
                    fd, sd->login_lobbydata_fd, sd->login_lobbyview_fd);
                uint32 val = 1337;
                if (sd->login_lobbydata_fd - 1 >= 0 && session[sd->login_lobbydata_fd - 1] != nullptr) {
                    val = session[sd->login_lobbydata_fd - 1]->client_addr;
                }
                ShowInfo("Details: %s ip %i and lobbydata-1 fd ip is %i\n", sd->login, sd->client_addr, val);
                do_close_tcp(fd);
                return -1;
            }

            memset(session[sd->login_lobbydata_fd]->wdata, 0, 5);
            WBUFB(session[sd->login_lobbydata_fd]->wdata, 0) = 0x02;
            WFIFOSET(sd->login_lobbydata_fd, 5);
        }
        break;
        case 0x21:
        {

            //creating new char
            if (lobby_createchar(sd, (char*)session[fd]->rdata) == -1)
            {
                do_close_lobbyview(sd, fd);
                return -1;
            }
            char lobbydata_code[] = { 0x15, 0x07 };
            //				session[sd->login_lobbydata_fd]->wdata[0]  = 0x15;
            //				session[sd->login_lobbydata_fd]->wdata[1]  = 0x07;
            //				WFIFOSET(sd->login_lobbydata_fd,2);
            ShowStatus(CL_WHITE"lobbyview_parse" CL_RESET": char <" CL_WHITE"%s" CL_RESET"> was successfully created\n", sd->charname);
            /////////////////////////
            LOBBY_ACTION_DONE(ReservePacket);
            unsigned char hash[16];

            int32 sendsize = 32;
            //memset(ReservePacket+12,0,sizeof(16));
            md5((unsigned char*)(ReservePacket), hash, sendsize);

            memcpy(ReservePacket + 12, hash, sizeof(hash));
            memcpy(session[fd]->wdata, ReservePacket, sendsize);
            WFIFOSET(fd, sendsize);
            RFIFOSKIP(fd, session[fd]->rdata_size);
            RFIFOFLUSH(fd);

        }
        break;
        case 0x22:
        {

            //creating new char
            char CharName[15];
            memset(CharName, 0, sizeof(CharName));
            memcpy(CharName, session[fd]->rdata + 32, sizeof(CharName));

            //find assigns
            const char *fmtQuery = "SELECT charname FROM chars WHERE charname LIKE '%s'";

            int32 sendsize = 0x24;
            unsigned char MainReservePacket[0x24];


            if (Sql_Query(SqlHandle, fmtQuery, CharName) == SQL_ERROR)
            {
                //do_close_lobbyview
                do_close_lobbyview(sd, fd);
                return -1;
            }

            if (Sql_NumRows(SqlHandle) != 0)
            {
                ShowWarning(CL_WHITE"lobbyview_parse:" CL_RESET" character name " CL_WHITE"<%s>" CL_RESET"already taken\n", CharName);
                LOBBBY_ERROR_MESSAGE(ReservePacket);
                // устанавливаем код ошибки

                // The character name you entered is unavailable. Please choose another name.
                // сообщение отображается на японском
                WBUFW(ReservePacket, 32) = 313;
                memcpy(MainReservePacket, ReservePacket, sendsize);
            }
            else {
                //copy charname
                memcpy(sd->charname, CharName, 15);
                sendsize = 0x20;
                LOBBY_ACTION_DONE(ReservePacket);
                memcpy(MainReservePacket, ReservePacket, sendsize);
            }
            unsigned char hash[16];

            md5(MainReservePacket, hash, sendsize);
            memcpy(MainReservePacket + 12, hash, 16);
            memcpy(session[fd]->wdata, MainReservePacket, sendsize);
            RFIFOSKIP(fd, session[fd]->rdata_size);
            RFIFOFLUSH(fd);

            WFIFOSET(fd, sendsize);
        }
        break;
        default:
            break;
        }
    }
    return 0;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 do_close_lobbyview(login_session_data_t* sd, int32 fd)
{
    ShowInfo(CL_WHITE"lobbyview_parse" CL_RESET": " CL_WHITE"%s" CL_RESET" shutdown the socket\n", sd->login);
    do_close_tcp(fd);
    return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 lobby_createchar(login_session_data_t *loginsd, char *buf)
{
    // инициализируем генератор случайных чисел
    srand(clock());
    char_mini createchar;

    memcpy(createchar.m_name, loginsd->charname, 16);
    memset(&createchar.m_look, 0, sizeof(look_t));

    createchar.m_look.race = RBUFB(buf, 48);
    createchar.m_look.size = RBUFB(buf, 57);
    createchar.m_look.face = RBUFB(buf, 60);

    // Validate that the job is a starting job.
    uint8 mjob = RBUFB(buf, 50);
    createchar.m_mjob = dsp_cap(mjob, 1, 6);

    // Log that the character attempting to create a non-starting job.
    if (mjob != createchar.m_mjob) {
        ShowInfo(
            CL_WHITE"lobby_createchar" CL_RESET": "
            CL_WHITE"%s" CL_RESET" attempted to create invalid starting job "
            CL_WHITE"%d" CL_RESET" substituting "
            CL_WHITE"%d" CL_RESET"\n",
            loginsd->charname,
            mjob,
            createchar.m_mjob);
    }

    createchar.m_nation = RBUFB(buf, 54);

    switch (createchar.m_nation)
    {
    case 0x02: // windy start
        //do not allow windy walls as startzone.
        do { createchar.m_zone = (0xEE) + rand() % 4; } while (createchar.m_zone == 0xEF);
        break;
    case 0x01: // bastok start
        createchar.m_zone = 0xEA + rand() % 3;
        break;
    case 0x00: // sandy start
        createchar.m_zone = 0xE6 + rand() % 3;
        break;
    }

    const int8* fmtQuery = "SELECT max(charid) FROM chars";

    if (Sql_Query(SqlHandle, fmtQuery) == SQL_ERROR)
    {
        return -1;
    }

    uint32 CharID = 0;

    if (Sql_NumRows(SqlHandle) != 0)
    {
        Sql_NextRow(SqlHandle);

        CharID = (uint32)Sql_GetUIntData(SqlHandle, 0) + 1;
    }

    CharID = (CharID < 21828 ? 21828 : CharID);

    if (lobby_createchar_save(loginsd->accid, CharID, &createchar) == -1)
        return -1;

    ShowDebug(CL_WHITE"lobby_createchar" CL_RESET": char<" CL_WHITE"%s" CL_RESET"> successfully saved\n", createchar.m_name);
    return 0;
};

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 lobby_createchar_save(uint32 accid, uint32 charid, char_mini* createchar)
{
    const int8* Query = "INSERT INTO chars(charid,accid,charname,pos_zone,nation) VALUES(%u,%u,'%s',%u,%u);";

    if (Sql_Query(SqlHandle, Query, charid, accid, createchar->m_name, createchar->m_zone, createchar->m_nation) == SQL_ERROR)
    {
        ShowDebug(CL_WHITE"lobby_ccsave" CL_RESET": char<" CL_WHITE"%s" CL_RESET">, accid: %u, charid: %u\n", createchar->m_name, accid, charid);
        return -1;
    }

    Query = "INSERT INTO char_look(charid,face,race,size) VALUES(%u,%u,%u,%u);";

    if (Sql_Query(SqlHandle, Query, charid, createchar->m_look.face, createchar->m_look.race, createchar->m_look.size) == SQL_ERROR)
    {
        ShowDebug(CL_WHITE"lobby_cLook" CL_RESET": char<" CL_WHITE"%s" CL_RESET">, charid: %u\n", createchar->m_name, charid);

        return -1;
    }

    Query = "INSERT INTO char_stats(charid,mjob) VALUES(%u,%u);";

    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR)
    {
        ShowDebug(CL_WHITE"lobby_cStats" CL_RESET": charid: %u\n", charid);

        return -1;
    }




    // people reported char creation errors, here is a fix.

    Query = "INSERT INTO char_exp(charid) VALUES(%u) \
			ON DUPLICATE KEY UPDATE charid = charid;";
    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR) return -1;

    Query = "INSERT INTO char_jobs(charid) VALUES(%u) \
			ON DUPLICATE KEY UPDATE charid = charid;";
    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR) return -1;

    Query = "INSERT INTO char_points(charid) VALUES(%u) \
			ON DUPLICATE KEY UPDATE charid = charid;";
    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR) return -1;

    Query = "INSERT INTO char_profile(charid) VALUES(%u) \
			ON DUPLICATE KEY UPDATE charid = charid;";
    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR) return -1;

    Query = "INSERT INTO char_storage(charid) VALUES(%u) \
			ON DUPLICATE KEY UPDATE charid = charid;";
    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR) return -1;



    //hot fix
    Query = "DELETE FROM char_inventory WHERE charid = %u";
    if (Sql_Query(SqlHandle, Query, charid) == SQL_ERROR) return -1;

    Query = "INSERT INTO char_inventory(charid) VALUES(%u);";
    if (Sql_Query(SqlHandle, Query, charid, createchar->m_mjob) == SQL_ERROR) return -1;




    return 0;
}