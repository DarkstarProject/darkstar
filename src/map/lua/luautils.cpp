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

#include "../../common/lua/lunar.h"
#include "../../common/showmsg.h"
#include "../../common/timer.h"
#include "../../common/utils.h"

#include <string.h>

#include "luautils.h"
#include "lua_ability.h"
#include "lua_baseentity.h"
#include "lua_instance.h"
#include "lua_region.h"
#include "lua_spell.h"
#include "lua_statuseffect.h"
#include "lua_mobskill.h"
#include "lua_trade_container.h"
#include "lua_zone.h"

#include "../alliance.h"
#include "../ability.h"
#include "../baseentity.h"
#include "../battleutils.h"
#include "../charentity.h"
#include "../conquest_system.h"
#include "../map.h"
#include "../mobentity.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../vana_time.h"
#include "../zoneutils.h"
#include "../transport.h"
#include "../packets/auction_house.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/char.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/message_basic.h"
#include "../packets/uncnown_39.h"

namespace luautils
{
lua_State*  LuaHandle = NULL;

/************************************************************************
*																		*
*  Инициализация lua, пользовательских классов и глобальных функций		*
*																		*
************************************************************************/

int32 init()
{
	ShowStatus("luautils::init:lua initializing...");
	LuaHandle = lua_open();
	luaL_openlibs(LuaHandle);

	lua_register(LuaHandle,"print",luautils::print);
	lua_register(LuaHandle,"GetNPCByID",luautils::GetNPCByID);
	lua_register(LuaHandle,"GetMobByID",luautils::GetMobByID);
	lua_register(LuaHandle,"GetMobIDByJob",luautils::GetMobIDByJob);
	lua_register(LuaHandle,"WeekUpdateConquest", luautils::WeekUpdateConquest);
    lua_register(LuaHandle,"GetRegionOwner", luautils::GetRegionOwner);
	lua_register(LuaHandle,"setMobPos",luautils::setMobPos);
	lua_register(LuaHandle,"SpawnMob",luautils::SpawnMob);
	lua_register(LuaHandle,"DespawnMob",luautils::DespawnMob);
	lua_register(LuaHandle,"GetPlayerByName",luautils::GetPlayerByName);
	lua_register(LuaHandle,"GetMobAction",luautils::GetMobAction);
	lua_register(LuaHandle,"VanadielTOTD",luautils::VanadielTOTD);
	lua_register(LuaHandle,"VanadielHour",luautils::VanadielHour);
	lua_register(LuaHandle,"VanadielMinute",luautils::VanadielMinute);
	lua_register(LuaHandle,"VanadielDayOfTheMonth",luautils::VanadielDayOfTheMonth);
	lua_register(LuaHandle,"VanadielDayOfTheYear",luautils::VanadielDayOfTheYear);
	lua_register(LuaHandle,"VanadielYear",luautils::VanadielYear);
	lua_register(LuaHandle,"VanadielMonth",luautils::VanadielMonth);
	lua_register(LuaHandle,"VanadielDayElement",luautils::VanadielDayElement);
	lua_register(LuaHandle,"VanadielMoonPhase",luautils::VanadielMoonPhase);
	lua_register(LuaHandle,"VanadielMoonDirection", luautils::VanadielMoonDirection);
    lua_register(LuaHandle,"SetVanadielTimeOffset",luautils::SetVanadielTimeOffset);
	lua_register(LuaHandle,"IsMoonFull",luautils::IsMoonFull);
	lua_register(LuaHandle,"RunElevator",luautils::StartElevator);
	lua_register(LuaHandle,"GetServerVariable",luautils::GetServerVariable);
	lua_register(LuaHandle,"SetServerVariable",luautils::SetServerVariable);
    lua_register(LuaHandle,"SendUncnown0x39Packet",luautils::SendUncnown0x39Packet);

	lua_register(LuaHandle,"GetMobRespawnTime",luautils::GetMobRespawnTime);
	lua_register(LuaHandle,"DeterMob",luautils::DeterMob);
	lua_register(LuaHandle,"UpdateNMSpawnPoint",luautils::UpdateNMSpawnPoint);
	lua_register(LuaHandle,"SetDropRate",luautils::SetDropRate);

	lua_register(LuaHandle,"getCorsairRollEffect",luautils::getCorsairRollEffect);
    lua_register(LuaHandle,"getSpell",luautils::getSpell);

    Lunar<CLuaAbility>::Register(LuaHandle);
	Lunar<CLuaBaseEntity>::Register(LuaHandle);
    Lunar<CLuaInstance>::Register(LuaHandle);
    Lunar<CLuaMobSkill>::Register(LuaHandle);
    Lunar<CLuaRegion>::Register(LuaHandle);
	Lunar<CLuaSpell>::Register(LuaHandle);
	Lunar<CLuaStatusEffect>::Register(LuaHandle);
	Lunar<CLuaTradeContainer>::Register(LuaHandle);
	Lunar<CLuaZone>::Register(LuaHandle);

	ShowMessage("\t\t - " CL_GREEN"[OK]" CL_RESET"\n");
	return 0;
}

/************************************************************************
*																		*
*  Освобождение lua														*
*																		*
************************************************************************/

int32 free()
{
	ShowStatus(CL_WHITE"luautils::free" CL_RESET":lua free...");
	lua_close(LuaHandle);
	ShowMessage("\t - " CL_GREEN"[OK]" CL_RESET"\n");
	return 0;
}

/************************************************************************
*																		*
*  Переопределение официальной lua функции print						*
*																		*
************************************************************************/

int32 print(lua_State* LuaHandle)
{
	if( !lua_isnil(LuaHandle,-1) && lua_isstring(LuaHandle,-1) )
	{
		ShowScript("%s\n",lua_tostring(LuaHandle,-1));
	}
	return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 SendUncnown0x39Packet(lua_State* L)
{
    if((!lua_isnil(L,1) && lua_isnumber(L,1)) &&
       (!lua_isnil(L,2) && lua_isnumber(L,2)) )
	{
		uint32 npcid = (uint32)lua_tointeger(L,1);
        uint8  param = (uint8)lua_tointeger(L,2);

		CBaseEntity* PNpc = zoneutils::GetEntity(npcid, TYPE_NPC);

        if (PNpc != NULL)
        {
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CUncnown0x39Packet(PNpc, param));
        }
		return 0;
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 GetNPCByID(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		uint32 npcid = (uint32)lua_tointeger(L, -1);

		CBaseEntity* PNpc = zoneutils::GetEntity(npcid, TYPE_NPC);

		if(PNpc == NULL){
			ShowWarning("luautils::GetNPCByID NPC doesn't exist (%d)\n", npcid);
			lua_pushnil(L);
		} else {
			lua_pushstring(L,CLuaBaseEntity::className);
			lua_gettable(L,LUA_GLOBALSINDEX);
			lua_pushstring(L,"new");
			lua_gettable(L,-2);
			lua_insert(L,-2);
			lua_pushlightuserdata(L,(void*)PNpc);
			lua_pcall(L,2,1,0);
		}

		return 1;
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 GetMobByID(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L, -1);

		CBaseEntity* PMob = zoneutils::GetEntity(mobid, TYPE_MOB);

		if(PMob == NULL){
			ShowWarning("luautils::GetMobByID Mob doesn't exist (%d)\n", mobid);
			lua_pushnil(L);
		} else {
			lua_pushstring(L,CLuaBaseEntity::className);
			lua_gettable(L,LUA_GLOBALSINDEX);
			lua_pushstring(L,"new");
			lua_gettable(L,-2);
			lua_insert(L,-2);
			lua_pushlightuserdata(L,(void*)PMob);
			lua_pcall(L,2,1,0);
		}

		return 1;
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
* GetMobIDByJob															*
* Get a mobid by his job (used in dynamis)								*
* GetMobIDByJob(mobid_min,mobid_max,mobjob)								*
************************************************************************/

int32 GetMobIDByJob(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1) || lua_isnil(L,2) || !lua_isnumber(L,2) || lua_isnil(L,3) || !lua_isnumber(L,3));

	uint32 id_min = (uint32)lua_tointeger(L,1);
	uint32 id_max = (uint32)lua_tointeger(L,2);
	JOBTYPE mobJob = (JOBTYPE)lua_tointeger(L,3);

	for(uint32 mobid = id_min; mobid <= id_max; mobid++)
	{
		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		
		if(PMob != NULL && 
		   PMob->isDead() && 
		   !(PMob->m_Type & MOBTYPE_NOTORIOUS) && 
		   (PMob->m_Family < 92 || PMob->m_Family > 95) && PMob->m_Family != 4 && 
		   PMob->GetMJob() == mobJob)
		{
			lua_pushinteger(L,PMob->id);
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
* WeekUpdateConquest		*
*																		*
************************************************************************/

int32 WeekUpdateConquest(lua_State* L)
{
    conquest::UpdateConquestGM();

    return 0;
}

/************************************************************************
*                                                                       *
*  Узнаем страну, владеющую текущим регионом                            *
*                                                                       *
************************************************************************/

int32 GetRegionOwner(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger(L, conquest::GetRegionOwner((REGIONTYPE)lua_tointeger(L,1)));
    return 1;
}

/************************************************************************
*																		*
* SetRegionalConquestOverseers() used for updating conquest guards		*
*																		*
************************************************************************/

int32 SetRegionalConquestOverseers()
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "SetRegionalConquestOverseers");

	snprintf(File, sizeof(File), "scripts/globals/conquest.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::SetRegionalConquestOverseers: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "SetRegionalConquestOverseers");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::SetRegionalConquestOverseers: undefined procedure onServerStart\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::SetRegionalConquestOverseers: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Получаем текущее время суток Vana'diel								*
*																		*
************************************************************************/

int32 VanadielTOTD(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->GetCurrentTOTD());
	return 1;
}

/************************************************************************
*																		*
*	Return Vanadiel Year												*
*																		*
************************************************************************/

int32 VanadielYear(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getYear());
	return 1;
}


/************************************************************************
*																		*
*	Return Vanadiel Month												*
*																		*
************************************************************************/

int32 VanadielMonth(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getMonth());
	return 1;
}

/************************************************************************
*																		*
*	Return Vanadiel Day of Year											*
*																		*
************************************************************************/

int32 VanadielDayOfTheYear(lua_State* L)
{
	int32 day;
	int32 month;

	day = CVanaTime::getInstance()->getDayOfTheMonth();
	month = CVanaTime::getInstance()->getMonth();

	lua_pushinteger(L, (month * 30 - 30) + day);
	return 1;
}

/************************************************************************
*																		*
*	Return Vanadiel Day	of the Month									*
*																		*
************************************************************************/

int32 VanadielDayOfTheMonth(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getDayOfTheMonth());
	return 1;
}

/************************************************************************
*																		*
*	Return Vanadiel Hour												*
*																		*
************************************************************************/

int32 VanadielHour(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getHour());
	return 1;
}

