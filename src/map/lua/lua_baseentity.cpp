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

#include "../../common/showmsg.h"
#include "../../common/timer.h"
#include "../../common/utils.h"

#include <math.h>

#include "lua_baseentity.h"
#include "lua_statuseffect.h"
#include "lua_trade_container.h"
#include "luautils.h"

#include "../packets/auction_house.h"
#include "../packets/char_abilities.h"
#include "../packets/char_appearance.h"
#include "../packets/char_jobs.h"
#include "../packets/char_equip.h"
#include "../packets/char_health.h"
#include "../packets/char_skills.h"
#include "../packets/char_spells.h"
#include "../packets/char_stats.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/entity_update.h"
#include "../packets/event.h"
#include "../packets/event_update.h"
#include "../packets/guild_menu.h"
#include "../packets/inventory_finish.h"
#include "../packets/inventory_modify.h"
#include "../packets/inventory_size.h"
#include "../packets/key_items.h"
#include "../packets/menu_mog.h"
#include "../packets/menu_merit.h"
#include "../packets/menu_raisetractor.h"
#include "../packets/message_basic.h"
#include "../packets/message_special.h"
#include "../packets/message_standard.h"
#include "../packets/message_system.h"
#include "../packets/message_text.h"
#include "../packets/position.h"
#include "../packets/quest_mission_log.h"
#include "../packets/release.h"
#include "../packets/server_ip.h"
#include "../packets/shop_items.h"
#include "../packets/shop_menu.h"
#include "../packets/conquest_map.h"
#include "../packets/weather.h"

#include "../battleutils.h"
#include "../charutils.h"
#include "../itemutils.h"
#include "../guildutils.h"
#include "../map.h"
#include "../mobentity.h"
#include "../npcentity.h"
#include "../petentity.h"
#include "../petutils.h"
#include "../spell.h"
#include "../trade_container.h"
#include "../zoneutils.h"

CLuaBaseEntity::CLuaBaseEntity(lua_State* L)
{
	if( !lua_isnil(L,-1) )
	{
		m_PBaseEntity = (CBaseEntity*)lua_touserdata(L,-1);
		lua_pop(L,1);
	}else{
		m_PBaseEntity = NULL;
	}
}

//======================================================//

CLuaBaseEntity::CLuaBaseEntity(CBaseEntity* PEntity)
{
	m_PBaseEntity = PEntity;
}

//======================================================//

