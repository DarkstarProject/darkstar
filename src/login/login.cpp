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
#include "../common/mmo.h"
#include "../common/malloc.h"
#include "../common/showmsg.h"
#include "../common/timer.h"
#include "../common/version.h"
#include "../common/strlib.h"
#include "../common/utils.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <thread>

#include "login.h"
#include "login_auth.h"
#include "lobby.h"
#include "message_server.h"

const char* LOGIN_CONF_FILENAME = nullptr;
const char* VERSION_INFO_FILENAME = nullptr;

//lan_config_t   lan_config;		// lan settings
login_config_t login_config;	//main settings
version_info_t version_info;


Sql_t *SqlHandle = nullptr;
std::thread messageThread;

int32 do_init(int32 argc, char** argv)
{
    int32 i;
    LOGIN_CONF_FILENAME = "conf/login_darkstar.conf";
    VERSION_INFO_FILENAME = "version.info";

    const char *lan_cfgName = LAN_CONFIG_NAME;
    //srand(gettick());

    for (i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "--h") == 0 || strcmp(argv[i], "--?") == 0 || strcmp(argv[i], "/?") == 0)
            login_helpscreen(1);
        else if (strcmp(argv[i], "--version") == 0 || strcmp(argv[i], "--v") == 0 || strcmp(argv[i], "-v") == 0 || strcmp(argv[i], "/v") == 0)
            login_versionscreen(1);
        else if (strcmp(argv[i], "--login_config") == 0 || strcmp(argv[i], "--login-config") == 0)
            LOGIN_CONF_FILENAME = argv[i + 1];
        else if (strcmp(argv[i], "--lan_config") == 0 || strcmp(argv[i], "--lan-config") == 0)
            lan_cfgName = argv[i + 1];
        else if (strcmp(argv[i], "--run_once") == 0)	// close the map-server as soon as its done.. for testing [Celest]
            runflag = 0;
    }

    //lan_config_default(&lan_config);
    //lan_config_read(lan_cfgName,&lan_config);

    login_config_default();
    login_config_read(LOGIN_CONF_FILENAME);

    version_info_default();
    version_info_read(VERSION_INFO_FILENAME);


    login_fd = makeListenBind_tcp(login_config.uiLoginAuthIp, login_config.usLoginAuthPort, connect_client_login);
    ShowStatus("The login-server-auth is " CL_GREEN"ready" CL_RESET" (Server is listening on the port %u).\n\n", login_config.usLoginAuthPort);

    login_lobbydata_fd = makeListenBind_tcp(login_config.uiLobbyDataIp, login_config.usLobbyDataPort, connect_client_lobbydata);
    ShowStatus("The login-server-lobbydata is " CL_GREEN"ready" CL_RESET" (Server is listening on the port %u).\n\n", login_config.usLobbyDataPort);

    login_lobbyview_fd = makeListenBind_tcp(login_config.uiLobbyViewIp, login_config.usLobbyViewPort, connect_client_lobbyview);
    ShowStatus("The login-server-lobbyview is " CL_GREEN"ready" CL_RESET" (Server is listening on the port %u).\n\n", login_config.usLobbyViewPort);

    SqlHandle = Sql_Malloc();
    if (Sql_Connect(SqlHandle, login_config.mysql_login,
        login_config.mysql_password,
        login_config.mysql_host,
        login_config.mysql_port,
        login_config.mysql_database) == SQL_ERROR)
    {
        exit(EXIT_FAILURE);
    }
    Sql_Keepalive(SqlHandle);

    const char *fmtQuery = "OPTIMIZE TABLE `accounts`,`accounts_banned`, `accounts_sessions`, `chars`,`char_equip`, \
						   `char_inventory`, `char_jobs`,`char_look`,`char_stats`, `char_vars`, `char_bazaar_msg`, \
						   `char_skills`, `char_titles`, `char_effects`, `char_exp`;";

    if (Sql_Query(SqlHandle, fmtQuery) == SQL_ERROR)
    {
        ShowError("do_init: Impossible to optimise tables\n");
    }

    messageThread = std::thread(message_server_init);

    ShowStatus("The login-server is " CL_GREEN"ready" CL_RESET" to work...\n");
    return 0;
}

void do_final(int code)
{
    aFree((void*)login_config.mysql_host);
    aFree((void*)login_config.mysql_login);
    aFree((void*)login_config.mysql_password);
    aFree((void*)login_config.mysql_database);

    message_server_close();
    if (messageThread.joinable())
    {
        messageThread.join();
    }

    Sql_Free(SqlHandle);

    timer_final();
    socket_final();
    malloc_final();

    exit(code);
}