/************************************************************************
*																		*
*	Return Vanadiel Minute												*
*																		*
************************************************************************/

int32 VanadielMinute(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getMinute());
	return 1;
}

/************************************************************************
*																		*
*	Return Vanadiel Day element											*
*																		*
************************************************************************/

int32 VanadielDayElement(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getWeekday());
	return 1;
}

/************************************************************************
*																		*
*	Return Moon Phase													*
*																		*
************************************************************************/

int32 VanadielMoonPhase(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getMoonPhase());
	return 1;
}


int32 SetVanadielTimeOffset(lua_State* L)
{
    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        int32 offset = (int32)lua_tointeger(L,1);

        CVanaTime::getInstance()->setCustomOffset(offset);

        lua_pushboolean(L, true);
        return 1;
    }
    lua_pushnil(L);
    return 0;
}

/************************************************************************
*																		*
*	Return Moon Phasing Direction										*
*																		*
************************************************************************/

int32 VanadielMoonDirection(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getMoonDirection());
	return 1;
}


/************************************************************************
*																		*
*	is full moon?														*
*																		*
************************************************************************/

int32 IsMoonFull(lua_State* L)
{
	// Full moon occurs when:
	// Waxing (increasing) from 90% to 100%, 
	// Waning (decending) from 100% to 95%. 
	
	uint8 phase = CVanaTime::getInstance()->getMoonPhase();

	switch (CVanaTime::getInstance()->getMoonDirection())
	{
		case 0: // None
			lua_pushboolean(L, false);
			return 0;

		case 1: // Waning (decending)
			if (phase >= 95 && phase <= 100) {
				lua_pushboolean(L, true);
				return 1;
			}

		case 2: // Waxing (increasing)
			if (phase >= 90 && phase <= 100) {
				lua_pushboolean(L, true);
				return 1;
			}
	}
	lua_pushboolean(L, false);
	return 0;
}