inline int32 CLuaBaseEntity::leavegame(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	((CCharEntity*)m_PBaseEntity)->status = STATUS_SHUTDOWN;
	((CCharEntity*)m_PBaseEntity)->pushPacket(new CServerIPPacket((CCharEntity*)m_PBaseEntity,1));

	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::warp(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
	((CCharEntity*)m_PBaseEntity)->loc.p = ((CCharEntity*)m_PBaseEntity)->profile.home_point.p;
    ((CCharEntity*)m_PBaseEntity)->loc.destination = ((CCharEntity*)m_PBaseEntity)->profile.home_point.destination;

	((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
	((CCharEntity*)m_PBaseEntity)->animation = ANIMATION_NONE;

	((CCharEntity*)m_PBaseEntity)->clearPacketList();
	((CCharEntity*)m_PBaseEntity)->pushPacket(new CServerIPPacket((CCharEntity*)m_PBaseEntity,2));

	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.hp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	int32 result = ((CBattleEntity*)m_PBaseEntity)->addHP(lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
    lua_pushinteger( L, result );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	int32 result = ((CBattleEntity*)m_PBaseEntity)->addHP(-lua_tointeger(L,-1));
	
    if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::setHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	((CBattleEntity*)m_PBaseEntity)->health.hp = 0;
	int32 result = ((CBattleEntity*)m_PBaseEntity)->addHP(lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getPet(lua_State* L)
{
	if(((CBattleEntity*)m_PBaseEntity)->PPet != NULL)
	{
		//uint32 petid = (uint32);

		CBaseEntity* PPet = ((CBattleEntity*)m_PBaseEntity)->PPet;

		lua_pushstring(L,CLuaBaseEntity::className);
		lua_gettable(L,LUA_GLOBALSINDEX);
		lua_pushstring(L,"new");
		lua_gettable(L,-2);
		lua_insert(L,-2);
		lua_pushlightuserdata(L,(void*)PPet);
		lua_pcall(L,2,1,0);
		return 1;
	}
	lua_pushnil(L);
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.mp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	
	int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
    lua_pushinteger( L, result );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(-lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::setMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	((CBattleEntity*)m_PBaseEntity)->health.mp = 0;
	int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.tp );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::delTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(-lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::setTP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	((CBattleEntity*)m_PBaseEntity)->health.tp = 0;
	uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(lua_tointeger(L,-1));

	if( result != 0 &&	m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
	{
		charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
	}
	return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getMaxHP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMaxHP() );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getMaxMP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMaxMP() );
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getXPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushnumber(L, m_PBaseEntity->GetXPos());
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getYPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushnumber( L,  m_PBaseEntity->GetYPos());
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getZPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushnumber(L, m_PBaseEntity->GetZPos());
	return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getRace(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->look.race );
	return 1;
}

/************************************************************************
*                                                                       *
*  Мгновенное перемещение сущности                                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setPos(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

    if( m_PBaseEntity->objtype != TYPE_PC)
    {
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_DESPAWN));
    }

	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
		m_PBaseEntity->loc.p.x = (float) lua_tonumber(L,1);
	if( !lua_isnil(L,2) && lua_isnumber(L,2) )
		m_PBaseEntity->loc.p.y = (float) lua_tonumber(L,2);
	if( !lua_isnil(L,3) && lua_isnumber(L,3) )
		m_PBaseEntity->loc.p.z = (float) lua_tonumber(L,3);
	if( !lua_isnil(L,4) && lua_isnumber(L,4) )
		m_PBaseEntity->loc.p.rotation = (uint8) lua_tointeger(L,4);

	if( m_PBaseEntity->objtype == TYPE_PC)
	{
		if( !lua_isnil(L,5) && lua_isnumber(L,5) )
		{
            ((CCharEntity*)m_PBaseEntity)->loc.destination = (uint8)lua_tointeger(L,5);
			((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
			((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
			((CCharEntity*)m_PBaseEntity)->clearPacketList();
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CServerIPPacket((CCharEntity*)m_PBaseEntity,2));
			//((CCharEntity*)m_PBaseEntity)->loc.zone->DecreaseZoneCounter(((CCharEntity*)m_PBaseEntity));
		} 
        else 
        {
			((CCharEntity*)m_PBaseEntity)->pushPacket(new CPositionPacket((CCharEntity*)m_PBaseEntity));
		}
	}
    else
    {
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_SPAWN));
    }
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	uint16 itemID = (uint16)lua_tointeger(L,1);
	uint32 quantity = 1;

	if( !lua_isnil(L,2) && lua_isnumber(L,2) )
		quantity = (uint32)lua_tointeger(L,2);
				
	uint8 SlotID = charutils::AddItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, itemID, quantity);

	lua_pushboolean( L, (SlotID != 0xFF) );
	return 1;
}

/*****************************************************
wakeUp - Wakes the calling entity if necessary.
Should only be used onTick for DoTs. This checks the
ACTION_SLEEP state rather than enumerating StatusEffectContainer
using delStatusEffect, so it's a lot faster.
*******************************************************/

inline int32 CLuaBaseEntity::wakeUp(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    if(PEntity->PBattleAI->GetCurrentAction() == ACTION_SLEEP)
    {
        //wake them up!
        PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP);
        PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP_II);
    }
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 ItemID = (uint16)lua_tointeger(L,1);
		
	if( !lua_isnil(L,2) && lua_isnumber(L,2) )
	{
		uint8  locationID = LOC_INVENTORY;

		locationID = (uint8)lua_tointeger(L,2);
		locationID = (locationID < MAX_CONTAINER_ID ? locationID : LOC_INVENTORY);

		lua_pushboolean( L, PChar->getStorage(locationID)->SearchItem(ItemID) != ERROR_SLOTID );
		return 1;
	}
    lua_pushboolean( L, charutils::HasItem(PChar, ItemID) );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getFreeSlotsCount(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	uint8  locationID = LOC_INVENTORY;
		
	if( !lua_isnil(L,1) && lua_isnumber(L,1) )
	{
		locationID = (uint8)lua_tointeger(L,1);
		locationID = (locationID < MAX_CONTAINER_ID ? locationID : LOC_INVENTORY);
	}

	uint8 FreeSlots =((CCharEntity*)m_PBaseEntity)->getStorage(locationID)->GetFreeSlotsCount();

	lua_pushinteger( L, FreeSlots );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getZone(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushinteger( L, m_PBaseEntity->getZone() );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPreviousZone(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushinteger( L, m_PBaseEntity->loc.prevzone );
	return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем континент, на котором находится сущность                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getContinentID(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

    lua_pushinteger( L, m_PBaseEntity->loc.zone->GetContinentID() );
	return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, посещалась ли указанная зона персонажем ранее             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isZoneVisited(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	
    lua_pushboolean( L, hasBit((uint8)lua_tointeger(L,-1), PChar->m_ZonesList, sizeof(PChar->m_ZonesList)));
	return 1;
}

/************************************************************************
*                                                                       *
*															            *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::getWeather(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	CZone* PZone = zoneutils::GetZone(PChar->getZone());

	WEATHER weather = PZone->GetWeather();

	switch(weather) 
    {
		case WEATHER_NONE:				lua_pushinteger(L, 0); break;
		case WEATHER_SUNSHINE:			lua_pushinteger(L, 1); break;
		case WEATHER_CLOUDS:			lua_pushinteger(L, 2); break;
		case WEATHER_FOG:				lua_pushinteger(L, 3); break;
		case WEATHER_HOT_SPELL:			lua_pushinteger(L, 4); break;
		case WEATHER_HEAT_WAVE:			lua_pushinteger(L, 5); break;
		case WEATHER_RAIN:				lua_pushinteger(L, 6); break;
		case WEATHER_SQUALL:			lua_pushinteger(L, 7); break;
		case WEATHER_DUST_STORM:		lua_pushinteger(L, 8); break;
		case WEATHER_SAND_STORM:		lua_pushinteger(L, 9); break;
		case WEATHER_WIND:				lua_pushinteger(L, 10); break;
		case WEATHER_GALES:				lua_pushinteger(L, 11); break;
		case WEATHER_SNOW:				lua_pushinteger(L, 12); break;
		case WEATHER_BLIZZARDS:			lua_pushinteger(L, 13); break;
		case WEATHER_THUNDER:			lua_pushinteger(L, 14); break;
		case WEATHER_THUNDERSTORMS:		lua_pushinteger(L, 15); break;
		case WEATHER_AURORAS:			lua_pushinteger(L, 16); break;
		case WEATHER_STELLAR_GLARE:		lua_pushinteger(L, 17); break;
		case WEATHER_GLOOM:				lua_pushinteger(L, 18); break;
		case WEATHER_DARKNESS:			lua_pushinteger(L, 19); break;
        default: lua_pushnil(L);
    }
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setWeather(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	uint8 weather = (uint8)lua_tointeger(L,1);

    if (weather < MAX_WEATHER_ID)
    {
        zoneutils::GetZone(m_PBaseEntity->getZone())->SetWeather((WEATHER)weather);
    }
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getNation(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.nation );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setNation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.nation = (uint8)lua_tointeger(L,-1);
    charutils::SaveCharNation(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.rankpoints );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setRankPoints(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC ) 
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				int32 rankPoints = (int32)lua_tointeger(L, -1);
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
				PChar->profile.rankpoints = rankPoints;  
				charutils::SaveMissionsList(PChar);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addRankPoints(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC ) 
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				int32 rankPoints = (int32)lua_tointeger(L, -1);
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
				PChar->profile.rankpoints += rankPoints;  
				charutils::SaveMissionsList(PChar);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRank(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CCharEntity * PChar = (CCharEntity*)m_PBaseEntity;
			uint16 rank = 1;

				rank = PChar->profile.rank[PChar->profile.nation];
				lua_pushinteger( L, rank);
				return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setRank(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC ) 
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				int32 rank = (int32)lua_tointeger(L, -1);
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
				PChar->profile.rank[PChar->profile.nation] = rank;  
				charutils::SaveMissionsList(PChar);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if(logID < MAX_QUESTAREA && questID < MAX_QUESTID)
	{
		uint8 current  = PChar->m_questLog[logID].current [questID/8] & (1 << (questID % 8));
		uint8 complete = PChar->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));

		if ((current == 0) && (complete == 0))
		{
			PChar->m_questLog[logID].current [questID/8] |= (1 << (questID % 8));
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 1));
		
		}
	}else{
		ShowError(CL_RED"Lua::addQuest: LogID %i or QuestID %i is invalid\n" CL_RESET, logID, questID);
		return -1;
	}
		charutils::SaveQuestsList(PChar);
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if(logID < MAX_QUESTAREA && questID < MAX_QUESTID)
	{
		uint8 current  = PChar->m_questLog[logID].current [questID/8] & (1 << (questID % 8));
		uint8 complete = PChar->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));

		if ((current != 0) || (complete != 0))
		{
			PChar->m_questLog[logID].current [questID/8] &= ~(1 << (questID % 8));
			PChar->m_questLog[logID].complete[questID/8] &= ~(1 << (questID % 8));

			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 1));
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 2));

			charutils::SaveQuestsList(PChar);
		}
	}else{
		ShowError(CL_RED"Lua::delQuest: LogID %i or QuestID %i is invalid\n" CL_RESET, logID, questID);
	}
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getQuestStatus(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if(logID < MAX_QUESTAREA && questID < MAX_QUESTID)
	{
		uint8 current  = ((CCharEntity*)m_PBaseEntity)->m_questLog[logID].current [questID/8] & (1 << (questID % 8));
		uint8 complete = ((CCharEntity*)m_PBaseEntity)->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));
					
		lua_pushinteger( L, (complete != 0 ? 2 : (current != 0 ? 1 : 0)) );
		return 1;
	}else{
		ShowError(CL_RED"Lua::getQuestStatus: LogID %i or QuestID %i is invalid\n" CL_RESET, logID, questID);
	}
	
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::completeQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);
				
	if(logID < MAX_QUESTAREA && questID < MAX_QUESTID)
	{
		uint8 complete = PChar->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));

		if (complete == 0)
		{
			PChar->m_questLog[logID].current [questID/8] &= ~(1 << (questID % 8));
			PChar->m_questLog[logID].complete[questID/8] |=  (1 << (questID % 8));

			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 1));
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, logID, 2));
		}
        charutils::SaveQuestsList(PChar);
	}else{
		ShowError(CL_RED"Lua::completeQuest: LogID %i or QuestID %i is invalid\n" CL_RESET, logID, questID);
	}
	
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, завершил ли персонаж задачу (quest)                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasCompleteQuest(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	uint8 questID = (uint8)lua_tointeger(L,-1);
	uint8 logID   = (uint8)lua_tointeger(L,-2);

	if(logID < MAX_QUESTAREA && questID < MAX_QUESTID)
	{
		uint8 complete = ((CCharEntity*)m_PBaseEntity)->m_questLog[logID].complete[questID/8] & (1 << (questID % 8));
					
		lua_pushboolean( L, (complete != 0) );
		return 1;
	}
    ShowError(CL_RED"Lua::hasCompleteQuest: LogID %i or QuestID %i is invalid\n" CL_RESET, logID, questID);
	lua_pushboolean( L, false );
	return 1;
}

/************************************************************************
*                                                                       *
*  Добавляем выбранную миссию                                           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);


    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    if (LogID < 6 && MissionID < 64)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        if (PChar->m_missionLog[LogID].current != LogID > 2 ? 0 : -1)
        {
            ShowWarning(CL_YELLOW"Lua::addMission: player has a current mission\n" CL_RESET, LogID);
        }
        PChar->m_missionLog[LogID].current = MissionID;
		PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+10, 1));

		charutils::SaveMissionsList(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::delMission: LogID %i or Mission %i is invalid\n" CL_RESET, LogID, MissionID);
    }
	return 0;
}

/************************************************************************
*                                                                       *
*  Удаляем выбранную миссию                                             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::delMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    if (LogID < 6 && MissionID < 64)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        uint8 current  = PChar->m_missionLog[LogID].current;
		uint8 complete = PChar->m_missionLog[LogID].complete[MissionID];

		if (current == MissionID)
		{
			PChar->m_missionLog[LogID].current = LogID > 2 ? 0 : -1;
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+10, 1));
		}
		if (complete != 0) 
		{
			PChar->m_missionLog[LogID].complete[MissionID] = false; 
			PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+10, 2));
		}
		charutils::SaveMissionsList(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::delMission: LogID %i or Mission %i is invalid\n" CL_RESET, LogID, MissionID);
    }
	return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем, завершил ли персонаж выбранную миссию                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasCompletedMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    bool complete = false;

    if (LogID < 6 && MissionID < 64)
    {
        complete = ((CCharEntity*)m_PBaseEntity)->m_missionLog[LogID].complete[MissionID];
    }
    else
    {
        ShowError(CL_RED"Lua::completeMission: LogID %i or Mission %i is invalid\n" CL_RESET, LogID, MissionID);
    }
	lua_pushboolean( L, complete );
	return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем текущую миссию                                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getCurrentMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8  LogID     = (uint8)lua_tointeger(L,1);
    uint8  MissionID = 0;

    if (LogID < 6)
    {
        MissionID = (uint8)((CCharEntity*)m_PBaseEntity)->m_missionLog[LogID].current;
    }
    else
    {
        ShowError(CL_RED"Lua::completeMission: LogID %i is invalid\n" CL_RESET, LogID);
    }
	lua_pushinteger( L, MissionID );
	return 1;
}

/************************************************************************
*                                                                       *
*  Завершаем выбранную миссию                                           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::completeMission(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    if (LogID < 6 && MissionID < 64)
    {
	    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        if (PChar->m_missionLog[LogID].current != MissionID)
        {
            ShowWarning(CL_YELLOW"Lua::completeMission: completion of not current mission\n" CL_RESET, LogID);
        }
	    PChar->m_missionLog[LogID].current = LogID > 2 ? 0 : -1;
	    PChar->m_missionLog[LogID].complete[MissionID] = true;
	    PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+10, 1));
	    PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+10, 2));
	
	    charutils::SaveMissionsList(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::completeMission: LogID %i or Mission %i is invalid\n" CL_RESET, LogID, MissionID);
    }
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	if( charutils::addKeyItem(PChar,KeyItemID) )
	{
		PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

		charutils::SaveKeyItems(PChar);
	}

	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	if( charutils::delKeyItem(PChar,KeyItemID) ) 
	{
		PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

		charutils::SaveKeyItems(PChar);
	}

	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasKeyItem(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

				lua_pushboolean( L, (charutils::hasKeyItem((CCharEntity*)m_PBaseEntity,KeyItemID) != 0));
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Проверяем, было ли описание ключевого предмета прочитано				*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::seenKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
			
	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	lua_pushboolean( L, (charutils::seenKeyItem((CCharEntity*)m_PBaseEntity,KeyItemID) != 0));
	return 1;		
}

/************************************************************************
*																		*
*  Should remove the key item from the seen list						*
*																		*
************************************************************************/


inline int32 CLuaBaseEntity::unseenKeyItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 KeyItemID = (uint16)lua_tointeger(L, -1);

	if( charutils::unseenKeyItem(PChar,KeyItemID) ) 
	{
		PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

		charutils::SaveKeyItems(PChar);
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  получить текущий уровень мастерства					                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getSkillLevel(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSkill(lua_tointeger(L,-1)));
	return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStat(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    switch(lua_tointeger(L,-1)) 
    {
        case MOD_STR:  lua_pushinteger(L, PEntity->STR()); break;
        case MOD_DEX:  lua_pushinteger(L, PEntity->DEX()); break;
        case MOD_VIT:  lua_pushinteger(L, PEntity->VIT()); break;
        case MOD_AGI:  lua_pushinteger(L, PEntity->AGI()); break;
        case MOD_INT:  lua_pushinteger(L, PEntity->INT()); break;
        case MOD_MND:  lua_pushinteger(L, PEntity->MND()); break;
        case MOD_CHR:  lua_pushinteger(L, PEntity->CHR()); break;
		case MOD_ATT:  lua_pushinteger(L, PEntity->ATT()); break;
		case MOD_DEF:  lua_pushinteger(L, PEntity->DEF()); break;
        default: lua_pushnil(L);
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Добавляем персонажу заклинание с отображением сообщения              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 SpellID = (uint16)lua_tointeger(L,-1);

    if (charutils::addSpell(PChar, SpellID))
    {
        charutils::SaveSpells(PChar);
        PChar->pushPacket(new CCharSpellsPacket(PChar));
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 23));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем у персонажа наличие заклинания в списке заклинаний         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    
    uint16 SpellID = (uint16)lua_tointeger(L,-1);

    lua_pushboolean(L, (charutils::hasSpell((CCharEntity*)m_PBaseEntity, SpellID) != 0));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::canLearnSpell(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint32 Message = 0;
				uint16 SpellID = (uint16)lua_tointeger(L,-1);

				if (charutils::hasSpell((CCharEntity*)m_PBaseEntity,SpellID))
				{
					Message = 96;
				}
				else if (!spell::CanUseSpell((CCharEntity*)m_PBaseEntity, SpellID))
				{
					Message = 95;
				}
				lua_pushinteger( L, Message );
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delSpell(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

				uint16 SpellID = (uint16)lua_tointeger(L,-1);

				if (charutils::delSpell(PChar,SpellID)) 
				{
					charutils::SaveSpells(PChar);
					PChar->pushPacket(new CCharSpellsPacket(PChar));
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMainJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMJob() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMainLvl(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMLevel() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSubJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSJob() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSubLvl(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSLevel() );
    return 1;
}

/************************************************************************
*																		*
*  Делаем доступной персонажу указанную профессию. 0 - subjob			*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::unlockJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    JOBTYPE JobID = (JOBTYPE)lua_tointeger(L,-1);

    if (JobID < MAX_JOBTYPE)
    {
        PChar->jobs.unlocked |= (1 << JobID);
        
        if (JobID == JOB_NON) JobID = JOB_WAR;
		if (PChar->jobs.job[JobID] == 0) PChar->jobs.job[JobID] = 1;
		
        charutils::SaveCharJob(PChar, JobID);
        PChar->pushPacket(new CCharJobsPacket(PChar));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Изменяем ограничение максимального уровня персонажа (genkai)         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::levelCap(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L,-1) && lua_isnumber(L,-1))
    {
        uint8 genkai = (uint8)lua_tointeger(L,-1);

        if (PChar->jobs.genkai != genkai)
		{
		    PChar->jobs.genkai = (uint8)lua_tointeger(L,1);

            Sql_Query(SqlHandle,"UPDATE char_jobs SET genkai = %u WHERE charid = %u LIMIT 1", PChar->jobs.genkai, PChar->id);
        }
        return 0;
	}
	lua_pushinteger(L, PChar->jobs.genkai);
    return 1;
}

/************************************************************************
*																		*
*  Устанавливаем/узнаем временное ограничение уровня. Параметр функции	*
*  является новый ограничением уровня, 0 - отмена ограничения уровня.	*
*  Функция всегда возвращается значение текущего/нового ограниченя.		*
*																		*
*  Нужно будет вынести код установки уровня в отдельную функцию			*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::levelRestriction(lua_State* L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
			
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				PChar->m_LevelRestriction = (uint32)lua_tointeger(L,1);

				uint8 NewMLevel = 0;

				if (PChar->m_LevelRestriction != 0 &&
					PChar->m_LevelRestriction < PChar->jobs.job[PChar->GetMJob()])
				{
					NewMLevel = PChar->m_LevelRestriction;
				}else{
					NewMLevel = PChar->jobs.job[PChar->GetMJob()];
				}

				if (PChar->GetMLevel()!= NewMLevel)
				{
					PChar->SetMLevel(NewMLevel);
					PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

					charutils::CalculateStats(PChar);
					charutils::BuildingCharSkillsTable(PChar);
					charutils::CheckValidEquipment(PChar);

					if (PChar->status == STATUS_NORMAL)
					{
						PChar->pushPacket(new CCharJobsPacket(PChar));
						PChar->pushPacket(new CCharUpdatePacket(PChar));
						PChar->pushPacket(new CCharHealthPacket(PChar));
						PChar->pushPacket(new CCharSkillsPacket(PChar));
						PChar->pushPacket(new CCharAbilitiesPacket(PChar));
						PChar->pushPacket(new CMenuMeritPacket(PChar));
						PChar->pushPacket(new CCharSyncPacket(PChar));
					}
				}
			}
			lua_pushinteger( L, PChar->m_LevelRestriction );
			return 1;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::release(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
			
			RELEASE_TYPE releaseType = RELEASE_STANDARD;

			if (PChar->m_event.EventID != -1)
			{
				// Message: Event skipped
				releaseType = RELEASE_SKIPPING;
				PChar->pushPacket(new CMessageSystemPacket(0,0,117));
			}
			PChar->pushPacket(new CReleasePacket(PChar,releaseType));
			PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Запускаем событие с указанными параметрами                           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::startEvent(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
    int32 n = lua_gettop(L);

    if (n > 10) 
    {
        ShowError("CLuaBaseEntity::startEvent: Could not start event, Lack of arguments.\n");
        lua_settop(L,-n);
        return 0;
    }
    if (m_PBaseEntity->animation == ANIMATION_HEALING)
    {
        ((CCharEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }		
    uint16 EventID = (uint16)lua_tointeger(L,1);

    uint32 param0 = 0;
    uint32 param1 = 0;
    uint32 param2 = 0;
    uint32 param3 = 0;
    uint32 param4 = 0;
    uint32 param5 = 0;
    uint32 param6 = 0;
    uint32 param7 = 0;

    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
        param0 = (uint32)lua_tointeger(L,2);
    if( !lua_isnil(L,3) && lua_isnumber(L,3) )
        param1 = (uint32)lua_tointeger(L,3);
    if( !lua_isnil(L,4) && lua_isnumber(L,4) )
        param2 = (uint32)lua_tointeger(L,4);
    if( !lua_isnil(L,5) && lua_isnumber(L,5) )
        param3 = (uint32)lua_tointeger(L,5);
    if( !lua_isnil(L,6) && lua_isnumber(L,6) )
        param4 = (uint32)lua_tointeger(L,6);
    if( !lua_isnil(L,7) && lua_isnumber(L,7) )
        param5 = (uint32)lua_tointeger(L,7);
    if( !lua_isnil(L,8) && lua_isnumber(L,8) )
        param6 = (uint32)lua_tointeger(L,8);
    if( !lua_isnil(L,9) && lua_isnumber(L,9) )
        param7 = (uint32)lua_tointeger(L,9);
		
    ((CCharEntity*)m_PBaseEntity)->pushPacket(
        new CEventPacket(
            (CCharEntity*)m_PBaseEntity,
            EventID,
            n-1,
            param0,
            param1,
            param2,
            param3,
            param4,
            param5,
            param6,
            param7)); 

    // если требуется вернуть фиктивный результат, то делаем это
    if( !lua_isnil(L,10) && lua_isnumber(L,10) )
    {
        ((CCharEntity*)m_PBaseEntity)->m_event.Option = (int32)lua_tointeger(L,10);
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::updateEvent(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			int32 n = lua_gettop(L);

			if ( n > 8 ) 
			{
				ShowError("CLuaBaseEntity::updateEvent: Could not update event, Lack of arguments.\n");
				lua_settop(L,-n);
				return 0;
			}
			
			uint32 param0 = 0;
			uint32 param1 = 0;
			uint32 param2 = 0;
			uint32 param3 = 0;
			uint32 param4 = 0;
			uint32 param5 = 0;
			uint32 param6 = 0;
			uint32 param7 = 0;

			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
				param0 = (uint32)lua_tointeger(L,1);
			if( !lua_isnil(L,2) && lua_isnumber(L,2) )
				param1 = (uint32)lua_tointeger(L,2);
			if( !lua_isnil(L,3) && lua_isnumber(L,3) )
				param2 = (uint32)lua_tointeger(L,3);
			if( !lua_isnil(L,4) && lua_isnumber(L,4) )
				param3 = (uint32)lua_tointeger(L,4);
			if( !lua_isnil(L,5) && lua_isnumber(L,5) )
				param4 = (uint32)lua_tointeger(L,5);
			if( !lua_isnil(L,6) && lua_isnumber(L,6) )
				param5 = (uint32)lua_tointeger(L,6);
			if( !lua_isnil(L,7) && lua_isnumber(L,7) )
				param6 = (uint32)lua_tointeger(L,7);
			if( !lua_isnil(L,8) && lua_isnumber(L,8) )
				param7 = (uint32)lua_tointeger(L,8);

			((CCharEntity*)m_PBaseEntity)->pushPacket(
				new CEventUpdatePacket(
					param0,
					param1,
					param2,
					param3,
					param4,
					param5,
					param6,
					param7)); 

			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Получаем указатель на персонажа, начавшего событие   				*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getEventTarget(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (((CCharEntity*)m_PBaseEntity)->m_event.Target == NULL)
    {
        ShowWarning(CL_YELLOW"EventTarget is empty: %s\n" CL_RESET, m_PBaseEntity->GetName());
    }
    lua_pushstring(L,CLuaBaseEntity::className);
    lua_gettable(L,LUA_GLOBALSINDEX);
    lua_pushstring(L,"new");
    lua_gettable(L,-2);
    lua_insert(L,-2);
    lua_pushlightuserdata(L,(void*)((CCharEntity*)m_PBaseEntity)->m_event.Target);
    lua_pcall(L,2,1,0);
    return 1;
}

/************************************************************************
*																		*
*  Отображаем статичный текст от лица NPC								*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::showText(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
			
	uint16 messageID = (uint16)lua_tointeger(L,2);

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

	if(PLuaBaseEntity != NULL)
	{
		CBaseEntity* PBaseEntity = PLuaBaseEntity->GetBaseEntity(); 
		if (PBaseEntity->objtype == TYPE_NPC)
		{
			PBaseEntity->m_TargID = m_PBaseEntity->targid;
			PBaseEntity->loc.p.rotation = getangle(PBaseEntity->loc.p, m_PBaseEntity->loc.p);

			PBaseEntity->loc.zone->PushPacket(
				PBaseEntity,
				CHAR_INRANGE,
				new CEntityUpdatePacket(PBaseEntity,ENTITY_UPDATE));
		}

        uint32 param0 = 0;
        uint32 param1 = 0;
        uint32 param2 = 0;
        uint32 param3 = 0;

        if( !lua_isnil(L,3) && lua_isnumber(L,3) )
            param0 = (uint32)lua_tointeger(L,3);
        if( !lua_isnil(L,4) && lua_isnumber(L,4) )
            param1 = (uint32)lua_tointeger(L,4);
        if( !lua_isnil(L,5) && lua_isnumber(L,5) )
            param2 = (uint32)lua_tointeger(L,5);
        if( !lua_isnil(L,6) && lua_isnumber(L,6) )
            param3 = (uint32)lua_tointeger(L,6);

        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSpecialPacket(PBaseEntity, messageID, param0, param1, param2, param3));
	}
	return 0;
}

/************************************************************************
*																		*
*                                                           			*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::sendMenu(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
            CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint32 menu = (uint32)lua_tointeger(L, -1);

				switch(menu) 
				{
					case 1:
						PChar->pushPacket(new CMenuMogPacket());
						break;
					case 2:
						PChar->pushPacket(new CShopMenuPacket(PChar));
						PChar->pushPacket(new CShopItemsPacket(PChar));
						break;
                    case 3:
                        PChar->pushPacket(new CAuctionHousePacket(2));
                        break;
					default:
						ShowDebug("Menu %i not implemented, yet.\n", menu);
					break;
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Отправляем персонажу меню магазина гильдии							*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::sendGuild(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));

	uint16 GuildID = (uint16)lua_tonumber(L,1);
	uint8  open    = (uint8) lua_tonumber(L,2);
	uint8  close   = (uint8) lua_tonumber(L,3);
	uint8  holiday = (uint8) lua_tonumber(L,4);

	DSP_DEBUG_BREAK_IF(open > close);

	uint8 VanadielHour = (uint8)CVanaTime::getInstance()->getHour();
	uint8 VanadielDay  = (uint8)CVanaTime::getInstance()->getWeekday();

	GUILDSTATUS status = GUILD_OPEN;

	if(VanadielDay == holiday) 
	{                               
		status = GUILD_HOLYDAY;
	} 
	else if ((VanadielHour < open) || (VanadielHour >= close)) 
	{
		status = GUILD_CLOSE;
	}

	((CCharEntity*)m_PBaseEntity)->PGuildShop = guildutils::GetGuildShop(GuildID);
	((CCharEntity*)m_PBaseEntity)->pushPacket(new CGuildMenuPacket(status, open, close, holiday));

	lua_pushboolean( L, status == GUILD_OPEN );
	return 1;
}

/************************************************************************
*																		*
*  Получаем временные переменные, необходимые для логики поисков		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getVar(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isstring(L,-1));

	int32 value = 0;

	const int8* varname  = lua_tostring(L, -1); 
	const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;";

	int32 ret = Sql_Query(SqlHandle,fmtQuery,m_PBaseEntity->id, varname);

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
*																		*
*  Сохраняем временные переменные, необходимые для логики поисков		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::setVar(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isstring(L,-2));

	const int8* varname =  lua_tostring(L,-2); 
	int32 value = (int32)lua_tointeger(L,-1); 
			
	if (value == 0)
	{
		Sql_Query(SqlHandle,"DELETE FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;",m_PBaseEntity->id, varname);
		return 0;
	}

	const int8* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = %i;";
	
	Sql_Query(SqlHandle,fmtQuery,m_PBaseEntity->id, varname, value, value);
		
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Увеличиваем/уменьшаем значение временной переменной                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addVar(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isstring(L,-2));

	const int8* varname =  lua_tostring(L,-2); 
	int32 value = (int32)lua_tointeger(L,-1); 

	const int8* Query = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = value + %i;";
	
	Sql_Query(SqlHandle, Query,
        m_PBaseEntity->id, 
        varname, 
        value, 
        value);
		
	return 0;
}

/************************************************************************
*																		*
*  Set a single bit as part of a bitmask in a database variable 		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::setMaskBit(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isboolean(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-3) || !lua_isstring(L,-3));

	const int8* varname =  lua_tostring(L,-3);
	int32 bit = (int32)lua_tointeger(L,-2);
	bool state = ( lua_toboolean(L,-1) == 0 ? false : true );
	
	int32 value = (int32)lua_tointeger(L,-4);
		
	if(state == true)
	{
		value |= (1<<bit); // добавляем
	}
	else
	{
		value &= ~(1<<bit); // удаляем
	}
	
	const int8* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = %i;";
	
	Sql_Query(SqlHandle,fmtQuery,m_PBaseEntity->id, varname, value, value);
	
	lua_pushinteger(L, value);
	return 1;
}

/************************************************************************
*																		*
*  Get a single bit from a bitmask in a database variable 				*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getMaskBit(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	uint8 bit = (uint8)lua_tointeger(L,-1);

    DSP_DEBUG_BREAK_IF(bit >= 32);

	lua_pushboolean(L, (uint32)lua_tointeger(L,-2) & (1 << bit));
	return 1;
}

/************************************************************************
*																		*
*  Counts the number of "true" bits in a bitmask from a variable 		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::countMaskBits(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	uint8  count = 0;
	uint32 value = (uint32)lua_tointeger(L,-1);

	for (uint8 bit = 0; bit < 32; bit++) 
    {
		if (value & (1 << bit)) count++;
	}
	lua_pushinteger(L, count);
	return 1;
}

/************************************************************************
*																		*
*  Returns true if var of the specified size contains only set bits		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::isMaskFull(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

	bool condition = false;
	
	int32 value = (int32)lua_tointeger(L,-2);
	int16 size = (int16)lua_tointeger(L,-1);
	
	condition = (value == intpow32(2, size)-1);
	
	lua_pushboolean(L, condition);
	return 1;
}


//==========================================================//

inline int32 CLuaBaseEntity::setHomePoint(lua_State *L) 
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.home_point.p = PChar->loc.p;
    PChar->profile.home_point.destination = PChar->getZone();
			
	const int8 *fmtQuery = "UPDATE chars \
                            SET home_zone = %u, home_rot = %u, home_x = %.3f, home_y = %.3f, home_z = %.3f \
							WHERE charid = %u;";

	Sql_Query(SqlHandle, fmtQuery, 
        PChar->profile.home_point.destination, 
        PChar->profile.home_point.p.rotation,
		PChar->profile.home_point.p.x, 
        PChar->profile.home_point.p.y, 
        PChar->profile.home_point.p.z, 
        PChar->id);
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::tradeComplete(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if(m_PBaseEntity->objtype == TYPE_PC)
		{
			CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

			for (uint8 slotID = 0; slotID < TRADE_CONTAINER_SIZE; ++slotID) 
			{
				if(PChar->Container->getInvSlotID(slotID) != 0xFF) 
				{
					uint8 invSlotID = PChar->Container->getInvSlotID(slotID);
					int32 quantity  = PChar->Container->getQuantity(slotID);

					charutils::UpdateItem(PChar, LOC_INVENTORY, invSlotID, -quantity);
				}
			}
			PChar->Container->Clean();
			PChar->pushPacket(new CInventoryFinishPacket());
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    
    uint16 TitleID = (uint16)lua_tointeger(L,-1);

    lua_pushboolean(L, (charutils::hasTitle((CCharEntity*)m_PBaseEntity, TitleID) != 0));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    
	lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.title );
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 TitleID = (uint16)lua_tointeger(L,-1);

    if (charutils::hasTitle(PChar, TitleID) != 0)
    {
        PChar->profile.title = TitleID;
        PChar->pushPacket(new CCharStatsPacket(PChar));

        charutils::SaveTitles(PChar);
    }
    else
    {
        ShowDebug(CL_CYAN"%s don't have title %u\n" CL_RESET, PChar->GetName(), TitleID);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем персонажу новое звание                                     *
*                                                                       *
************************************************************************/

inline int CLuaBaseEntity::addTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 TitleID = (uint16)lua_tointeger(L,-1);

    PChar->profile.title = TitleID;
    PChar->pushPacket(new CCharStatsPacket(PChar));

    charutils::addTitle(PChar, TitleID);
    charutils::SaveTitles(PChar);
    return 0;
}

/************************************************************************
*                                                                       *
*  Удаляем у персонажа звание (DEBUG ONLY)                              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::delTitle(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint16 TitleID = (uint16)lua_tointeger(L,-1);

	if (charutils::delTitle(PChar, TitleID)) 
	{
        if (PChar->profile.title == TitleID)
        {
            PChar->profile.title = 0;
        }
		PChar->pushPacket(new CCharStatsPacket(PChar));

        charutils::SaveTitles(PChar);
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
		
			if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
			{
				ShowFatalError(CL_RED"lua::getGil : No Gil in currency slot\n" CL_RESET);
				return 0;
			}
			lua_pushinteger( L, item->getQuantity() );
			return 1;
		}
		else if(m_PBaseEntity->objtype == TYPE_MOB)
		{
			// TODO: Mobs should have a gil pool, until implemented mob can be mugged unlimited times.
			CMobEntity * PMob = (CMobEntity*)m_PBaseEntity;
			if(PMob->m_EcoSystem == SYSTEM_BEASTMEN || PMob->m_Type & MOBTYPE_NOTORIOUS)
			{
				lua_pushinteger(L, (PMob->GetMLevel() * ((PMob->m_Type & MOBTYPE_NOTORIOUS) ? 10 : 1)));
				return 1;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
			
				if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
				{
					ShowFatalError(CL_RED"lua::addGil : No Gil in currency slot\n" CL_RESET);
					return 0;
				}

				int32 gil = (int32)lua_tointeger(L, -1);

				charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Отнимаем указанное количество gil у персонажа                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::delGil(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));

    bool result = false;

	CItem* PItem = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
		
    if (PItem != NULL && (PItem->getType() & ITEM_CURRENCY))
    {
        int32 gil = (int32)lua_tointeger(L, -1);
	    result = charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, -gil) == 0xFFFF;
    }
    else
    {
        ShowFatalError(CL_RED"lua::delGil : No Gil in currency slot\n" CL_RESET);
    }
    lua_pushboolean(L, result);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setGil(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);
			
				if(item == NULL || !(item->getType() & ITEM_CURRENCY)) 
				{
					ShowFatalError(CL_RED"lua::setGil : No Gil in currency slot\n" CL_RESET);
					return 0;
				}

				int32 gil = (int32)lua_tointeger(L, -1) - item->getQuantity();

				charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::messageSpecial(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				uint16 messageID = (uint16)lua_tointeger(L,1);

				uint32 param0 = 0;
				uint32 param1 = 0;
				uint32 param2 = 0;
				uint32 param3 = 0;
				
				bool showName = 0;

				if( !lua_isnil(L,2) && lua_isnumber(L,2) )
					param0 = (uint32)lua_tointeger(L,2);
				if( !lua_isnil(L,3) && lua_isnumber(L,3) )
					param1 = (uint32)lua_tointeger(L,3);
				if( !lua_isnil(L,4) && lua_isnumber(L,4) )
					param2 = (uint32)lua_tointeger(L,4);
				if( !lua_isnil(L,5) && lua_isnumber(L,5) )
					param3 = (uint32)lua_tointeger(L,5);

				if( !lua_isnil(L,6) && lua_isboolean(L,6) )
					showName = ( lua_toboolean(L,6) == 0 ? false : true );
		
				((CCharEntity*)m_PBaseEntity)->pushPacket(
					new CMessageSpecialPacket(
						m_PBaseEntity,
						messageID,
						param0,
						param1,
						param2,
						param3,
						showName)); 
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Отправляем базовое сообщение персонажу                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::messageBasic(lua_State* L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 messageID = (uint16)lua_tointeger(L,1);

	uint32 param0 = 0;
	uint32 param1 = 0;

    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
        param0 = (uint32)lua_tointeger(L,2);
    if( !lua_isnil(L,3) && lua_isnumber(L,3) )
        param1 = (uint32)lua_tointeger(L,3);
	
	if(m_PBaseEntity->objtype == TYPE_PC){
		((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageBasicPacket(m_PBaseEntity, m_PBaseEntity, param0, param1, messageID));
	}
	else{//broadcast in range
		m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity,CHAR_INRANGE,new CMessageBasicPacket(m_PBaseEntity, m_PBaseEntity, param0, param1, messageID));
	}
	return 0;
}

//========================================================//

inline int32 CLuaBaseEntity::capSkill(lua_State* L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				uint8 skill = lua_tointeger(L, -1);
				if(skill < MAX_SKILLTYPE){
					CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
					CItemWeapon* PItem = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];

					//remove modifiers if valid
					if(skill>=1 && skill<=12 && PItem!=NULL && PItem->getSkillType()==skill){
						PChar->delModifier(MOD_ATT, PChar->GetSkill(skill));
						PChar->delModifier(MOD_ACC, PChar->GetSkill(skill));
					}

					uint16 maxSkill = 10*battleutils::GetMaxSkill((SKILLTYPE)skill, PChar->GetMJob(),PChar->GetMLevel());
					PChar->RealSkills.skill[skill] = maxSkill; //set to capped
					PChar->WorkingSkills.skill[skill] = maxSkill/10;
					PChar->WorkingSkills.skill[skill] |= 0x8000; //set blue capped flag
					PChar->pushPacket(new CCharSkillsPacket(PChar));
					charutils::CheckWeaponSkill(PChar, skill);

					//reapply modifiers if valid
					if(skill>=1 && skill<=12 && PItem!=NULL && PItem->getSkillType()==skill){
						PChar->addModifier(MOD_ATT, PChar->GetSkill(skill));
						PChar->addModifier(MOD_ACC, PChar->GetSkill(skill));
					}

					charutils::SaveCharSkills(PChar, skill); //save to db
					return 0;
				}
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::messageSystem(lua_State* L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				uint16 messageID = (uint16)lua_tointeger(L,1);

				uint32 param0 = 0;
				uint32 param1 = 0;

				if( !lua_isnil(L,2) && lua_isnumber(L,2) )
					param0 = (uint32)lua_tointeger(L,2);
				if( !lua_isnil(L,3) && lua_isnumber(L,3) )
					param1 = (uint32)lua_tointeger(L,3);
		
				((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSystemPacket(param0,param1,messageID));
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::createShop(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			((CCharEntity*)m_PBaseEntity)->Container->Clean();

			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
			{
				((CCharEntity*)m_PBaseEntity)->Container->setType((uint8)lua_tointeger(L, -1));
			}
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addShopItem(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if (lua_gettop(L) < 2) 
			{
				ShowDebug("lua:addShopItem : Not enough information for addItem[itemID,price]\n");
				lua_pushnil(L);
				return 1;
			}
			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
				!lua_isnil(L,-2) && lua_isnumber(L,-2) )
			{
				uint16 itemID = (uint16)lua_tonumber(L,-2);
				uint32 price  = (uint32)lua_tonumber(L,-1);

				uint8 slotID = ((CCharEntity*)m_PBaseEntity)->Container->getItemsCount();

				if (slotID < 16)
				{
					((CCharEntity*)m_PBaseEntity)->Container->setItem(slotID, itemID, 0, price);
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем текущее значение известности персонажа                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
	
    uint8  fameArea = (uint8)lua_tointeger(L, -1); 
    uint16 fame     = 0;

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (fameArea) 
    {
        case 0: // San d'Oria
        case 1: // Bastock
        case 2: // Windurst
            fame = PChar->profile.fame[fameArea];
        break;
        case 3: // Jeuno
            fame = (PChar->profile.fame[0] + PChar->profile.fame[1] + PChar->profile.fame[2]) / 3;
        break;
        case 4: // Selbina / Rabao
            fame = (PChar->profile.fame[0] + PChar->profile.fame[1]) / 2;
        break;
        case 5: // Norg
            fame = PChar->profile.fame[3];
        break;
    }
    lua_pushinteger( L, fame);
    return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем текущий уровень известности персонажа                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getFameLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    this->getFame(L);

    uint16 fame = (uint16)lua_tointeger(L, -1); 			
    uint8  fameLevel = 1;

    if (fame >= 2450)
        fameLevel = 9;
    else if (fame >= 2200)
        fameLevel = 8;
    else if (fame >= 1950)
        fameLevel = 7;
    else if (fame >= 1700)
        fameLevel = 6;
    else if (fame >= 1300)
        fameLevel = 5;
    else if (fame >= 900)
        fameLevel = 4;
    else if (fame >= 500)
        fameLevel = 3;
    else if (fame >= 200)
        fameLevel = 2;

    lua_pushinteger(L, fameLevel);
    return 1;
}

/************************************************************************
*                                                                       *
*  Устанавливаем известность персонажу                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setFame(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

    uint8  fameArea = (uint8) lua_tointeger(L,-2); 
    uint16 fame     = (uint16)lua_tointeger(L,-1);
				
    switch(fameArea) 
    {
        case 0: // San d'Oria
        case 1: // Bastock
        case 2: // Windurst
            ((CCharEntity*)m_PBaseEntity)->profile.fame[fameArea] = fame;
        break;
        case 3: // Jeuno
            ((CCharEntity*)m_PBaseEntity)->profile.fame[0] = fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[1] = fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[2] = fame;
        break;
        case 4: // Selbina / Rabao
            ((CCharEntity*)m_PBaseEntity)->profile.fame[0] = fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[1] = fame;
        break;
        case 5: // Norg
            ((CCharEntity*)m_PBaseEntity)->profile.fame[3] = fame;
        break;
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем известность персонажу                                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

    uint8  fameArea = (uint8) lua_tointeger(L,-2); 
    uint16 fame     = (uint16)lua_tointeger(L,-1);
				
    switch(fameArea) 
    {
        case 0: // San d'Oria
        case 1: // Bastock
        case 2: // Windurst
            ((CCharEntity*)m_PBaseEntity)->profile.fame[fameArea] += fame;
        break;
        case 3: // Jeuno
            ((CCharEntity*)m_PBaseEntity)->profile.fame[0] += fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[1] += fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[2] += fame;
        break;
        case 4: // Selbina / Rabao
            ((CCharEntity*)m_PBaseEntity)->profile.fame[0] += fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[1] += fame;
        break;
        case 5: // Norg
            ((CCharEntity*)m_PBaseEntity)->profile.fame[3] += fame;
        break;
    }
    return 0;
}	

//==========================================================//

inline int32 CLuaBaseEntity::getAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	
    lua_pushinteger(L, m_PBaseEntity->animation);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setAnimation(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
		{
			uint8 animation = (uint8)lua_tointeger(L, -1);

			if (m_PBaseEntity->animation != animation)
			{
				m_PBaseEntity->animation = animation;

				if (m_PBaseEntity->objtype == TYPE_PC)
				{
					((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
				} else {
                    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity,ENTITY_UPDATE));
				}
			}
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Получаем/устанавливаем скорость передвижения сущности                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::speed(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	
    if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
    {
        uint8 speed = (uint8)dsp_min(lua_tointeger(L,-1), 255);

        if (m_PBaseEntity->speed != speed)
		{
            m_PBaseEntity->speed = speed;

			if (m_PBaseEntity->objtype == TYPE_PC)
			{
			    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
            } else {
                m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE));
            }
        }
        return 0;
	}
    lua_pushinteger(L, m_PBaseEntity->speed);
    return 1;
}

/************************************************************************
*                                                                       *
*  Получаем/устанавливаем значение дополнительной анимации              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::AnimationSub(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	
    if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
    {
        uint8 animationsub = (uint8)lua_tointeger(L,-1);

        if (m_PBaseEntity->animationsub != animationsub)
		{
		    m_PBaseEntity->animationsub = animationsub;

			if (m_PBaseEntity->objtype == TYPE_PC)
			{
			    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
            } else {
                m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE));
            }
        }
        return 0;
	}
	lua_pushinteger(L, m_PBaseEntity->animationsub);
    return 1;
}

/************************************************************************
*                                                                       *
*  Получаем/устанавливаем костюм персонажу                              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::costume(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if( !lua_isnil(L,-1) && lua_isnumber(L,-1) )
    {
        uint16 costum = (uint16)lua_tointeger(L,-1);

        if (PChar->m_Costum != costum &&
            PChar->status   != STATUS_SHUTDOWN &&
            PChar->status   != STATUS_DISAPPEAR)
		{
            PChar->m_Costum = costum;
            PChar->status   = STATUS_UPDATE;
            PChar->pushPacket(new CCharUpdatePacket(PChar));
        }
        return 0;
	}
    lua_pushinteger(L, PChar->m_Costum);
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, может ли персонаж использовать костюм                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::canUseCostume(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (((CCharEntity*)m_PBaseEntity)->m_Costum != 0)
    {
        lua_pushinteger(L, 445);
        return 1;
    }
    lua_pushinteger(L, (m_PBaseEntity->loc.zone->CanUseMisc(MISC_COSTUME) ? 0 : 316));
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, может ли персонаж использовать chocobo                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::canUseChocobo(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (m_PBaseEntity->animation == ANIMATION_CHOCOBO || !charutils::hasKeyItem((CCharEntity*)m_PBaseEntity, 138)) //keyitem CHOCOBO_LICENSE
    {
        lua_pushinteger(L, 445);
        return 1;
    }
    lua_pushinteger(L, (m_PBaseEntity->loc.zone->CanUseMisc(MISC_CHOCOBO) ? 0 : 316));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setStatus(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( !lua_isnil(L,1) && lua_isnumber(L,1) )
		{
			m_PBaseEntity->status = (STATUSTYPE)lua_tointeger(L, 1);
			m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_DESPAWN));
			return 0;
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Разрещение атаковать этого персонажа другим персонажам               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setPVPFlag(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->m_PVPFlag = 0x08;
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::sendTractor(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{	
			// недостаточно условий, tractor можно читать только на мертвую цель

			if( !lua_isnil(L,-1) && lua_isnumber(L,-1) &&
				!lua_isnil(L,-2) && lua_isnumber(L,-2) &&
				!lua_isnil(L,-3) && lua_isnumber(L,-3) &&
				!lua_isnil(L,-4) && lua_isnumber(L,-4) )
			{

				if(((CCharEntity*)m_PBaseEntity)->m_hasTractor == 0) {

					((CCharEntity*)m_PBaseEntity)->m_hasTractor = 1;

					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.x = (float)lua_tonumber(L, -1);
					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.y = (float)lua_tonumber(L, -2);
					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.z = (float)lua_tonumber(L, -3);
					((CCharEntity*)m_PBaseEntity)->m_StartActionPos.rotation = (int8)lua_tonumber(L, -4);
			
					((CCharEntity*)m_PBaseEntity)->pushPacket(new CRaiseTractorMenuPacket((CCharEntity*)m_PBaseEntity, TYPE_TRACTOR));	
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Отправляем персонажу Raise меню                                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::sendRaise(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8 RaiseLevel = (uint8)lua_tonumber(L,1);

    if (RaiseLevel == 0 || RaiseLevel > 3)
    {
        ShowDebug(CL_CYAN"lua::sendRaise raise value is not valide!\n" CL_RESET);
    }
    else if(PChar->m_hasRaise == 0)
    {
        PChar->m_hasRaise = RaiseLevel;
        PChar->pushPacket(new CRaiseTractorMenuPacket(PChar, TYPE_RAISE));	
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем боевой сущности StatusEffect                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
	
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));
    
    int32 n = lua_gettop(L);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L,1),
        (uint16)lua_tointeger(L,1),
        (uint16)lua_tointeger(L,2),
        (uint16)lua_tointeger(L,3),
        (uint16)lua_tointeger(L,4),
        (n >= 5 ? (uint16)lua_tointeger(L,5) : 0),
        (n >= 6 ? (uint16)lua_tointeger(L,6) : 0),
        (n >= 7 ? (uint16)lua_tointeger(L,7) : 0));

    ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect);
	return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем боевой сущности StatusEffect                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addStatusEffectEx(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
	
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,5) || !lua_isnumber(L,5));
    
    int32 n = lua_gettop(L);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L,1),
        (uint16)lua_tointeger(L,2),
        (uint16)lua_tointeger(L,3),
        (uint16)lua_tointeger(L,4),
        (uint16)lua_tointeger(L,5),
        (n >= 6 ? (uint16)lua_tointeger(L,6) : 0),
        (n >= 7 ? (uint16)lua_tointeger(L,7) : 0),
        (n >= 8 ? (uint16)lua_tointeger(L,8) : 0));

    ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect);
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addPartyEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
				!lua_isnil(L,2) && lua_isnumber(L,2) &&
				!lua_isnil(L,3) && lua_isnumber(L,3) && 
				!lua_isnil(L,4) && lua_isnumber(L,4) )
			{
				int32 n = lua_gettop(L);

				CStatusEffect * PEffect = new CStatusEffect(
					(EFFECT)lua_tointeger(L,1),
					(uint16)lua_tointeger(L,2),
					(uint16)lua_tointeger(L,3),
					(uint16)lua_tointeger(L,4),
					(n >= 5 ? (uint16)lua_tointeger(L,5) : 0),
                    (n >= 6 ? (uint16)lua_tointeger(L,6) : 0),
                    (n >= 7 ? (uint16)lua_tointeger(L,7) : 0));

				CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
				
				for (int i=0; i< PChar->PParty->members.size(); ++i)
				{
					if (PChar->PParty->members[i]->loc.zone == PChar->loc.zone) 
					{
						PChar->PParty->members[i]->StatusEffectContainer->AddStatusEffect(PEffect);
					}
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*                                                                       *
*  Получаем указатель на эффект по имени                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 n = lua_gettop(L);
		
    CStatusEffect* PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetStatusEffect(
        (EFFECT)lua_tointeger(L,1), 
        (n >= 2) ? (uint16)lua_tointeger(L,2) : 0);
    
    if (PStatusEffect == NULL)
        lua_pushnil(L);
    else 
    {
        lua_pop(L,1);
        lua_pushstring(L, CLuaStatusEffect::className);
        lua_gettable(L,LUA_GLOBALSINDEX);
        lua_pushstring(L,"new");
        lua_gettable(L,-2);
        lua_insert(L,-2);
        lua_pushlightuserdata(L,(void*)PStatusEffect);
    }
    if( lua_pcall(L,2,1,0) )
    {
        return 0;
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем наличие статус-эффекта в контейнере                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    bool hasEffect = false;

    if (lua_gettop(L) >= 2)
    {
        hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffect(
            (EFFECT)lua_tointeger(L,1), 
            (uint16)lua_tointeger(L,2));
    } else {    
        hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffect(
            (EFFECT)lua_tointeger(L,1));
    }
    lua_pushboolean(L, hasEffect);
    return 1;
}

/************************************************************************
*																		*
*  Удаляем статус-эффект по его основному и дополнительному типам.		*
*  Возвращаем результат выполнения операции.							*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::delStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    bool result = false;

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        if(lua_gettop(L) >= 2)
        {
            /* Delete matching status effect with matching power */
            result = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(
                        (EFFECT)lua_tointeger(L,1),
                        (uint16)lua_tointeger(L,2));
        }
        else
        {
            /* Delete matching status effect any power */
            result = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect((EFFECT)lua_tointeger(L,1));
        }   
    }

    lua_pushboolean(L, result);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::removePartyEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isnumber(L,1) )
			{
				int32 n = lua_gettop(L);

                CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
				
				for (int i=0; i< PChar->PParty->members.size(); ++i)
				{
					if (PChar->PParty->members[i]->loc.zone == PChar->loc.zone) 
					{
						PChar->PParty->members[i]->StatusEffectContainer->DelStatusEffect((EFFECT)lua_tointeger(L,1));
					}
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}
//==========================================================//

inline int32 CLuaBaseEntity::hasPartyEffect(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype != TYPE_NPC )
		{
			
				int32 n = lua_gettop(L);
                CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
				if (PChar->PParty != NULL)
				{
				for (int i=0; i< PChar->PParty->members.size(); ++i)
				{		
					if (PChar->PParty->members[i]->loc.zone == PChar->loc.zone) 
					{
						PChar->PParty->members[i]->StatusEffectContainer->HasStatusEffect((EFFECT)lua_tointeger(L,1));	
					}
				}
				return 1;
				}

		}
	}
	lua_pushnil(L);
	return 1;
}
/************************************************************************
*                                                                       *
*  Удаляем первый отрицательный эффект                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::eraseStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->EraseStatusEffect());
    return 1;
}

/************************************************************************
*                                                                       *
*  Удаляем первый положительный эффект                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::dispelStatusEffect(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DispelStatusEffect());
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    
    ((CBattleEntity*)m_PBaseEntity)->addModifier(
		lua_tointeger(L,1),
        lua_tointeger(L,2));
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger(L,((CBattleEntity*)m_PBaseEntity)->getMod(lua_tointeger(L,1))); 
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    
    ((CBattleEntity*)m_PBaseEntity)->delModifier(
		lua_tointeger(L,1),
        lua_tointeger(L,2));
    return 0;
}	

//==========================================================//

inline int32 CLuaBaseEntity::setMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    ((CBattleEntity*)m_PBaseEntity)->setModifier(
		lua_tointeger(L,1),
        lua_tointeger(L,2));
    return 0;
}	

/************************************************************************
*                                                                       *
*  Добавляем очки опыта персонажу                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addExp(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    charutils::AddExperiencePoints((CCharEntity*)m_PBaseEntity, m_PBaseEntity, (uint32)lua_tointeger(L,1),0, false);
    return 0;
}


/************************************************************************
*                                                                       *
*  GM command @changeJOB !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::changeJob(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	PChar->jobs.unlocked |= (1 << (uint8)lua_tointeger(L,1));
	PChar->SetMJob((uint8)lua_tointeger(L,1));

	charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    charutils::BuildingCharSkillsTable(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);

	PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    charutils::SaveCharStats(PChar);
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    charutils::SaveCharExp(PChar, PChar->GetMJob());
	charutils::SaveCharPoints(PChar);
	charutils::UpdateHealth(PChar);

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
	return 0;
}

/************************************************************************
*                                                                       *
*  GM command @changesJOB !!! FOR DEBUG ONLY !!!                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::changesJob(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	PChar->jobs.unlocked |= (1 << (uint8)lua_tointeger(L,1));
	PChar->SetSJob((uint8)lua_tointeger(L,1));

	charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    charutils::BuildingCharSkillsTable(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);

	PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    charutils::SaveCharStats(PChar);
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    charutils::SaveCharExp(PChar, PChar->GetMJob());
	charutils::UpdateHealth(PChar);

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
	return 0;
}



/************************************************************************
*                                                                       *
*  GM command @setslevel !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setsLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	DSP_DEBUG_BREAK_IF(lua_tointeger(L,1) > 99);
	
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	//PChar->jobs.exp[PChar->GetSJob()] = 0;
	PChar->jobs.job[PChar->GetSJob()] = (uint8)lua_tointeger(L,1);
	PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

	charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    charutils::BuildingCharSkillsTable(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);

	PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    charutils::SaveCharStats(PChar);
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    charutils::SaveCharExp(PChar, PChar->GetMJob());

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
    return 0;
}


/************************************************************************
*                                                                       *
*  GM command @setlevel !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	DSP_DEBUG_BREAK_IF(lua_tointeger(L,1) > 99);
	
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	PChar->SetMLevel((uint8)lua_tointeger(L,1));
	PChar->jobs.exp[PChar->GetMJob()] = 0;
	PChar->jobs.job[PChar->GetMJob()] = (uint8)lua_tointeger(L,1);
	PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

	charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    charutils::BuildingCharSkillsTable(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);

	PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    charutils::SaveCharStats(PChar);
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    charutils::SaveCharExp(PChar, PChar->GetMJob());
	charutils::SaveCharPoints(PChar);

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
    return 0;
}


//==========================================================//

inline int32 CLuaBaseEntity::showPosition(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageStandardPacket(
		m_PBaseEntity->loc.p.x,
		m_PBaseEntity->loc.p.y,
		m_PBaseEntity->loc.p.z,
		m_PBaseEntity->loc.p.rotation,
        239));
    return 0;
}

/************************************************************************
*                                                                       *
*  Устанавливаем персонажу указанный флаг                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CCharEntity*)m_PBaseEntity)->nameflags.flags ^= (uint32)lua_tointeger(L,1);
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
    return 0;
}

/************************************************************************
*                                                                       *
*  Устанавливаем/запрашиваем флаг выхода из MogHouse                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::moghouseFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L,1) && lua_isnumber(L,1))
    {
        PChar->profile.mhflag |= (uint8)lua_tointeger(L,1);
        charutils::SaveCharStats(PChar);
        return 0;
    }
    lua_pushinteger(L, PChar->profile.mhflag);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::injectPacket(lua_State *L)
{
	if( m_PBaseEntity != NULL )
	{
		if( m_PBaseEntity->objtype == TYPE_PC )
		{
			if( !lua_isnil(L,1) && lua_isstring(L,1) )
			{
				uint8 size = 0;
				FILE* File = fopen(lua_tostring(L,1),"rb");

				if (File)
				{
					CBasicPacket * PPacket = new CBasicPacket();
					
					fseek(File,1,SEEK_SET);
					fread(&size,1,1,File);

					if (size <= 128)
					{
						fseek(File,0,SEEK_SET);
						fread(PPacket,1,size*2,File);
						fclose(File);

						((CCharEntity*)m_PBaseEntity)->pushPacket(PPacket);
					}
				}else{
					ShowError(CL_RED"CLuaBaseEntity::injectPacket : Cannot open file\n" CL_RESET);
				}
				return 0;
			}
		}
	}
	lua_pushnil(L);
	return 1;
}

/************************************************************************
*																		*
*  Returns the ItemId of the equipped item in the associated slot		*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getEquipID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	uint8 SLOT = (uint8)lua_tointeger(L,1);

    DSP_DEBUG_BREAK_IF(SLOT > 15);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT]);

    if((PItem != NULL) && (PItem->getType() & ITEM_ARMOR)) 
	{
	    lua_pushinteger(L,PItem->getID()); 
		return 1;
    }
	lua_pushinteger(L,0); 
	return 1;
}

/************************************************************************
*                                                                       *
*  блокируем ячейку экипировки                                          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::lockEquipSlot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 SLOT = (uint8)lua_tointeger(L,1);

    DSP_DEBUG_BREAK_IF(SLOT > 15);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::EquipItem(PChar, 0, SLOT);
    
    PChar->m_EquipBlock |= 1 << SLOT;
    PChar->pushPacket(new CCharAppearancePacket(PChar));
    PChar->pushPacket(new CEquipPacket(0, SLOT));
    PChar->pushPacket(new CCharJobsPacket(PChar));

    if (PChar->status == STATUS_NORMAL) PChar->status == STATUS_UPDATE;
    return 0;
}

/************************************************************************
*                                                                       *
*  Cнимаем блокировку с ячейки экипировки                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::unlockEquipSlot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 SLOT = (uint8)lua_tointeger(L,1);

    DSP_DEBUG_BREAK_IF(SLOT > 15);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->m_EquipBlock &= ~(1 << SLOT);
    PChar->pushPacket(new CCharJobsPacket(PChar));

    if (PChar->status == STATUS_NORMAL) PChar->status == STATUS_UPDATE;
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPetElement(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if(((CBattleEntity*)m_PBaseEntity)->PPet){
				lua_pushinteger(L, ((CPetEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->m_Element);
			} else {
				lua_pushinteger(L, 0);
			}
			return 1;
		}
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPetName(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if(((CBattleEntity*)m_PBaseEntity)->PPet){
				lua_pushstring(L, (((CBattleEntity*)m_PBaseEntity)->PPet)->name.c_str());
			}
			return 1;
		}
	}
	return 0;
}

/************************************************************************
*																		*
*  Сущность призывает питомца											*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::spawnPet(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if( !lua_isnil(L,1) && lua_isstring(L,1) )
			{
				petutils::SpawnPet((CBattleEntity*)m_PBaseEntity, lua_tointeger(L,1));
				return 0;
			}
			ShowError(CL_RED"CLuaBaseEntity::spawnPet : PetID is NULL\n" CL_RESET);
		}
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::petAttack(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);
			if(((CBattleEntity*)m_PBaseEntity)->PPet!=NULL){
				petutils::AttackTarget((CBattleEntity*)m_PBaseEntity,(CBattleEntity*)PEntity->GetBaseEntity());
			}
			return 0;
		}
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::petRetreat(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if(((CBattleEntity*)m_PBaseEntity)->PPet!=NULL){
				petutils::RetreatToMaster((CBattleEntity*)m_PBaseEntity);
			}
		}
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::petStay(lua_State *L)
{
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::petAbility(lua_State *L)
{
	return 0;
}

/************************************************************************
*																		*
*  Сущность освобождает питомца											*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::despawnPet(lua_State *L)
{
	if ( m_PBaseEntity != NULL )
	{
		if ( m_PBaseEntity->objtype != TYPE_NPC )
		{
			if(((CBattleEntity*)m_PBaseEntity)->PPet!=NULL){
				petutils::DespawnPet((CBattleEntity*)m_PBaseEntity);
			}
		}
	}
	return 0;
}

/************************************************************************
*                                                                       *
*  Обновляем ненависть монстров к указанной цели                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::updateEnmity(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

  //DSP_DEBUG_BREAK_IF(lua_gettop(L) > 1);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);

    if (PEntity != NULL && 
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
	{
        ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->AddBaseEnmity((CBattleEntity*)PEntity->GetBaseEntity());
	}
	return 0;
}

/************************************************************************
	Check if the mob has immunity for this type of spell
	list at mobentity.h
	return true if he has immunity, else false
************************************************************************/

inline int32 CLuaBaseEntity::hasImmunity(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->hasImmunity((uint32)lua_tointeger(L,1)));	
	return 1;
}

/************************************************************************
*                                                                       *
*  Get the time in second of the battle                                 *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getBattleTime(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->PBattleAI->GetBattleTime());
	return 1;
}

/************************************************************************
*                                                                       *
*  Add the rage mode for a mob (stat x10)                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::rageMode(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

	((CMobEntity*)m_PBaseEntity)->addRageMode();
	return 0;
}

/************************************************************************
			Calculates the enmity produced by the input cure and
			applies it to all on the base entity's enemies hate list
			FORMAT: phealer:(ptarget,amount)
************************************************************************/

inline int32 CLuaBaseEntity::updateEnmityFromCure(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
	DSP_DEBUG_BREAK_IF(lua_tointeger(L,2) < 0);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);
	uint32 amount = lua_tointeger(L,2);

    if (PEntity != NULL && 
        PEntity->GetBaseEntity()->objtype == TYPE_PC)//TODO: Handle people curing skeletons
	{
		battleutils::GenerateCureEnmity((CBattleEntity*)m_PBaseEntity, (CBattleEntity*)PEntity->GetBaseEntity(), amount);
	}

	return 0;
}

/************************************************************************
*                                                                       *
*  Calculates the enmity produced by the input damage                   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::updateEnmityFromDamage(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
	DSP_DEBUG_BREAK_IF(lua_tointeger(L,2) < 0);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);
	uint32 damage = lua_tointeger(L,2);

    if (PEntity != NULL && 
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
	{
		((CMobEntity*)m_PBaseEntity)->PEnmityContainer->UpdateEnmityFromDamage((CBattleEntity*)PEntity->GetBaseEntity(),damage);
	}

	return 0;
}

/************************************************************************
*																		*
*  Проверяем, покидал ли персонаж зону после поднятия флага				*
*  необходимости ее покинуть. С параметром устанавливаем флаг, без		*
*  параметра узнаем результат.											*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::needToZone(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	if (!lua_isnil(L,-1) && lua_isboolean(L,-1))
	{
        m_PBaseEntity->loc.zoning = lua_toboolean(L,-1);				
		return 0;
	}
    lua_pushboolean( L, m_PBaseEntity->loc.zoning );
	return 1;
}

/************************************************************************
*																		*
*	Get Container Size													*
*																		*
************************************************************************/

inline int32 CLuaBaseEntity::getContainerSize(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
    CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
    lua_pushinteger(L, PChar->getStorage(lua_tointeger(L,1))->GetSize());
	return 1;
}

/************************************************************************
*                                                                       *
*  Increase/Decrease Container Size                                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::changeContainerSize(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	
	if( !lua_isnil(L,1) && lua_isnumber(L,1) &&
		!lua_isnil(L,2) && lua_isnumber(L,2))
	{
        uint8 LocationID = (uint8)lua_tointeger(L,1);

        if (LocationID < MAX_CONTAINER_ID)
        {
		    CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);

		    PChar->getStorage(LocationID)->AddBuff(lua_tointeger(L,2));
		    PChar->pushPacket(new CInventorySizePacket(PChar));
		    charutils::SaveCharInventoryCapacity(PChar);
        }
        else
        {
            ShowError(CL_RED"CLuaBaseEntity::changeContainerSize: bad container id (%u)\n", LocationID);
        }
	}
	return 0; 
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *   
************************************************************************/

inline int32 CLuaBaseEntity::takeMagicDamage(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

    uint16 damage = 0;
	if(PLuaBaseEntity != NULL)
	{
        damage = battleutils::TakeMagicDamage((CBattleEntity*)PLuaBaseEntity->GetBaseEntity(), (CBattleEntity*)m_PBaseEntity);
	}
    lua_pushinteger(L, damage);
	return 1;
}

/************************************************************************
*                                                                       *
*  Get Entity's id                                                      *
*                                                                       *   
************************************************************************/

inline int32 CLuaBaseEntity::getID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	lua_pushinteger( L, m_PBaseEntity->id );
	return 1;
}

/************************************************************************
*                                                                       *
*  Get Entity's name                                                    *
*                                                                       *   
************************************************************************/

inline int32 CLuaBaseEntity::getName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

    lua_pushstring( L, m_PBaseEntity->GetName() );
	return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current weapon's base DMG; used for WS calcs                *
*                                                                       *   
************************************************************************/

inline int32 CLuaBaseEntity::getWeaponDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getWeaponDmg weapon in main slot is null!\n" CL_RESET);
		return 0;
    }
	lua_pushinteger( L, weapon->getDamage() );
	return 1;
}


/************************************************************************
*                                                                       *
*  Gets the current offhand weapon's base DMG; used for WS calcs        *
*                                                                       *   
************************************************************************/

inline int32 CLuaBaseEntity::getOffhandDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_SUB];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getOffhandDmg weapon in main slot is null!\n" CL_RESET);
		return 0;
    }
	lua_pushinteger( L, weapon->getDamage() );
	return 1;
}

/************************************************************************
*                                                                       *
*  Gets the skill type of weapon in slot								*
*                                                                       *   
************************************************************************/
inline int32 CLuaBaseEntity::getWeaponSkillType(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	if( !lua_isnil(L,1) && lua_isstring(L,1) )
	{
		uint8 SLOT = (uint8)lua_tointeger(L,1);
		if (SLOT > 1) 
		{
			lua_pushinteger(L,0);
			return 1;
		}
		CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT];
		if(weapon == NULL) 
		{
		    ShowDebug(CL_CYAN"lua::getOffhandDmg weapon in main slot is null!\n" CL_RESET);
			return 0;
		}
		lua_pushinteger( L, weapon->getSkillType() );
		return 1;
	}
}

