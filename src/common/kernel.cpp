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

#ifndef GITVERSION
	static char dsp_git_version[1024] = "";
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
				do_final(EXIT_SUCCESS);
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

#ifdef GITVERSION
#define xstringify(x) stringify(x)
#define stringify(x) #x
const char* get_git_revision(void)
{
    return xstringify(GITVERSION);
}
#else

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

const char* get_git_revision(void)
{
    FILE *fp = NULL;

    // Pull lastest fetch version from FETCH_HEAD..
    if ((fp = fopen(".git/FETCH_HEAD", "r")) != NULL)
    {
        int8 line[1024], w1[1024], w2[1024];

        fgets(line, 1024, fp);
        sscanf(line, "%[a-zA-Z0-9] %[^\t\r\n]", w1, w2);
        snprintf(dsp_git_version, sizeof(dsp_git_version), "%s", w1);
        fclose(fp);
    }

    // If no version was found, mark as unknown..
    if (!(*dsp_git_version))
    {
        snprintf(dsp_git_version, sizeof(dsp_git_version), "Unknown");
    }
    
    return dsp_git_version;
}
#endif

/************************************************************************
*																		*
*  CORE : Display title													*
*																		*
************************************************************************/

static void display_title(void)
{
	ShowInfo("DarkStar - Git Revision Hash: " CL_WHITE"%s" CL_RESET".\n", get_git_revision());
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

    log_init(argc, argv);
	malloc_init();
	set_server_type();
	display_title();
	usercheck();
	signals_init();
	timer_init();
	socket_init();

	do_init(argc,argv);
	fd_set rfd;
	{// Main runtime cycle
		duration next;

		while (runflag) 
		{
            next = CTaskMgr::getInstance()->DoTimer(server_clock::now());
			do_sockets(&rfd,next);
		}
	}

    do_final(EXIT_SUCCESS);
	return 0;
}
