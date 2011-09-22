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

#include "../../common/lua/lunar.h"
#include "../../common/showmsg.h"

#include <string.h>

#include <string>

#include "luautils.h"
#include "lua_baseentity.h"
#include "lua_spell.h"
#include "lua_statuseffect.h"
#include "lua_trade_container.h"
#include "lua_zone.h"

#include "../baseentity.h"
#include "../battleentity.h"
#include "../charentity.h"
#include "../mobentity.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../vana_time.h"
#include "../zoneutils.h"

#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/message_basic.h"

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
	lua_register(LuaHandle,"SpawnMOBByID",luautils::SpawnMOBByID);
	lua_register(LuaHandle,"VanadielTOTD",luautils::VanadielTOTD);
	lua_register(LuaHandle,"VanadielHour",luautils::VanadielHour);
	lua_register(LuaHandle,"VanadielMinute",luautils::VanadielMinute);
	lua_register(LuaHandle,"VanadielTimeOffset",luautils::VanadielTimeOffset);
	lua_register(LuaHandle,"VanadielDayOfTheMonth",luautils::VanadielDayOfTheMonth);
	lua_register(LuaHandle,"VanadielDayOfTheYear",luautils::VanadielDayOfTheYear);
	lua_register(LuaHandle,"VanadielYear",luautils::VanadielYear);
	lua_register(LuaHandle,"VanadielMonth",luautils::VanadielMonth);

	Lunar<CLuaBaseEntity>::Register(LuaHandle);
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

//======================================================//

int32 GetNPCByID(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		uint32 npcid = (uint32)lua_tointeger(L, -1);
		uint8  zone  = (npcid >> 12)-4096;

		CBaseEntity* PNpc = zoneutils::GetZone(zone)->GetEntity((uint16)npcid & 0x0FFF, TYPE_NPC);

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
*																		*
*  Устанавливаем/узнаем смещение Vana'diel Time в минутах				*
*																		*
************************************************************************/

int32 VanadielTimeOffset(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		int32 offset = (uint32)lua_tointeger(L, -1);
		CVanaTime::getInstance()->setCustomOffset(offset);
		zoneutils::UpdateVanadielTime();
		return 0;
	}
	lua_pushinteger(L,CVanaTime::getInstance()->getCustomOffset());
	return 1;
}

/************************************************************************
*																		*
*  Возрождение монстра по его ID.										*
*																		*
************************************************************************/

int32 SpawnMOBByID(lua_State* L)
{
	if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
	{
		uint32 mobid = (uint32)lua_tointeger(L, -1);
		uint8  zone  = (mobid >> 12)-4096;

		CMobEntity* PMob = (CMobEntity*)zoneutils::GetZone(zone)->GetEntity((uint16)mobid & 0x0FFF, TYPE_MOB);

		if (PMob != NULL)
		{
			PMob->PBattleAI->SetLastActionTime(0);
			PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
		}
		return 0;
	}
	lua_pushnil(L);
	return 1;
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
   
	lua_pushstring(LuaHandle,"onServerStart");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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
*  Получаем значение константы из соответствующего TextIDs				*
*																		*
************************************************************************/

int32 GetGlobalConstant(const int8* name, uint8 ZoneID)
{
	CZone* PZone = zoneutils::GetZone(ZoneID);

	int8 File[255];
	memset(File,0,sizeof(File));

  	snprintf(File,sizeof(File),"%s/zones/%s/TextIDs.lua",LuaScriptDir,PZone->GetName());

	return 0;
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
		ShowError("luautils::OnZoneInitialise: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
   
	lua_pushstring(LuaHandle,"onInitialize");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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
   
	lua_pushstring(LuaHandle,"onZoneIn");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

int32 OnRegionEnter(CCharEntity* PChar, uint32 RegionID)
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
   
	lua_pushstring(LuaHandle,"onRegionEnter");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnRegionEnter: undefined procedure onRegionEnter\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
  
	lua_pushinteger(LuaHandle,RegionID);
  
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

int32 OnRegionLeave(CCharEntity* PChar, uint32 RegionID)
{
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
	
	snprintf(File,sizeof(File),"%s/zones/%s/npcs/%s.lua",LuaScriptDir,zoneutils::GetZone(PChar->getZone())->GetName(),PNpc->GetName());
	
	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		if (PNpc->name[0] != '_')
		{
			ShowError("luautils::OnTrigger: %s\n",lua_tostring(LuaHandle,-1));
		}
		return -1;
	}

	lua_pushstring(LuaHandle,"onTrigger");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	lua_pushstring(LuaHandle,"onEventUpdate");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	lua_pushstring(LuaHandle,"onEventFinish");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnTrade: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}

	lua_pushstring(LuaHandle,"onTrade");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	lua_pushstring(LuaHandle,"onEffectGain");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	PEntity->addModifiers(&PStatusEffect->modList);

	if (PEntity->objtype == TYPE_PC)
	{
		((CCharEntity*)PEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)PEntity));
		((CCharEntity*)PEntity)->pushPacket(new CCharSyncPacket((CCharEntity*)PEntity));
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

	lua_pushstring(LuaHandle,"onEffectTick");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	lua_pushstring(LuaHandle,"onEffectLose");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	PEntity->delModifiers(&PStatusEffect->modList);

	if (PEntity->objtype == TYPE_PC)
	{
		((CCharEntity*)PEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)PEntity));
		((CCharEntity*)PEntity)->pushPacket(new CCharSyncPacket((CCharEntity*)PEntity));
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

	lua_pushstring(LuaHandle,"onItemCheck");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	lua_pushstring(LuaHandle,"onItemUse");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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

	lua_pushstring(LuaHandle,"onSpellCast");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
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
	int8 File[255];
	memset(File,0,sizeof(File));

	snprintf(File,sizeof(File),"%s/zones/%s/mobs/%s.lua",LuaScriptDir,zoneutils::GetZone(PMob->getZone())->GetName(), PMob->GetName());

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		return -1;
	}

	lua_pushstring(LuaHandle,"onMobDeath");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnMobDeath: undefined procedure onMobDeath\n");
		return -1;
	}

	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	
	CLuaBaseEntity LuaKillerEntity(PKiller);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaKillerEntity);

	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnMobDeath: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
}