//==========================================================//

inline int32 CLuaBaseEntity::getRangedDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getRangedDmg weapon in ranged slot is null!\n" CL_RESET);
		return 0;
    }
	lua_pushinteger( L, weapon->getDamage() );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getAmmoDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_AMMO];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getAmmoDmg weapon in ammo slot is null!\n" CL_RESET);
		return 0;
    }
	lua_pushinteger( L, weapon->getDamage() );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRATT(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getRATT weapon in ranged slot is null!\n" CL_RESET);
		return 0;
    }

	lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->RATT(weapon->getSkillType()));
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRACC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getRACC weapon in ranged slot is null!\n" CL_RESET);
		return 0;
    }
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	int skill = PChar->GetSkill(weapon->getSkillType());
	int acc = skill;
	if(skill>200){ acc = 200 + (skill-200)*0.9;}
	acc += PChar->getMod(MOD_RACC);
	acc += PChar->AGI()/2;
	acc = ((100 +  PChar->getMod(MOD_RACCP)) * acc)/100 + 
		dsp_min(((100 +  PChar->getMod(MOD_FOOD_RACCP)) * acc)/100,  PChar->getMod(MOD_FOOD_RACC_CAP));

	lua_pushinteger( L, acc);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::isWeaponTwoHanded(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

	CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];
			
	if(weapon == NULL) 
	{
	    ShowDebug(CL_CYAN"lua::getWeaponDmg weapon in main slot is null!\n" CL_RESET);
		return 0;
    }
	lua_pushinteger( L, weapon->isTwoHanded() );
	return 1;
}

