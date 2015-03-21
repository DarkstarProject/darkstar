﻿/*
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

#include "../../common/lua/lunar.h"
#include "../../common/showmsg.h"
#include "../../common/timer.h"
#include "../../common/utils.h"
#include "../../common/malloc.h"

#include <string.h>
#include <unordered_map>

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
#include "lua_item.h"

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
#include "../items/item_puppet.h"

namespace luautils
{
lua_State*  LuaHandle = nullptr;

bool expansionRestrictionEnabled;
std::unordered_map<std::string, bool> expansionEnabledMap;

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
    lua_register(LuaHandle,"GetRegionInfluence", luautils::GetRegionInfluence);
    lua_register(LuaHandle,"getNationRank", luautils::getNationRank);
    lua_register(LuaHandle,"getConquestBalance", luautils::getConquestBalance);
    lua_register(LuaHandle,"isConquestAlliance", luautils::isConquestAlliance);
	lua_register(LuaHandle,"setMobPos",luautils::setMobPos);
	lua_register(LuaHandle,"SpawnMob",luautils::SpawnMob);
	lua_register(LuaHandle,"DespawnMob",luautils::DespawnMob);
	lua_register(LuaHandle,"GetPlayerByName",luautils::GetPlayerByName);
	lua_register(LuaHandle,"GetMobAction",luautils::GetMobAction);
    lua_register(LuaHandle,"VanadielTime",luautils::VanadielTime);
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
    Lunar<CLuaItem>::Register(LuaHandle);

    luaL_dostring(LuaHandle, "require('bit')");

	expansionRestrictionEnabled = (GetSettingsVariable("RESTRICT_BY_EXPANSION") != 0);

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

int32 prepFile(int8* File, const char* function)
{
    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, function);

    auto ret = luaL_loadfile(LuaHandle, File);
    if (ret)
    {
        if (ret != LUA_ERRFILE)
            ShowError("luautils::%s: %s\n", function, lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    ret = lua_pcall(LuaHandle, 0, 0, 0);
    if (ret)
    {
        ShowError("luautils::%s: %s\n", function, lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, function);
    if (lua_isnil(LuaHandle, -1))
    {
        lua_pop(LuaHandle, 1);
        return -1;
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

        if (PNpc != nullptr)
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
	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
	{
		uint32 npcid = (uint32)lua_tointeger(L, 1);

        CInstance* PInstance = nullptr;

        if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
        {
            CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
            PInstance = PLuaBaseEntity->GetBaseEntity()->PInstance;
        }

        CBaseEntity* PNpc = nullptr;

        if (PInstance)
        {
            PNpc = PInstance->GetEntity(npcid & 0xFFF, TYPE_NPC);
        }
        else
        {
            PNpc = zoneutils::GetEntity(npcid, TYPE_NPC);
        }

		if(PNpc == nullptr){
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

		if(PMob == nullptr){
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

		if(PMob != nullptr &&
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
    ConquestUpdate type = Conquest_Tally_Start;
    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        type = (ConquestUpdate)lua_tointeger(L, 1);
    }
    conquest::UpdateConquestGM(type);

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

int32 GetRegionInfluence(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushinteger(L, conquest::GetInfluenceGraphics((REGIONTYPE)lua_tointeger(L, 1)));
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

int32 getConquestBalance(lua_State* L)
{
    lua_pushinteger(L, conquest::GetBalance());
    return 1;
}

int32 isConquestAlliance(lua_State* L)
{
    lua_pushboolean(L, conquest::IsAlliance());
    return 1;
}

/************************************************************************
*																		*
* SetRegionalConquestOverseers() used for updating conquest guards		*
*																		*
************************************************************************/