void do_abort(void)
{
    do_final(EXIT_FAILURE);
}
void set_server_type()
{
    SERVER_TYPE = DARKSTAR_SERVER_LOGIN;
}

int do_sockets(fd_set* rfd, int next)
{
    struct timeval timeout;
    int ret, i;


    // can timeout until the next tick
    timeout.tv_sec = next / 1000;
    timeout.tv_usec = next % 1000 * 1000;


    memcpy(rfd, &readfds, sizeof(*rfd));
    ret = sSelect(fd_max, rfd, nullptr, nullptr, &timeout);

    if (ret == SOCKET_ERROR)
    {
        if (sErrno != S_EINTR)
        {
            ShowFatalError("do_sockets: select() failed, error code %d!\n", sErrno);
            exit(EXIT_FAILURE);
        }
        return 0; // interrupted by a signal, just loop and try again
    }

    last_tick = time(nullptr);

#if defined(WIN32)
    // on windows, enumerating all members of the fd_set is way faster if we access the internals
    for (i = 0; i < (int)rfd->fd_count; ++i)
    {
        int fd = sock2fd(rfd->fd_array[i]);
        if (session[fd])
        {
            session[fd]->func_recv(fd);

            if (fd != login_fd &&
                fd != login_lobbydata_fd &&
                fd != login_lobbyview_fd)
            {
                session[fd]->func_parse(fd);

                if (!session[fd])
                    continue;

                //				RFIFOFLUSH(fd);
            }
        }
    }
#else
    // otherwise assume that the fd_set is a bit-array and enumerate it in a standard way
    for (i = 1; ret && i < fd_max; ++i)
    {
        if (sFD_ISSET(i, rfd) && session[i])
        {
            session[i]->func_recv(i);

            if (session[i])
            {

                if (i != login_fd &&
                    i != login_lobbydata_fd &&
                    i != login_lobbyview_fd)
                {
                    session[i]->func_parse(i);

                    if (!session[i])
                        continue;

                    //							RFIFOFLUSH(fd);
                }
                --ret;
            }
        }
    }
#endif

    /*
        // parse input data on each socket
    for(i = 1; i < fd_max; i++)
    {
        if(!session[i])
            continue;

        if (session[i]->rdata_tick && DIFF_TICK(last_tick, session[i]->rdata_tick) > stall_time) {
            ShowInfo("Session #%d timed out\n", i);
            set_eof(i);
        }

        session[i]->func_parse(i);

        if(!session[i])
            continue;

        // after parse, check client's RFIFO size to know if there is an invalid packet (too big and not parsed)
        if (session[i]->rdata_size == RFIFO_SIZE && session[i]->max_rdata == RFIFO_SIZE) {
            set_eof(i);
            continue;
        }
        RFIFOFLUSH(i);
    }*/


    for (i = 1; i < fd_max; i++)
    {
        if (!session[i])
            continue;

        if (session[i]->wdata_size)
            session[i]->func_send(i);
    }
    return 0;
}

int parse_console(char *buf)
{
    return 0;
}

int32 login_config_read(const char *cfgName)
{
    char line[1024], w1[1024], w2[1024];
    FILE *fp;

    fp = fopen(cfgName, "r");
    if (fp == nullptr)
    {
        ShowError("login configuration file not found at: %s\n", cfgName);
        return 1;
    }

    while (fgets(line, sizeof(line), fp))
    {
        char* ptr;

        if (line[0] == '#')
            continue;
        if (sscanf(line, "%[^:]: %[^\t\r\n]", w1, w2) < 2)
            continue;

        //Strip trailing spaces
        ptr = w2 + strlen(w2);
        while (--ptr >= w2 && *ptr == ' ');
        ptr++;
        *ptr = '\0';

        if (strcmpi(w1, "timestamp_format") == 0)
        {
            strncpy(timestamp_format, w2, 19);
        }
        else if (strcmpi(w1, "stdout_with_ansisequence") == 0)
        {
            stdout_with_ansisequence = config_switch(w2);
        }
        else if (strcmpi(w1, "console_silent") == 0)
        {
            ShowInfo("Console Silent Setting: %d\n", atoi(w2));
            msg_silent = atoi(w2);
        }
        else if (strcmp(w1, "mysql_host") == 0)
        {
            login_config.mysql_host = aStrdup(w2);
        }
        else if (strcmp(w1, "mysql_login") == 0)
        {
            login_config.mysql_login = aStrdup(w2);
        }
        else if (strcmp(w1, "mysql_password") == 0)
        {
            login_config.mysql_password = aStrdup(w2);
        }
        else if (strcmp(w1, "mysql_port") == 0)
        {
            login_config.mysql_port = atoi(w2);
        }
        else if (strcmp(w1, "mysql_database") == 0)
        {
            login_config.mysql_database = aStrdup(w2);
        }
        else if (strcmp(w1, "search_server_port") == 0)
        {
            login_config.search_server_port = atoi(w2);
        }
        else if (strcmp(w1, "expansions") == 0)
        {
            login_config.expansions = atoi(w2);
        }
        else if (strcmp(w1, "servername") == 0)
        {
            login_config.servername = aStrdup(w2);
        }
        else if (strcmpi(w1, "import") == 0)
        {
            login_config_read(w2);
        }
        else if (strcmp(w1, "msg_server_port") == 0)
        {
            login_config.msg_server_port = atoi(w2);
        }
        else if (strcmp(w1, "msg_server_ip") == 0)
        {
            login_config.msg_server_ip = aStrdup(w2);
        }
        else
        {
            ShowWarning("Unknown setting '%s' in file %s\n", w1, cfgName);
        }
    }

    fclose(fp);
    return 0;
}