/************************************************************************
	Returns the value of a single hit against the target monster
	(can return -1 if it misses). Useful for calculating physical
	BP damage, but it isn't limited to just pets. Usage:
	damage = attacker:getMeleeHitDamage(target,acc);
	the acc value is OPTIONAL and it should be an int (e.g. 95 = 95% acc)
************************************************************************/

inline int32 CLuaBaseEntity::getMeleeHitDamage(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

	CBattleEntity* PAttacker = (CBattleEntity*)m_PBaseEntity;
	CBattleEntity* PDefender = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();
	int hitrate = battleutils::GetHitRate(PAttacker, PDefender);
	if(!lua_isnil(L,2) && lua_isnumber(L,2)){
		hitrate = lua_tointeger(L,2);
	}

	if(rand()%100 < hitrate){
		float DamageRatio = battleutils::GetDamageRatio(PAttacker, PDefender,false); 
		int damage = (uint16)((PAttacker->m_Weapons[SLOT_MAIN]->getDamage() + battleutils::GetFSTR(PAttacker,PDefender,SLOT_MAIN)) * DamageRatio);	
		lua_pushinteger( L,damage );
		return 1;
	}
	lua_pushinteger( L,-1 );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::resetRecasts(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->PRecastContainer->Del(RECAST_MAGIC);
    PChar->PRecastContainer->Del(RECAST_ABILITY);

	PChar->pushPacket(new CCharSkillsPacket(PChar));
	return 1;
}

/***************************************************************
  Attempts to register a BCNM or Dynamis instance.
  INPUT: The BCNM ID to register.
  OUTPUT: The instance number assigned, or -1 if it's all full.
  Call on: The Orb trader
****************************************************************/

inline int32 CLuaBaseEntity::bcnmRegister(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	int instance = 0;
	
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	if(PChar->loc.zone->m_InstanceHandler->hasFreeInstance()){
		int Pzone = PChar->getZone();
		if(Pzone > 184 && Pzone < 189 || Pzone > 133 && Pzone < 136){
			ShowDebug("Free Dynamis Instance found for BCNMID %i \n",lua_tointeger(L,1));
			instance = PChar->loc.zone->m_InstanceHandler->registerDynamis(lua_tointeger(L,1),PChar);
		}
		else{
			ShowDebug("Free BCNM Instance found for BCNMID %i \n",lua_tointeger(L,1));
			instance = PChar->loc.zone->m_InstanceHandler->registerBcnm(lua_tointeger(L,1),PChar);
		}
		
		if(instance!=-1){
			ShowDebug("Registration successful!\n");
			lua_pushinteger( L,instance);
		}
		else{
			ShowDebug("Unable to register BCNM Instance.\n");
			lua_pushinteger( L,instance);
		}
	}
	else{
		ShowDebug("BCNM Registration Failed : No free instances for BCNMID %i \n",lua_tointeger(L,1));
		lua_pushinteger( L,-1);
	}

	return 1;
}

/***************************************************************
  Attempts to enter a BCNM or Dynamis instance.
  OUTPUT: 1 if successful, 0 if not.
  Call on: Any player. (e.g. non-orb trader in same pt)
****************************************************************/

inline int32 CLuaBaseEntity::bcnmEnter(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	int Pzone = PChar->getZone();
	if(Pzone > 184 && Pzone < 189 || Pzone > 133 && Pzone < 136){
		if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DYNAMIS)){
			uint16 effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DYNAMIS,0)->GetPower();
			if(PChar->loc.zone->m_InstanceHandler->enterBcnm(effect_bcnmid,PChar)){
				lua_pushinteger( L,1);
				return 1;
			}
		}
	}
	else{
		if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD)){
			uint16 effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD,0)->GetPower();
			if(PChar->loc.zone->m_InstanceHandler->enterBcnm(effect_bcnmid,PChar)){
				lua_pushinteger( L,1);
				return 1;
			}
		}
	}
	ShowDebug("%s is unable to enter.\n",PChar->GetName());
	lua_pushinteger( L,0);
	return 1;
}