/************************************************************************
*																		*
*		Runs LUA for special weapons on Kill							*
*																		*
************************************************************************/

int32 OnSpecialWeaponKill(CCharEntity* PChar) 
{
	int8 File[255];
	memset(File,0,sizeof(File));

  	CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_MAIN]);
	
	snprintf(File,sizeof(File),"%s/globals/specialweapons/%s.lua",LuaScriptDir, PItem->getName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		//ShowError("luautils::OnSpecialWeaponKill: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
   
	lua_pushstring(LuaHandle,"onSpecialWeaponKill");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnSpecialWeaponKill: undefined procedure onSpecialWeaponKill\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
  
	lua_pushinteger(LuaHandle,0);
  
	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnSpecialWeaponKill: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
	return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
	
}

int32 OnUseWeaponSkill(CCharEntity* PChar, CBaseEntity* PMob) 
{
	int8 File[255];
	memset(File,0,sizeof(File));

   //CItemWeapon* PItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_MAIN]);
	CWeaponSkill* wskill = PChar->PBattleAI->GetCurrentWeaponSkill();
	snprintf(File,sizeof(File),"%s/globals/weaponskills/%s.lua",LuaScriptDir, wskill->getName());

	PChar->m_event.reset();
	PChar->m_event.Script.insert(0,File);

	if( luaL_loadfile(LuaHandle,File) || lua_pcall(LuaHandle,0,0,0) )
	{
		ShowError("luautils::OnUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
   
	lua_pushstring(LuaHandle,"OnUseWeaponSkill");
	lua_gettable(LuaHandle,LUA_GLOBALSINDEX);
	if( lua_isnil(LuaHandle,-1) )
	{
		ShowError("luautils::OnUseWeaponSkill: undefined procedure OnUseWeaponSkill\n");
		return -1;
	}

	CLuaBaseEntity LuaBaseEntity(PChar);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaBaseEntity);
	
	CLuaBaseEntity LuaMobEntity(PMob);
	Lunar<CLuaBaseEntity>::push(LuaHandle,&LuaMobEntity);
	
	//lua_pushinteger(LuaHandle,0);
  
	if( lua_pcall(LuaHandle,2,LUA_MULTRET,0) )
	{
		ShowError("luautils::OnUseWeaponSkill: %s\n",lua_tostring(LuaHandle,-1));
		return -1;
	}
	//return (!lua_isnil(LuaHandle,-1) && lua_isnumber(LuaHandle,-1) ? (int32)lua_tonumber(LuaHandle,-1) : -1);
	return (int32)lua_tonumber(LuaHandle,-1);
}

}; // namespace luautils