int32 SetRegionalConquestOverseers(uint8 regionID)
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
		ShowError("luautils::SetRegionalConquestOverseers: undefined procedure SetRegionalConquestOverseers\n");
		return -1;
	}

    lua_pushinteger(LuaHandle, regionID);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::SetRegionalConquestOverseers: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::SetRegionalConquestOverseers (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/************************************************************************
*                                                                       *
*    Return Vanadiel Time                                               *
*                                                                       *
************************************************************************/

int32 VanadielTime(lua_State* L)
{
    lua_pushinteger(L, CVanaTime::getInstance()->getVanaTime());
    return 1;
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

		CMobEntity* PMob = nullptr;

		if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
		{
			CLuaInstance* PLuaInstance = Lunar<CLuaInstance>::check(L, 2);
			PMob = (CMobEntity*)PLuaInstance->GetInstance()->GetEntity(mobid & 0xFFF, TYPE_MOB);
		}
        else if (((mobid >> 12) & 0x0FFF) < MAX_ZONEID)
		{
			PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		}
        if (PMob != nullptr)
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
                    ShowDebug(CL_CYAN"SpawnMob: <%s> is already spawned\n" CL_RESET, PMob->GetName());
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
		if (PMob != nullptr)
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
		if (PMob != nullptr)
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
		int8* name = (int8*)lua_tolstring(L,-1,nullptr);

		CCharEntity* PTargetChar = zoneutils::GetCharByName(name);

		if (PTargetChar != nullptr)
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
    if (PMob != nullptr)
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
*                                                                       *
*  Get a Variable From Settings.lua                                     *
*                                                                       *
************************************************************************/

uint8 GetSettingsVariable(const char* variable)
{
	lua_pushnil(LuaHandle);
	lua_setglobal(LuaHandle, variable);

	int8 File[255];
	memset(File, 0, sizeof(File));
	snprintf(File, sizeof(File), "scripts/globals/settings.lua");

	if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
	{
		lua_pop(LuaHandle, 1);
		return 0;
	}

	lua_getglobal(LuaHandle, variable);

	if (lua_isnil(LuaHandle, -1) || !lua_isnumber(LuaHandle, -1))
	{
		lua_pop(LuaHandle, 1);
		return 0;
	}

	uint8 value = lua_tonumber(LuaHandle, -1);
	lua_pop(LuaHandle, -1);
	return value;
}

/************************************************************************
*                                                                       *
*  Check if an Expansion Is Enabled In Settings.lua                     *
*                                                                       *
************************************************************************/

bool IsExpansionEnabled(const char* expansionCode)
{
	if (expansionCode != nullptr){
		std::string expansionVariable("ENABLE_");
		expansionVariable.append(expansionCode);

        bool expansionEnabled;

        try
        {
            expansionEnabled = expansionEnabledMap.at(expansionVariable);
        }
        catch (std::out_of_range)
        {
            // Cache Expansion Lookups in a Map so that we don't re-hit the Lua file every time
            expansionEnabled = (GetSettingsVariable(expansionVariable.c_str()) != 0);
            expansionEnabledMap[expansionVariable] = expansionEnabled;
        }

		if (expansionEnabled == false && expansionRestrictionEnabled == true){
			return false;
		}
	}

	return true;
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

    lua_prepscript("scripts/zones/%s/Zone.lua", PZone->GetName());

    if (prepFile(File, "onInitialize"))
    {
        return -1;
    }

	CLuaZone LuaZone(PZone);
	Lunar<CLuaZone>::push(LuaHandle,&LuaZone);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::onInitialize: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::oInitialize (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/************************************************************************
*																		*
*  Выполняем скрипт при входе персонажа в зону							*
*																		*
************************************************************************/

int32 OnGameIn(CCharEntity* PChar, bool zoning)
{
    lua_prepscript("scripts/globals/player.lua");

    if (prepFile(File, "onGameIn"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushboolean(LuaHandle, PChar->GetPlayTime(false) == 0); // first login
    lua_pushboolean(LuaHandle, zoning);

	if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
	{
		ShowError("luautils::onGameIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onGameIn (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/Zone.lua", PChar->m_moghouseID ? "Residential_Area" : zoneutils::GetZone(PChar->loc.destination)->GetName());

    if (prepFile(File, "onZoneIn"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,PChar->loc.prevzone);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onZoneIn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onZoneIn (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onZoneIn (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
}

int32 AfterZoneIn(uint32 tick, CTaskMgr::CTask *PTask)
{
    CCharEntity* PChar = zoneutils::GetChar((uintptr)PTask->m_data);

    if (!PChar)
        return -1;

    lua_prepscript("scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

    if (prepFile(File, "afterZoneIn"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::afterZoneIn: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::afterZoneIn (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

    PChar->m_event.reset();
    PChar->m_event.Script.insert(0, File);

    if (prepFile(File, "onRegionEnter"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
    CLuaRegion LuaRegion(PRegion);
	Lunar<CLuaRegion>::push(LuaHandle,&LuaRegion);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onRegionEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onRegionEnter (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

    PChar->m_event.reset();
    PChar->m_event.Script.insert(0, File);

    if (prepFile(File, "onRegionLeave"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
    CLuaRegion LuaRegion(PRegion);
	Lunar<CLuaRegion>::push(LuaHandle,&LuaRegion);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onRegionLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onRegionLeave (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/npcs/%s.lua", PChar->loc.zone->GetName(), PNpc->GetName());

    PChar->m_event.reset();
    PChar->m_event.Target = PNpc;
    PChar->m_event.Script.insert(0, File);
    PChar->StatusEffectContainer->DelStatusEffect(EFFECT_BOOST);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onTrigger");

    auto ret = luaL_loadfile(LuaHandle, File);
    if (ret)
    {
        ShowError("luautils::%s: %s\n", "onTrigger", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    ret = lua_pcall(LuaHandle, 0, 0, 0);
    if (ret)
    {
        ShowError("luautils::%s: %s\n", "onTrigger", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    lua_getglobal(LuaHandle, "onTrigger");
    if (lua_isnil(LuaHandle, -1))
    {
        lua_pop(LuaHandle, 1);
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaBaseEntityTarg(PNpc);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntityTarg);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onTrigger: %s\n",lua_tostring(LuaHandle,-1));
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
            ShowError("luautils::onTrigger (%s): 1 or 0 returns expected, got %d\n", File, returns);
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
        lua_pop(LuaHandle, 1);
		memset(File,0,sizeof(File));
		snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

		if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
		{
			ShowError("luautils::onEventUpdate %s\n", lua_tostring(LuaHandle, -1));
			ShowError("luautils::onEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

    lua_getglobal(LuaHandle, "onEventUpdate");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::onEventUpdate: undefined procedure onEventUpdate\n");
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
		ShowError("luautils::onEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onEventUpdate (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnEventUpdate(CCharEntity* PChar, int8* string)
{
    int32 oldtop = lua_gettop(LuaHandle);

    lua_pushnil(LuaHandle);
    lua_setglobal(LuaHandle, "onEventUpdate");

    int8 File[255];
    if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0))
    {
        lua_pop(LuaHandle, 1);
        memset(File, 0, sizeof(File));
        snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

        if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
        {
            ShowError("luautils::onEventUpdate %s\n", lua_tostring(LuaHandle, -1));
            ShowError("luautils::onEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
            lua_pop(LuaHandle, 1);
            return -1;
        }
    }

    lua_getglobal(LuaHandle, "onEventUpdate");
    if (lua_isnil(LuaHandle, -1))
    {
        ShowError("luautils::onEventUpdate: undefined procedure onEventUpdate\n");
        lua_pop(LuaHandle, 1);
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PChar);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    lua_pushinteger(LuaHandle, PChar->m_event.EventID);
    lua_pushstring(LuaHandle, string);

    CLuaBaseEntity LuaTargetEntity(PChar->m_event.Target);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaTargetEntity);

    if (lua_pcall(LuaHandle, 4, LUA_MULTRET, 0))
    {
        ShowError("luautils::onEventUpdate: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onEventUpdate (%s): 0 returns expected, got %d\n", File, returns);
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
        lua_pop(LuaHandle, 1);
		memset(File,0,sizeof(File));
		snprintf(File, sizeof(File), "scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

		if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
		{
			ShowError("luautils::onEventFinish %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

    lua_getglobal(LuaHandle, "onEventFinish");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::onEventFinish: undefined procedure onEventFinish\n");
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
		ShowError("luautils::onEventFinish %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
	if(PChar->m_event.Script.find("/bcnms/") > 0 && PChar->health.hp <= 0){ //for some reason the event doesnt enforce death afterwards
		PChar->animation = ANIMATION_DEATH;
		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CRaiseTractorMenuPacket(PChar,TYPE_HOMEPOINT));
        PChar->updatemask |= UPDATE_HP;
	}
    if (returns > 0)
    {
        ShowError("luautils::onEventFinish (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/npcs/%s.lua", PChar->loc.zone->GetName(), PNpc->GetName());

    PChar->m_event.reset();
    PChar->m_event.Target = PNpc;
    PChar->m_event.Script.insert(0, File);

    if (prepFile(File, "onTrade"))
    {
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
		ShowError("luautils::onTrade: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onTrade (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnNpcSpawn(CBaseEntity* PNpc)
{
    DSP_DEBUG_BREAK_IF(PNpc == nullptr);

    lua_prepscript("scripts/zones/%s/npcs/%s.lua", PNpc->loc.zone->GetName(), PNpc->GetName());

    if (prepFile(File, "onSpawn"))
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PNpc);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::onNpcSpawn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onNpcSpawn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnAdditionalEffect(CBattleEntity* PAttacker, CBattleEntity* PDefender, CItemWeapon* PItem, apAction_t* Action, uint32 damage)
{
    lua_prepscript(PAttacker->objtype == TYPE_PC ? "scripts/globals/items/%s.lua" : "scripts/zones/%s/mobs/%s.lua",
        PAttacker->objtype == TYPE_PC ? PItem->getName() : PAttacker->loc.zone->GetName(), PAttacker->GetName());

    if (prepFile(File, "onAdditionalEffect"))
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PAttacker);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

    CLuaBaseEntity LuaMobEntity(PDefender);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

    lua_pushinteger(LuaHandle, damage);

    if( lua_pcall(LuaHandle,3,LUA_MULTRET,0) )
    {
        ShowError("luautils::onAdditionalEffect: %s\n",lua_tostring(LuaHandle,-1));
	    lua_pop(LuaHandle, 1);
        return -1;
    }
	int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 3)
    {
        Action->additionalEffect = (SUBEFFECT)(!lua_isnil(LuaHandle, -3) && lua_isnumber(LuaHandle, -3) ? (int32)lua_tonumber(LuaHandle, -3) : 0);
        Action->addEffectMessage = (!lua_isnil(LuaHandle, -2) && lua_isnumber(LuaHandle, -2) ? (int32)lua_tonumber(LuaHandle, -2) : 0);
        Action->addEffectParam = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
        ShowError("luautils::onAdditionalEffect (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
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
        ShowError("luautils::onAdditionalEffect (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
        lua_pop(LuaHandle, returns);
    }

    return 0;
}

int32 OnSpikesDamage(CBattleEntity* PDefender, CBattleEntity* PAttacker, apAction_t* Action, uint32 damage)
{
    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PDefender->loc.zone->GetName(), PDefender->GetName());

    if (prepFile(File, "onSpikesDamage"))
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PDefender);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    CLuaBaseEntity LuaMobEntity(PAttacker);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaMobEntity);

    lua_pushinteger(LuaHandle, damage);

    if (lua_pcall(LuaHandle, 3, LUA_MULTRET, 0))
    {
        ShowError("luautils::onSpikesDamage: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 3)
    {
        Action->spikesEffect = (SUBEFFECT)(!lua_isnil(LuaHandle, -3) && lua_isnumber(LuaHandle, -3) ? (int32)lua_tonumber(LuaHandle, -3) : 0);
        Action->spikesMessage = (!lua_isnil(LuaHandle, -2) && lua_isnumber(LuaHandle, -2) ? (int32)lua_tonumber(LuaHandle, -2) : 0);
        Action->spikesParam = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
        ShowError("luautils::onSpikesDamage (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
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
        ShowError("luautils::onSpikesDamage (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
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
    lua_prepscript("scripts/%s.lua", PStatusEffect->GetName());

    if (prepFile(File, "onEffectGain"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaStatusEffect LuaStatusEffect(PStatusEffect);
	Lunar<CLuaStatusEffect>::push(LuaHandle,&LuaStatusEffect);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onEffectGain: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onEffectGain (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/%s.lua", PStatusEffect->GetName());

    if (prepFile(File, "onEffectTick"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaStatusEffect LuaStatusEffect(PStatusEffect);
	Lunar<CLuaStatusEffect>::push(LuaHandle,&LuaStatusEffect);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onEffectTick: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onEffectTick (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/%s.lua", PStatusEffect->GetName());

    if (prepFile(File, "onEffectLose"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PEntity);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaStatusEffect LuaStatusEffect(PStatusEffect);
	Lunar<CLuaStatusEffect>::push(LuaHandle,&LuaStatusEffect);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onEffectLose: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onEffectLose (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnManeuverGain(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers)
{
    lua_prepscript("scripts/globals/abilities/pets/attachments/%s.lua", attachment->getName());

    if (prepFile(File, "onManeuverGain"))
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PEntity);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    lua_pushinteger(LuaHandle, maneuvers);

    if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
    {
        ShowError("luautils::onManeuverGain: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onManeuverGain (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
    return 0;
}

int32 OnManeuverLose(CBattleEntity* PEntity, CItemPuppet* attachment, uint8 maneuvers)
{
    lua_prepscript("scripts/globals/abilities/pets/attachments/%s.lua", attachment->getName());

    if (prepFile(File, "onManeuverLose"))
    {
        return -1;
    }

    CLuaBaseEntity LuaBaseEntity(PEntity);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    lua_pushinteger(LuaHandle, maneuvers);

    if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
    {
        ShowError("luautils::onManeuverLose: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onManeuverLose (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/globals/items/%s.lua", PItem->getName());

    if (prepFile(File, "onItemCheck"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,param);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onItemCheck: %s\n",lua_tostring(LuaHandle,-1));
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
            ShowError("luautils::onItemCheck (%s): 1 return expected, got %d\n", File, retNumber);
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
    lua_prepscript("scripts/globals/items/%s.lua", PItem->getName());

    if (prepFile(File, "onItemUse"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::onItemUse: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onItemUse (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/globals/gear_sets.lua");

    if (prepFile(File, "checkForGearSet"))
    {
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
        ShowError("luautils::CheckForGearSet (%s): 0 returns expected, got %d\n", File, returns);
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
    DSP_DEBUG_BREAK_IF(PSpell == nullptr);

    lua_prepscript(PSpell->getSpellGroup() == SPELLGROUP_BLUE ? "scripts/globals/spells/bluemagic/%s.lua" : "scripts/globals/spells/%s.lua",
        PSpell->getName());

    if (prepFile(File, "onSpellCast"))
    {
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
		ShowError("luautils::onSpellCast: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onSpellCast (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onSpellCast (%s): 1 return expected, got %d\n", File, returns);
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
        lua_prepscript("scripts/zones/%s/mobs/%s.lua", PCaster->loc.zone->GetName(), PCaster->GetName());

        if (prepFile(File, "onSpellPrecast"))
        {
            return 0;
        }

		CLuaBaseEntity LuaCasterEntity(PCaster);
		Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaCasterEntity);

		CLuaSpell LuaSpell(PSpell);
		Lunar<CLuaSpell>::push(LuaHandle, &LuaSpell);

		if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
		{
			ShowError("luautils::onSpellPrecast: %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return 0;
		}
		int32 returns = lua_gettop(LuaHandle) - oldtop;
		if (returns > 0)
		{
			ShowError("luautils::onMobInitialize (%s): 0 returns expected, got %d\n", File, returns);
			lua_pop(LuaHandle, returns);
		}
	}
	return 0;
}

int32 OnMonsterMagicPrepare(CBattleEntity* PCaster, CBattleEntity* PTarget)
{
	DSP_DEBUG_BREAK_IF(PCaster == nullptr || PTarget == nullptr);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PCaster->loc.zone->GetName(), PCaster->GetName());

    if (prepFile(File, "onMonsterMagicPrepare"))
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onMonsterMagicPrepare (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if ( returns > 1)
    {
        ShowError("luautils::onMonsterMagicPrepare (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns-1);
    }
    return retVal;
}

/************************************************************************
*																		*
*  Called when mob is targeted by a spell.                              *
*  Note: does not differentiate between offensive and defensive spells  *
*																		*
************************************************************************/

int32 OnMagicHit(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell)
{
    DSP_DEBUG_BREAK_IF(PSpell == nullptr);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PTarget->loc.zone->GetName(), PTarget->GetName());

    if (prepFile(File, "onMagicHit"))
    {
        return 0;
    }

    CLuaBaseEntity LuaCasterEntity(PCaster);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaCasterEntity);

    CLuaBaseEntity LuaTargetEntity(PTarget);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaTargetEntity);

    CLuaSpell LuaSpell(PSpell);
    Lunar<CLuaSpell>::push(LuaHandle, &LuaSpell);

    if (lua_pcall(LuaHandle, 3, LUA_MULTRET, 0))
    {
        ShowError("luautils::onMagicHit: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return 0;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onMagicHit (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
    uint32 retVal = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onMagicHit (%s): 1 return expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns - 1);
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
    DSP_DEBUG_BREAK_IF(PMob == nullptr);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobInitialize"))
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobInitialize (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnPath(CBaseEntity* PEntity)
{
    DSP_DEBUG_BREAK_IF(PEntity == nullptr);
    DSP_DEBUG_BREAK_IF(PEntity->objtype == TYPE_PC)

    lua_prepscript("scripts/zones/%s/%s/%s.lua", PEntity->loc.zone->GetName(), (PEntity->objtype == TYPE_MOB ? "mobs" : "npcs"), PEntity->GetName());


    if (prepFile(File, "onPath"))
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PEntity);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::onPath: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onPath (%s): 0 returns expected, got %d\n", File, returns);
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
	DSP_DEBUG_BREAK_IF(PTarget == nullptr || PMob == nullptr);

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PTarget);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (PTarget->objtype != TYPE_PET && PTarget->objtype != TYPE_MOB)
    {
        ((CCharEntity*)PTarget)->m_event.reset();
        ((CCharEntity*)PTarget)->m_event.Target = PMob;
        ((CCharEntity*)PTarget)->m_event.Script.insert(0, File);
    }

    if (prepFile(File, "onMobEngaged"))
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobEngaged (%s): 0 returns expected, got %d\n", File, returns);
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
	DSP_DEBUG_BREAK_IF(PMob == nullptr);

    uint8 weather = PMob->loc.zone->GetWeather();

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobDisengage"))
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobDisengage (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnMobDrawIn(CBaseEntity* PMob, CBaseEntity* PTarget)
{
	DSP_DEBUG_BREAK_IF(PTarget == nullptr || PMob == nullptr);

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PTarget);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

	if(PTarget->objtype != TYPE_PET && PTarget->objtype != TYPE_MOB)
	{
		((CCharEntity*)PTarget)->m_event.reset();
        ((CCharEntity*)PTarget)->m_event.Target = PMob;
        ((CCharEntity*)PTarget)->m_event.Script.insert(0, File);
	}

    if (prepFile(File, "onMobDrawIn"))
    {
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
        ShowError("luautils::onMobDrawIn (%s): 0 returns expected, got %d\n", File, returns);
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
    DSP_DEBUG_BREAK_IF(PMob == nullptr || PMob->objtype != TYPE_MOB)
    DSP_DEBUG_BREAK_IF(PTarget == nullptr || PTarget->objtype == TYPE_NPC);

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PTarget);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobFight"))
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobFight (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnCriticalHit(CBattleEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == nullptr || PMob->objtype != TYPE_MOB)

	CLuaBaseEntity LuaMobEntity(PMob);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onCriticalHit"))
    {
        return -1;
    }

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::onCriticalHit: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onCriticalHit (%s): 0 returns expected, got %d\n", File, returns);
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
    DSP_DEBUG_BREAK_IF(PMob == nullptr);

    CCharEntity* PChar = (CCharEntity*)PKiller;

    if (PChar)
    {
        // onMobDeathEx
        lua_prepscript("scripts/globals/mobs.lua");

        PChar->ForAlliance([PChar, PMob, PKiller, &File](CBattleEntity* PMember)
        {
            if (PMember->getZone() == PChar->getZone())
            {
                if (prepFile(File, "onMobDeathEx"))
                {
                    return;
                }

                CLuaBaseEntity LuaMobEntity(PMob);
                CLuaBaseEntity LuaKillerEntity(PMember);

                bool isKillShot = PMember->id == PKiller->id;
                bool isWeaponSkillKill = PChar->getWeaponSkillKill();
                
                Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaMobEntity);
                Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaKillerEntity);
                lua_pushboolean(LuaHandle, isKillShot);
                lua_pushboolean(LuaHandle, isWeaponSkillKill);
                // lua_pushboolean(LuaHandle, isMagicKill);
                // lua_pushboolean(LuaHandle, isPetKill);
                // Rather than use even more bools for this, I'm thinking it's better to replace isWeaponSkillKill with a "killType" value
                // Checking that sort of thing could also make Colibri mimic and Jailer of Fortitude reflect easier to do.
                
                if (lua_pcall(LuaHandle, 4, 0, 0))
                {
                    ShowError("luautils::onMobDeathEx: %s\n", lua_tostring(LuaHandle, -1));
                    lua_pop(LuaHandle, 1);
                }
            }
        } );

        // onMobDeath
        memset(File, 0, sizeof(File));

        lua_pushnil(LuaHandle);
        lua_setglobal(LuaHandle, "onMobDeath");

        snprintf( File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

        PChar->ForAlliance([PChar, PMob, &File, oldtop](CBattleEntity* PPartyMember)
        {
            CCharEntity* PMember = (CCharEntity*)PPartyMember;
            if (PMember->getZone() == PChar->getZone())
            {
                CLuaBaseEntity LuaMobEntity(PMob);
                CLuaBaseEntity LuaKillerEntity(PMember);
                
                PMember->m_event.reset();
                PMember->m_event.Target = PMob;
                PMember->m_event.Script.insert(0, File);
                
                if ( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
                {
                    lua_pop(LuaHandle, 1);
                    return;
                }
                
                lua_getglobal(LuaHandle, "onMobDeath");
                if ( lua_isnil(LuaHandle,-1) )
                {
                    ShowError("luautils::onMobDeath: undefined procedure onMobDeath\n");
                    lua_pop(LuaHandle, 1);
                    return;
                }
                
                Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
                if (PMember)
                {
                    CLuaBaseEntity LuaKillerEntity(PMember);
                    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaKillerEntity);
                }
                else
                {
                    lua_pushnil(LuaHandle);
                }
                
                if ( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
                {
                    ShowError("luautils::onMobDeath: %s\n",lua_tostring(LuaHandle,-1));
                    lua_pop(LuaHandle, 1);
                    return;
                }
                
                int32 returns = lua_gettop(LuaHandle) - oldtop;
                if (returns > 0)
                {
                    ShowError("luautils::onMobDeath (%s): 0 returns expected, got %d\n", File, returns);
                    lua_pop(LuaHandle, returns);
                }
            }
        } );
    }
    else
    {
        lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());
        memset(File, 0, sizeof(File));

        lua_pushnil(LuaHandle);
        lua_setglobal(LuaHandle, "onMobDeath");

        snprintf(File, sizeof(File), "scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

        CLuaBaseEntity LuaMobEntity(PMob);

        if (luaL_loadfile(LuaHandle, File) || lua_pcall(LuaHandle, 0, 0, 0))
        {
            lua_pop(LuaHandle, 1);
            return -1;
        }

        lua_getglobal(LuaHandle, "onMobDeath");
        if (lua_isnil(LuaHandle, -1))
        {
            ShowError("luautils::onMobDeath: undefined procedure onMobDeath\n");
            lua_pop(LuaHandle, 1);
            return -1;
        }

        Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaMobEntity);
        lua_pushnil(LuaHandle);

        if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
        {
            ShowError("luautils::onMobDeath: %s\n", lua_tostring(LuaHandle, -1));
            lua_pop(LuaHandle, 1);
            return -1;
        }

        int32 returns = lua_gettop(LuaHandle) - oldtop;
        if (returns > 0)
        {
            ShowError("luautils::onMobDeath (%s): 0 returns expected, got %d\n", File, returns);
            lua_pop(LuaHandle, returns);
        }
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
    DSP_DEBUG_BREAK_IF(PMob == nullptr);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobSpawn"))
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PMob);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);


    if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
    {
        ShowError("luautils::onMobSpawn: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobSpawn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnMobRoamAction(CBaseEntity* PMob)
{
    DSP_DEBUG_BREAK_IF(PMob == nullptr || PMob->objtype != TYPE_MOB)

	CLuaBaseEntity LuaMobEntity(PMob);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobRoamAction"))
    {
        return -1;
    }

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobRoamAction: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobRoamAction (%s): 0 returns expected, got %d\n", File, returns);
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
    DSP_DEBUG_BREAK_IF(PMob == nullptr || PMob->objtype != TYPE_MOB)

	CLuaBaseEntity LuaMobEntity(PMob);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobRoam"))
    {
        return -1;
    }

	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,1,LUA_MULTRET,0) )
	{
		ShowError("luautils::onMobRoam: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobRoam (%s): 0 returns expected, got %d\n", File, returns);
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
	DSP_DEBUG_BREAK_IF(PMob == nullptr);

    lua_prepscript("scripts/zones/%s/mobs/%s.lua", PMob->loc.zone->GetName(), PMob->GetName());

    if (prepFile(File, "onMobDespawn"))
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
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onMobDespawn (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/************************************************************************
*	OnGameDayAutomatisation()											*
*   used for creating action of npc every game day						*
*																		*
************************************************************************/

int32 OnGameDay(CZone* PZone)
{
    lua_prepscript("scripts/zones/%s/Zone.lua", PZone->GetName());

    if (prepFile(File, "onGameDay"))
    {
        return -1;
    }

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::onGameDay: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onGameDay (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/************************************************************************
*	OnGameHourAutomatisation()											*
*   used for creating action of npc every game hour						*
*																		*
************************************************************************/

int32 OnGameHour(CZone* PZone)
{
    lua_prepscript("scripts/zones/%s/Zone.lua", PZone->GetName());

    if (prepFile(File, "onGameHour"))
    {
        return -1;
    }

	if( lua_pcall(LuaHandle,0,LUA_MULTRET,0) )
	{
		ShowError("luautils::onGameHour: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onGameHour (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnZoneWeatherChange(uint16 ZoneID, uint8 weather)
{
    lua_prepscript("scripts/zones/%s/Zone.lua", zoneutils::GetZone(ZoneID)->GetName());

    if (prepFile(File, "onZoneWeatherChange"))
    {
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
        ShowError("luautils::onZoneWeatherChange (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnTOTDChange(uint16 ZoneID, uint8 TOTD)
{
    lua_prepscript("scripts/zones/%s/Zone.lua", zoneutils::GetZone(ZoneID)->GetName());

    if (prepFile(File, "onTOTDChange"))
    {
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
        ShowError("luautils::onTOTDChange (%s): 0 returns expected, got %d\n", File, returns);
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
	CWeaponSkill* wskill = PChar->PBattleAI->GetCurrentWeaponSkill();

    lua_prepscript("scripts/globals/weaponskills/%s.lua", wskill->getName());

    if (prepFile(File, "onUseWeaponSkill"))
    {
        return 0;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 4)
    {
        ShowError("luautils::onUseWeaponSkill (%s): 4 returns expected, got %d\n", File, returns);
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
        ShowError("luautils::onUseWeaponSkill (%s): 4 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/globals/mobskills/%s.lua", PMobSkill->getName());

    if (prepFile(File, "onMobWeaponSkill"))
    {
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
		ShowError("luautils::onMobWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onMobWeaponSkill (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onMobWeaponSkill (%s): 1 return expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/globals/mobskills/%s.lua", PMobSkill->getName());

    if (prepFile(File, "onMobSkillCheck"))
    {
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
		ShowError("luautils::onMobSkillCheck (%s): %s\n",PMobSkill->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onMobSkillCheck (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -5);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onMobSkillCheck (%s): 1 return expected, got %d\n", File, returns);
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
    lua_prepscript(PSpell->getSpellGroup() == SPELLGROUP_BLUE ? "scripts/globals/spells/bluemagic/%s.lua" : "scripts/globals/spells/%s.lua", PSpell->getName());

    if (prepFile(File, "onMagicCastingCheck"))
    {
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
		ShowError("luautils::onMagicCastingCheck (%s): %s\n",PSpell->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 47;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onMagicCastingCheck (%s): 1 return expected, got %d\n", File, returns);
        return 47;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -5);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onMagicCastingCheck (%s): 1 return expected, got %d\n", File, returns);
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
    DSP_DEBUG_BREAK_IF(PAbility == nullptr);

    char filePath[40] = "scripts/globals/abilities/%s.lua";

    if(PAbility->isAvatarAbility())
    {
        memcpy(filePath,"scripts/globals/abilities/pets/%s.lua",38);
    }

    lua_prepscript(filePath, PAbility->getName());

    if (prepFile(File, "onAbilityCheck"))
    {
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
		ShowError("luautils::onAbilityCheck (%s): %s\n",PAbility->getName(), lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 87;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 2)
    {
        ShowError("luautils::onAbilityCheck (%s): 2 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
        return 87;
    }
	if((!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0) != 0)
		*PMsgTarget = (CBaseEntity*)PTarget;

	uint32 retVal = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : -5);
    lua_pop(LuaHandle, 2);
    if (returns > 2)
    {
        ShowError("luautils::onAbilityCheck (%s): 2 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/globals/abilities/pets/%s.lua", PMobSkill->getName());

    if (prepFile(File, "onPetAbility"))
    {
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
		ShowError("luautils::onPetAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns < 1)
    {
        ShowError("luautils::onPetAbility (%s): 1 return expected, got %d\n", File, returns);
        return 0;
    }
	uint32 retVal = (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
    lua_pop(LuaHandle, 1);
    if (returns > 1)
    {
        ShowError("luautils::onPetAbility (%s): 1 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/globals/abilities/%s.lua", PAbility->getName());

    if (prepFile(File, "onUseAbility"))
    {
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
		ShowError("luautils::onUseAbility: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}

    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 3)
    {
        action->speceffect = (SPECEFFECT)(!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : 0);
        action->animation = (!lua_isnil(LuaHandle,-2) && lua_isnumber(LuaHandle,-2) ? (int32)lua_tonumber(LuaHandle,-2) : 0);
	    int32 retVal = (!lua_isnil(LuaHandle,-3) && lua_isnumber(LuaHandle,-3) ? (int32)lua_tonumber(LuaHandle,-3) : 0);
        ShowError("luautils::onUseAbility (%s): 3 returns expected, got %d\n", File, lua_gettop(LuaHandle));
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
    lua_prepscript("scripts/globals/abilities/%s.lua", PAbility->getName());

    if (prepFile(File, "onUseAbilityRoll"))
    {
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
		ShowError("luautils::onUseAbilityRoll: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onUseAbilityRoll (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 AfterInstanceRegister(uint32 tick, CTaskMgr::CTask *PTask)
{
	CCharEntity* PChar = (CCharEntity*)PTask->m_data;

	DSP_DEBUG_BREAK_IF(!PChar->PInstance);

    lua_prepscript("scripts/zones/%s/instances/%s.lua", PChar->loc.zone->GetName(), PChar->PInstance->GetName());

    if (prepFile(File, "afterInstanceRegister"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::afterInstanceRegister: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::afterInstanceRegister (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceLoadFailed(CZone* PZone)
{
    lua_prepscript("scripts/zones/%s/Zone.lua", PZone->GetName());

    if (prepFile(File, "onInstanceLoadFailed"))
    {
        return -1;
    }

	if (lua_pcall(LuaHandle, 0, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceLoadFailed: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns < 1)
	{
		ShowError("luautils::onInstanceLoadFailed (%s): 1 return expected, got %d\n", File, returns);
		return 0;
	}
	uint32 retVal = (!lua_isnil(LuaHandle, -1) && lua_isnumber(LuaHandle, -1) ? (int32)lua_tonumber(LuaHandle, -1) : 0);
	lua_pop(LuaHandle, 1);
	if (returns > 1)
	{
		ShowError("luautils::onInstanceLoadFailed (%s): 1 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns - 1);
	}
	return retVal;
}

int32 OnInstanceTimeUpdate(CZone* PZone, CInstance* PInstance, uint32 time)
{
    lua_prepscript("scripts/zones/%s/instances/%s.lua", PZone->GetName(), PInstance->GetName());

    if (prepFile(File, "onInstanceTimeUpdate"))
    {
        return -1;
    }

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	lua_pushinteger(LuaHandle, time);

	if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceTimeUpdate: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceTimeUpdate (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceFailure(CInstance* PInstance)
{
    lua_prepscript("scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

    if (prepFile(File, "onInstanceFailure"))
    {
        return -1;
    }

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceFailure: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceFailure (%s): 0 returns expected, got %d\n", File, returns);
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
			ShowError("luautils::onInstanceCreated %s\n", lua_tostring(LuaHandle, -1));
			lua_pop(LuaHandle, 1);
			return -1;
		}
	}

	lua_getglobal(LuaHandle, "onInstanceCreated");
	if (lua_isnil(LuaHandle, -1))
	{
		ShowError("luautils::onInstanceCreated: undefined procedure onInstanceCreated\n");
		lua_pop(LuaHandle, 1);
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    CLuaBaseEntity LuaTargetEntity(PChar->m_event.Target);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaTargetEntity);

	if (PInstance)
	{
		CLuaInstance LuaInstance(PInstance);
		Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);
	}
	else
	{
		lua_pushnil(LuaHandle);
	}

	if (lua_pcall(LuaHandle, 3, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceCreated %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceCreated (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

    if (prepFile(File, "onInstanceCreated"))
    {
        return -1;
    }

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceCreated %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceCreated (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceProgressUpdate(CInstance* PInstance)
{
    lua_prepscript("scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

    if (prepFile(File, "onInstanceProgressUpdate"))
    {
        return -1;
    }

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	lua_pushinteger(LuaHandle, PInstance->GetProgress());

	if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceProgressUpdate %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceProgressUpdate (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceStageChange(CInstance* PInstance)
{
    lua_prepscript("scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

    if (prepFile(File, "onInstanceStageChange"))
    {
        return -1;
    }

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	lua_pushinteger(LuaHandle, PInstance->GetStage());

	if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceStageChange %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceStageChange (%s): 0 returns expected, got %d\n", File, returns);
		lua_pop(LuaHandle, returns);
	}
	return 0;
}

int32 OnInstanceComplete(CInstance* PInstance)
{
    lua_prepscript("scripts/zones/%s/instances/%s.lua", PInstance->GetZone()->GetName(), PInstance->GetName());

    if (prepFile(File, "onInstanceComplete"))
    {
        return -1;
    }

	CLuaInstance LuaInstance(PInstance);
	Lunar<CLuaInstance>::push(LuaHandle, &LuaInstance);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::onInstanceComplete %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return -1;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;
	if (returns > 0)
	{
		ShowError("luautils::onInstanceComplete (%s): 0 returns expected, got %d\n", File, returns);
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
    lua_prepscript("scripts/zones/%s/Zone.lua", PChar->loc.zone->GetName());

    if (prepFile(File, "onTransportEvent"))
    {
        return -1;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	lua_pushinteger(LuaHandle,TransportID);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onTransportEvent: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return -1;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onTransportEvent (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

int32 OnConquestUpdate(CZone* PZone, ConquestUpdate type)
{
    lua_prepscript("scripts/zones/%s/Zone.lua", PZone->GetName());

    if (prepFile(File, "onConquestUpdate"))
    {
        return -1;
    }
    CLuaZone LuaZone(PZone);
    Lunar<CLuaZone>::push(LuaHandle, &LuaZone);

    lua_pushinteger(LuaHandle, type);

    if (lua_pcall(LuaHandle, 2, LUA_MULTRET, 0))
    {
        ShowError("luautils::onConquestUpdate: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onConquestUpdate (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
    return 0;
}

/********************************************************************
	onBcnmEnter - callback when you enter a BCNM via a lua call to bcnmEnter(bcnmid)
*********************************************************************/
int32 OnBcnmEnter(CCharEntity* PChar, CBattlefield* PBattlefield){

    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    lua_prepscript("scripts/zones/%s/bcnms/%s.lua", PZone->GetName(), PBattlefield->getBcnmName());

    if (prepFile(File, "onBcnmEnter"))
    {
        return 0;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onBcnmEnter: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onBcnmEnter (%s): 0 returns expected, got %d\n", File, returns);
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

    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    lua_prepscript("scripts/zones/%s/bcnms/%s.lua", PZone->GetName(), PBattlefield->getBcnmName());

    if (prepFile(File, "onBcnmLeave"))
    {
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
		ShowError("luautils::onBcnmLeave: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onBcnmLeave (%s): 0 returns expected, got %d\n", File, returns);
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

    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    lua_prepscript("scripts/zones/%s/bcnms/%s.lua", PZone->GetName(), PBattlefield->getBcnmName());

    if (prepFile(File, "onBcnmRegister"))
    {
        return 0;
    }

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);
	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::onBcnmRegister: %s\n",lua_tostring(LuaHandle,-1));
        lua_pop(LuaHandle, 1);
		return 0;
	}
    int32 returns = lua_gettop(LuaHandle) - oldtop;

    if (returns > 0)
    {
        ShowError("luautils::onBcnmRegister (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }
	return 0;
}

/********************************************************************
onBcnmDestroy - called when BCNM is destroyed (cleanup)
*********************************************************************/
int32 OnBcnmDestroy(CBattlefield* PBattlefield){

    lua_prepscript("scripts/zones/%s/bcnms/%s.lua", zoneutils::GetZone(PBattlefield->getZoneId())->GetName(), PBattlefield->getBcnmName());

    if (prepFile(File, "onBcnmDestroy"))
    {
        return 0;
    }

	CLuaBattlefield LuaBattlefieldEntity(PBattlefield);
	Lunar<CLuaBattlefield>::push(LuaHandle, &LuaBattlefieldEntity);

	if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
	{
		ShowError("luautils::onBcnmDestroy: %s\n", lua_tostring(LuaHandle, -1));
		lua_pop(LuaHandle, 1);
		return 0;
	}
	int32 returns = lua_gettop(LuaHandle) - oldtop;

	if (returns > 0)
	{
		ShowError("luautils::onBcnmDestroy (%s): 0 returns expected, got %d\n", File, returns);
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

		if (PMob != nullptr) {
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

		if (PMob != nullptr) {
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

    if (PMob != nullptr) {
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
    if (fp == nullptr)
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
    if (fp == nullptr)
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

    // Ensure both messages have nullptr terminates..
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


int32 OnPlayerLevelUp(CCharEntity* PChar)
{
    lua_prepscript("scripts/globals/player.lua");
    if (prepFile(File, "onPlayerLevelUp"))
        return -1;

    CLuaBaseEntity LuaBaseEntity(PChar);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
    {
        ShowError("luautils::onPlayerLevelUp: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onPlayerLevelUp (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }

    return 0;
}

int32 OnPlayerLevelDown(CCharEntity* PChar)
{
    lua_prepscript("scripts/globals/player.lua");
    if (prepFile(File, "onPlayerLevelDown"))
        return -1;

    CLuaBaseEntity LuaBaseEntity(PChar);
    Lunar<CLuaBaseEntity>::push(LuaHandle, &LuaBaseEntity);

    if (lua_pcall(LuaHandle, 1, LUA_MULTRET, 0))
    {
        ShowError("luautils::onPlayerLevelDown: %s\n", lua_tostring(LuaHandle, -1));
        lua_pop(LuaHandle, 1);
        return -1;
    }

    int32 returns = lua_gettop(LuaHandle) - oldtop;
    if (returns > 0)
    {
        ShowError("luautils::onPlayerLevelDown (%s): 0 returns expected, got %d\n", File, returns);
        lua_pop(LuaHandle, returns);
    }

    return 0;
}


}; // namespace luautils