/***************************************************************
  Attempts to leave a BCNM instance.
  INPUT: The type of leave (1=RUN AWAY, 2=TREASURE CHEST)
  OUTPUT: 1 if successful, 0 if not.
  Call on: Anyone who selects "Leave" or "Run Away"
****************************************************************/

inline int32 CLuaBaseEntity::bcnmLeave(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);

	if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD)){
		uint16 effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD,0)->GetPower();
		uint8 typeOfExit = lua_tointeger(L,1);
		if(typeOfExit==1 && PChar->loc.zone->m_InstanceHandler->leaveBcnm(effect_bcnmid,PChar)){
			ShowDebug("BCNM Leave :: %s left BCNMID %i \n",PChar->GetName(),effect_bcnmid);
		}
		else if(typeOfExit==2 && PChar->loc.zone->m_InstanceHandler->winBcnm(effect_bcnmid,PChar)){
			ShowDebug("BCNM Leave :: Won BCNMID %i \n",effect_bcnmid);
		}
	}
	else{
		ShowDebug("BCNM Leave :: %s does not have EFFECT_BATTLEFIELD. \n",PChar->GetName());
	}

	lua_pushinteger( L,0);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::isInBcnm(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	
	if(PChar->m_insideBCNM){
		lua_pushinteger( L,1);
		return 1;
	}
	lua_pushinteger( L,0);
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getInstanceID(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	uint8 inst = 255;

	if(PChar->loc.zone != NULL && PChar->loc.zone->m_InstanceHandler != NULL){
		inst = PChar->loc.zone->m_InstanceHandler->findInstanceIDFor(PChar);
	}

	lua_pushinteger( L,inst);
	return 1;
}


//==========================================================//

inline int32 CLuaBaseEntity::getBCNMloot(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	uint8 inst = 255;

	if(PChar->loc.zone != NULL && PChar->loc.zone->m_InstanceHandler != NULL){
		inst = PChar->loc.zone->m_InstanceHandler->findInstanceIDFor(PChar);
		PChar->loc.zone->m_InstanceHandler->openTreasureChest(PChar);
	}

	lua_pushinteger( L,inst);
	return 1;
}


//==========================================================//

//returns 1 if all 3 instances are full. Temp measure until event param struct is found out.
inline int32 CLuaBaseEntity::isBcnmsFull(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	uint8 full = 1;

	if(PChar->loc.zone!=NULL && PChar->loc.zone->m_InstanceHandler!=NULL &&
		PChar->loc.zone->m_InstanceHandler->hasFreeInstance()){
		full = 0;
	}
	lua_pushinteger( L,full);
	return 1;
}

// Return unique ID for Dynamis
inline int32 CLuaBaseEntity::getDynamisUniqueID(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);

	lua_pushinteger( L, PChar->loc.zone->m_InstanceHandler->getUniqueDynaID(lua_tointeger(L,1)));

	return 1;
}

