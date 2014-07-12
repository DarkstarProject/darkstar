/*
===========================================================================

  Copyright (c) 2010-2014 Darkstar Dev Teams

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
#include "../../common/malloc.h"

#include <string.h>

#include "luautils.h"
#include "lua_ability.h"
#include "lua_baseentity.h"
#include "lua_battlefield.h"
#include "lua_region.h"
#include "lua_instance.h"
#include "lua_spell.h"
#include "lua_statuseffect.h"
#include "lua_mobskill.h"
#include "lua_trade_container.h"
#include "lua_zone.h"

#include "../alliance.h"
#include "../ability.h"
#include "../entities/baseentity.h"
#include "../utils/battleutils.h"
#include "../entities/charentity.h"
#include "../conquest_system.h"
#include "../map.h"
#include "../entities/mobentity.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../vana_time.h"
#include "../utils/zoneutils.h"
#include "../transport.h"
#include "../zone_instance.h"
#include "../packets/auction_house.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/entity_update.h"
#include "../packets/char.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/message_basic.h"
#include "../packets/entity_visual.h"

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
	LuaHandle = luaL_newstate();
	luaL_openlibs(LuaHandle);

	lua_register(LuaHandle,"print",luautils::print);
	lua_register(LuaHandle,"GetNPCByID",luautils::GetNPCByID);
	lua_register(LuaHandle,"GetMobByID",luautils::GetMobByID);
	lua_register(LuaHandle,"GetMobIDByJob",luautils::GetMobIDByJob);
	lua_register(LuaHandle,"WeekUpdateConquest", luautils::WeekUpdateConquest);
    lua_register(LuaHandle,"GetRegionOwner", luautils::GetRegionOwner);
    lua_register(LuaHandle,"getNationRank", luautils::getNationRank);
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
	lua_register(LuaHandle,"VanadielRSERace",luautils::VanadielRSERace);
	lua_register(LuaHandle,"VanadielRSELocation",luautils::VanadielRSELocation);
    lua_register(LuaHandle,"SetVanadielTimeOffset",luautils::SetVanadielTimeOffset);   	
	lua_register(LuaHandle,"IsMoonNew",luautils::IsMoonNew);    	
	lua_register(LuaHandle,"IsMoonFull",luautils::IsMoonFull);
	lua_register(LuaHandle,"RunElevator",luautils::StartElevator);
	lua_register(LuaHandle,"GetServerVariable",luautils::GetServerVariable);
	lua_register(LuaHandle,"SetServerVariable",luautils::SetServerVariable);
	lua_register(LuaHandle,"clearVarFromAll",luautils::clearVarFromAll);
    lua_register(LuaHandle,"SendEntityVisualPacket",luautils::SendEntityVisualPacket);
	lua_register(LuaHandle,"UpdateServerMessage",luautils::UpdateServerMessage);
	lua_register(LuaHandle,"UpdateTreasureSpawnPoint",luautils::UpdateTreasureSpawnPoint);
	lua_register(LuaHandle,"GetMobRespawnTime",luautils::GetMobRespawnTime);
	lua_register(LuaHandle,"DeterMob",luautils::DeterMob);
	lua_register(LuaHandle,"UpdateNMSpawnPoint",luautils::UpdateNMSpawnPoint);
	lua_register(LuaHandle,"SetDropRate",luautils::SetDropRate);
    lua_register(LuaHandle,"NearLocation",luautils::nearLocation);

	lua_register(LuaHandle,"getCorsairRollEffect",luautils::getCorsairRollEffect);
    lua_register(LuaHandle,"getSpell",luautils::getSpell);

    Lunar<CLuaAbility>::Register(LuaHandle);
	Lunar<CLuaBaseEntity>::Register(LuaHandle);
    Lunar<CLuaBattlefield>::Register(LuaHandle);
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

int32 garbageCollect()
{

    int32 top = lua_gettop( LuaHandle );
    ShowDebug(CL_CYAN"[Lua] Garbage Collected. Current State Top: %d\n" CL_RESET, top);

    lua_gc(LuaHandle, LUA_GCSTEP, 10);

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

int32 SendEntityVisualPacket(lua_State* L)
{
    if((!lua_isnil(L,1) && lua_isnumber(L,1)) &&
       (!lua_isnil(L,2) && lua_isnumber(L,2)) &&
	   (!lua_isnil(L,3) && lua_isnumber(L,3)) &&
	   (!lua_isnil(L,4) && lua_isnumber(L,4)) &&
	   (!lua_isnil(L,5) && lua_isnumber(L,5)) )
	{
		uint32 npcid = (uint32)lua_tointeger(L,1);
		const char* command = lua_tostring(L,2);

		CBaseEntity* PNpc = zoneutils::GetEntity(npcid, TYPE_NPC);

        if (PNpc != NULL)
        {
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityVisualPacket(PNpc, command));
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
			lua_getglobal(L,CLuaBaseEntity::className);
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

		CBaseEntity* PMob = zoneutils::GetEntity(mobid, TYPE_MOB | TYPE_PET);

		if(PMob == NULL){
			ShowWarning("luautils::GetMobByID Mob doesn't exist (%d)\n", mobid);
			lua_pushnil(L);
		} else {
			lua_getglobal(L,CLuaBaseEntity::className);
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
* Get Rank of Nations in Conquest		*
*																		*
************************************************************************/