/************************************************************************
*                                                                       *
*  Spawn a mob using mob ID.											*
*                                                                       *
************************************************************************/
int32 SpawnMob(lua_State* L)
{
	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L,1);

        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
        if (PMob != NULL)
        {

            if( !lua_isnil(L,2) && lua_isnumber(L,2))
            {
                PMob->SetDespawnTimer((uint32)lua_tointeger(L,2));
            }

            if( !lua_isnil(L,3) && lua_isnumber(L,3))
            {
                PMob->m_RespawnTime = (uint32)lua_tointeger(L,3) * 1000;
                PMob->m_AllowRespawn = true;
                PMob->PBattleAI->SetLastActionTime(gettick());
                if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE)
                {
                    PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
                }
            } else {
                if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
                    PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
                {
	                PMob->PBattleAI->SetLastActionTime(0);
                    PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
                } else {
                    ShowDebug(CL_CYAN"SpawnMob: <%s> is alredy spawned\n" CL_RESET, PMob->GetName());
                }
            }
            PMob->PBattleAI->CheckCurrentAction(gettick());
		    lua_pushstring(L,CLuaBaseEntity::className);
		    lua_gettable(L,LUA_GLOBALSINDEX);
		    lua_pushstring(L,"new");
		    lua_gettable(L,-2);
		    lua_insert(L,-2);
		    lua_pushlightuserdata(L,(void*)PMob);
		    lua_pcall(L,2,1,0);
		    return 1;
        } else {
            ShowDebug(CL_RED"SpawnMob: mob <%u> not found\n" CL_RESET, mobid);
        }
        return 0;
    }
    lua_pushnil(L);
    return 1;
}

/************************************************************************
*                                                                       *
*  DeSpawn mob using mob ID.											*
*                                                                       *
************************************************************************/

int32 DespawnMob(lua_State* L)
{
	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L, 1);

		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		if (PMob != NULL)
		{
			if(!lua_isnil(L,2) && lua_isnumber(L,2))
			{
				PMob->SetDespawnTimer((uint32)lua_tointeger(L,2));
			}
			else
			{
			PMob->PBattleAI->SetLastActionTime(gettick() - 12500);
			PMob->PBattleAI->SetCurrentAction(ACTION_DEATH);
		}
		}
		return 0;
	}
	lua_pushnil(L);
	return 1;
}


/************************************************************************
*                                                                       *
*  set a mobs position			                                        *
*                                                                       *
************************************************************************/

int32 setMobPos(lua_State *L)
{
	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L,1);

        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
        if (PMob != NULL)
        {
			//if mob is in battle, do not warp it
			if (PMob->m_OwnerID.id == 0 && PMob->PBattleAI->GetCurrentAction() != ACTION_ATTACK)
			{
				if( !lua_isnil(L,2) && lua_isnumber(L,2) )
					PMob->loc.p.x = (float) lua_tonumber(L,2);

				if( !lua_isnil(L,3) && lua_isnumber(L,3) )
					PMob->loc.p.y = (float) lua_tonumber(L,3);

				if( !lua_isnil(L,4) && lua_isnumber(L,4) )
					PMob->loc.p.z = (float) lua_tonumber(L,4);

				if( !lua_isnil(L,5) && lua_isnumber(L,5) )
					PMob->loc.p.rotation = (uint8) lua_tointeger(L,5);
            }
			else
			{
                ShowDebug(CL_CYAN"setMobPos: <%s> is currently in battle, will not warp it!\n" CL_RESET, PMob->GetName());
				return 1;
			}
		}
		lua_pushnil(L);
		return 0;
	}
	ShowError(CL_RED"setMobPos :: Mob ID is not valid." CL_RESET);
	return 1;
}


/************************************************************************
*                                                                       *
*  Gets a player object via the player's name. Used for GM commands.    *
*                                                                       *
************************************************************************/

int32 GetPlayerByName(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isstring(L,-1))
	{
		int8* name = (int8*)lua_tolstring(L,-1,NULL);

		CCharEntity* PTargetChar = zoneutils::GetCharByName(name);

		if (PTargetChar != NULL)
        {
			lua_pushstring(L,CLuaBaseEntity::className);
			lua_gettable(L,LUA_GLOBALSINDEX);
			lua_pushstring(L,"new");
			lua_gettable(L,-2);
			lua_insert(L,-2);
			lua_pushlightuserdata(L,(void*)PTargetChar);
			lua_pcall(L,2,1,0);
			return 1;
		}
	}
    ShowError(CL_RED"GetPlayerByName :: Input string is not valid.\n" CL_RESET);
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Get Current Mob Action by Mob ID.                                    *
*                                                                       *
************************************************************************/

int32 GetMobAction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    uint32 mobid = (uint32)lua_tointeger(L,-1);

    CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
    if (PMob != NULL)
    {
        int32 CurrentAction = (int32)PMob->PBattleAI->GetCurrentAction();
        lua_pushinteger(L, CurrentAction);
        return 1;
    }
    ShowError(CL_RED"luautils::GetMobAction: mob <%u> was not found\n" CL_RESET, mobid);
    lua_pushnil(L);
    return 1;
}

/************************************************************************
*                                                                       *
*  Загружаем значение переменной TextID указанной зоны                  *
*                                                                       *
************************************************************************/

int32 GetTextIDVariable(uint16 ZoneID, const char* variable)
{
    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, variable);

    int8 File[255];
	memset(File,0,sizeof(File));
    snprintf(File, sizeof(File), "scripts/zones/%s/TextIDs.lua", zoneutils::GetZone(ZoneID)->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_pushstring(LuaHandle,variable);
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);

	if( lua_isnil(LuaHandle,-1) || !lua_isnumber(LuaHandle,-1) )
	{
		return 0;
	}

    int32 value = lua_tonumber(LuaHandle, -1);
    lua_pop(LuaHandle, -1);
    return value;
}

/************************************************************************
*																		*
*  Выполняем скрипт при старте сервера (все монстры, npc уже загружены) *
*																		*
************************************************************************/

int32 OnServerStart()
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onServerStart");

	snprintf(File, sizeof(File), "scripts/globals/server.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnServerStart: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onServerStart");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnServerStart: undefined procedure onServerStart\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnServerStart: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Запускаем скрипт инициализации зоны.									*
*  Выполняется во время старта сервера при загрузке зон.				*
*  При разделенных lua стеках необходимо создавать их здесь				*
*																		*
************************************************************************/

int32 OnZoneInitialise(uint16 ZoneID)
{
	CZone* PZone = zoneutils::GetZone(ZoneID);

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onInitialize");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PZone->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
	  //ShowError("luautils::OnZoneInitialise: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onInitialize");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnZoneInitialise: undefined procedure onInitialize\n");
		return -1;
	}

	CLuaZone LuaZone(PZone);
	Lunar<CLuaZone>::push(LuaHandle,&LuaZone);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnZoneInitialize: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Выполняем скрипт при входе персонажа в зону							*