// Add time on your dynamis instance
inline int32 CLuaBaseEntity::addTimeToDynamis(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	PChar->loc.zone->m_InstanceHandler->dynamisMessage(448,lua_tointeger(L,1));

	return 1;
}

//Launch dynamis mob part 2 (when mega boss is defeated)
inline int32 CLuaBaseEntity::launchDynamisSecondPart(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);
	
	PChar->loc.zone->m_InstanceHandler->launchDynamisSecondPart();

	return 1;
}

inline int32 CLuaBaseEntity::addPlayerToDynamis(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_InstanceHandler == NULL);

	int instance = PChar->loc.zone->m_InstanceHandler->dynamisAddPlayer(lua_tointeger(L,1),PChar);

	if(instance!=-1){
		ShowDebug("Registration successful!\n");
		lua_pushinteger( L,instance);
	}
	else{
		ShowDebug("Unable to register BCNM Instance.\n");
		lua_pushinteger( L,-1);
	}

	return 1;
}

inline int32 CLuaBaseEntity::isInDynamis(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	if(PChar->isInDynamis()){
		lua_pushboolean(L, true);
	}else{
		lua_pushboolean(L, false);
	}
	return 1;
}

/************************************************************************
*                                                                       *
*  Открываем дверь и автоматически закрываем через 7 секунд             *
*                                                                       *   
************************************************************************/

