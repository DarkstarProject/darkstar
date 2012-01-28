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
#include "lua_baseentity.h"
#include "lua_region.h"
#include "lua_spell.h"
#include "lua_statuseffect.h"
#include "lua_trade_container.h"
#include "lua_zone.h"

#include "../ability.h"
#include "../baseentity.h"
#include "../battleentity.h"
#include "../charentity.h"
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
#include "../packets/message_basic.h"
#include "../packets/uncnown_39.h"

namespace luautils
{
lua_State*  LuaHandle = NULL;
const int8* LuaScriptDir = "scripts";

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
	lua_register(LuaHandle,"SpawnMob",luautils::SpawnMob);
	lua_register(LuaHandle,"DespawnMob",luautils::DespawnMob);
	lua_register(LuaHandle,"GetMobAction",luautils::GetMobAction);
	lua_register(LuaHandle,"VanadielTOTD",luautils::VanadielTOTD);
	lua_register(LuaHandle,"VanadielHour",luautils::VanadielHour);
	lua_register(LuaHandle,"VanadielMinute",luautils::VanadielMinute);
	lua_register(LuaHandle,"VanadielDayOfTheMonth",luautils::VanadielDayOfTheMonth);
	lua_register(LuaHandle,"VanadielDayOfTheYear",luautils::VanadielDayOfTheYear);
	lua_register(LuaHandle,"VanadielYear",luautils::VanadielYear);
	lua_register(LuaHandle,"VanadielMonth",luautils::VanadielMonth);
	lua_register(LuaHandle,"RunElevator",luautils::StartElevator);
	lua_register(LuaHandle,"GetServerVariable",luautils::GetServerVariable);
	lua_register(LuaHandle,"SetServerVariable",luautils::SetServerVariable);
    lua_register(LuaHandle,"SendUncnown0x39Packet",luautils::SendUncnown0x39Packet);

	Lunar<CLuaBaseEntity>::Register(LuaHandle);
    Lunar<CLuaRegion>::Register(LuaHandle);
	Lunar<CLuaSpell>::Register(LuaHandle);
	Lunar<CLuaStatusEffect>::Register(LuaHandle);
	Lunar<CLuaTradeContainer>::Register(LuaHandle);
	Lunar<CLuaZone>::Register(LuaHandle);

	ShowMessage("\t\t - "CL_GREEN"[OK]"CL_RESET"\n"); 
	return 0;
}

/************************************************************************
*																		*
*  Освобождение lua														*
*																		*
************************************************************************/

int32 free()
{
	ShowStatus(CL_WHITE"luautils::free"CL_RESET":lua free...");
	lua_close(LuaHandle);
	ShowMessage("\t - "CL_GREEN"[OK]"CL_RESET"\n");
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
		return 0;
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
            zoneutils::GetZone(PNpc->getZone())->PushPacket(PNpc, CHAR_INRANGE, new CUncnown0x39Packet(PNpc, param));   
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

		lua_pushstring(L,CLuaBaseEntity::className);
		lua_gettable(L,LUA_GLOBALSINDEX);
		lua_pushstring(L,"new");
		lua_gettable(L,-2);
		lua_insert(L,-2);
		lua_pushlightuserdata(L,(void*)PNpc);
		lua_pcall(L,2,1,0);
		return 1;
	}
	lua_pushnil(L);
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
            if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
                PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
            {
                PMob->PBattleAI->SetLastActionTime(0);
                PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);

                if( !lua_isnil(L,2) && lua_isnumber(L,2))
                {
                    PMob->SetDespawnTimer((uint32)lua_tointeger(L,2)); 
                }
            } else {
                ShowDebug(CL_CYAN"SpawnMob: <%s> is alredy spawned\n"CL_RESET, PMob->GetName());
            }
        } else {
            ShowDebug(CL_RED"SpawnMob: mob <%u> not found\n"CL_RESET, mobid);
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
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L, -1);

		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		if (PMob != NULL)
		{
			PMob->PBattleAI->SetLastActionTime(gettick() - 12000);
			PMob->PBattleAI->SetCurrentAction(ACTION_DEATH);
		}
		return 0;
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Get Current Mob Action by Mob ID.									*
*                                                                       *
************************************************************************/

int32 GetMobAction(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L, -1);

		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		if (PMob != NULL)
		{
			int32 currentAction = (int32)PMob->PBattleAI->GetCurrentAction(); 
			lua_pushinteger(L,currentAction);
		    return 1;
        }
	}
	return -1;
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

	snprintf(File,sizeof(File),"%s/globals/server.lua",LuaScriptDir);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnServerStart: %s\n",lua_tostring(LuaHandle,-1));
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
										