*																		*
************************************************************************/

int32 OnGameIn(CCharEntity* PChar)
{
	int8 File[255];
	memset(File,0,sizeof(File));

	lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onGameIn");

	snprintf(File, sizeof(File), "scripts/globals/player.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnGameIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onGameIn");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnGameIn: undefined procedure onGameIn\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushboolean(LuaHandle, PChar->loc.prevzone == 0); // first login

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnGameIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}


/************************************************************************
*																		*
*  Выполняем скрипт при входе персонажа в зону							*
*																		*
************************************************************************/

int32 OnZoneIn(CCharEntity* PChar)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onZoneIn");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnZoneIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onZoneIn");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnZoneIn: undefined procedure onZoneIn\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,PChar->loc.prevzone);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnZoneIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Персонаж входит в активный регион									*
*																		*
************************************************************************/

int32 OnRegionEnter(CCharEntity* PChar, CRegion* PRegion)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onRegionEnter");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnRegionEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onRegionEnter");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnRegionEnter: undefined procedure onRegionEnter\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
    CLuaRegion LuaRegion(PRegion);
	Lunar<CLuaRegion>::push(LuaHandle,&LuaRegion);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnRegionEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Персонаж покидает активный регион									*
*																		*
************************************************************************/

int32 OnRegionLeave(CCharEntity* PChar, CRegion* PRegion)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onRegionLeave");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnRegionLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onRegionLeave");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnRegionEnter: undefined procedure onRegionLeave\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
    CLuaRegion LuaRegion(PRegion);
	Lunar<CLuaRegion>::push(LuaHandle,&LuaRegion);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnRegionLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Персонаж обращается к какому-либо npc. Пытаемся отреагировать на		*
*  его действие															*
*																		*
************************************************************************/

int32 OnTrigger(CCharEntity* PChar, CBaseEntity* PNpc)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onTrigger");

	snprintf( File, sizeof(File), "scripts/zones/%s/npcs/%s.lua", PChar->loc.zone->GetName(),PNpc->GetName());

	PChar->m_event.reset();
    PChar->m_event.Target = PNpc;
	PChar->m_event.Script.insert(0,File);
	PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BOOST);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnTrigger: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onTrigger");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnTrigger: undefined procedure onTrigger\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaBaseEntityTarg(PNpc);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntityTarg);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnTrigger: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Запущенное событие нуждается в дополнительных параметрах				*
*																		*
************************************************************************/

