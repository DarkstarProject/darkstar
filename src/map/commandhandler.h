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

#ifndef _COMMAND_HANDLER_H
#define _COMMAND_HANDLER_H

#include "../common/cbasetypes.h"
#include "../common/lua/lua.hpp"
#include "../common/showmsg.h"

//#include "lua/lua_baseentity.h"

#include <string>
#include <list>

#define USERLEVEL_ALL		0xff
#define USERLEVEL_PLAYER	0x01
#define USERLEVEL_GM		0x02
#define USERLEVEL_SGM		0x04

/************************************************************************
*																		*
*  Структура инициализирующего файла CmdHandler, представлена			*
*  записями следующего типа.											*
*																		*
************************************************************************/

const uint32 MaxCmdNameSize  = 32;
const uint32 MaxCmdPathSize  = 256;
const uint32 MaxAmntParams   = 6;
const uint32 MaxReturnValues = 6;
const uint32 MaxLineSize     = MaxCmdNameSize+MaxCmdPathSize+MaxAmntParams+24;

struct cmd_t
{
	std::string  CmdName;
	std::string  CmdPath;
	uint8        CmdPermissionLvl;
	std::string  CmdParameters;
};

typedef std::list<cmd_t> ListCmds_t;

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CCharEntity;

class CCommandHandler
{
	lua_State*		m_LState;			// handle lvm
	std::string		m_CmdInIPath;		// path to cmds descriptions
	ListCmds_t		m_ListCmds;			// list exitsing commands

public:

	CCommandHandler()
	{
		//char BuffString[256];
		//GetCurrentDirectory(256,BuffString);
		//std::string BuffString;
		//m_CmdInIPath = BuffString;
		//m_CmdInIPath += InitCmdInIPath;
	};

	bool	init(const int8* InitCmdInIPath, lua_State* InitLState);	// Инициализация списка команд.
	bool	free();														// Освобождение занятых заранее ресурсов 

	int32	call(CCharEntity* PChar, const int8* commandline);			// Вызов сценария.

	~CCommandHandler() {}
};
#endif