inline int32 CLuaBaseEntity::openDoor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->animation == ANIMATION_CLOSE_DOOR)
    {
        uint32 OpenTime = (!lua_isnil(L,1) && lua_isnumber(L,1)) ? (uint32)lua_tointeger(L,1) * 1000 : 7000;
     
        m_PBaseEntity->animation = ANIMATION_OPEN_DOOR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE));

        CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_door", gettick()+OpenTime, m_PBaseEntity, CTaskMgr::TASK_ONCE, close_door));
    }
	return 0;
}

/************************************************************************
* can be used by all npc for disappear a certain time					*
* npc:hideNPC() : disappear for 15sec									*
* you can add time in second : hideNPC(30) : disappear for 30sec		*
************************************************************************/

inline int32 CLuaBaseEntity::hideNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->status == STATUS_NORMAL)
    {
        uint32 OpenTime = (!lua_isnil(L,1) && lua_isnumber(L,1)) ? (uint32)lua_tointeger(L,1) * 1000 : 15000;
     
        m_PBaseEntity->status = STATUS_DISAPPEAR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_DESPAWN));

        CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("reappear_npc", gettick()+OpenTime, m_PBaseEntity, CTaskMgr::TASK_ONCE, reappear_npc));
    }
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getCP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
			
	lua_pushinteger( L, PChar->RegionPoints[PChar->profile.nation] );
	return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addCP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
	int32 cp = (int32)lua_tointeger(L,1);
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	PChar->RegionPoints[PChar->profile.nation] += cp;
	charutils::SaveCharPoints(PChar);
	PChar->pushPacket(new CConquestPacket(PChar));
		
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delCP(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
	int32 cp = (int32)lua_tointeger(L,1);
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	PChar->RegionPoints[PChar->profile.nation] -= cp;
	charutils::SaveCharPoints(PChar);
	PChar->pushPacket(new CConquestPacket(PChar));
		
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getNationTeleport(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
	
	int32 nation = (int32)lua_tointeger(L,1);
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	
	if(nation == 0)
	{
		lua_pushinteger( L, PChar->nationtp.sandoria );
		return 1;
	}
	else if(nation == 1)
	{
		lua_pushinteger( L, PChar->nationtp.bastok );
		return 1;
	}
	else if(nation == 2)
	{
		lua_pushinteger( L, PChar->nationtp.windurst );
		return 1;
	}
	else
	{
		ShowDebug(CL_CYAN"lua::getNationTeleport no region with this number!\n" CL_RESET);
		return 0;
	}
}

//==========================================================//

// TODO: зачем это ?

inline int32 CLuaBaseEntity::addNationTeleport(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1) || lua_isnil(L,2) || !lua_isnumber(L,2));
	
	int32 nation = (int32)lua_tointeger(L,1);
	int32 newTP = (int32)lua_tointeger(L,2);
	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	if(nation == 0)		 PChar->nationtp.sandoria += newTP;
	else if(nation == 1) PChar->nationtp.bastok += newTP;
	else if(nation == 2) PChar->nationtp.windurst += newTP;
	else
	{
		ShowDebug(CL_CYAN"lua::getNationTeleport no region with this number!\n" CL_RESET);
		return 0;
	}

	charutils::SaveCharPoints(PChar);
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::isBehind(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

	CBattleEntity* PAttacker = (CBattleEntity*)m_PBaseEntity;
	CBattleEntity* PDefender = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();

	uint8 isbehind = 0;

	if(abs(PDefender->loc.p.rotation - PAttacker->loc.p.rotation) < 23){
		isbehind = 1;
	}

	lua_pushinteger( L,isbehind);
	return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isFacing(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

    DSP_DEBUG_BREAK_IF(PLuaBaseEntity == NULL);

    lua_pushboolean( L, isFaceing(m_PBaseEntity->loc.p, PLuaBaseEntity->GetBaseEntity()->loc.p, 40));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStealItem(lua_State *L)
{
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

	DropList_t* DropList = itemutils::GetDropList(((CMobEntity*)m_PBaseEntity)->m_DropID);

	if (DropList != NULL && DropList->size())
	{
		for(uint8 i = 0; i < DropList->size(); ++i)
		{
			if (DropList->at(i).DropType == 2)
			{
				lua_pushinteger( L,DropList->at(i).ItemID);
				return 1;
			}
		}
	}
	return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::checkDistance(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

	CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;
	CBattleEntity* PMob = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();

	float calcdistance = distance(PBattle->loc.p, PMob->loc.p);

	lua_pushnumber( L,calcdistance);
	return 1;
}

inline int32 CLuaBaseEntity::checkBaseExp(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

	CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

	bool isbaseexp = false;
	uint32 baseexp = charutils::GetRealExp(PMob->m_HiPCLvl, PMob->GetMLevel());
	if (baseexp != 0) isbaseexp = true;

	lua_pushboolean( L,isbaseexp);
	return 1;
}

inline int32 CLuaBaseEntity::checkSoloPartyAlliance(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

	uint8 SoloPartyAlliance = 0;
	if (PChar->PParty != NULL) 
	{
		SoloPartyAlliance = 1;
		if (PChar->PParty->m_PAlliance != NULL) SoloPartyAlliance = 2;
	}

	lua_pushinteger( L,SoloPartyAlliance);
	return 1;
}

inline int32 CLuaBaseEntity::checkExpPoints(lua_State *L){
	DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
	DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));
	DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

	CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);
	float baseexp = (float)lua_tonumber(L,2);
	float exp = 0;

	CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
	CMobEntity* PMob = (CMobEntity*)PLuaBaseEntity->GetBaseEntity();
	uint8 charlvl = PChar->GetMLevel();
	uint8 maxlevel = PMob->m_HiPCLvl;
	
	if (map_config.fov_party_gap_penalties == 1)
	{
		if (maxlevel > 50 || maxlevel > (charlvl+7))
		{
			exp = (float)baseexp*(float)((float)(charlvl)/(float)(maxlevel));
		}
		else
		{
			exp = (float)baseexp*(float)((float)(charutils::GetExpNEXTLevel(charlvl))/(float)(charutils::GetExpNEXTLevel(maxlevel)));
		}
	}
	else exp = baseexp;

	lua_pushnumber( L,exp);
	return 1;
}