int32 version_info_read(const char *fileName)
{
    char line[1024], w1[1024], w2[1024];
    FILE *fp;

    fp = fopen(fileName, "r");
    if (fp == nullptr)
    {
        ShowError("version info file not found at: %s\n", fileName);
        return 1;
    }

    while (fgets(line, sizeof(line), fp))
    {
        char* ptr;

        if (line[0] == '#')
            continue;
        if (sscanf(line, "%[^:]: %[^\t\r\n]", w1, w2) < 2)
            continue;

        //Strip trailing spaces
        ptr = w2 + strlen(w2);
        while (--ptr >= w2 && *ptr == ' ');
        ptr++;
        *ptr = '\0';

        if (strcmp(w1, "Min_Client_Ver") == 0)
        {
            version_info.Min_Client_Ver = aStrdup(w2);
        }
    }
    fclose(fp);
    return 0;
}

int32 login_config_default()
{
    login_config.uiLobbyDataIp = INADDR_ANY;
    login_config.usLobbyDataPort = 54230;
    login_config.uiLobbyViewIp = INADDR_ANY;
    login_config.usLobbyViewPort = 54001;
    login_config.uiLoginAuthIp = INADDR_ANY;
    login_config.usLoginAuthPort = 54231;

    login_config.expansions = 0xFFFF;
    login_config.servername = "DarkStar";

    login_config.mysql_host = "";
    login_config.mysql_login = "";
    login_config.mysql_password = "";
    login_config.mysql_database = "";
    login_config.mysql_port = 3306;

    login_config.search_server_port = 54002;
    login_config.msg_server_port = 54003;
    login_config.msg_server_ip = "127.0.0.1";
    return 0;
}

int32 version_info_default()
{
    version_info.Min_Client_Ver = "99999999_9"; // xxYYMMDD_m = xx:MajorRelease YY:year MM:month DD:day _m:MinorRelease
    // version_info.DSP_VER = 0;
    return 0;
}

void login_versionscreen(int32 flag)
{
    ShowInfo(CL_WHITE "Darkstar version %d.%02d.%02d" CL_RESET"\n",
        DARKSTAR_MAJOR_VERSION, DARKSTAR_MINOR_VERSION, DARKSTAR_REVISION);
    ShowInfo(CL_GREEN "Forum:" CL_RESET "\thttp://forums.dspt.info/\n");
    if (flag) exit(EXIT_FAILURE);
}

void login_helpscreen(int32 flag)
{
    ShowMessage("Usage: login-server [options]\n");
    ShowMessage("Options:\n");
    ShowMessage(CL_WHITE"  Commands\t\t\tDescription\n" CL_RESET);
    ShowMessage("-----------------------------------------------------------------------------\n");
    ShowMessage("  --help, --h, --?, /?		Displays this help screen\n");
    ShowMessage("  --login-config <file>	Load login-server configuration from <file>\n");
    ShowMessage("  --lan-config	  <file>	Load lan configuration from <file>\n");
    ShowMessage("  --version, --v, -v, /v	Displays the server's version\n");
    ShowMessage("\n");
    if (flag) exit(EXIT_FAILURE);
}

void log_init(int argc, char** argv)
{
    std::string logFile;

#ifdef DEBUGLOGLOGIN
#ifdef WIN32
    logFile = "log\\login-server.log";
#else
    logFile = "log/login-server.log";
#endif
#endif
    for (int i = 1; i < argc; i++)
    {
        if (strcmp(argv[i], "--log") == 0)
        {
            logFile = argv[i + 1];
        }
    }
    InitializeLog(logFile);
}

///////////////////////////////////////////////////////
////////////////////////////////////////////////////////