int32 OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result)
{
    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEventUpdate");

	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		int8 File[255];
		memset(File,0,sizeof(File));
		snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

		if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
		{
			ShowError("luautils::OnEventUpdate %s\n", lua_tostring(LuaHandle, -1));
			ShowError("luautils::OnEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onEventUpdate");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEventUpdate: undefined procedure onEventUpdate\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,eventID);
	lua_pushinteger(LuaHandle,result);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Событие завершилось, результат события хранится в result				*
*																		*
************************************************************************/

int32 OnEventFinish(CCharEntity* PChar, uint16 eventID, uint32 result)
{
    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEventFinish");

	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		int8 File[255];
		memset(File,0,sizeof(File));
		snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

		if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
		{
			ShowError("luautils::OnEventFinish %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onEventFinish");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEventFinish: undefined procedure onEventFinish\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,eventID);
	lua_pushinteger(LuaHandle,result);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEventFinish %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	if(PChar->m_event.Script.find("/bcnms/") > 0 && PChar->health.hp <= 0){ //for some reason the event doesnt enforce death afterwards
		PChar->animation = ANIMATION_DEATH;
		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CRaiseTractorMenuPacket(PChar,TYPE_HOMEPOINT));
		PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharPacket(PChar,ENTITY_UPDATE));
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Персонаж пытается передать предмет npc								*
*																		*
************************************************************************/

int32 OnTrade(CCharEntity* PChar, CBaseEntity* PNpc)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onTrade");

	snprintf(File, sizeof(File), "scripts/zones/%s/npcs/%s.lua", PChar->loc.zone->GetName(),PNpc->GetName());

	PChar->m_event.reset();
    PChar->m_event.Target = PNpc;
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnTrade: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onTrade");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnTrade: undefined procedure onTrade\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaBaseEntityTarg(PNpc);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntityTarg);

	CLuaTradeContainer LuaTradeContainer(PChar->Container);
	Lunar<CLuaTradeContainer>::push(LuaHandle,&LuaTradeContainer);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnTrade: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnNpcSpawn(CBaseEntity* PNpc)
{
    DSP_DEBUG_BREAK_IF(PNpc == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onSpawn");

    snprintf( File, sizeof(File), "scripts/zones/%s/npcs/%s.lua", PNpc->loc.zone->GetName(), PNpc->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onSpawn");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PNpc);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::OnNpcSpawn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnNpcPath(CBaseEntity* PNpc)
{
    DSP_DEBUG_BREAK_IF(PNpc == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onPath");

    snprintf( File, sizeof(File), "scripts/zones/%s/npcs/%s.lua", PNpc->loc.zone->GetName(), PNpc->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onPath");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PNpc);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::OnNpcPath: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Начало работы статус-эффекта. Возвращаемое значение 0 или номер		*
*  сообщения															*
*																		*
************************************************************************/

int32 OnEffectGain(CBattleEntity* PEntity, CStatusEffect* PStatusEffect)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEffectGain");

	snprintf(File, sizeof(File), "scripts/%s.lua", PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectGain: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onEffectGain");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEffectGain: undefined procedure onEffectGain\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaStatusEffect LuaStatusEffect(PStatusEffect);
	Lunar<CLuaStatusEffect>::push(LuaHandle,&LuaStatusEffect);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEffectGain: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Повторяемое действие в процессе работы статус-оффекта 				*
*																		*
************************************************************************/

int32 OnEffectTick(CBattleEntity* PEntity, CStatusEffect* PStatusEffect)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEffectTick");

	snprintf(File, sizeof(File), "scripts/%s.lua", PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectTick: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onEffectTick");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEffectTick: undefined procedure onEffectTick\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaStatusEffect LuaStatusEffect(PStatusEffect);
	Lunar<CLuaStatusEffect>::push(LuaHandle,&LuaStatusEffect);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEffectTick: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Завершение работы статус-эффекта. Возвращаемое значение -1 или		*
*  номер сообщения														*
*																		*
************************************************************************/

int32 OnEffectLose(CBattleEntity* PEntity, CStatusEffect* PStatusEffect)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEffectLose");

	snprintf(File, sizeof(File), "scripts/%s.lua", PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectLose: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onEffectLose");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEffectLose: undefined procedure onEffectLose\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaStatusEffect LuaStatusEffect(PStatusEffect);
	Lunar<CLuaStatusEffect>::push(LuaHandle,&LuaStatusEffect);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEffectLose: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Проверяем возможность использования предмета. Если все хорошо, то    *
*  возвращаемое значение - 0, в случае отказа - номер сообщения ошибки  *
*																		*
************************************************************************/

int32 OnItemCheck(CBaseEntity* PTarget, CItem* PItem, uint32 param)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onItemCheck");

	snprintf(File, sizeof(File), "scripts/globals/items/%s.lua", PItem->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnItemCheck: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 56;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onItemCheck");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnItemCheck: undefined procedure onItemCheck\n");
		return 56;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,param);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnItemCheck: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 56;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Используем предмет. Возврадаемое значение - номер сообщения или 0.	*
*  Так же необходимо как-то передавать параметр сообщения (например,	*
*  количество восстановленных MP)										*
*																		*
************************************************************************/

int32 OnItemUse(CBaseEntity* PTarget, CItem* PItem)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onItemUse");

	snprintf(File, sizeof(File), "scripts/globals/items/%s.lua", PItem->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnItemUse: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onItemUse");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnItemUse: undefined procedure onItemUse\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnItemUse: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}


/************************************************************************
*																		*
*  check for gear sets  (e.g Set: enhances haste effect)			    *
*																		*
************************************************************************/

int32 CheckForGearSet(CBaseEntity* PTarget)
{

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "checkForGearSet");

	snprintf(File, sizeof(File), "scripts/globals/gear_sets.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::CheckForGearSet: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 56;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "checkForGearSet");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::CheckForGearSet: undefined procedure checkForGearSet\n");
		return 56;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,0);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::CheckForGearSet: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 56;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}


/************************************************************************
*																		*
*  Чтение заклинаний				 									*
*																		*
************************************************************************/

int32 OnSpellCast(CBattleEntity* PCaster, CBattleEntity* PTarget)
{
	if(PCaster->PBattleAI->GetCurrentSpell()->getSpellGroup() == SPELLGROUP_SONG){
		EFFECT effectId = (EFFECT)battleutils::SingSong(PCaster,PTarget,PCaster->PBattleAI->GetCurrentSpell());
        if(effectId != EFFECT_NONE){
            return effectId;
        }
	}
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onSpellCast");

	CSpell* PSpell = PCaster->PBattleAI->GetCurrentSpell();

    DSP_DEBUG_BREAK_IF(PSpell == NULL);

	snprintf(File, sizeof(File), (PSpell->getSpellGroup() == SPELLGROUP_BLUE ? "scripts/globals/spells/bluemagic/%s.lua" : "scripts/globals/spells/%s.lua"), PSpell->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnSpellCast: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onSpellCast");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnSpellCast: undefined procedure onSpellCast\n");
		return 0;
	}

	CLuaBaseEntity LuaCasterEntity(PCaster);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaCasterEntity);

	CLuaBaseEntity LuaTargetEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaTargetEntity);

	CLuaSpell LuaSpell(PSpell);
	Lunar<CLuaSpell>::push(LuaHandle,&LuaSpell);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnSpellCast: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnMonsterMagicPrepare(CBattleEntity* PCaster, CBattleEntity* PTarget)
{
	DSP_DEBUG_BREAK_IF(PCaster == NULL || PTarget == NULL);

	int8 File[255];
    memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMonsterMagicPrepare");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PCaster->loc.zone->GetName(), PCaster->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMonsterMagicPrepare");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PCaster);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	CLuaBaseEntity LuaTargetEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaTargetEntity);


    if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
    {
        ShowError("luautils::onMonsterMagicPrepare: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*  OnMobInitialise                                                      *
*  Used for passive trait                                               *
*                                                                       *
************************************************************************/

int32 OnMobInitialize(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobInitialize");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobInitialize");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PMob);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);


    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::onMobInitialize: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnMobPath(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobPath");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnMobPath");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PMob);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::OnMobPath: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Сalled when a monster engages a target for the first time			*
*		Added by request (for doing stuff when mobs first engage)		*
************************************************************************/

int32 OnMobEngaged(CBaseEntity* PMob, CBaseEntity* PTarget)
{
	DSP_DEBUG_BREAK_IF(PTarget == NULL || PMob == NULL);


	CCharEntity* PChar = (CCharEntity*)PTarget;

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PTarget);

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobEngaged");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if(PTarget->objtype != TYPE_PET && PTarget->objtype != TYPE_MOB)
	{
		PChar->m_event.reset();
		PChar->m_event.Target = PMob;
		PChar->m_event.Script.insert(0,File);
	}

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobEngaged");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobEngaged: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Calls a lua script when a mob has disengaged from a target	*		*
*																		*
************************************************************************/

int32 OnMobDisengage(CBaseEntity* PMob)
{
	DSP_DEBUG_BREAK_IF(PMob == NULL);

	int8 File[255];
	memset(File,0,sizeof(File));

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onMobDisengage");

	uint8 weather = PMob->loc.zone->GetWeather();

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDisengage");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	lua_pushinteger(LuaHandle, weather);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobDisengage: %s\n",lua_tostring(LuaHandle,-1));
		lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Сalled every 3 sec when a player fight monster						*
*																		*
************************************************************************/

int32 OnMobFight(CBaseEntity* PMob, CBaseEntity* PTarget)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL || PMob->objtype != TYPE_MOB)
    DSP_DEBUG_BREAK_IF(PTarget == NULL || PTarget->objtype == TYPE_NPC);

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PTarget);

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobFight");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobFight");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobFight: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnCriticalHit(CBattleEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL || PMob->objtype != TYPE_MOB)

	CLuaBaseEntity LuaMobEntity(PMob);

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnCriticalHit");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnCriticalHit");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnCriticalHit: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*  Скрипт выполняется после смерти любого монстра в игре				*
*																		*
************************************************************************/