//==========================================================//

const int8 CLuaBaseEntity::className[] = "CBaseEntity";

Lunar<CLuaBaseEntity>::Register_t CLuaBaseEntity::methods[] = 
{
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,warp),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,leavegame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getID),	
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getName),	
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getHP),				
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delTP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setTP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStat),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaxHP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaxMP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFreeSlotsCount),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getXPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getYPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZone),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPreviousZone),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getContinentID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isZoneVisited),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeather),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setWeather),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setPos),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRace),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNation),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setNation),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addQuest),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delQuest),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getQuestStatus),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,completeQuest),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCompleteQuest),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrentMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCompletedMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,completeMission),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRank),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setRank),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRankPoints),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setRankPoints),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addRankPoints),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,seenKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,unseenKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delKeyItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSkillLevel),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasSpell),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,canLearnSpell),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delSpell),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMainJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMainLvl),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSubJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSubLvl),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,unlockJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,levelCap),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,levelRestriction),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getVar),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setVar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addVar),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMaskBit),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaskBit),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,countMaskBits),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,isMaskFull),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,release),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,startEvent),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEvent),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEventTarget),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,showText),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageBasic),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageSpecial),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageSystem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendMenu),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendGuild),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setHomePoint),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,tradeComplete),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasTitle),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTitle),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTitle),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delTitle),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setTitle),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setGil),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addExp),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,createShop),		
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addShopItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setFame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addFame),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFameLevel),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAnimation),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setAnimation),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,AnimationSub),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,speed),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,costume),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canUseCostume),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canUseChocobo),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setStatus),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setPVPFlag),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendRaise),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendTractor),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addStatusEffectEx),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,eraseStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,dispelStatusEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMod),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMod),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMod),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,moghouseFlag),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,injectPacket),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,showPosition),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmity),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmityFromDamage),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEquipID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,lockEquipSlot),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,unlockEquipSlot),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPetElement),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPetName),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,spawnPet),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,despawnPet),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,petAttack),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,petRetreat),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,petStay),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,petAbility),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPet),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,needToZone),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getContainerSize),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,changeContainerSize),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addPartyEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,removePartyEffect),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasPartyEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,takeMagicDamage),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setLevel),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,setsLevel),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,changeJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,changesJob),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponDmg),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getOffhandDmg),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,openDoor),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,wakeUp),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmityFromCure),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,isWeaponTwoHanded),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponSkillType),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRangedDmg),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAmmoDmg),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRATT),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRACC),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,capSkill),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMeleeHitDamage),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetRecasts),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,bcnmRegister),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,bcnmEnter),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,bcnmLeave),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,isInBcnm),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,isBcnmsFull),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getInstanceID),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addCP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,delCP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCP),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addNationTeleport),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNationTeleport),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,isBehind),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hideNPC),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStealItem),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBCNMloot),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getDynamisUniqueID),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addPlayerToDynamis),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTimeToDynamis),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,launchDynamisSecondPart),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,isInDynamis),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkDistance),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkBaseExp),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkSoloPartyAlliance),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkExpPoints),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasImmunity),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,rageMode),
	LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBattleTime),
	{NULL,NULL}
};