int32 OnZoneInitialise(uint8 ZoneID)
{
	CZone* PZone = zoneutils::GetZone(ZoneID);

	int8 File[255];
	memset(File,0,sizeof(File));

	snprintf(File,sizeof(File),"%s/zones/%s/Zone.lua",LuaScriptDir,PZone->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
	  //ShowError("luautils::OnZoneInitialise: %s\n",lua_tostring(LuaHandle,-1));
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

	snprintf(File,sizeof(File),"%s/zones/%s/Zone.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnZoneIn: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/zones/%s/Zone.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnRegionEnter: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/zones/%s/Zone.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnRegionLeave: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/zones/%s/npcs/%s.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName(),PNpc->GetName());
	
	PChar->m_event.reset();
    PChar->m_event.Target = PNpc;
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnTrigger: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

/************************************************************************
*																		*
*  Запущенное событие нуждается в дополнительных параметрах				*
*																		*
************************************************************************/

int32 OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result)
{
	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0)) 
	{  
		ShowError("luautils::OnEventUpdate: %s\n", lua_tostring(LuaHandle, -1)); 		
		return -1;  
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

/************************************************************************
*																		*
*  Событие завершилось, результат события хранится в result				*
*																		*
************************************************************************/

int32 OnEventFinish(CCharEntity* PChar, uint16 eventID, uint32 result)
{
	if (luaL_loadfile(LuaHandle, PChar->m_event.Script.c_str()) || lua_pcall(LuaHandle, 0, 0, 0)) 
	{  
		ShowError("luautils::OnEventFinish %s\n", lua_tostring(LuaHandle, -1)); 		
		return -1;  
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/zones/%s/npcs/%s.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName(),PNpc->GetName());

	PChar->m_event.reset();
    PChar->m_event.Target = PNpc;
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnTrade: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/%s.lua",LuaScriptDir,PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectGain: %s\n",lua_tostring(LuaHandle,-1));
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

	snprintf(File,sizeof(File),"%s/%s.lua",LuaScriptDir,PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectTick: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/%s.lua",LuaScriptDir,PStatusEffect->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnEffectLose: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/globals/items/%s.lua",LuaScriptDir,PItem->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnItemCheck: %s\n",lua_tostring(LuaHandle,-1));
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
		return 56;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

	snprintf(File,sizeof(File),"%s/globals/items/%s.lua",LuaScriptDir,PItem->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnItemUse: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
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
	int8 File[255];
	memset(File,0,sizeof(File));

	CSpell* PSpell = PCaster->PBattleAI->GetCurrentSpell();

	snprintf(File,sizeof(File),"%s/globals/spells/%s.lua",LuaScriptDir, PSpell->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnSpellCast: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onSpellCast");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnSpellCast: undefined procedure onSpellCast\n");
		return -1;
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

/************************************************************************
*																		*
*  Скрипт выполняется после смерти любого монстра в игре				*
*																		*
************************************************************************/

int32 OnMobDeath(CBaseEntity* PMob, CBaseEntity* PKiller) 
{	
	DSP_DEBUG_BREAK_IF(PKiller == NULL || PMob == NULL);

	CLuaBaseEntity LuaMobEntity(PMob);
	CLuaBaseEntity LuaKillerEntity(PKiller);
	
    if (((CMobEntity*)PMob)->m_OwnerID == PKiller->id)
    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobDeathEx");
	if( !lua_isnil(LuaHandle,-1) )
	{
        Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
        Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

        if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	    {
		    ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
	    }
	}

	int8 File[255];
	memset(File,0,sizeof(File));

	snprintf(File,sizeof(File),"%s/zones/%s/mobs/%s.lua",LuaScriptDir,zoneutils::GetZone(PMob->getZone())->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
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
		return -1;
	}

    CCharEntity* PChar = (CCharEntity*)PKiller;

	if (PChar->PParty != NULL)
	{
	    for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
	    {
            if (PChar->PParty->members[i] == PChar ||
                PChar->PParty->members[i]->getZone() != PChar->getZone()) 
                continue;

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
			    return -1;
		    }
	    }
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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

    snprintf(File,sizeof(File),"%s/zones/%s/mobs/%s.lua",LuaScriptDir,zoneutils::GetZone(PMob->getZone())->GetName(), PMob->GetName());

    if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
    {
        return -1;
    }

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "onMobSpawn");
    if( lua_isnil(LuaHandle,-1) )
    {
        return -1;
    }

    CLuaBaseEntity LuaMobEntity(PMob);
    Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);


    if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
    {
        ShowError("luautils::OnMobSpawn: %s\n",lua_tostring(LuaHandle,-1));
        return -1;
    }
    return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnUseWeaponSkill(CCharEntity* PChar, CBaseEntity* PMob) 
{
	int8 File[255];
	memset(File,0,sizeof(File));

	CWeaponSkill* wskill = PChar->PBattleAI->GetCurrentWeaponSkill();
	snprintf(File,sizeof(File),"%s/globals/weaponskills/%s.lua",LuaScriptDir, wskill->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnUseWeaponSkill");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnUseWeaponSkill: undefined procedure OnUseWeaponSkill\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
	
	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	
	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

int32 OnUseAbility(CCharEntity* PChar, CBattleEntity* PTarget) 
{
	int8 File[255];
	memset(File,0,sizeof(File));

	CAbility* ability = PChar->PBattleAI->GetCurrentJobAbility();
	snprintf(File,sizeof(File),"%s/globals/abilities/%s.lua",LuaScriptDir, ability->getName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseAbility: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}

    lua_getfield(LuaHandle, LUA_GLOBALSINDEX, "OnUseAbility");
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnUseAbility: undefined procedure OnUseAbility\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
	
	CLuaBaseEntity LuaMobEntity(PTarget);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	
	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnUseAbility: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
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
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isstring(L,-2));

	int32 value = (int32)lua_tointeger(L,-1); 

	Sql_Query(SqlHandle,"INSERT INTO server_variables VALUES ('%s', %i) ON DUPLICATE KEY UPDATE value = %i;", lua_tostring(L,-2), value, value);
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

	snprintf(File,sizeof(File),"%s/zones/%s/Zone.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
	    ShowError("luautils::OnTransportEvent: %s\n",lua_tostring(LuaHandle,-1));
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
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

}; // namespace luautils