int32 OnMobDeath(CBaseEntity* PMob, CBaseEntity* PKiller)
{
	DSP_DEBUG_BREAK_IF(PKiller == NULL || PMob == NULL);

    CCharEntity* PChar = (CCharEntity*)PKiller;

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PKiller);

	bool isWeaponSkillKill = PChar->getWeaponSkillKill();

    if (((CMobEntity*)PMob)->m_OwnerID.id == PKiller->id)
    {
        lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDeathEx");
	    if( !lua_isnil(LuaHandle,-1) )
	    {
            Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
            Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);
			lua_pushboolean(LuaHandle, isWeaponSkillKill);

            if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	        {
		        ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
	        }
	    }
    }

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobDeath");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    PChar->m_event.reset();
    PChar->m_event.Target = PMob;
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDeath");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	if (PChar->PParty != NULL)
	{
        if (PChar->PParty->m_PAlliance != NULL)
		{
			for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
				{
					if (PChar->PParty->m_PAlliance->partyList.at(a)->members.at(i) == PChar || PChar->PParty->m_PAlliance->partyList.at(a)->members.at(i)->getZone() != PChar->getZone())
						continue;

					((CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members[i])->m_event.reset();
					((CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members[i])->m_event.Target = PMob;
					((CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members[i])->m_event.Script.insert(0,File);

					lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDeath");
					if (lua_isnil(LuaHandle,-1))
					{
						ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
						return -1;
					}
					CLuaBaseEntity LuaKillerEntity(PChar->PParty->m_PAlliance->partyList.at(a)->members[i]);

					Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
					Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

					if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
					{
						ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
						lua_pop(LuaHandle, 1);
						return -1;
					}
				}
			}
		}
        else
		{
			for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
			{
				if (PChar->PParty->members[i] == PChar ||
					PChar->PParty->members[i]->getZone() != PChar->getZone())
					continue;

				((CCharEntity*)PChar->PParty->members[i])->m_event.reset();
				((CCharEntity*)PChar->PParty->members[i])->m_event.Target = PMob;
				((CCharEntity*)PChar->PParty->members[i])->m_event.Script.insert(0,File);

				lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDeath");
				if (lua_isnil(LuaHandle,-1))
				{
					ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
					return -1;
				}
				CLuaBaseEntity LuaKillerEntity(PChar->PParty->members[i]);

				Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
				Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

				if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
				{
					ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
					lua_pop(LuaHandle, 1);
					return -1;
				}
			}
		}
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnMobSpawn(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobSpawn");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobSpawn");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PMob);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);


    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::OnMobSpawn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnMobRoamAction(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL || PMob->objtype != TYPE_MOB)
    
	CLuaBaseEntity LuaMobEntity(PMob);
	
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobRoamAction");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnMobRoamAction");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	
	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobRoamAction: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 OnMobRoam(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL || PMob->objtype != TYPE_MOB)
    
	CLuaBaseEntity LuaMobEntity(PMob);
	
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobRoam");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnMobRoam");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	
	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobRoam: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnMobDespawn(CBaseEntity* PMob)
{
	DSP_DEBUG_BREAK_IF(PMob == NULL);

	int8 File[255];
	memset(File,0,sizeof(File));

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onMobDespawn");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDespawn");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobDespawn: %s\n",lua_tostring(LuaHandle,-1));
		lua_pop(LuaHandle, 1);
		return -1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*	OnGameDayAutomatisation()											*
*   used for creating action of npc every game day						*
*																		*
************************************************************************/

int32 OnGameDayAutomatisation()
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnGameDayAutomatisation");

	snprintf(File, sizeof(File), "scripts/globals/automatisation.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnGameDayAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnGameDayAutomatisation");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnGameDayAutomatisation: undefined procedure OnGameDayAutomatisation\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnGameDayAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*	OnGameHourAutomatisation()											*
*   used for creating action of npc every game hour						*
*																		*
************************************************************************/

int32 OnGameHourAutomatisation()
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnGameHourAutomatisation");

	snprintf(File, sizeof(File), "scripts/globals/automatisation.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnGameHourAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnGameHourAutomatisation");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnGameHourAutomatisation: undefined procedure OnGameHourAutomatisation\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnGameHourAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnZoneWeatherChange(uint16 ZoneID, uint8 weather)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnZoneWeatherChange");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", zoneutils::GetZone(ZoneID)->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnZoneWeatherChange");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	lua_pushinteger(LuaHandle, weather);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

int32 OnTOTDChange(uint16 ZoneID, uint8 TOTD)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnTOTDChange");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", zoneutils::GetZone(ZoneID)->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnTOTDChange");
	if( lua_isnil(LuaHandle,-1) )
	{
		return -1;
	}

	lua_pushinteger(LuaHandle, TOTD);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnUseWeaponSkill(CCharEntity* PChar, CBaseEntity* PMob, uint16* tpHitsLanded, uint16* extraHitsLanded)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnUseWeaponSkill");

	CWeaponSkill* wskill = PChar->PBattleAI->GetCurrentWeaponSkill();

	snprintf(File, sizeof(File), "scripts/globals/weaponskills/%s.lua", wskill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnUseWeaponSkill");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnUseWeaponSkill: undefined procedure OnUseWeaponSkill\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

	(*tpHitsLanded) = lua_tonumber(LuaHandle, -4);
	(*extraHitsLanded) = lua_tonumber(LuaHandle, -3);
	bool criticalHit = lua_toboolean(LuaHandle, -2);
    int32 dmg = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);

	if (criticalHit == true)
	{
		CBattleEntity* PTarget = (CBattleEntity*)PMob;
		luautils::OnCriticalHit(PTarget);
	}

	return dmg;
}

/***********************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 OnMobWeaponSkill(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobWeaponSkill");

	snprintf(File, sizeof(File), "scripts/globals/mobskills/%s.lua", PMobSkill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnMobWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnMobWeaponSkill");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnMobWeaponSkill: undefined procedure OnMobWeaponSkill\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	CLuaMobSkill LuaMobSkill(PMobSkill);
	Lunar<CLuaMobSkill>::push(LuaHandle,&LuaMobSkill);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/***********************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 OnMobSkillCheck(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobSkillCheck");

	snprintf(File, sizeof(File), "scripts/globals/mobskills/%s.lua", PMobSkill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnMobSkillCheck (%s): %s\n",PMobSkill->getName(),lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnMobSkillCheck");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnMobSkillCheck (%s): undefined procedure OnMobSkillCheck\n", PMobSkill->getName());
		return 1;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	CLuaMobSkill LuaMobSkill(PMobSkill);
	Lunar<CLuaMobSkill>::push(LuaHandle,&LuaMobSkill);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobSkillCheck (%s): %s\n",PMobSkill->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 1;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -5);
}

/***********************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 OnMagicCastingCheck(CBaseEntity* PChar,CBaseEntity* PTarget,CSpell* PSpell)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMagicCastingCheck");

	snprintf(File, sizeof(File), (PSpell->getSpellGroup() == SPELLGROUP_BLUE ? "scripts/globals/spells/bluemagic/%s.lua" : "scripts/globals/spells/%s.lua"), PSpell->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnMagicCastingCheck (%s): %s\n",PSpell->getName(),lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnMagicCastingCheck");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnMagicCastingCheck (%s): undefined procedure OnMagicCastingCheck\n", PSpell->getName());
		return 47;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaCharEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaCharEntity);

	CLuaSpell LuaSpell(PSpell);
	Lunar<CLuaSpell>::push(LuaHandle,&LuaSpell);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMagicCastingCheck (%s): %s\n",PSpell->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 47;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -5);
}

/***********************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 OnAbilityCheck(CBaseEntity* PChar, CBaseEntity* PTarget, CAbility* PAbility, CBaseEntity** PMsgTarget)
{
    DSP_DEBUG_BREAK_IF(PAbility == NULL);

	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnAbilityCheck");

    char* filePath = "scripts/globals/abilities/%s.lua";

    if(PAbility->isAvatarAbility())
    {
        filePath = "scripts/globals/abilities/pets/%s.lua";
    }

	snprintf(File, sizeof(File), filePath, PAbility->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnAbilityCheck (%s): %s\n",PAbility->getName(),lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnAbilityCheck");
	if( lua_isnil(LuaHandle,-1))
	{
		ShowError("luautils::OnAbilityCheck (%s): undefined procedure OnAbilityCheck\n", PAbility->getName());
		return 87;
	}

	CLuaBaseEntity LuaCharEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaCharEntity);

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaAbility LuaAbility(PAbility);
	Lunar<CLuaAbility>::push(LuaHandle,&LuaAbility);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnAbilityCheck (%s): %s\n",PAbility->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 87;
	}
	if((!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0) != 0)
		*PMsgTarget = (CBaseEntity*)PTarget;

	return (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : -5);
}

/***********************************************************************
*																		*
*																		*
*																		*
************************************************************************/

