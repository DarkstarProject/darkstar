/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../common/kernel.h"
#include "../common/malloc.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/taskmgr.h"
#include "../common/timer.h"
#include "../common/version.h"

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <cstring>

#ifndef _WIN32
	#include <unistd.h>
#endif


int runflag = 1;
int arg_c = 0;
char **arg_v = NULL;

char *SERVER_NAME = NULL;
char  SERVER_TYPE = DARKSTAR_SERVER_NONE;
#ifndef SVNVERSION
	static char dsp_svn_version[10] = "";
#endif

// Copyright (c) Athena Dev Teams 
// Added by Gabuzomeu
//
// This is an implementation of signal() using sigaction() for portability.
// (sigaction() is POSIX; signal() is not.)  Taken from Stevens' _Advanced
// Programming in the UNIX Environment_.

#ifdef WIN32	// windows don't have SIGPIPE
	#define SIGPIPE SIGINT
#endif

#ifndef POSIX
	#define compat_signal(signo, func) signal(signo, func)
#else
sigfunc *compat_signal(int signo, sigfunc *func)
{
	struct sigaction sact, oact;

	sact.sa_handler = func;
	sigemptyset(&sact.sa_mask);
	sact.sa_flags = 0;
#ifdef SA_INTERRUPT
	sact.sa_flags |= SA_INTERRUPT;	/* SunOS */
#endif

	if (sigaction(signo, &sact, &oact) < 0)
		return (SIG_ERR);

	return (oact.sa_handler);
}
#endif

/************************************************************************
*																		*
*  CORE : Signal Sub Function											*
*																		*
************************************************************************/

static void sig_proc(int sn)
{
	static int is_called = 0;

	switch (sn) 
	{
		case SIGINT:
		case SIGTERM:
			if (++is_called > 3)
				exit(EXIT_SUCCESS);
			runflag = 0;
			break;
		case SIGSEGV:
		case SIGFPE:
			do_abort();
			// Pass the signal to the system's default handler
			compat_signal(sn, SIG_DFL);
			raise(sn);
			break;
#ifndef _WIN32
		case SIGXFSZ:
			// ignore and allow it to set errno to EFBIG
			ShowWarning ("Max file size reached!\n");
			//run_flag = 0;	// should we quit?
			break;
		case SIGPIPE:
			//ShowInfo ("Broken pipe found... closing socket\n");	// set to eof in socket.c
			break;	// does nothing here
#endif
	}
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void signals_init (void)
{
	compat_signal(SIGTERM, sig_proc);
	compat_signal(SIGINT, sig_proc);
#ifndef _DEBUG // need unhandled exceptions to debug on Windows
	compat_signal(SIGSEGV, sig_proc);
	compat_signal(SIGFPE, sig_proc);
#endif
#ifndef _WIN32
	compat_signal(SIGILL, SIG_DFL);
	compat_signal(SIGXFSZ, sig_proc);
	compat_signal(SIGPIPE, sig_proc);
	compat_signal(SIGBUS, SIG_DFL);
	compat_signal(SIGTRAP, SIG_DFL);
#endif
}

#ifdef SVNVERSION
#define xstringify(x) stringify(x)
#define stringify(x) #x
const char* get_svn_revision(void)
{
	return xstringify(SVNVERSION);
}
#else

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

const char* get_svn_revision(void)
{
	FILE *fp;

    //
    // Subversion 1.7 and above.. (Uses Sqlite)
    //

    if (dsp_svn_version[0] != '\0')
        return dsp_svn_version;

    if ( (fp = fopen( ".svn/wc.db", "rb" )) != NULL )
    {
        fseek( fp, 0L, SEEK_END );
        size_t nLength = ftell( fp );
        fseek( fp, 0L, SEEK_SET );
        
        char* buffer = (char*)aMalloc( nLength + 1 );
        nLength = fread( buffer, 1, nLength, fp );
        buffer[ nLength ] = '\0';
        fclose( fp );

        const char* prefix = "!svn/ver/";
        const char* postfix = "/trunk";

        for (size_t x = strlen( prefix ) + 1; x + strlen( postfix ) <= nLength; ++x)
        {
            if (buffer[x] != postfix[0] || memcmp( buffer + x, postfix, sizeof( postfix ) ) != 0)
                continue;

            size_t y = 0;
            for (y = x; y > 0; --y)
                if (!ISDIGIT(buffer[y - 1]))
                    break;

            if (memcmp( buffer + y - strlen( prefix ), prefix, sizeof( prefix ) ) != 0)
                continue;

            snprintf(dsp_svn_version, sizeof(dsp_svn_version), "%d", atoi(buffer + y));
        }
        
        aFree( buffer );
        
        if (dsp_svn_version[0] != '\0')
            return dsp_svn_version;
    }

    //
    // Subversion 1.6 and below..
    //

    if(*dsp_svn_version)
		return dsp_svn_version;

	if ((fp = fopen(".svn/entries", "r")) != NULL)
	{
		char line[1024];
		int rev;
		// Check the version
		if (fgets(line, sizeof(line), fp))
		{
			if(!ISDIGIT(line[0]))
			{
				// XML File format
				while (fgets(line,sizeof(line),fp))
				{
					if (strstr(line,"revision=")) break;
				}
				if (sscanf(line," %*[^\"]\"%d%*[^\n]", &rev) == 1) 
				{
					snprintf(dsp_svn_version, sizeof(dsp_svn_version), "%d", rev);
				}
			}
			else
			{
				// Bin File format
				fgets(line, sizeof(line), fp);		// Get the name
				fgets(line, sizeof(line), fp);		// Get the entries kind
				if(fgets(line, sizeof(line), fp))	// Get the rev numver
				{
					snprintf(dsp_svn_version, sizeof(dsp_svn_version), "%d", atoi(line));
				}
			}
		}
		fclose(fp);
	}

	if(!(*dsp_svn_version))
	{
		snprintf(dsp_svn_version, sizeof(dsp_svn_version), "Unknown");
	}
	return dsp_svn_version;
}
#endif

/************************************************************************
*																		*
*  CORE : Display title													*
*																		*
************************************************************************/

static void display_title(void)
{
	ShowInfo("DarkStar - SVN Revision: " CL_WHITE"%s" CL_RESET".\n", get_svn_revision());
}

/************************************************************************
*																		*
*  Warning if logged in as superuser (root)								*
*																		*
************************************************************************/

void usercheck(void)
{
#ifndef _WIN32
    if ((getuid() == 0) && (getgid() == 0)) 
	{
		ShowWarning ("You are running DSP as the root superuser.\n");
		ShowWarning ("It is unnecessary and unsafe to run with root privileges.\n");
		sleep(3);
    }
#endif
}

/************************************************************************
*																		*
*  CORE : MAINROUTINE													*
*																		*
************************************************************************/

int main (int argc, char **argv)
{
	{// initialize program arguments
		char *p1 = SERVER_NAME = argv[0];
		char *p2 = p1;
		while ((p1 = strchr(p2, '/')) != NULL || (p1 = strchr(p2, '\\')) != NULL)
		{
			SERVER_NAME = ++p1;
			p2 = p1;
		}
		arg_c = argc;
		arg_v = argv;
	}

	malloc_init();
	set_server_type();
	display_title();
	usercheck();
	signals_init();
	timer_init();
	socket_init();

	do_init(argc,argv);

	{// Main runtime cycle
		int next;

		while (runflag) 
		{
			next = CTaskMgr::getInstance()->DoTimer(gettick_nocache());
			do_sockets(next);
		}
	}

	do_final();
	timer_final();
	socket_final();
	malloc_final();
	return 0;
}