int32 getNationRank(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    
    uint8 balance = conquest::GetBalance();
    switch(lua_tointeger(L,1))
    {
        case SANDORIA:
            balance &= 0x3U;
            lua_pushinteger(L, balance);
            return 1;
        case BASTOK:
            balance &= 0xCU;
            balance >>= 2;
            lua_pushinteger(L, balance);
            return 1;
        case WINDURST:
            balance >>= 4;
            lua_pushinteger(L, balance);
            return 1;
        default:
            lua_pushinteger(L, 0);
            return 1;
    }
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "SetRegionalConquestOverseers");

	snprintf(File, sizeof(File), "scripts/globals/conquest.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::SetRegionalConquestOverseers: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "SetRegionalConquestOverseers");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		ShowError("luautils::SetRegionalConquestOverseers: undefined procedure onServerStart\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::SetRegionalConquestOverseers: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::SetRegionalConquestOverseers (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    return 1;
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
*	Return RSE Race														*
*																		*
************************************************************************/

int32 VanadielRSERace(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getRSERace());
	return 1;
}

/************************************************************************
*																		*
*	Return RSE Location													*
*																		*
************************************************************************/

int32 VanadielRSELocation(lua_State* L)
{
	lua_pushinteger(L, CVanaTime::getInstance()->getRSELocation());
	return 1;
}

/************************************************************************
*																		*
*	is new moon?														*
*																		*
************************************************************************/
	
int32 IsMoonNew(lua_State* L)
{
	// New moon occurs when:
	// Waning (decreasing) from 10% to 0%,
	// Waxing (increasing) from 0% to 5%.

	uint8 phase = CVanaTime::getInstance()->getMoonPhase();

	switch (CVanaTime::getInstance()->getMoonDirection())
	{
		case 0: // None
			if (phase == 0)
			{
				lua_pushboolean(L, true);
				return 1;
			}

		case 1: // Waning (decending)
			if (phase <= 10 && phase >= 0)
			{
				lua_pushboolean(L, true);
				return 1;
			}

		case 2: // Waxing (increasing)
			if (phase >= 0 && phase <= 5)
			{
				lua_pushboolean(L, true);
				return 1;
			}
	}
	lua_pushboolean(L, false);
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
			if (phase == 100) {
				lua_pushboolean(L, true);
				return 1;
			}

		case 1: // Waning (decending)
			if (phase >= 95 && phase <= 100)
			{
				lua_pushboolean(L, true);
				return 1;
			}

		case 2: // Waxing (increasing)
			if (phase >= 90 && phase <= 100)
			{
				lua_pushboolean(L, true);
				return 1;
			}
	}
	lua_pushboolean(L, false);
	return 1;
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

		CMobEntity* PMob = NULL;

		if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
		{
			CLuaInstance* PLuaInstance = Lunar<CLuaInstance>::check(L, 2);
			PMob = (CMobEntity*)PLuaInstance->GetInstance()->GetEntity(mobid & 0xFFF, TYPE_MOB);
		}
		else
		{
			PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		}
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
            lua_getglobal(L, CLuaBaseEntity::className);
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
	if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
	{
		uint32 mobid = (uint32)lua_tointeger(L, 1);

		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		if (PMob != NULL)
		{
			//if mob is in battle, do not warp it
			if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
				PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN ||
				PMob->PBattleAI->GetCurrentAction() == ACTION_ROAMING ||
				PMob->PBattleAI->GetCurrentAction() == ACTION_DEATH ||
				PMob->PBattleAI->GetCurrentAction() == ACTION_FADE_OUT ||
				PMob->PBattleAI->GetCurrentAction() == ACTION_DESPAWN)
			{
				if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
					PMob->loc.p.x = (float)lua_tonumber(L, 2);

				if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
					PMob->loc.p.y = (float)lua_tonumber(L, 3);

				if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
					PMob->loc.p.z = (float)lua_tonumber(L, 4);

				if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
					PMob->loc.p.rotation = (uint8)lua_tointeger(L, 5);
			}
			else
			{
				ShowDebug(CL_CYAN"setMobPos: <%s> is currently in battle, will not warp it!\n" CL_RESET, PMob->GetName());
				return 1;
			}
		}
		lua_pushnil(L);
		return 1;
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
            lua_getglobal(L, CLuaBaseEntity::className);
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

    CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB | TYPE_PET);
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

    lua_getglobal(LuaHandle,variable);

	if( lua_isnil(LuaHandle,-1) || !lua_isnumber(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onServerStart");

	snprintf(File, sizeof(File), "scripts/globals/server.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnServerStart: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onServerStart");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnServerStart: undefined procedure onServerStart\n");
        lua_pop(LuaHandle, 1);
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnServerStart: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnServerStart (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onInitialize");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PZone->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
	  //ShowError("luautils::OnZoneInitialise: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onInitialize");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnZoneInitialise: undefined procedure onInitialize\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnZoneInitialize (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onGameIn");

	snprintf(File, sizeof(File), "scripts/globals/player.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnGameIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onGameIn");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnGameIn: undefined procedure onGameIn\n");
        lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushboolean(LuaHandle, PChar->GetPlayTime(false) == 0); // first login

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnGameIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnGameIn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onZoneIn");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnZoneIn: undefined procedure onZoneIn\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::OnZoneIn (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luatils::OnZoneIn (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
}

int32 AfterZoneIn(uint32 tick, CTaskMgr::CTask *PTask)
{
	CCharEntity* PChar = (CCharEntity*)PTask->m_data;

	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "afterZoneIn");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_getglobal(LuaHandle, "afterZoneIn");
	if (lua_isnil(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::AfterZoneIn: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::AfterZoneIn (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onRegionEnter");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnRegionEnter: undefined procedure onRegionEnter\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnRegionEnter (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onRegionLeave");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnRegionEnter: undefined procedure onRegionLeave\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnRegionLeave (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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

    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onTrigger");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnTrigger: undefined procedure onTrigger\n");
        lua_pop(LuaHandle, 1);
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

    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 1)
    {
	    uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        lua_pop(LuaHandle, 1);
        if (returns > 1)
        {
            ShowError("luatils::OnTrigger (%s): 1 or 0 returns expected, got %d\n", File, returns);
            lua_pop(LuaHandle, returns-1);
        }
        return retVal;
    }
    else if (returns == 1)
    {
	    uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        lua_pop(LuaHandle, 1);
        return retVal;
    }
    else
    {
        return 0;
    }
}

/************************************************************************
*																		*
*  Запущенное событие нуждается в дополнительных параметрах				*
*																		*
************************************************************************/

int32 OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result)
{
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEventUpdate");

	int8 File[255];
	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0))
	{
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

    lua_getglobal(LuaHandle, "onEventUpdate");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEventUpdate: undefined procedure onEventUpdate\n");
        lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,eventID);
	lua_pushinteger(LuaHandle,result);

    CLuaBaseEntity LuaTargetEntity(PChar->m_event.Target);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaTargetEntity);

	if( lua_pcall(LuaHandle,4,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnEventUpdate (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/************************************************************************
*																		*
*  Событие завершилось, результат события хранится в result				*
*																		*
************************************************************************/

int32 OnEventFinish(CCharEntity* PChar, uint16 eventID, uint32 result)
{
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEventFinish");

	int8 File[255];
	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		memset(File,0,sizeof(File));
		snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

		if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
		{
			ShowError("luautils::OnEventFinish %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

    lua_getglobal(LuaHandle, "onEventFinish");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEventFinish: undefined procedure onEventFinish\n");
        lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,eventID);
	lua_pushinteger(LuaHandle,result);

    CLuaBaseEntity LuaTargetEntity(PChar->m_event.Target);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaTargetEntity);

	if( lua_pcall(LuaHandle,4,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnEventFinish %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
	if(PChar->m_event.Script.find("/bcnms/") > 0 && PChar->health.hp <= 0){ //for some reason the event doesnt enforce death afterwards
		PChar->animation = ANIMATION_DEATH;
		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CRaiseTractorMenuPacket(PChar,TYPE_HOMEPOINT));
		PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharPacket(PChar,ENTITY_UPDATE));
	}
    if (returns > 0)
    {
        ShowError("luatils::OnEventFinish (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onTrade");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnTrade: undefined procedure onTrade\n");
        lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaBaseEntityTarg(PNpc);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntityTarg);

    CLuaTradeContainer LuaTradeContainer(PChar->TradeContainer);
	Lunar<CLuaTradeContainer>::push(LuaHandle,&LuaTradeContainer);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnTrade: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnTrade (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnNpcSpawn(CBaseEntity* PNpc)
{
    DSP_DEBUG_BREAK_IF(PNpc == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onSpawn");

    snprintf( File, sizeof(File), "scripts/zones/%s/npcs/%s.lua", PNpc->loc.zone->GetName(), PNpc->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onSpawn");
    if( lua_isnil(LuaHandle,-1) )
    {
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnNpcSpawn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnNpcPath(CBaseEntity* PNpc)
{
    DSP_DEBUG_BREAK_IF(PNpc == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onPath");

    snprintf( File, sizeof(File), "scripts/zones/%s/npcs/%s.lua", PNpc->loc.zone->GetName(), PNpc->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onPath");
    if( lua_isnil(LuaHandle,-1) )
    {
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnNpcPath (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnAdditionalEffect(CBattleEntity* PAttacker, CBattleEntity* PDefender, CItemWeapon* PItem, apAction_t* Action, uint32 damage)
{
    int8 File[255];
    memset(File,0,sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onAdditionalEffect");

	if (PAttacker->objtype == TYPE_PC)
		snprintf(File, sizeof(File), "scripts/globals/items/%s.lua", PItem->getName());
	else
		snprintf(File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PAttacker->loc.zone->GetName(), PAttacker->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        ShowError("luautils::OnAdditionalEffect: %s\n",lua_tostring(LuaHandle,-1));
		lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onAdditionalEffect");

    if( lua_isnil(LuaHandle,-1) )
    {
        ShowError("luautils::OnAdditionalEffect: undefined procedure onAdditionalEffect\n");
	    lua_pop(LuaHandle, 1);
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PAttacker);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

    CLuaBaseEntity LuaMobEntity(PDefender);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

    lua_pushinteger(LuaHandle, damage);

    if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
    {
        ShowError("luautils::OnAdditionalEffect: %s\n",lua_tostring(LuaHandle,-1));
	    lua_pop(LuaHandle, 1);
        return -1;
    }
	int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 3)
    {
        Action->additionalEffect = (SUBEFFECT)(!lua_isnil(LuaHandle, -3) && lua_isnumber(LuaHandle, -3) ? (int32)lua_tonumber(LuaHandle, -3) : 0);
        Action->addEffectMessage = (!lua_isnil(LuaHandle, -2) && lua_isnumber(LuaHandle, -2) ? (int32)lua_tonumber(LuaHandle, -2) : 0);
        Action->addEffectParam = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
        ShowError("luatils::OnAdditionalEffect (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
        lua_pop(LuaHandle, returns);
    }
    else if (returns == 3)
    {
        Action->additionalEffect = (SUBEFFECT)(!lua_isnil(LuaHandle, -3) && lua_isnumber(LuaHandle, -3) ? (int32)lua_tonumber(LuaHandle, -3) : 0);
        Action->addEffectMessage = (!lua_isnil(LuaHandle, -2) && lua_isnumber(LuaHandle, -2) ? (int32)lua_tonumber(LuaHandle, -2) : 0);
        Action->addEffectParam = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
        lua_pop(LuaHandle, 3);
    }
    else if (returns < 2)
    {
        ShowError("luatils::OnAdditionalEffect (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
        lua_pop(LuaHandle, returns);
    }

    return 0;
}

int32 OnSpikesDamage(CBattleEntity* PDefender, CBattleEntity* PAttacker, apAction_t* Action, uint32 damage)
{
    int8 File[255];
    memset(File, 0, sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onSpikesDamage");

    snprintf(File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PDefender->loc.zone->GetName(), PDefender->GetName());

    if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
    {
        ShowError("luautils::OnSpikesDamage: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onSpikesDamage");

    if (lua_isnil(LuaHandle, -1))
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PDefender);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    CLuaBaseEntity LuaMobEntity(PAttacker);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaMobEntity);

    lua_pushinteger(LuaHandle, damage);

    if (lua_pcall(LuaHandle, 3, LUA_MULTRET, 0))
    {
        ShowError("luautils::OnSpikesDamage: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 3)
    {
        Action->spikesEffect = (SUBEFFECT)(!lua_isnil(LuaHandle, -3) && lua_isnumber(LuaHandle, -3) ? (int32)lua_tonumber(LuaHandle, -3) : 0);
        Action->spikesMessage = (!lua_isnil(LuaHandle, -2) && lua_isnumber(LuaHandle, -2) ? (int32)lua_tonumber(LuaHandle, -2) : 0);
        Action->spikesParam = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
        ShowError("luatils::OnSpikesDamage (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
        lua_pop(LuaHandle, returns);
    }
    else if (returns == 3)
    {
        Action->spikesEffect = (SUBEFFECT)(!lua_isnil(LuaHandle, -3) && lua_isnumber(LuaHandle, -3) ? (int32)lua_tonumber(LuaHandle, -3) : 0);
        Action->spikesMessage = (!lua_isnil(LuaHandle, -2) && lua_isnumber(LuaHandle, -2) ? (int32)lua_tonumber(LuaHandle, -2) : 0);
        Action->spikesParam = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
        lua_pop(LuaHandle, 3);
    }
    else if (returns < 2)
    {
        ShowError("luatils::OnSpikesDamage (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
        lua_pop(LuaHandle, returns);
    }

    return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEffectGain");

	snprintf(File, sizeof(File), "scripts/%s.lua", PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectGain: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onEffectGain");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEffectGain: undefined procedure onEffectGain\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnEffectGain (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEffectTick");

	snprintf(File, sizeof(File), "scripts/%s.lua", PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectTick: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onEffectTick");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEffectTick: undefined procedure onEffectTick\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnEffectTick (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEffectLose");

	snprintf(File, sizeof(File), "scripts/%s.lua", PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectLose: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onEffectLose");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnEffectLose: undefined procedure onEffectLose\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnEffectLose (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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

    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onItemCheck");

	snprintf(File, sizeof(File), "scripts/globals/items/%s.lua", PItem->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnItemCheck: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 56;
	}

    lua_getglobal(LuaHandle, "onItemCheck");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnItemCheck: undefined procedure onItemCheck\n");
        lua_pop(LuaHandle, 1);
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

    int32 retNumber = lua_gettop(LuaHandle) - oldtop;
    if (retNumber > 1)
    {
	    uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        lua_pop(LuaHandle, 1);
        if (retNumber > 1)
        {
            ShowError("luatils::OnItemCheck (%s): 1 return expected, got %d\n", File, retNumber);
            lua_pop(LuaHandle, retNumber-1);
        }
        return retVal;
    }
    else if (retNumber == 1)
    {
	    uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        lua_pop(LuaHandle, 1);
        return retVal;
    }
    else
    {
        return 0;
    }
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onItemUse");

	snprintf(File, sizeof(File), "scripts/globals/items/%s.lua", PItem->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnItemUse: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onItemUse");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnItemUse: undefined procedure onItemUse\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnItemUse (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "checkForGearSet");

	snprintf(File, sizeof(File), "scripts/globals/gear_sets.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::CheckForGearSet: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 56;
	}

    lua_getglobal(LuaHandle, "checkForGearSet");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::CheckForGearSet: undefined procedure checkForGearSet\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::CheckForGearSet (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}


/************************************************************************
*																		*
*  Чтение заклинаний				 									*
*																		*
************************************************************************/

int32 OnSpellCast(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell)
{
    int8 File[255];
    memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onSpellCast");

    DSP_DEBUG_BREAK_IF(PSpell == NULL);

    snprintf(File, sizeof(File), (PSpell->getSpellGroup() == SPELLGROUP_BLUE ? "scripts/globals/spells/bluemagic/%s.lua" : "scripts/globals/spells/%s.lua"), PSpell->getName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        ShowError("luautils::OnSpellCast: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return 0;
    }

    lua_getglobal(LuaHandle, "onSpellCast");
    if( lua_isnil(LuaHandle,-1) )
    {
        ShowError("luautils::OnSpellCast: undefined procedure onSpellCast\n");
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::OnSpellCast (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luatils::OnSpellCast (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
}

/************************************************************************
*																		*
*  Чтение заклинаний				 									*
*																		*
************************************************************************/

int32 OnSpellPrecast(CBattleEntity* PCaster, CSpell* PSpell)
{
	if (PCaster->objtype == TYPE_MOB)
	{
		int8 File[255];
		memset(File, 0, sizeof(File));
		int32 oldtop = lua_gettop(LuaHandle);

		lua_pushnil(LuaHandle);
		lua_setglobal(LuaHandle, "onSpellPrecast");

		DSP_DEBUG_BREAK_IF(PSpell == NULL);

		snprintf(File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PCaster->loc.zone->GetName(), PCaster->GetName());

		if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
		{
			lua_pop(LuaHandle, 1);
			return 0;
		}

		lua_getglobal(LuaHandle, "onSpellPrecast");
		if (lua_isnil(LuaHandle, -1))
		{
			lua_pop(LuaHandle, 1);
			return 0;
		}

		CLuaBaseEntity LuaCasterEntity(PCaster);
		Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaCasterEntity);

		CLuaSpell LuaSpell(PSpell);
		Lunar<CLuaSpell>::push(LuaHandle, &LuaSpell);

		if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
		{
			ShowError("luautils::OnSpellPrecast: %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return 0;
		}
		int32 returns = lua_gettop(LuaHandle) - oldtop;
		if (returns > 0)
		{
			ShowError("luatils::onMobInitialize (%s): 0 returns expected, got %d\n", File, returns);
			lua_pop(LuaHandle, returns);
		}
	}
	return 0;
}

int32 OnMonsterMagicPrepare(CBattleEntity* PCaster, CBattleEntity* PTarget)
{
	DSP_DEBUG_BREAK_IF(PCaster == NULL || PTarget == NULL);

	int8 File[255];
    memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMonsterMagicPrepare");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PCaster->loc.zone->GetName(), PCaster->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onMonsterMagicPrepare");
    if( lua_isnil(LuaHandle,-1) )
    {
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::onMonsterMagicPrepare (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if ( returns > 1)
    {
        ShowError("luatils::onMonsterMagicPrepare (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
}

/************************************************************************
*  onMobInitialize                                                      *
*  Used for passive trait                                               *
*                                                                       *
************************************************************************/

int32 OnMobInitialize(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobInitialize");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onMobInitialize");
    if( lua_isnil(LuaHandle,-1) )
    {
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::onMobInitialize (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnMobPath(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL);

    int8 File[255];
    memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobPath");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "OnMobPath");
    if( lua_isnil(LuaHandle,-1) )
    {
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnMobPath (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onMobEngaged");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::onMobEngaged (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onMobDisengage");

	uint8 weather = PMob->loc.zone->GetWeather();

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_getglobal(LuaHandle, "onMobDisengage");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::onMobDisengage (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnMobDrawIn(CBaseEntity* PMob, CBaseEntity* PTarget)
{
	DSP_DEBUG_BREAK_IF(PTarget == NULL || PMob == NULL);


	CCharEntity* PChar = (CCharEntity*)PTarget;

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PTarget);

	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobDrawIn");

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

    lua_getglobal(LuaHandle, "onMobDrawIn");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobDrawIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::onMobDrawIn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobFight");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        //ShowError("luautils::OnMobFight (%s): %s\n", PMob->GetName(), lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onMobFight");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnMobFight (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnCriticalHit(CBattleEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL || PMob->objtype != TYPE_MOB)

	CLuaBaseEntity LuaMobEntity(PMob);

	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnCriticalHit");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnCriticalHit");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnCriticalHit: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnCriticalHit (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/************************************************************************
*																		*
*  Скрипт выполняется после смерти любого монстра в игре				*
*																		*
************************************************************************/

int32 OnMobDeath(CBaseEntity* PMob, CBaseEntity* PKiller)
{
	DSP_DEBUG_BREAK_IF(PMob == NULL);

    CCharEntity* PChar = (CCharEntity*)PKiller;

	CLuaBaseEntity LuaMobEntity(PMob);

    if (PKiller && ((CMobEntity*)PMob)->m_OwnerID.id == PKiller->id)
    {
		CLuaBaseEntity LuaKillerEntity(PKiller);
        lua_getglobal(LuaHandle, "onMobDeathEx");
	    if( !lua_isnil(LuaHandle,-1) )
	    {
			bool isWeaponSkillKill = PChar->getWeaponSkillKill();

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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobDeath");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if (PChar)
	{
		PChar->m_event.reset();
		PChar->m_event.Target = PMob;
		PChar->m_event.Script.insert(0, File);
	}

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "onMobDeath");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
        lua_pop(LuaHandle, 1);
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	if (PKiller)
	{
		CLuaBaseEntity LuaKillerEntity(PKiller);
		Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaKillerEntity);
	}
	else
	{
		lua_pushnil(LuaHandle);
	}

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

	if (PChar && PChar->PParty != NULL)
	{
        if (PChar->PParty->m_PAlliance != NULL)
		{
			for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
			{
				for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
				{
					if (PChar->PParty->m_PAlliance->partyList.at(a)->members.at(i) == PChar || PChar->PParty->m_PAlliance->partyList.at(a)->members.at(i)->getZone() != PChar->getZone())
						continue;

					CCharEntity* PMember = (CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members[i];

					PMember->m_event.reset();
					PMember->m_event.Target = PMob;
					PMember->m_event.Script.insert(0,File);

					lua_getglobal(LuaHandle, "onMobDeath");
					if (lua_isnil(LuaHandle,-1))
					{
						ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
                        lua_pop(LuaHandle, 1);
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

				CCharEntity* PMember = (CCharEntity*)PChar->PParty->members[i];
				PMember->m_event.reset();
				PMember->m_event.Target = PMob;
				PMember->m_event.Script.insert(0,File);

				lua_getglobal(LuaHandle, "onMobDeath");
				if (lua_isnil(LuaHandle,-1))
				{
					ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
                    lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnMobDeath (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onMobSpawn");

    snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onMobSpawn");
    if( lua_isnil(LuaHandle,-1) )
    {
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnMobSpawn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnMobRoamAction(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == NULL || PMob->objtype != TYPE_MOB)

	CLuaBaseEntity LuaMobEntity(PMob);

	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobRoamAction");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnMobRoamAction");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobRoamAction: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnMobRoamAction (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobRoam");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnMobRoam");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobRoam: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnMobRoam (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }

	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onMobDespawn");

	snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_getglobal(LuaHandle, "onMobDespawn");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::onMobDespawn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnGameDayAutomatisation");

	snprintf(File, sizeof(File), "scripts/globals/automatisation.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnGameDayAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnGameDayAutomatisation");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		ShowError("luautils::OnGameDayAutomatisation: undefined procedure OnGameDayAutomatisation\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnGameDayAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnGameDayAutomisation (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnGameHourAutomatisation");

	snprintf(File, sizeof(File), "scripts/globals/automatisation.lua");

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnGameHourAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnGameHourAutomatisation");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		ShowError("luautils::OnGameHourAutomatisation: undefined procedure OnGameHourAutomatisation\n");
		return -1;
	}

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnGameHourAutomatisation: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnGameHourAutomisation (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnZoneWeatherChange(uint16 ZoneID, uint8 weather)
{
	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnZoneWeatherChange");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", zoneutils::GetZone(ZoneID)->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnZoneWeatherChange");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_pushinteger(LuaHandle, weather);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnZoneWeatherChange (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnTOTDChange(uint16 ZoneID, uint8 TOTD)
{
	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnTOTDChange");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", zoneutils::GetZone(ZoneID)->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

    lua_getglobal(LuaHandle, "OnTOTDChange");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_pushinteger(LuaHandle, TOTD);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnTOTDChange (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "OnUseWeaponSkill");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 4)
    {
        ShowError("luatils::OnUseWeaponSkill (%s): 4 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
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
    lua_pop(LuaHandle, 4);
    if (returns > 4)
    {
        ShowError("luatils::OnUseWeaponSkill (%s): 4 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-4);
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobWeaponSkill");

	snprintf(File, sizeof(File), "scripts/globals/mobskills/%s.lua", PMobSkill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnMobWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnMobWeaponSkill");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::OnMobWeaponSkill (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luatils::OnMobWeaponSkill (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMobSkillCheck");

	snprintf(File, sizeof(File), "scripts/globals/mobskills/%s.lua", PMobSkill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnMobSkillCheck (%s): %s\n",PMobSkill->getName(),lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 1;
	}

    lua_getglobal(LuaHandle, "OnMobSkillCheck");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::OnMobSkillCheck (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -5);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luatils::OnMobSkillCheck (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnMagicCastingCheck");

	snprintf(File, sizeof(File), (PSpell->getSpellGroup() == SPELLGROUP_BLUE ? "scripts/globals/spells/bluemagic/%s.lua" : "scripts/globals/spells/%s.lua"), PSpell->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnMagicCastingCheck (%s): %s\n",PSpell->getName(),lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnMagicCastingCheck");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		ShowError("luautils::OnMagicCastingCheck (%s): undefined procedure OnMagicCastingCheck\n", PSpell->getName());
		return 47;
	}

    CLuaBaseEntity LuaCharEntity(PChar);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaCharEntity);

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaSpell LuaSpell(PSpell);
	Lunar<CLuaSpell>::push(LuaHandle,&LuaSpell);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMagicCastingCheck (%s): %s\n",PSpell->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 47;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::OnMagicCastingCheck (%s): 1 return expected, got %d\n", File, returns);
        return 47;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -5);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luatils::OnMagicCastingCheck (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnAbilityCheck");

    char filePath[40] = "scripts/globals/abilities/%s.lua";

    if(PAbility->isAvatarAbility())
    {
        memcpy(filePath,"scripts/globals/abilities/pets/%s.lua",38);
    }

	snprintf(File, sizeof(File), filePath, PAbility->getName());


	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnAbilityCheck (%s): %s\n",PAbility->getName(),lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnAbilityCheck");
	if( lua_isnil(LuaHandle,-1))
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 2)
    {
        ShowError("luatils::OnAbilityCheck (%s): 2 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
        return 87;
    }
	if((!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0) != 0)
		*PMsgTarget = (CBaseEntity*)PTarget;

	uint32 retVal = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : -5);
    lua_pop(LuaHandle, 2);
    if (returns > 2)
    {
        ShowError("luatils::OnAbilityCheck (%s): 2 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-2);
    }
    return retVal;
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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnPetAbility");

	snprintf(File, sizeof(File), "scripts/globals/abilities/pets/%s.lua", PMobSkill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnPetAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnPetAbility");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luatils::OnPetAbility (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luatils::OnPetAbility (%s): 1 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
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

    lua_getglobal(LuaHandle, "OnUseAbility");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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

    if (returns > 3)
    {
        action->speceffect = (SPECEFFECT)(!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        action->animation = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : 0);
	    int32 retVal = (!lua_isnil(LuaHandle,-3) && lua_isnumber(LuaHandle,-3) ? (int32)lua_tonumber(LuaHandle,-3) : 0);
        ShowError("luatils::OnUseAbility (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
        lua_pop(LuaHandle, returns);
        return retVal;
    }
    else if (returns == 3)
    {
        action->speceffect = (SPECEFFECT)(!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        action->animation = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : 0);
	    int32 retVal = (!lua_isnil(LuaHandle,-3) && lua_isnumber(LuaHandle,-3) ? (int32)lua_tonumber(LuaHandle,-3) : 0);
        lua_pop(LuaHandle, 3);
        return retVal;
    }
    else if (returns == 2)
    {
        action->animation = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
	    uint32 retVal = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : 0);
        lua_pop(LuaHandle, 2);
        return retVal;
    }
    else if (returns == 1)
    {
	    int32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        lua_pop(LuaHandle, 1);
        return retVal;
    }
    else
    {
	    return 0;
    }
}

int32 clearVarFromAll(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isstring(L, -1));

	const int8* varname = lua_tostring(L, -1);

	Sql_Query(SqlHandle, "DELETE FROM char_vars WHERE varname = '%s';", varname);

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
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnUseAbilityRoll");

	snprintf(File, sizeof(File), "scripts/globals/abilities/%s.lua", PAbility->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseAbilityRoll: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnUseAbilityRoll");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnUseAbilityRoll (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 AfterInstanceRegister(uint32 tick, CTaskMgr::CTask *PTask)
{
	CCharEntity* PChar = (CCharEntity*)PTask->m_data;

	DSP_DEBUG_BREAK_IF(!PChar->PInstance);

	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "afterInstanceRegister");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PChar->loc.zone->GetName(), PChar->PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	lua_getglobal(LuaHandle, "afterInstanceRegister");
	if (lua_isnil(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::AfterInstanceRegister: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::AfterInstanceRegister (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceLoadFailed(CZone* PZone)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceLoadFailed");

	snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PZone->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceLoadFailed: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceLoadFailed");
	if (lua_isnil(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		ShowError("luautils::OnInstanceLoadFailed: undefined procedure onInstanceLoadFailed\n");
		return 0;
	}

	if (lua_pcall(LuaHandle, 0, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceLoadFailed: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns < 1)
	{
		ShowError("luatils::OnInstanceLoadFailed (%s): 1 return expected, got %d\n", File, returns);
		return 0;
	}
	uint32 retVal = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
	lua_pop(LuaHandle, 1);
	if (returns > 1)
	{
		ShowError("luatils::OnInstanceLoadFailed (%s): 1 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns - 1);
	}
	return retVal;
}

int32 OnInstanceTimeUpdate(CZone* PZone, CInstance* PInstance, uint32 time)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceTimeUpdate");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PZone->GetName(), PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceTimeUpdate: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceTimeUpdate");
	if (lua_isnil(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		ShowError("luautils::OnInstanceTimeUpdate: undefined procedure onInstanceTimeUpdate\n");
		return 0;
	}

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	lua_pushinteger(LuaHandle, time);

	if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceTimeUpdate: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceTimeUpdate (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceFailure(CInstance* PInstance)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceFailure");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceFailure: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceFailure");
	if (lua_isnil(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		ShowError("luautils::OnInstanceFailure: undefined procedure onInstanceFailure\n");
		return 0;
	}

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceFailure: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceFailure (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

/************************************************************************
*																		*
*  When instance is created, let player know it's finished				*
*																		*
************************************************************************/

int32 OnInstanceCreated(CCharEntity* PChar, CInstance* PInstance)
{
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceCreated");

	int8 File[255];
	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		memset(File, 0, sizeof(File));
		snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

		if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
		{
			ShowError("luautils::OnInstanceCreated %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

	lua_getglobal(LuaHandle, "onInstanceCreated");
	if (lua_isnil(LuaHandle, -1))
	{
		ShowError("luautils::OnInstanceCreated: undefined procedure onInstanceCreated\n");
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

	if (PInstance)
	{
		CLuaInstance LuaInstance(PInstance);
		Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);
	}
	else
	{
		lua_pushnil(LuaHandle);
	}

	CLuaBaseEntity LuaTargetEntity(PChar->m_event.Target);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaTargetEntity);

	if (lua_pcall(LuaHandle, 3, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceCreated %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceCreated (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

/************************************************************************
*																		*
*  When instance is created, run setup script for instance				*
*																		*
************************************************************************/

int32 OnInstanceCreated(CInstance* PInstance)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceCreated");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceCreated: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceCreated");
	if (lua_isnil(LuaHandle, -1))
	{
		ShowError("luautils::OnInstanceCreated: undefined procedure onInstanceCreated\n");
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceCreated %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceCreated (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceProgressUpdate(CInstance* PInstance)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceProgressUpdate");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceProgressUpdate: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceProgressUpdate");
	if (lua_isnil(LuaHandle, -1))
	{
		ShowError("luautils::OnInstanceProgressUpdate: undefined procedure onInstanceProgressUpdate\n");
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	lua_pushinteger(LuaHandle, PInstance->GetProgress());

	if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceProgressUpdate %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceProgressUpdate (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceStageChange(CInstance* PInstance)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceStageChange");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceStageChange: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceStageChange");
	if (lua_isnil(LuaHandle, -1))
	{
		ShowError("luautils::OnInstanceStageChange: undefined procedure onInstanceStageChange\n");
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	lua_pushinteger(LuaHandle, PInstance->GetStage());

	if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceStageChange %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceStageChange (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceComplete(CInstance* PInstance)
{
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "onInstanceComplete");

	snprintf(File, sizeof(File), "scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnInstanceComplete: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "onInstanceComplete");
	if (lua_isnil(LuaHandle, -1))
	{
		ShowError("luautils::OnInstanceComplete: undefined procedure onInstanceComplete\n");
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnInstanceComplete %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luatils::OnInstanceComplete (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
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
    int32 oldtop = lua_gettop(LuaHandle);

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

    lua_getglobal(LuaHandle, "onTransportEvent");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnTransportEvent (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/********************************************************************
	onBcnmEnter - callback when you enter a BCNM via a lua call to bcnmEnter(bcnmid)
*********************************************************************/
int32 OnBcnmEnter(CCharEntity* PChar, CBattlefield* PBattlefield){
	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnBcnmEnter");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", PChar->loc.zone->GetName(), PBattlefield->getBcnmName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnBcnmEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnBcnmEnter");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		ShowError("luautils::OnBcnmEnter: undefined procedure OnBcnmEnter\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnBcnmEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnBcnmEnter (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/********************************************************************
	onBcnmLeave - callback when you leave a BCNM via multiple means.
	The method of leaving is given by the LeaveCode as follows:
	1 - Leaving via burning circle e.g. "run away"
    2 - Leaving via win
	3 - Leaving via warp or d/c
	4 - Leaving via lose
	This callback is executed for everyone in the BCNM when they leave
	so if they leave via win, this will be called for each char.
*********************************************************************/
int32 OnBcnmLeave(CCharEntity* PChar, CBattlefield* PBattlefield, uint8 LeaveCode){
	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnBcnmLeave");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", PChar->loc.zone->GetName(), PBattlefield->getBcnmName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnBcnmLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnBcnmLeave");
	if( lua_isnil(LuaHandle,-1) )
	{
        lua_pop(LuaHandle, 1);
		ShowError("luautils::OnBcnmLeave: undefined procedure OnBcnmLeave\n");
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);

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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luatils::OnBcnmLeave (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/********************************************************************
	onBcnmRegister - callback when you successfully register a BCNM.
	For example, trading an orb, selecting the battle.
	Called AFTER assigning BCNM status to all valid characters.
	This callback is called only for the character initiating the
	registration, and after CBattlefield:init() procedure.
*********************************************************************/
int32 OnBcnmRegister(CCharEntity* PChar, CBattlefield* PBattlefield){
	int8 File[255];
	memset(File,0,sizeof(File));
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "OnBcnmRegister");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", PChar->loc.zone->GetName(), PBattlefield->getBcnmName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnBcnmRegister: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    lua_getglobal(LuaHandle, "OnBcnmRegister");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnBcnmRegister: undefined procedure OnBcnmRegister\n");
        lua_pop(LuaHandle, 1);
		return 0;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);
	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnBcnmRegister: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 0)
    {
        ShowError("luatils::OnBcnmRegister (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/********************************************************************
onBcnmDestroy - called when BCNM is destroyed (cleanup)
*********************************************************************/
int32 OnBcnmDestroy(CBattlefield* PBattlefield){
	int8 File[255];
	memset(File, 0, sizeof(File));
	int32 oldtop = lua_gettop(LuaHandle);

	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, "OnBcnmDestroy");

	snprintf(File, sizeof(File), "scripts/zones/%s/bcnms/%s.lua", zoneutils::GetZone(PBattlefield->getZoneId())->GetName(), PBattlefield->getBcnmName());

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		ShowError("luautils::OnBcnmDestroy: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, "OnBcnmDestroy");
	if (lua_isnil(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		return 0;
	}

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::OnBcnmDestroy: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;

	if (returns > 0)
	{
		ShowError("luatils::OnBcnmDestroy (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
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
		  int32 r = WELL512::irand()%50;
		  int32 ret = Sql_Query(SqlHandle, "SELECT pos_x, pos_y, pos_z FROM `nm_spawn_points` WHERE mobid=%u AND pos=%i", mobid, r);

		  if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS) {
			PMob->m_SpawnPoint.rotation = WELL512::irand() % 256;
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

/******************************************************************************
*                                                                             *
* Update the Treasure spawn point to a new point, retrieved from the database *
*                                                                             *
*******************************************************************************/
int32 UpdateTreasureSpawnPoint(lua_State* L)
{
	// TODO: check respawn time
	if ( !lua_isnil(L,1) && lua_isnumber(L,1) ) {
		uint32 npcid = (uint32)lua_tointeger(L,1);

		uint32 OpenTime = 300000; // 5 min respawn

		if ( !lua_isnil(L,2) && lua_isboolean(L,2) ) {
			if ( lua_toboolean(L,2) == 1 ) {
				OpenTime = 3000; // respawn immediately (3 sec)
			}
		}

		zoneutils::UpdateTreasureSpawnPoint(npcid, OpenTime);

		CBaseEntity* PNpc = zoneutils::GetEntity(npcid, TYPE_NPC);
		if(PNpc)
		{
			PNpc->status = STATUS_DISAPPEAR;
			PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_DESPAWN, UPDATE_NONE));
		}

		return 0;
	}
	lua_pushnil(L);
	return 1;
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

		lua_getglobal(L,CLuaSpell::className);
		lua_pushstring(L,"new");
		lua_gettable(L,-2);
		lua_insert(L,-2);
		lua_pushlightuserdata(L,(void*)PSpell);
		lua_pcall(L,2,1,0);

		return 1;
	}
	return 0;
}

int32 UpdateServerMessage(lua_State* L)
{
    int8 line[1024];
    FILE* fp;

    // Clear old messages..
    map_config.server_message.clear();
    map_config.server_message_fr.clear();

    // Load the English server message..
    fp = fopen("./conf/server_message.conf", "rb");
    if (fp == NULL)
    {
        ShowError("Could not read English server message from: ./conf/server_message.conf\n");
        return 1;
    }

    while (fgets(line, sizeof(line), fp))
    {
        string_t sline(line);
        map_config.server_message += sline;
    }

    fclose(fp);

    // Load the French server message..
    fp = fopen("./conf/server_message_fr.conf", "rb");
    if (fp == NULL)
    {
        ShowError("Could not read English server message from: ./conf/server_message_fr.conf\n");
        return 1;
    }

    while (fgets(line, sizeof(line), fp))
    {
        string_t sline(line);
        map_config.server_message_fr += sline;
    }

    fclose(fp);

    // Ensure both messages have null terminates..
    if (map_config.server_message.at(map_config.server_message.length() - 1) != 0x00)
        map_config.server_message += (char)0x00;
    if (map_config.server_message_fr.at(map_config.server_message_fr.length() - 1) != 0x00)
        map_config.server_message_fr += (char)0x00;

    return 0;
}

inline int32 nearLocation(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));

    position_t center;
    lua_getfield(L, 1, "x");
    center.x = lua_tonumber(L, -1);
    lua_getfield(L, 1, "y");
    center.y = lua_tonumber(L, -1);
    lua_getfield(L, 1, "z");
    center.z = lua_tonumber(L, -1);
    lua_getfield(L, 1, "rot");
    center.rotation = lua_tonumber(L, -1);
    
    float radius = lua_tonumber(L, 2);
    float theta = lua_tonumber(L, 3);

    position_t pos = nearPosition(center, radius, theta);

    lua_createtable(L, 3, 0);
    int8 newTable = lua_gettop(L);

    lua_pushnumber(L, pos.x);
    lua_setfield(L, newTable, "x");

    lua_pushnumber(L, pos.y);
    lua_setfield(L, newTable, "y");

    lua_pushnumber(L, pos.z);
    lua_setfield(L, newTable, "z");

    return 1;
}

}; // namespace luautils