int32 OnPetAbility(CBaseEntity* PTarget, CBaseEntity* PMob, CMobSkill* PMobSkill, CBaseEntity* PMobMaster)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnPetAbility");

	snprintf(File, sizeof(File), "scripts/globals/abilities/pets/%s.lua", PMobSkill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnPetAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnPetAbility");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnPetAbility: undefined procedure OnPetAbility\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	CLuaMobSkill LuaMobSkill(PMobSkill);
	Lunar<CLuaMobSkill>::push(LuaHandle,&LuaMobSkill);

	CLuaBaseEntity LuaMasterEntity(PMobMaster);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMasterEntity);

	if( lua_pcall(LuaHandle,4,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnPetAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnUseAbility(CCharEntity* PChar, CBattleEntity* PTarget, CAbility* PAbility, apAction_t* action)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnUseAbility");

	snprintf(File, sizeof(File), "scripts/globals/abilities/%s.lua", PAbility->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnUseAbility");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnUseAbility: undefined procedure OnUseAbility\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

    CLuaAbility LuaAbility(PAbility);
	Lunar<CLuaAbility>::push(LuaHandle,&LuaAbility);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnUseAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns == 3)
    {
        action->speceffect = (SPECEFFECT)(!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        action->animation = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : 0);
        return (!lua_isnil(LuaHandle,-3) && lua_isnumber(LuaHandle,-3) ? lua_tonumber(LuaHandle,-3) : 0);
    } 
    else if (returns == 2)
    {
        action->animation = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        return (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? lua_tonumber(LuaHandle,-2) : 0);
    }
    else
    {
        return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? lua_tonumber(LuaHandle,-1) : 0);
    }

	return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnUseAbilityRoll(CCharEntity* PChar, CBattleEntity* PTarget, CAbility* PAbility, uint8 total)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnUseAbilityRoll");

	snprintf(File, sizeof(File), "scripts/globals/abilities/%s.lua", PAbility->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseAbilityRoll: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnUseAbilityRoll");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnUseAbilityRoll: undefined procedure OnUseAbilityRoll\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

    CLuaAbility LuaAbility(PAbility);
	Lunar<CLuaAbility>::push(LuaHandle,&LuaAbility);

	lua_pushinteger(LuaHandle, total);

	if( lua_pcall(LuaHandle,4,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnUseAbilityRoll: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 StartElevator(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint32 ElevatorID = (uint32)lua_tointeger(L, -1);
    CTransportHandler::getInstance()->startElevator(ElevatorID);
	return 0;
}

/************************************************************************
*                                                                       *
*  Получаем значение глобальной переменной сервера.                     *
*  Переменная действительна лишь в пределах зоны, в которой установлена *
*                                                                       *
************************************************************************/

int32 GetServerVariable(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isstring(L,-1));

    int32 value = 0;

	int32 ret = Sql_Query(SqlHandle,"SELECT value FROM server_variables WHERE name = '%s' LIMIT 1;", lua_tostring(L,-1));

	if (ret != SQL_ERROR &&
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		value = (int32)Sql_GetIntData(SqlHandle,0);
	}
	lua_pushinteger(L, value);
	return 1;
}

/************************************************************************
*                                                                       *
*  Устанавливаем значение глобальной переменной сервера.                *
*                                                                       *
************************************************************************/

int32 SetServerVariable(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isstring(L, -2));

	const int8* name = lua_tostring(L, -2);
	int32 value = (int32)lua_tointeger(L, -1);

	if (value == 0)
	{
		Sql_Query(SqlHandle, "DELETE FROM server_variables WHERE name = '%s' LIMIT 1;", name);
		return 0;
	}
	Sql_Query(SqlHandle, "INSERT INTO server_variables VALUES ('%s', %i) ON DUPLICATE KEY UPDATE value = %i;", name, value, value);
	
	lua_pushnil(L);
	return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnTransportEvent(CCharEntity* PChar, uint32 TransportID)
{
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onTransportEvent");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
	    ShowError("luautils::OnTransportEvent: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onTransportEvent");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnTransportEvent: undefined procedure\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,TransportID);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnTransportEvent: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/********************************************************************
	onBcnmEnter - callback when you enter a BCNM via a lua call to bcnmEnter(bcnmid)
*********************************************************************/
int32 OnBcnmEnter(CCharEntity* PChar, CInstance* PInstance){
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnBcnmEnter");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", PChar->loc.zone->GetName(),PInstance->getBcnmName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnBcnmEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnBcnmEnter");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnBcnmEnter: undefined procedure OnBcnmEnter\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaInstance LuaInstanceEntity(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle,&LuaInstanceEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnBcnmEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/********************************************************************
	onBcnmLeave - callback when you leave a BCNM via multiple means.
	The method of leaving is given by the LeaveCode as follows:
	1 - Leaving via burning circle e.g. "run away"
	2 - Leaving via warp or d/c
	3 - Leaving via win
	4 - Leaving via lose
	This callback is executed for everyone in the BCNM when they leave
	so if they leave via win, this will be called for each char.
*********************************************************************/
int32 OnBcnmLeave(CCharEntity* PChar, CInstance* PInstance, uint8 LeaveCode){
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnBcnmLeave");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", PChar->loc.zone->GetName(),PInstance->getBcnmName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnBcnmLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnBcnmLeave");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnBcnmLeave: undefined procedure OnBcnmLeave\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaInstance LuaInstanceEntity(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle,&LuaInstanceEntity);

	lua_pushinteger(LuaHandle,LeaveCode);

	PChar->m_event.reset();
    PChar->m_event.Target = PChar;
	PChar->m_event.Script.insert(0,File);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnBcnmLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}

/********************************************************************
	onBcnmRegister - callback when you successfully register a BCNM.
	For example, trading an orb, selecting the battle.
	Called AFTER assigning BCNM status to all valid characters.
	This callback is called only for the character initiating the
	registration, and after CInstance:init() procedure.
*********************************************************************/
int32 OnBcnmRegister(CCharEntity* PChar, CInstance* PInstance){
	int8 File[255];
	memset(File,0,sizeof(File));

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnBcnmRegister");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", PChar->loc.zone->GetName(),PInstance->getBcnmName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnBcnmRegister: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnBcnmRegister");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnBcnmRegister: undefined procedure OnBcnmRegister\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaInstance LuaInstanceEntity(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle,&LuaInstanceEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnBcnmRegister: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
}
/************************************************************************
*                                                                       *
* Set SpawnType of mob to scripted (128) or normal (0) usind mob id     *
*                                                                       *
************************************************************************/
int32 DeterMob(lua_State* L)
{
	if( !lua_isnil(L,1) && lua_isnumber(L,1) ) {
		uint32 mobid = (uint32)lua_tointeger(L,1);
		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);

		if (PMob != NULL) {
			if( !lua_isnil(L,2) && lua_isboolean(L,2) ) {
				if ( lua_toboolean(L,2) == 0 ) {
				  PMob->m_AllowRespawn = true; // Do not deter the mob, allow mob to respawn
				} else {
				  PMob->m_AllowRespawn = false; // Deter the mob, do not allow mob to respawn
				}
				//ShowDebug(CL_RED"DeterMob: Mob <%u> AllowRespawn is now <%s>.\n" CL_RESET, mobid, PMob->m_AllowRespawn ? "true" : "false");
			return 1;
			} else {
			ShowDebug(CL_RED"DeterMob: Boolean parameter not given, mob <%u> SpawnType unchanged.\n" CL_RESET, mobid);
			}
		} else {
			ShowDebug(CL_RED"DeterMob: mob <%u> not found\n" CL_RESET, mobid);
		}
		return 0;
  }
  lua_pushnil(L);
  return 1;
}

/************************************************************************
*                                                                       *
* Update the NM spawn point to a new point, retrieved from the database *
*                                                                       *
************************************************************************/

int32 UpdateNMSpawnPoint(lua_State* L)
{
	if( !lua_isnil(L,1) && lua_isnumber(L,1) ) {
		uint32 mobid = (uint32)lua_tointeger(L,1);
		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);

		if (PMob != NULL) {
		  int32 r = rand()%50;
		  int32 ret = Sql_Query(SqlHandle, "SELECT pos_x, pos_y, pos_z FROM `nm_spawn_points` WHERE mobid=%u AND pos=%i", mobid, r);

		  if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS) {
			PMob->m_SpawnPoint.rotation = rand() % 256;
			PMob->m_SpawnPoint.x = Sql_GetFloatData(SqlHandle,0);
			PMob->m_SpawnPoint.y = Sql_GetFloatData(SqlHandle,1);
			PMob->m_SpawnPoint.z = Sql_GetFloatData(SqlHandle,2);
			//ShowDebug(CL_RED"UpdateNMSpawnPoint: After %i - %f, %f, %f, %i\n" CL_RESET, r, PMob->m_SpawnPoint.x,PMob->m_SpawnPoint.y,PMob->m_SpawnPoint.z,PMob->m_SpawnPoint.rotation);
		  } else {
			ShowDebug(CL_RED"UpdateNMSpawnPoint: SQL error or NM <%u> not found in nmspawnpoints table.\n" CL_RESET, mobid);
		  }
		} else {
			ShowDebug(CL_RED"UpdateNMSpawnPoint: mob <%u> not found\n" CL_RESET, mobid);
		}
		return 0;
  }
  lua_pushnil(L);
  return 1;
}

/************************************************************************
*                                                                       *
*  Get Mob Respawn Time in seconds by Mob ID.                           *
*                                                                       *
************************************************************************/

int32 GetMobRespawnTime(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    uint32 mobid = (uint32)lua_tointeger(L,-1);
    CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);

    if (PMob != NULL) {
        uint32 RespawnTime = (uint32)PMob->m_RespawnTime / 1000;
        lua_pushinteger(L, RespawnTime);
        return 1;
    }
    ShowError(CL_RED"luautils::GetMobAction: mob <%u> was not found\n" CL_RESET, mobid);
    lua_pushnil(L);
    return 1;
}

