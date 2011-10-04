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

#ifndef _LUAUTILS_H
#define _LUAUTILS_H

#include "../../common/cbasetypes.h"

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

class CBaseEntity;
class CBattleEntity;
class CCharEntity;
class CItem;
class CStatusEffect;

namespace luautils
{
	extern struct lua_State* LuaHandle;
	extern const  int8*		 LuaScriptDir;

	int32 init();
	int32 free();
	int32 print(lua_State*);

	int32 GetNPCByID(lua_State*);												// Returns NPC By Id
	int32 SpawnMOBByID(lua_State*);												// Spawn Mob By Mob Id - NMs, BCNM...
	int32 DeSpawnMOBByID(lua_State*);											// Despawn (Fade Out) Mob By Id
	int32 VanadielTOTD(lua_State*);												// текущее игровое время суток
	int32 VanadielHour(lua_State*);												// текущие Vanadiel часы
	int32 VanadielMinute(lua_State*);											// текущие Vanadiel минуты
	int32 VanadielTimeOffset(lua_State*);										// смещение игрового времени (в целях отладки)
	int32 VanadielDayOfTheYear(lua_State*);
	int32 VanadielDayOfTheMonth(lua_State*);
	int32 VanadielYear(lua_State*);
	int32 VanadielMonth(lua_State*);

	int32 GetGlobalConstant(const int8* name, uint8 ZoneID);					// получаем значение константы из соответствующего TextIDs

	int32 OnServerStart();														// need to comments this declaration

	int32 OnZoneIn(CCharEntity* PChar);											// персонаж входит в зону
	int32 OnZoneInitialise(uint8 ZoneID);										// запускаем скрипт инициализации зоны
	int32 OnRegionEnter(CCharEntity* PChar, uint32 RegionID);					// персонаж входит в активный регион
	int32 OnRegionLeave(CCharEntity* PChar, uint32 RegionID);					// персонаж покидает активный регион

	int32 OnTrigger(CCharEntity* PChar, CBaseEntity* PNpc);						// need to comments this declaration
	int32 OnEventUpdate(CCharEntity* PChar, uint16 eventID, uint32 result);		// need to comments this declaration
	int32 OnEventFinish(CCharEntity* PChar, uint16 eventID, uint32 result);		// need to comments this declaration
	int32 OnTrade(CCharEntity* PChar, CBaseEntity* PNpc);						// need to comments this declaration

	int32 OnEffectGain(CBattleEntity* PEntity, CStatusEffect* StatusEffect);	// need to comments this declaration
	int32 OnEffectTick(CBattleEntity* PEntity, CStatusEffect* StatusEffect);	// need to comments this declaration
	int32 OnEffectLose(CBattleEntity* PEntity, CStatusEffect* StatusEffect);	// need to comments this declaration

	int32 OnItemUse(CBaseEntity* PTarget, CItem* PItem);						// используем предмет
	int32 OnItemCheck(CBaseEntity* PTarget, CItem* PItem, uint32 param = 0);	// проверяем возможность использования предмета

	int32 OnSpellCast(CBattleEntity* PCaster, CBattleEntity* PTarget);			// выполняем скрипт при чтении заклинаний (проверки, расчет урона)

	int32 OnMobDeath(CBaseEntity* PMob, CBaseEntity* PKiller);					// выполняем скрипт после смерти монстра

	int32 OnSpecialWeaponKill(CCharEntity* PChar);			// Testing for special weapons (Blade Of Darkness quest)
	
	int32 OnUseWeaponSkill(CCharEntity* PChar, CBaseEntity* PMob);
	int32 OnUseAbility(CCharEntity* PChar, CBattleEntity* PTarget);
	int32 OpenAuctionHouse(CCharEntity* PChar); 
};

#endif //- _LUAUTILS_H -
