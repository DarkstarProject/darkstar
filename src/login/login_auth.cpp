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

#include "../common/malloc.h"
#include "../common/showmsg.h"
#include "../common/socket.h"

#include "account.h"
#include "login.h"
#include "login_auth.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
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
	if( ( fd = connect_client(listenfd,client_address) ) != -1 )
	{
		create_session(fd, recv_to_fifo, send_from_fifo, login_parse);
		session[fd]->client_addr = ntohl(client_address.sin_addr.s_addr);
		return fd;
	}
	return -1;
}

int32 login_parse(int32 fd)
{
	login_session_data_t* sd = (login_session_data_t*)session[fd]->session_data;

	//check if sd will not defined
	if( sd == NULL )
	{
		CREATE(session[fd]->session_data,login_session_data_t,1);
		sd = (login_session_data_t*)session[fd]->session_data;
		login_sd_list.push_back(sd);
		sd->client_addr = session[fd]->client_addr;
		sd->login_fd	= fd;
	}

	if( session[fd]->flag.eof )
	{
		do_close_login(sd,fd);
		return 0;
	}

	//all auth packets have one structure: 
	// [login][passwords][code] => summary assign 33 bytes
	if( session[fd]->rdata_size == 33 )
	{
		unsigned char* buff = session[fd]->rdata;
		int8 code = RBUFB(buff,32);

		char login[17];
		char password[17];

		memset(login,0,sizeof(login));
		memset(sd->login,0,sizeof(sd->login));
		memset(password,0,sizeof(password));

		memcpy(login,buff,16);
		memcpy(sd->login,login,16);
		memcpy(password,buff+16,16);

		//data check
		if( login_datacheck(login,3,sizeof(login)) == -1 ||
			login_datacheck(password,6,sizeof(password)) == -1 )
		{
			ShowWarning(CL_WHITE"login_parse"CL_RESET":"CL_WHITE"%s"CL_RESET" send unreadable data\n",ip2str(sd->client_addr,NULL));
			WBUFB(session[fd]->wdata,0) = LOGIN_ERROR;
			WFIFOSET(fd,1);
			do_close_login(sd,fd);
			return -1;
		}

		switch(code)
		{
		case LOGIN_ATTEMPT:
			{
			const int8* fmtQuery = "SELECT accounts.id,accounts.status \
									FROM accounts \
									WHERE accounts.login = '%s' AND accounts.password = PASSWORD('%s')";

			int32 ret = Sql_Query(SqlHandle,fmtQuery,login,password);	
			if( ret != SQL_ERROR  && Sql_NumRows(SqlHandle) != 0)
			{
				ret = Sql_NextRow(SqlHandle);

				sd->accid   = (uint32)Sql_GetUIntData(SqlHandle,0);
				uint8 status = (uint8)Sql_GetUIntData(SqlHandle,1);

				if( status & ACCST_NORMAL )
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
					Sql_Query(SqlHandle,fmtQuery,sd->accid);

					memset(session[fd]->wdata,0,33);
					WBUFB(session[fd]->wdata,0) = LOGIN_SUCCESS;
					WBUFL(session[fd]->wdata,1) = sd->accid;
					WFIFOSET(fd,33);
					flush_fifo(fd);
					do_close_tcp(fd);
				}
				else if( status & ACCST_BANNED)
				{
					memset(session[fd]->wdata,0,33);
				//	WBUFB(session[fd]->wdata,0) = LOGIN_SUCCESS;
					WFIFOSET(fd,33);
					do_close_login(sd,fd);
				}
				ShowInfo("login_parse:"CL_WHITE"<%s>"CL_RESET" was connected\n",login,status);
				return 0;
			}else{
				WBUFB(session[fd]->wdata,0) = LOGIN_ERROR;
				WFIFOSET(fd,1);
				ShowWarning("login_parse: unexisting user"CL_WHITE"<%s>"CL_RESET" tried to connect\n",login);
				do_close_login(sd,fd);
			}
			}
			break;
		case LOGIN_CREATE:
			//looking for same login
			if( Sql_Query(SqlHandle,"SELECT accounts.id FROM accounts WHERE accounts.login = '%s'",login) == SQL_ERROR )
			{
				WBUFB(session[fd]->wdata,0) = LOGIN_ERROR_CREATE;
				WFIFOSET(fd,1);
				do_close_login(sd,fd);
				return -1;
			}
						
			if( Sql_NumRows(SqlHandle) == 0 )
			{
				//creating new account_id 
				char *fmtQuery = "SELECT max(accounts.id) FROM accounts;";

				uint32 accid = 0;

				if( Sql_Query(SqlHandle,fmtQuery) != SQL_ERROR  && Sql_NumRows(SqlHandle) != 0)
				{
					Sql_NextRow(SqlHandle);
					
					accid = Sql_GetUIntData(SqlHandle,0)+1;
				}else{
					WBUFB(session[fd]->wdata,0) = LOGIN_ERROR_CREATE;
					WFIFOSET(fd,1);
					do_close_login(sd,fd);
					return -1;
				}

				accid = (accid < 1000 ? 1000 : accid);
			
				//creating new account
				time_t timecreate;
				tm*	   timecreateinfo;

				time(&timecreate);
				timecreateinfo = localtime(&timecreate);

				char strtimecreate[128];
				strftime(strtimecreate,sizeof(strtimecreate),"%Y:%m:%d %H:%M:%S",timecreateinfo);
				fmtQuery = "INSERT INTO accounts(id,login,password,timecreate,timelastmodify,status,priv)\
									   VALUES(%d,'%s',PASSWORD('%s'),'%s',NULL,%d,%d);";

				if( Sql_Query(SqlHandle,fmtQuery,accid,login,password,
							  strtimecreate,ACCST_NORMAL,ACCPRIV_USER) == SQL_ERROR )
				{
					WBUFB(session[fd]->wdata,0) = LOGIN_ERROR_CREATE;
					WFIFOSET(fd,1);
					do_close_login(sd,fd);
					return -1;
				}

				ShowStatus(CL_WHITE"login_parse"CL_RESET": account<"CL_WHITE"%s"CL_RESET"> was created\n",login);
				WBUFB(session[fd]->wdata,0) = LOGIN_SUCCESS_CREATE;
				WFIFOSET(fd,1);
				do_close_login(sd,fd);
			}else{
				ShowWarning(CL_WHITE"login_parse"CL_RESET": account<"CL_WHITE"%s"CL_RESET"> already exists\n",login);
				WBUFB(session[fd]->wdata,0) = LOGIN_ERROR_CREATE;
				WFIFOSET(fd,1);
				do_close_login(sd,fd);
			}
			break;
		default:
			ShowWarning("login_parse: undefined code:[%d], ip sender:<%s>\n",code,ip2str(session[fd]->client_addr,NULL));
			do_close_login(sd,fd);
			break;
		};
		//RFIFOSKIP(fd,33);
	}else{
		do_close_login(sd,fd);
	}
	return 0;
};


int32 do_close_login(login_session_data_t* loginsd,int32 fd)
{
	ShowInfo(CL_WHITE"login_parse"CL_RESET":"CL_WHITE"%s"CL_RESET"shutdown socket...\n",ip2str(loginsd->client_addr,NULL));
	erase_loginsd(fd);
	if(session[fd]->session_data)
		aFree(session[fd]->session_data);
	do_close_tcp(fd);
	return 0;
}

int8 login_datacheck(const char *buf,size_t MinSize, size_t MaxSize)
{
	size_t str_size = strnlen(buf,MaxSize);
	if( str_size < MinSize )
	{
		return -1;
	}

	for( size_t i = 0; i < str_size; ++i )
	{
		if( !isalpha(buf[i]) && !isdigit(buf[i]) )
			return -1;
	}
	return 0;
}
