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

#include "../common/malloc.h"
#include "../common/showmsg.h"
#include "../common/socket.h"

#include "account.h"
#include "login.h"
#include "login_auth.h"
#include "message_server.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include <algorithm>

int32 login_fd;					//main fd(socket) of server

/*
*
*		LOGIN SECTION
*
*/
int32 connect_client_login(int32 listenfd)
{
    int32 fd = 0;
    struct sockaddr_in client_address;
    if ((fd = connect_client(listenfd, client_address)) != -1)
    {
        int32 code = create_session(fd, recv_to_fifo, send_from_fifo, login_parse);
        session[fd]->client_addr = ntohl(client_address.sin_addr.s_addr);
        return fd;
    }
    return -1;
}

int32 login_parse(int32 fd)
{
    login_session_data_t* sd = (login_session_data_t*)session[fd]->session_data;

    //check if sd will not defined
    if (sd == nullptr)
    {
        CREATE(session[fd]->session_data, login_session_data_t, 1);
        sd = (login_session_data_t*)session[fd]->session_data;
        sd->serviced = 0;
        login_sd_list.push_back(sd);
        sd->client_addr = session[fd]->client_addr;
        sd->login_fd = fd;
    }

    if (session[fd]->flag.eof)
    {
        do_close_login(sd, fd);
        return 0;
    }

    //all auth packets have one structure:
    // [login][passwords][code] => summary assign 33 bytes
    if (session[fd]->rdata_size == 33)
    {
        char* buff = session[fd]->rdata;
        int8 code = RBUFB(buff, 32);

        std::string name(buff, buff + 16);
        std::string password(buff + 16, buff + 32);

        std::fill_n(sd->login, sizeof sd->login, '\0');
        std::copy(name.cbegin(), name.cend(), sd->login);

        //data check
        if (check_string(name, 16) && check_string(password, 16))
        {
            ShowWarning(CL_WHITE"login_parse" CL_RESET":" CL_WHITE"%s" CL_RESET" send unreadable data\n", ip2str(sd->client_addr, nullptr));
            WBUFB(session[fd]->wdata, 0) = LOGIN_ERROR;
            WFIFOSET(fd, 1);
            do_close_login(sd, fd);
            return -1;
        }

        switch (code)
        {
        case LOGIN_ATTEMPT:
        {
            const int8* fmtQuery = "SELECT accounts.id,accounts.status \
									FROM accounts \
									WHERE accounts.login = '%s' AND accounts.password = PASSWORD('%s')";
            int32 ret = Sql_Query(SqlHandle, fmtQuery, name.c_str(), password.c_str());
            if (ret != SQL_ERROR  && Sql_NumRows(SqlHandle) != 0)
            {
                ret = Sql_NextRow(SqlHandle);

                sd->accid = (uint32)Sql_GetUIntData(SqlHandle, 0);
                uint8 status = (uint8)Sql_GetUIntData(SqlHandle, 1);

                if (status & ACCST_NORMAL)
                {
                    //fmtQuery = "SELECT * FROM accounts_sessions WHERE accid = %d AND client_port <> 0";

                    //int32 ret = Sql_Query(SqlHandle,fmtQuery,sd->accid);

                    //if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 )
                    //{
                    //	WBUFB(session[fd]->wdata,0) = 0x05; // SESSION has already activated
                    //	WFIFOSET(fd,33);
                    //	do_close_login(sd,fd);
                    //	return 0;
                    //}
                    fmtQuery = "UPDATE accounts SET accounts.timelastmodify = NULL WHERE accounts.id = %d";
                    Sql_Query(SqlHandle, fmtQuery, sd->accid);
                    fmtQuery = "SELECT charid, server_addr, server_port \
                                FROM accounts_sessions JOIN accounts \
                                ON accounts_sessions.accid = accounts.id \
                                WHERE accounts.id = %d;";
                    ret = Sql_Query(SqlHandle, fmtQuery, sd->accid);
                    if (ret != SQL_ERROR  && Sql_NumRows(SqlHandle) == 1)
                    {
                        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                        {
                            uint32 charid = Sql_GetUIntData(SqlHandle, 0);
                            uint64 ip = Sql_GetUIntData(SqlHandle, 1);
                            uint64 port = Sql_GetUIntData(SqlHandle, 2);

                            ip |= (port << 32);

                            zmq::message_t chardata(sizeof(charid));
                            WBUFL(chardata.data(), 0) = charid;
                            zmq::message_t empty(0);

                            queue_message(ip, MSG_LOGIN, &chardata, &empty);
                        }
                    }
                    memset(session[fd]->wdata, 0, 33);
                    WBUFB(session[fd]->wdata, 0) = LOGIN_SUCCESS;
                    WBUFL(session[fd]->wdata, 1) = sd->accid;
                    WFIFOSET(fd, 33);
                    flush_fifo(fd);
                    do_close_tcp(fd);
                }
                else if (status & ACCST_BANNED)
                {
                    memset(session[fd]->wdata, 0, 33);
                    //	WBUFB(session[fd]->wdata,0) = LOGIN_SUCCESS;
                    WFIFOSET(fd, 33);
                    do_close_login(sd, fd);
                }

                //////22/03/2012 Fix for when a client crashes before fully logging in:
                //				Before: When retry to login, would freeze client since login data corrupt.
                //				After: Removes older login info if a client logs in twice (based on acc id!)

                //check for multiple logins from this account id
                int numCons = 0;
                for (login_sd_list_t::iterator i = login_sd_list.begin(); i != login_sd_list.end(); ++i) {
                    if ((*i)->accid == sd->accid) {
                        numCons++;
                    }
                }

                if (numCons > 1) {
                    ShowInfo("login_parse:" CL_WHITE"<%s>" CL_RESET" has logged in %i times! Removing older logins.\n", name.c_str(), numCons);
                    for (int j = 0; j < (numCons - 1); j++) {
                        for (login_sd_list_t::iterator i = login_sd_list.begin(); i != login_sd_list.end(); ++i) {
                            if ((*i)->accid == sd->accid) {
                                //ShowInfo("Current login fd=%i Removing fd=%i \n",sd->login_fd,(*i)->login_fd);
                                login_sd_list.erase(i);
                                break;
                            }
                        }
                    }
                }
                //////

                ShowInfo("login_parse:" CL_WHITE"<%s>" CL_RESET" was connected\n", name.c_str(), status);
                return 0;
            }
            else {
                WBUFB(session[fd]->wdata, 0) = LOGIN_ERROR;
                WFIFOSET(fd, 1);
                ShowWarning("login_parse: unexisting user" CL_WHITE"<%s>" CL_RESET" tried to connect\n", name.c_str());
                do_close_login(sd, fd);
            }
        }
        break;
        case LOGIN_CREATE:
            //looking for same login
            if (Sql_Query(SqlHandle, "SELECT accounts.id FROM accounts WHERE accounts.login = '%s'", name.c_str()) == SQL_ERROR)
            {
                WBUFB(session[fd]->wdata, 0) = LOGIN_ERROR_CREATE;
                WFIFOSET(fd, 1);
                do_close_login(sd, fd);
                return -1;
            }

            if (Sql_NumRows(SqlHandle) == 0)
            {
                //creating new account_id
                char *fmtQuery = "SELECT max(accounts.id) FROM accounts;";

                uint32 accid = 0;

                if (Sql_Query(SqlHandle, fmtQuery) != SQL_ERROR  && Sql_NumRows(SqlHandle) != 0)
                {
                    Sql_NextRow(SqlHandle);

                    accid = Sql_GetUIntData(SqlHandle, 0) + 1;
                }
                else {
                    WBUFB(session[fd]->wdata, 0) = LOGIN_ERROR_CREATE;
                    WFIFOSET(fd, 1);
                    do_close_login(sd, fd);
                    return -1;
                }

                accid = (accid < 1000 ? 1000 : accid);

                //creating new account
                time_t timecreate;
                tm*	   timecreateinfo;

                time(&timecreate);
                timecreateinfo = localtime(&timecreate);

                char strtimecreate[128];
                strftime(strtimecreate, sizeof(strtimecreate), "%Y:%m:%d %H:%M:%S", timecreateinfo);
                fmtQuery = "INSERT INTO accounts(id,login,password,timecreate,timelastmodify,status,priv)\
									   VALUES(%d,'%s',PASSWORD('%s'),'%s',NULL,%d,%d);";

                if (Sql_Query(SqlHandle, fmtQuery, accid, name.c_str(), password.c_str(),
                    strtimecreate, ACCST_NORMAL, ACCPRIV_USER) == SQL_ERROR)
                {
                    WBUFB(session[fd]->wdata, 0) = LOGIN_ERROR_CREATE;
                    WFIFOSET(fd, 1);
                    do_close_login(sd, fd);
                    return -1;
                }

                ShowStatus(CL_WHITE"login_parse" CL_RESET": account<" CL_WHITE"%s" CL_RESET"> was created\n", name.c_str());
                WBUFB(session[fd]->wdata, 0) = LOGIN_SUCCESS_CREATE;
                WFIFOSET(fd, 1);
                do_close_login(sd, fd);
            }
            else {
                ShowWarning(CL_WHITE"login_parse" CL_RESET": account<" CL_WHITE"%s" CL_RESET"> already exists\n", name.c_str());
                WBUFB(session[fd]->wdata, 0) = LOGIN_ERROR_CREATE;
                WFIFOSET(fd, 1);
                do_close_login(sd, fd);
            }
            break;
        default:
            ShowWarning("login_parse: undefined code:[%d], ip sender:<%s>\n", code, ip2str(session[fd]->client_addr, nullptr));
            do_close_login(sd, fd);
            break;
        };
        //RFIFOSKIP(fd,33);
    }
    else {
        do_close_login(sd, fd);
    }
    return 0;
};


int32 do_close_login(login_session_data_t* loginsd, int32 fd)
{
    ShowInfo(CL_WHITE"login_parse" CL_RESET":" CL_WHITE"%s" CL_RESET"shutdown socket...\n", ip2str(loginsd->client_addr, nullptr));
    erase_loginsd(fd);
    if (session[fd]->session_data)
        aFree(session[fd]->session_data);
    do_close_tcp(fd);
    return 0;
}

bool check_string(std::string const& str, std::size_t max_length)
{
    return !str.empty() && str.size() <= max_length && std::all_of(str.cbegin(), str.cend(), [](char const& c) { return c >= 0x20; });
}
