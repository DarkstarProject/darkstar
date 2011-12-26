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

#include <sstream>

#include "commandhandler.h"
#include "charentity.h"

#include "lua/lua_baseentity.h"

#include "packets/message_debug.h"


/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

bool CCommandHandler::init(const int8* InitCmdInIPath, lua_State* InitLState)
{
	m_CmdInIPath = InitCmdInIPath;
	m_LState = InitLState;
	if( luaL_loadfile(m_LState,m_CmdInIPath.c_str()) || lua_pcall(m_LState,0,0,0) )
	{
		ShowError("cmdhandler::init: Error - %s",lua_tostring(m_LState,-1));
		lua_pop(m_LState,1);
		return false;
	}

	lua_pushstring(m_LState,"commands_ini");
	lua_gettable(m_LState,LUA_GLOBALSINDEX);

	if( lua_isnil(m_LState,-1) || !lua_istable(m_LState,-1) )
	{
		ShowError("cmdhandler::init: Error - Can't load main table commands_ini\n");
		return false;
	}

	lua_pushnil(m_LState);
	while( lua_next(m_LState,-2) )
	{
		if( !lua_istable(m_LState,-1) )
		{
			ShowWarning("cmdhandler::init: Error can't load command table at line %d\n",lua_tonumber(m_LState,-2));
			lua_pop(m_LState,-1);
			continue;
		}
		cmd_t SomthCmds;

		/*getting cmd name*/
		lua_pushstring(m_LState,"name");
		lua_gettable(m_LState,-2);
		if(lua_tostring(m_LState,-1) != NULL)
		{
			SomthCmds.CmdName = lua_tostring(m_LState,-1);
			lua_pop(m_LState,1);
		}else{
			ShowWarning("cmdhandler::init:can't load cmd's name, line %d",m_ListCmds.size()+1);
			lua_pop(m_LState,1);
			continue;
		};
		/*getting cmd path*/
		lua_pushstring(m_LState,"path");
		lua_gettable(m_LState,-2);
		
		if(lua_tostring(m_LState,-1) != NULL)
		{
			SomthCmds.CmdPath = lua_tostring(m_LState,-1);
			lua_pop(m_LState,1);
		}else{
			SomthCmds.CmdPath = m_CmdInIPath;
		};
		/*getting cmd parameters*/
		lua_pushstring(m_LState,"parameters");
		lua_gettable(m_LState,-2);
		if( lua_tostring(m_LState,-1) != NULL )
		{
			SomthCmds.CmdParameters = lua_tostring(m_LState,-1);
			/*pop key and value*/
			lua_pop(m_LState,1);
		}
		m_ListCmds.push_back(SomthCmds);
		/*pop somthcommand table*/
		lua_pop(m_LState,1);
	}
	/*pop commands_ini table*/
	lua_pop(m_LState,1);
	ShowStatus("cmdhandler::init: initializing...\t\t - "CL_GREEN"[OK]"CL_RESET"\n");
	return true;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

bool CCommandHandler::free()
{
	m_ListCmds.clear();
	return true;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 CCommandHandler::call(CCharEntity* PChar, const int8* commandline)
{
	std::istringstream clstream(commandline);
	std::string cmdname;
	clstream >> cmdname;

	if( cmdname.empty()) 
	{
		ShowError("cmdhandler::call: function name is empty\n"); 
		return -1;
	}

	const cmd_t* CmdHandler = 0;
	for( ListCmds_t::iterator cmd_iter = m_ListCmds.begin(); cmd_iter != m_ListCmds.end(); ++cmd_iter)
	{
		if( (*cmd_iter).CmdName == cmdname )
		{
			CmdHandler = &(*cmd_iter);
			break;
		}
	}
	if (CmdHandler == 0) 
	{
		PChar->pushPacket(new CMessageDebugPacket(PChar,PChar,0,0,27));
		ShowDebug("cmdhandler::call: function <%s> not found\n", cmdname.c_str());
		return -1;
	}

	//Загрузка файла команды.
	if( luaL_loadfile(m_LState,std::string(CmdHandler->CmdPath+"/"+CmdHandler->CmdName+".lua").c_str()) ||
		lua_pcall(m_LState,0,0,0) )
	{
		ShowError("cmdhandler::call: %s\n",lua_tostring(m_LState,-1));
		lua_pop(m_LState,1);
		return -1;
	}

	//Загрузка адреса функции в стек.
	lua_pushstring(m_LState, "onTrigger");
	lua_gettable(m_LState,LUA_GLOBALSINDEX);

	if( lua_isnil(m_LState,-1) || !lua_isfunction(m_LState,-1) )
	{
		ShowError("cmdhandler::call: can't load the function: onTrigger\n");
		lua_pop(m_LState,-1);
		return -1;
	}

	//Добавление самого первого параметра
	CLuaBaseEntity LuaCmdCaller(PChar);
	int32 cntparam = 0;
	if( PChar != NULL )
	{
		Lunar<CLuaBaseEntity>::push(m_LState,&LuaCmdCaller);
		cntparam += 1;
	}

	/* цикл просмотра строки передаваемых значений*/
	std::string::const_iterator param_iter = CmdHandler->CmdParameters.begin();
	
	std::string param;
	while( param_iter != CmdHandler->CmdParameters.end() &&
		   !clstream.eof() )
	{
		clstream >> param;
		switch( *param_iter )
		{
			case 's':
			{
				++cntparam;
				lua_pushstring(m_LState,param.c_str());
			}
				break;
			case 'i':
			{
				int32 buff_val = atoi(param.c_str());
				lua_pushnumber(m_LState,buff_val);
				++cntparam;	
			}
				break;
			case 'd':
			{
				double buff_val = atof(param.c_str());
				lua_pushnumber(m_LState,buff_val);
				++cntparam;	
			}
				break;
			default:
				ShowError("cmdhandler::call: undefined type symbol:%s\n",*param_iter);
		};
		++param_iter;
	}

	//Вызов функции.
	int32 status = lua_pcall(m_LState,cntparam,0,0);
	if( status )
	{
		ShowError("cmdhandler::call: %s\n", lua_tostring(m_LState,-1));
		lua_pop(m_LState,1);
		return -1;
	}
	return 0;
}