/************************************************************************
*	Change drop rate of a mob											*
*  	1st number: dropid in mob_droplist.sql								*
*	2nd number: itemid in mob_droplist.sql								*
*	3rd number: new rate												*
************************************************************************/

int32 SetDropRate(lua_State *L)
{
	DropList_t* DropList = itemutils::GetDropList(lua_tointeger(L,1));

	for(uint8 i = 0; i < DropList->size(); ++i)
	{
		if(DropList->at(i).ItemID == lua_tointeger(L,2))
		{
			DropList->at(i).DropRate = lua_tointeger(L,3);
			return 1;
		}
	}

	return 0;
}

int32 getCorsairRollEffect(lua_State* L)
{
    if(!lua_isnil(L,1) && lua_isnumber(L,1))
	{
		lua_pushinteger(L, battleutils::getCorsairRollEffect(lua_tointeger(L,1)));
		return 1;
	}
	return 0;
}

int32 getSpell(lua_State* L)
{
    if(!lua_isnil(L,1) && lua_isnumber(L,1))
	{
		CSpell* PSpell = spell::GetSpell(lua_tointeger(L,1));

		lua_pushstring(L,CLuaSpell::className);
		lua_gettable(L,LUA_GLOBALSINDEX);
		lua_pushstring(L,"new");
		lua_gettable(L,-2);
		lua_insert(L,-2);
		lua_pushlightuserdata(L,(void*)PSpell);
		lua_pcall(L,2,1,0);

		return 1;
	}
	return 0;
}

}; // namespace luautils