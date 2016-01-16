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

#include <sstream>
#include "commandhandler.h"
#include "entities/charentity.h"
#include "lua/lua_baseentity.h"

void CCommandHandler::init(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(L == nullptr);
    m_LState = L;
}

int32 CCommandHandler::call(CCharEntity* PChar, const int8* commandline)
{
    std::istringstream clstream(commandline);
    std::string cmdname;
    clstream >> cmdname;

    if (!PChar)
    {
        ShowError("cmdhandler::call: nullptr character attempted to use command\n");
        return -1;
    }
    if (cmdname.empty())
    {
        ShowError("cmdhandler::call: function name was empty\n");
        return -1;
    }

    int8 filePath[255] = { 0 };
    snprintf(filePath, sizeof(filePath), "scripts/commands/%s.lua", cmdname.c_str());

    if (luaL_loadfile(m_LState, filePath) || lua_pcall(m_LState, 0, 0, 0))
    {
        ShowError("cmdhandler::call: (%s): %s\n", cmdname.c_str(), lua_tostring(m_LState, -1));
        lua_pop(m_LState, 1);
        return -1;
    }

    lua_getglobal(m_LState, "cmdprops");
    if (lua_isnil(m_LState, -1) || !lua_istable(m_LState, -1))
    {
        lua_pop(m_LState, -1);
        ShowError("cmdhandler::call: (%s): Undefined 'cmdprops' table\n", cmdname.c_str());
        return -1;
    }

    // Attempt to obtain the command permissions..
    lua_pushstring(m_LState, "permission");
    lua_gettable(m_LState, -2);

    if (lua_isnil(m_LState, -1) || !lua_isnumber(m_LState, -1))
    {
        lua_pop(m_LState, -1);
        ShowError("cmdhandler::call: (%s): Invalid or no permission field set in cmdprops\n", cmdname.c_str());

        // Delete the cmdprops table..
        lua_pushnil(m_LState);
        lua_setglobal(m_LState, "cmdprops");

        return -1;
    }

    int8 permission = lua_tonumber(m_LState, -1);
    lua_pop(m_LState, 1); // pop number..

    // Attempt to obtain the command parameters..
    lua_pushstring(m_LState, "parameters");
    lua_gettable(m_LState, -2);

    if (lua_isnil(m_LState, -1) || !lua_isstring(m_LState, -1))
    {
        lua_pop(m_LState, -1);
        ShowError("cmdhandler::call: (%s): Invalid or no parameter field set in cmdprops\n", cmdname.c_str());

        // Delete the cmdprops table..
        lua_pushnil(m_LState);
        lua_setglobal(m_LState, "cmdprops");

        return -1;
    }

    const int8* parameters = luaL_checkstring(m_LState, -1);
    if (parameters == nullptr)
    {
        lua_pop(m_LState, -1);
        ShowError("cmdhandler::call: (%s): Invalid or no parameter field set in cmdprops\n", cmdname.c_str());

        // Delete the cmdprops table..
        lua_pushnil(m_LState);
        lua_setglobal(m_LState, "cmdprops");

        return -1;
    }

    lua_pop(m_LState, 1); // pop string..
    lua_pop(m_LState, 1); // pop table..

    // Ensure this user can use this command..
    if (permission > PChar->m_GMlevel)
    {
        ShowWarning("cmdhandler::call: Character %s attempting to use higher permission command %s\n", PChar->name.c_str(), cmdname.c_str());

        // Delete the cmdprops table..
        lua_pushnil(m_LState);
        lua_setglobal(m_LState, "cmdprops");

        return -1;
    }

    // Ensure the onTrigger function exists for this command..
    lua_getglobal(m_LState, "onTrigger");
    if (lua_isnil(m_LState, -1) || !lua_isfunction(m_LState, -1))
    {
        lua_pop(m_LState, -1);
        ShowError("cmdhandler::call: (%s) missing onTrigger function\n", cmdname.c_str());

        // Delete the cmdprops table..
        lua_pushnil(m_LState);
        lua_setglobal(m_LState, "cmdprops");

        return -1;
    }

    // Push the calling character (if exists)..
    CLuaBaseEntity LuaCmdCaller(PChar);
    int32 cntparam = 0;

    Lunar<CLuaBaseEntity>::push(m_LState, &LuaCmdCaller);
    cntparam += 1;

    // Prepare parameters..
    std::string param;
    std::string cmdparameters(parameters);
    std::string::const_iterator parameter = cmdparameters.cbegin();

    // Parse and push parameters based on symbol string..
    while (parameter != cmdparameters.cend() && !clstream.eof())
    {
        clstream >> param;

        switch (*parameter)
        {
        case 's':
            if (cmdparameters.size() == 1)
            {
                std::string str = param;
                while (!clstream.eof())
                {
                    clstream >> param;
                    str += " " + param;
                }
                lua_pushstring(m_LState, str.c_str());
                ++cntparam;
                break;
            }
            lua_pushstring(m_LState, param.c_str());
            ++cntparam;
            break;

        case 'i':
            lua_pushnumber(m_LState, atoi(param.c_str()));
            ++cntparam;
            break;

        case 'd':
            lua_pushnumber(m_LState, atof(param.c_str()));
            ++cntparam;
            break;

        default:
            ShowError("cmdhandler::call: (%s) undefined type for param; symbol: %s\n", cmdname.c_str(), *parameter);
            break;
        }

        ++parameter;
    }

    // Call the function..
    int32 status = lua_pcall(m_LState, cntparam, 0, 0);
    if (status)
    {
        ShowError("cmdhandler::call: (%s) error: %s\n", cmdname.c_str(), lua_tostring(m_LState, -1));
        lua_pop(m_LState, -1);

        // Delete the cmdprops table..
        lua_pushnil(m_LState);
        lua_setglobal(m_LState, "cmdprops");

        return -1;
    }

    // Delete the cmdprops table..
    lua_pushnil(m_LState);
    lua_setglobal(m_LState, "cmdprops");

    return 0;
}
