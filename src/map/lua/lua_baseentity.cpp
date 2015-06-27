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

#include "../../common/showmsg.h"
#include "../../common/timer.h"
#include "../../common/utils.h"
#include "../../common/kernel.h"

#include <math.h>

#include "lua_baseentity.h"
#include "lua_instance.h"
#include "lua_item.h"
#include "lua_statuseffect.h"
#include "lua_trade_container.h"
#include "lua_battlefield.h"
#include "lua_zone.h"
#include "luautils.h"

#include "../packets/action.h"
#include "../packets/auction_house.h"
#include "../packets/char.h"
#include "../packets/char_abilities.h"
#include "../packets/char_appearance.h"
#include "../packets/char_jobs.h"
#include "../packets/char_job_extra.h"
#include "../packets/char_equip.h"
#include "../packets/char_health.h"
#include "../packets/char_recast.h"
#include "../packets/char_skills.h"
#include "../packets/char_spells.h"
#include "../packets/char_stats.h"
#include "../packets/char_sync.h"
#include "../packets/char_update.h"
#include "../packets/chat_message.h"
#include "../packets/entity_animation.h"
#include "../packets/entity_update.h"
#include "../packets/entity_visual.h"
#include "../packets/event.h"
#include "../packets/event_string.h"
#include "../packets/event_update.h"
#include "../packets/guild_menu.h"
#include "../packets/guild_menu_buy.h"
#include "../packets/instance_entry.h"
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
#include "../packets/change_music.h"
#include "../packets/conquest_map.h"
#include "../packets/weather.h"

#include "../ability.h"
#include "../utils/battleutils.h"
#include "../utils/blueutils.h"
#include "../utils/charutils.h"
#include "../utils/instanceutils.h"
#include "../utils/itemutils.h"
#include "../guild.h"
#include "../utils/guildutils.h"
#include "../utils/puppetutils.h"
#include "../utils/jailutils.h"
#include "../map.h"
#include "../alliance.h"
#include "../entities/mobentity.h"
#include "../mobskill.h"
#include "../entities/npcentity.h"
#include "../entities/petentity.h"
#include "../utils/petutils.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../trade_container.h"
#include "../utils/zoneutils.h"
#include "../entities/charentity.h"

#include "../ai/ai_npc_dummy.h"
#include "../ai/ai_mob_dummy.h"

#include "../transport.h"

CLuaBaseEntity::CLuaBaseEntity(lua_State* L)
{
    if( !lua_isnil(L,1) )
    {
        m_PBaseEntity = (CBaseEntity*)lua_touserdata(L,1);
        lua_pop(L,1);
    }else{
        m_PBaseEntity = nullptr;
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->status = STATUS_SHUTDOWN;
    charutils::SendToZone((CCharEntity*)m_PBaseEntity, 1, 0);

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::ChangeMusic(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8  BlockID = (uint32)lua_tointeger(L,1);
    uint32 MusicTrackID = (uint32)lua_tointeger(L,2);

    PChar->pushPacket(new CChangeMusicPacket(BlockID, MusicTrackID));
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::warp(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
    ((CCharEntity*)m_PBaseEntity)->loc.p = ((CCharEntity*)m_PBaseEntity)->profile.home_point.p;
    ((CCharEntity*)m_PBaseEntity)->loc.destination = ((CCharEntity*)m_PBaseEntity)->profile.home_point.destination;

    ((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
    ((CCharEntity*)m_PBaseEntity)->animation = ANIMATION_NONE;

    ((CCharEntity*)m_PBaseEntity)->clearPacketList();
    charutils::SendToZone((CCharEntity*)m_PBaseEntity, 2, zoneutils::GetZoneIPP(m_PBaseEntity->loc.destination));

    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.hp );
    return 1;
}

inline int32 CLuaBaseEntity::getHPP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetHPP() );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    int32 result = PBattle->addHP(lua_tointeger(L,1));

    // will always remove sleep effect
    PBattle->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP);
    PBattle->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP_II);
    PBattle->StatusEffectContainer->DelStatusEffect(EFFECT_LULLABY);

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    lua_pushinteger( L, result );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::restoreHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    if(m_PBaseEntity->animation != ANIMATION_DEATH)
    {
        int32 result = ((CBattleEntity*)m_PBaseEntity)->addHP(lua_tointeger(L,1));

        if( result != 0 && m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status != STATUS_DISAPPEAR)
        {
            charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
        }
        lua_pushinteger( L, result );
        return 1;
    }
    lua_pushinteger( L, 0 );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int32 result = ((CBattleEntity*)m_PBaseEntity)->addHP(-lua_tointeger(L,1));

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::setHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CBattleEntity*)m_PBaseEntity)->health.hp = 0;
    int32 value = lua_tointeger(L,1);
    int32 result = ((CBattleEntity*)m_PBaseEntity)->addHP(value);
    m_PBaseEntity->updatemask |= UPDATE_HP;

    if(m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getPet(lua_State* L)
{
    if(((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        //uint32 petid = (uint32);

        CBattleEntity* PPet = ((CBattleEntity*)m_PBaseEntity)->PPet;

        lua_getglobal(L,CLuaBaseEntity::className);
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

inline int32 CLuaBaseEntity::familiar(lua_State* L)
{
    if(((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        //uint32 petid = (uint32);

        CBattleEntity* PPet = ((CBattleEntity*)m_PBaseEntity)->PPet;

        petutils::Familiar(PPet);
    }

    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getPetID(lua_State* L)
{
    if ( m_PBaseEntity != nullptr )
    {
        if(((CBattleEntity*)m_PBaseEntity)->PPet) {
            lua_pushinteger( L, ((CPetEntity*)(((CBattleEntity*)m_PBaseEntity)->PPet))->m_PetID );
            return 1;
        }
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::isJugPet(lua_State* L)
{
    if ( m_PBaseEntity != nullptr )
    {
        if(((CBattleEntity*)m_PBaseEntity)->PPet) {
            lua_pushboolean( L, ((CPetEntity*)(((CBattleEntity*)m_PBaseEntity)->PPet))->getPetType() == PETTYPE_JUG_PET);
            return 1;
        }
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->health.mp );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(lua_tointeger(L,1));

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    lua_pushinteger( L, result );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::restoreMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    if(m_PBaseEntity->animation != ANIMATION_DEATH)
    {
        int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(lua_tointeger(L,1));

        if( result != 0 && m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status != STATUS_DISAPPEAR)
        {
            charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
        }
        lua_pushinteger( L, result );
        return 1;
    }
    lua_pushinteger( L, 0 );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::delMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(-lua_tointeger(L,1));

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::setMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CBattleEntity*)m_PBaseEntity)->health.mp = 0;
    int32 value = lua_tointeger(L,1) - ((CBattleEntity*)m_PBaseEntity)->health.mp;
    int32 result = ((CBattleEntity*)m_PBaseEntity)->addMP(value);

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushnumber( L, (float)((CBattleEntity*)m_PBaseEntity)->health.tp / 10.0f );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::addTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(lua_tointeger(L,1) * 10);

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::delTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(-lua_tointeger(L,1) * 10);

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::setTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int16 value = (lua_tointeger(L,1) * 10) - ((CBattleEntity*)m_PBaseEntity)->health.tp;
    uint16 result = ((CBattleEntity*)m_PBaseEntity)->addTP(value);

    if( result != 0 &&  m_PBaseEntity->objtype == TYPE_PC && m_PBaseEntity->status !=  STATUS_DISAPPEAR)
    {
        charutils::UpdateHealth((CCharEntity*)m_PBaseEntity);
    }
    return 0;
}

//======================================================//

inline int32 CLuaBaseEntity::getMaxHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMaxHP() );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getMaxMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMaxMP() );
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getXPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetXPos());
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getYPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber( L,  m_PBaseEntity->GetYPos());
    return 1;
}

//======================================================//

inline int32 CLuaBaseEntity::getZPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetZPos());
    return 1;
}

inline int32 CLuaBaseEntity::getRotPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetRotPos());
    return 1;
}

//======================================================//

//======================================================//

inline int32 CLuaBaseEntity::getRace(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        if (!lua_isnil(L, 5) && lua_isnumber(L, 5) && ((CCharEntity*)m_PBaseEntity)->status == STATUS_DISAPPEAR)
        {
            // do not modify zone/position if the character is already zoning
            return 0;
        }
    }

    if(lua_isnumber(L, 1))
    {

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
        m_PBaseEntity->loc.p.x = (float) lua_tonumber(L,1);
    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
        m_PBaseEntity->loc.p.y = (float) lua_tonumber(L,2);
    if( !lua_isnil(L,3) && lua_isnumber(L,3) )
        m_PBaseEntity->loc.p.z = (float) lua_tonumber(L,3);
    if( !lua_isnil(L,4) && lua_isnumber(L,4) )
        m_PBaseEntity->loc.p.rotation = (uint8) lua_tointeger(L,4);
    }
    else
    {
        // its a table
        lua_rawgeti(L, 1, 1);
        m_PBaseEntity->loc.p.x = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, 2);
        m_PBaseEntity->loc.p.y = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, 3);
        m_PBaseEntity->loc.p.z = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, 4);
        m_PBaseEntity->loc.p.rotation = (uint8)lua_tointeger(L, -1);
        lua_pop(L,1);
    }

    if( m_PBaseEntity->objtype == TYPE_PC)
    {
        if( !lua_isnil(L,5) && lua_isnumber(L,5) )
        {
            if ((uint16)lua_tointeger(L, 5) >= MAX_ZONEID)
                return 0;

            ((CCharEntity*)m_PBaseEntity)->loc.destination = (uint16)lua_tointeger(L,5);
            ((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
            ((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
            ((CCharEntity*)m_PBaseEntity)->clearPacketList();
            charutils::SendToZone((CCharEntity*)m_PBaseEntity, 2, zoneutils::GetZoneIPP(m_PBaseEntity->loc.destination));
            //((CCharEntity*)m_PBaseEntity)->loc.zone->DecreaseZoneCounter(((CCharEntity*)m_PBaseEntity));
        }
        else if (((CCharEntity*)m_PBaseEntity)->status != STATUS_DISAPPEAR)
        {
            ((CCharEntity*)m_PBaseEntity)->pushPacket(new CPositionPacket((CCharEntity*)m_PBaseEntity));
        }
    }
    m_PBaseEntity->updatemask |= UPDATE_POS;

    return 0;
}

inline int32 CLuaBaseEntity::teleport(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));

    lua_getfield(L, 1, "x");
    m_PBaseEntity->loc.p.x = lua_tonumber(L, -1);
    lua_getfield(L, 1, "y");
    m_PBaseEntity->loc.p.y = lua_tonumber(L, -1);
    lua_getfield(L, 1, "z");
    m_PBaseEntity->loc.p.z = lua_tonumber(L, -1);

    if (lua_isnumber(L, 2))
        m_PBaseEntity->loc.p.rotation = lua_tonumber(L, 2);
    else if (lua_isuserdata(L, 2))
    {
        CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
        m_PBaseEntity->loc.p.rotation = getangle(m_PBaseEntity->loc.p, PLuaBaseEntity->GetBaseEntity()->loc.p);
    }

    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CPositionPacket(m_PBaseEntity));
    m_PBaseEntity->updatemask |= UPDATE_POS;
    return 0;
}

inline int32 CLuaBaseEntity::getPos(lua_State* L)
{
    lua_createtable(L, 4, 0);
    int8 newTable = lua_gettop(L);

    lua_pushnumber(L, m_PBaseEntity->loc.p.x);
    lua_setfield(L, newTable, "x");

    lua_pushnumber(L, m_PBaseEntity->loc.p.y);
    lua_setfield(L, newTable, "y");

    lua_pushnumber(L, m_PBaseEntity->loc.p.z);
    lua_setfield(L, newTable, "z");

    lua_pushnumber(L, m_PBaseEntity->loc.p.rotation);
    lua_setfield(L, newTable, "rot");

    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSpawnPos(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(!(m_PBaseEntity->objtype & TYPE_MOB));

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    lua_createtable(L, 4, 0);
    int8 newTable = lua_gettop(L);

    lua_pushnumber(L, PMob->m_SpawnPoint.x);
    lua_setfield(L, newTable, "x");

    lua_pushnumber(L, PMob->m_SpawnPoint.y);
    lua_setfield(L, newTable, "y");

    lua_pushnumber(L, PMob->m_SpawnPoint.z);
    lua_setfield(L, newTable, "z");

    lua_pushnumber(L, PMob->m_SpawnPoint.rotation);
    lua_setfield(L, newTable, "rot");

    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    bool silence = false;
    uint16 itemID = (uint16)lua_tointeger(L,1);
    uint32 quantity = 1;
    uint16 augment0 = 0; uint8 augment0val = 0;
    uint16 augment1 = 0; uint8 augment1val = 0;
    uint16 augment2 = 0; uint8 augment2val = 0;
    uint16 augment3 = 0; uint8 augment3val = 0;
    uint16 trialNumber = 0;

    if (!lua_isnil(L, 2) && lua_isboolean(L, 2))
        silence = (uint32)lua_toboolean(L, 2);
    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
        quantity = (uint32)lua_tointeger(L,2);

    if( !lua_isnil(L,3) && lua_isnumber(L,3) )
        augment0 = (uint16)lua_tointeger(L,3);
    if( !lua_isnil(L,4) && lua_isnumber(L,4) )
        augment0val = (uint8)lua_tointeger(L,4);
    if( !lua_isnil(L,5) && lua_isnumber(L,5) )
        augment1 = (uint16)lua_tointeger(L,5);
    if( !lua_isnil(L,6) && lua_isnumber(L,6) )
        augment1val = (uint8)lua_tointeger(L,6);
    if( !lua_isnil(L,7) && lua_isnumber(L,7) )
        augment2 = (uint16)lua_tointeger(L,7);
    if( !lua_isnil(L,8) && lua_isnumber(L,8) )
        augment2val = (uint8)lua_tointeger(L,8);
    if( !lua_isnil(L,9) && lua_isnumber(L,9) )
        augment3 = (uint16)lua_tointeger(L,9);
    if( !lua_isnil(L,10) && lua_isnumber(L,10) )
        augment3val = (uint8)lua_tointeger(L,10);

    if( !lua_isnil(L,11) && lua_isnumber(L,11) )
        trialNumber = (uint16)lua_tointeger(L,11);

    uint8 SlotID = ERROR_SLOTID;

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0 && quantity != 0)
    {
        CItem* PItem = itemutils::GetItem(itemID);

        if (PItem != nullptr)
        {
            PItem->setQuantity(quantity);

            if (PItem->isType(ITEM_ARMOR))
            {
                if (augment0 != 0) ((CItemArmor*)PItem)->setAugment(0, augment0, augment0val);
                if (augment1 != 0) ((CItemArmor*)PItem)->setAugment(1, augment1, augment1val);
                if (augment2 != 0) ((CItemArmor*)PItem)->setAugment(2, augment2, augment2val);
                if (augment3 != 0) ((CItemArmor*)PItem)->setAugment(3, augment3, augment3val);
                if (trialNumber != 0) ((CItemArmor*)PItem)->setTrialNumber(trialNumber);
            }
            SlotID = charutils::AddItem(PChar, LOC_INVENTORY, PItem, silence);
        }
        else
        {
            ShowWarning(CL_YELLOW"charplugin::AddItem: Item <%i> is not found in a database\n" CL_RESET, itemID);
        }
    }
    lua_pushboolean( L, (SlotID != ERROR_SLOTID) );
    return 1;
}
//==========================================================//

inline int32 CLuaBaseEntity::addTempItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint16 itemID = (uint16)lua_tointeger(L, 1);
    uint32 quantity = 1;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        quantity = (uint32)lua_tointeger(L, 2);

    uint8 SlotID = ERROR_SLOTID;

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->getStorage(LOC_TEMPITEMS)->GetFreeSlotsCount() != 0 && quantity != 0)
    {
        CItem* PItem = itemutils::GetItem(itemID);

        if (PItem != nullptr)
        {
            PItem->setQuantity(quantity);

            SlotID = charutils::AddItem(PChar, LOC_TEMPITEMS, PItem);
        }
        else
        {
            ShowWarning(CL_YELLOW"charplugin::AddItem: Item <%i> is not found in a database\n" CL_RESET, itemID);
        }
    }
    lua_pushboolean(L, (SlotID != ERROR_SLOTID));
    return 1;
}

inline int32 CLuaBaseEntity::resetPlayer(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1));

    const int8* charName  = lua_tostring(L, 1);
    uint32 id = 0;


    // char will not be logged in so get the id manually
    const int8* Query = "SELECT charid FROM chars WHERE charname = '%s';";
    int32 ret = Sql_Query(SqlHandle,Query,charName);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        id = (int32)Sql_GetIntData(SqlHandle,0);


    // could not get player from database
    if (id == 0){
        ShowDebug("Could not get the character from database.\n");
        return 1;
    }

    // delete the account session
    Query = "DELETE FROM accounts_sessions WHERE charid = %u;";
    Sql_Query(SqlHandle, Query, id);



    // send the player to lower jeuno
    Query =
        "UPDATE chars "
        "SET "
          "pos_zone = %u,"
          "pos_prevzone = %u,"
          "pos_rot = %u,"
          "pos_x = %.3f,"
          "pos_y = %.3f,"
          "pos_z = %.3f,"
          "boundary = %u "
        "WHERE charid = %u;";

    Sql_Query(SqlHandle, Query,
        245,        // lower jeuno
        122,        // prev zone
        86,         // rotation
        33.464f,    // x
        -5.000f,    // y
        69.162f,    // z
        0,          //boundary,
        id);

    ShowDebug("Player reset was successful.\n");

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    // is asleep is not working!
    // if(PEntity->isAsleep())
    // {
        //wake them up!
        PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP);
        PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP_II);
        PEntity->StatusEffectContainer->DelStatusEffect(EFFECT_LULLABY);
    // }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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

/************************************************************************
*  player:createWornItem(item)                                          *
*  Item cannot be used a second time                                    *
*  For BCNM Item and Testimony (Maat battle)                            *
************************************************************************/

inline int32 CLuaBaseEntity::createWornItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    uint8 slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem((uint16)lua_tointeger(L,1));

    if(slotID != -1)
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);
        PItem->m_extra[0] = 1;

        int8 extra[sizeof(PItem->m_extra) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, extra, (const int8*)PItem->m_extra, sizeof(PItem->m_extra));

        const int8* Query =
                "UPDATE char_inventory "
                "SET extra = '%s' "
                "WHERE charid = %u AND location = %u AND slot = %u;";

        Sql_Query(SqlHandle, Query, extra, PChar->id, PItem->getLocationID(), PItem->getSlotID());
    }

    return 0;
}

/************************************************************************
*  player:hasWornItem(item)                                             *
*  return true if player has this worn item                             *
*  For BCNM Item and Testimony (Maat battle)                            *
************************************************************************/

inline int32 CLuaBaseEntity::hasWornItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    uint8 slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem((uint16)lua_tointeger(L,1));

    if(slotID != ERROR_SLOTID)
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

        lua_pushboolean(L, PItem->m_extra[0] == 1);
        return 1;
    }
    return 0;
}

/************************************************************************
*  player:getItem(location,slot,equipslot)                              *
*  returns item object                                                  *
*  slot param is ignored if equipslot isnt nullptr                         *
************************************************************************/

inline int32 CLuaBaseEntity::getStorageItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8 container = lua_tointeger(L, 1); // LOC_INVENTORY etc
    uint8 slotID = lua_tointeger(L, 2);   // slot in container
    uint8 equipID = (!lua_isnil(L,3) ? lua_tointeger(L, 3) : 255); // SLOT_MAIN etc

    CItem* PItem = nullptr;

    if (equipID == 255)
        PItem = PChar->getStorage(container)->GetItem(slotID);
    else
        PItem = PChar->getEquip((SLOTTYPE)equipID);

    if (PItem != nullptr)
    {
        lua_getglobal(L, CLuaItem::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, PItem);
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    ShowError(CL_RED"Lua::getItem: unable to find item! Slot: %i Container: %i\n" CL_RESET, equipID > 0 ? equipID : slotID, container);
    lua_pushnil(L);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getZone(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->loc.zone)
    {
        lua_getglobal(L, CLuaZone::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)m_PBaseEntity->loc.zone);
        lua_pcall(L, 2, 1, 0);
    }
    else
    {
        lua_pushnil(L);
    }

    return 1;
}

inline int32 CLuaBaseEntity::getZoneID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->getZone());
    return 1;
}

/************************************************************************
*                                                                       *
*  Получаем имя зоны, в которой находится персонаж                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getZoneName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->loc.zone == nullptr);

    lua_pushstring( L, m_PBaseEntity->loc.zone->GetName() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::isInMogHouse(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushboolean(L, ((CCharEntity*)m_PBaseEntity)->m_moghouseID);
    return 1;
}

inline int32 CLuaBaseEntity::getCurrentRegion(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger( L, zoneutils::GetCurrentRegion(m_PBaseEntity->getZone()) );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPreviousZone(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushboolean( L, hasBit((uint16)lua_tointeger(L,1), PChar->m_ZonesList, sizeof(PChar->m_ZonesList)));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::getWeather(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    WEATHER weather = WEATHER_NONE;
    if (m_PBaseEntity->objtype & TYPE_PC || m_PBaseEntity->objtype & TYPE_MOB)
        weather = battleutils::GetWeather((CBattleEntity*)m_PBaseEntity, false);
    else
        weather = zoneutils::GetZone(m_PBaseEntity->getZone())->GetWeather();

    switch(weather)
    {
        case WEATHER_NONE:              lua_pushinteger(L, 0); break;
        case WEATHER_SUNSHINE:          lua_pushinteger(L, 1); break;
        case WEATHER_CLOUDS:            lua_pushinteger(L, 2); break;
        case WEATHER_FOG:               lua_pushinteger(L, 3); break;
        case WEATHER_HOT_SPELL:         lua_pushinteger(L, 4); break;
        case WEATHER_HEAT_WAVE:         lua_pushinteger(L, 5); break;
        case WEATHER_RAIN:              lua_pushinteger(L, 6); break;
        case WEATHER_SQUALL:            lua_pushinteger(L, 7); break;
        case WEATHER_DUST_STORM:        lua_pushinteger(L, 8); break;
        case WEATHER_SAND_STORM:        lua_pushinteger(L, 9); break;
        case WEATHER_WIND:              lua_pushinteger(L, 10); break;
        case WEATHER_GALES:             lua_pushinteger(L, 11); break;
        case WEATHER_SNOW:              lua_pushinteger(L, 12); break;
        case WEATHER_BLIZZARDS:         lua_pushinteger(L, 13); break;
        case WEATHER_THUNDER:           lua_pushinteger(L, 14); break;
        case WEATHER_THUNDERSTORMS:     lua_pushinteger(L, 15); break;
        case WEATHER_AURORAS:           lua_pushinteger(L, 16); break;
        case WEATHER_STELLAR_GLARE:     lua_pushinteger(L, 17); break;
        case WEATHER_GLOOM:             lua_pushinteger(L, 18); break;
        case WEATHER_DARKNESS:          lua_pushinteger(L, 19); break;
        default: lua_pushnil(L);
    }
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setWeather(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 weather = (uint8)lua_tointeger(L,1);

    if (weather < MAX_WEATHER_ID)
    {
        zoneutils::GetZone(m_PBaseEntity->getZone())->SetWeather((WEATHER)weather);
        luautils::OnZoneWeatherChange(m_PBaseEntity->getZone(), weather);
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getNation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.nation );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setNation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.nation = (uint8)lua_tointeger(L,1);
    charutils::SaveCharNation(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getCampaignAllegiance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.campaign_allegiance );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setCampaignAllegiance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.campaign_allegiance = (uint8)lua_tointeger(L,1);
    charutils::SaveCampaignAllegiance(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger( L, ((CCharEntity*)m_PBaseEntity)->profile.rankpoints );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.rankpoints = (int32)lua_tointeger(L, 1);
    charutils::SaveMissionsList(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.rankpoints += (int32)lua_tointeger(L, 1);;
    charutils::SaveMissionsList(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity * PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger( L, PChar->profile.rank[PChar->profile.nation]);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.rank[PChar->profile.nation] = (int32)lua_tointeger(L, 1);;
    charutils::SaveMissionsList(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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

            charutils::SaveQuestsList(PChar);
        }
    }else{
        ShowError(CL_RED"Lua::addQuest: LogID %i or QuestID %i is invalid\n" CL_RESET, logID, questID);
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getQuestStatus(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем, завершил ли персонаж задачу (quest)                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasCompleteQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);


    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    if (LogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        if (PChar->m_missionLog[LogID].current != LogID > 2 ? 0 : -1)
        {
            ShowWarning(CL_YELLOW"Lua::addMission: player has a current mission\n" CL_RESET, LogID);
        }
        PChar->m_missionLog[LogID].current = MissionID;
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+11, 1));

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    if (LogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        uint8 current  = PChar->m_missionLog[LogID].current;
        uint8 complete = PChar->m_missionLog[LogID].complete[MissionID];

        if (current == MissionID)
        {
            PChar->m_missionLog[LogID].current = LogID > 2 ? 0 : -1;
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+11, 1));
        }
        if (complete != 0)
        {
            PChar->m_missionLog[LogID].complete[MissionID] = false;
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+11, 2));
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    bool complete = false;

    if (LogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8  LogID     = (uint8)lua_tointeger(L,1);
    uint8  MissionID = 0;

    if (LogID < MAX_MISSIONAREA)
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint8 LogID     = (uint8)lua_tointeger(L,1);
    uint8 MissionID = (uint8)lua_tointeger(L,2);

    if (LogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        if (PChar->m_missionLog[LogID].current != MissionID)
        {
            ShowWarning(CL_YELLOW"Lua::completeMission: can't complete non current mission\n" CL_RESET, LogID);
        }
        else
        {
            PChar->m_missionLog[LogID].current = LogID > 2 ? 0 : -1;
            PChar->m_missionLog[LogID].complete[MissionID] = true;
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+11, 1));
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, LogID+11, 2));

            charutils::SaveMissionsList(PChar);
        }
    }
    else
    {
        ShowError(CL_RED"Lua::completeMission: LogID %i or Mission %i is invalid\n" CL_RESET, LogID, MissionID);
    }
    return 0;
}

inline int32 CLuaBaseEntity::addAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint8 MissionID = (uint8)lua_tointeger(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->m_assaultLog.current != 0)
    {
        ShowWarning(CL_YELLOW"Lua::addAssault: player has a current assault\n" CL_RESET);
    }
    PChar->m_assaultLog.current = MissionID;
    PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, 1));

    charutils::SaveMissionsList(PChar);

    return 0;
}

inline int32 CLuaBaseEntity::delAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint8 MissionID = (uint8)lua_tointeger(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8 current = PChar->m_assaultLog.current;
    uint8 complete = PChar->m_assaultLog.complete[MissionID];

    if (current == MissionID)
    {
        PChar->m_assaultLog.current = 0;
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, 1));
    }
    charutils::SaveMissionsList(PChar);

    return 0;
}

inline int32 CLuaBaseEntity::hasCompletedAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint8 MissionID = (uint8)lua_tointeger(L, 1);

    bool complete = ((CCharEntity*)m_PBaseEntity)->m_assaultLog.complete[MissionID];

    lua_pushboolean(L, complete);
    return 1;
}

inline int32 CLuaBaseEntity::getCurrentAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    uint8 MissionID = (uint8)((CCharEntity*)m_PBaseEntity)->m_assaultLog.current;

    lua_pushinteger(L, MissionID);
    return 1;
}

inline int32 CLuaBaseEntity::completeAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint8 MissionID = (uint8)lua_tointeger(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->m_assaultLog.current != MissionID)
    {
        ShowWarning(CL_YELLOW"Lua::completeAssault: completion of not current assault\n" CL_RESET);
    }
    PChar->m_assaultLog.current = 0;
    PChar->m_assaultLog.complete[MissionID] = true;
    PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, 1));
    PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, 2));

    charutils::SaveMissionsList(PChar);

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 KeyItemID = (uint16)lua_tointeger(L, 1);

    if( charutils::addKeyItem(PChar,KeyItemID) )
    {
        PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

        charutils::SaveKeyItems(PChar);
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 KeyItemID = (uint16)lua_tointeger(L, 1);

    if( charutils::delKeyItem(PChar,KeyItemID) )
    {
        PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

        charutils::SaveKeyItems(PChar);
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::hasKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 KeyItemID = (uint16)lua_tointeger(L, 1);

    lua_pushboolean( L, (charutils::hasKeyItem((CCharEntity*)m_PBaseEntity,KeyItemID) != 0));
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, было ли описание ключевого предмета прочитано             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::seenKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 KeyItemID = (uint16)lua_tointeger(L, 1);

    lua_pushboolean( L, (charutils::seenKeyItem((CCharEntity*)m_PBaseEntity,KeyItemID) != 0));
    return 1;
}

/************************************************************************
*                                                                       *
*  Should remove the key item from the seen list                        *
*                                                                       *
************************************************************************/


inline int32 CLuaBaseEntity::unseenKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 KeyItemID = (uint16)lua_tointeger(L, 1);

    if( charutils::unseenKeyItem(PChar,KeyItemID) )
    {
        PChar->pushPacket(new CKeyItemsPacket(PChar,(KEYS_TABLE)(KeyItemID >> 9)));

        charutils::SaveKeyItems(PChar);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  получить текущий уровень мастерства                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype & TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 1) >= MAX_SKILLTYPE);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSkill(lua_tointeger(L,1)));
    return 1;
}

inline int32 CLuaBaseEntity::setSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 1) >= MAX_SKILLTYPE);

    uint8 SkillID = lua_tointeger(L, 1);
    uint16 SkillAmount = lua_tointeger(L, 2);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->RealSkills.skill[SkillID] = SkillAmount * 10;
    PChar->WorkingSkills.skill[SkillID] = SkillAmount;

    charutils::BuildingCharSkillsTable(PChar);
    charutils::CheckWeaponSkill(PChar, SkillID);
    charutils::SaveCharSkills(PChar, SkillID);

    PChar->pushPacket(new CCharSkillsPacket(PChar));
    return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getMaxSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-3) || !lua_isnumber(L,-3));

    SKILLTYPE skill = (SKILLTYPE)lua_tointeger(L,-1);
    JOBTYPE job = (JOBTYPE)lua_tointeger(L,-2);
    uint8 level = lua_tointeger(L,-3);

    lua_pushinteger( L, battleutils::GetMaxSkill(skill, job, level));
    return 1;
}

/************************************************************************
*                                                                       *
*  Get craft skill Rank player:getSkillRank(SKILLID)                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getSkillRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    uint8 rankID = (uint8)lua_tointeger(L,1);

    lua_pushinteger( L, PChar->RealSkills.rank[rankID]);
    return 1;
}

/************************************************************************
*                                                                       *
*  Set craft skill rank player:setSkillRank(SKILLID,newRank)            *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setSkillRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    uint16 skillID = (uint16)lua_tointeger(L,1);
    uint16 newrank = (uint16)lua_tointeger(L,2);

    PChar->WorkingSkills.rank[skillID] = newrank;
    //PChar->WorkingSkills.skill[skillID] += 1;
    PChar->RealSkills.rank[skillID] = newrank;
    //PChar->RealSkills.skill[skillID] += 1;

    charutils::BuildingCharSkillsTable(PChar);
    charutils::SaveCharSkills(PChar, skillID);
    PChar->pushPacket(new CCharSkillsPacket(PChar));

    return 0;
}

/************************************************************************
*                                                                       *
*  Returns the skill level of the equipped item in the associated slot  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getWeaponSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC && m_PBaseEntity->objtype != TYPE_PET && m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        uint8 SLOT = (uint8)lua_tointeger(L, 1);

        DSP_DEBUG_BREAK_IF(SLOT > 3);

        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        CItemWeapon* PWeapon = PChar->m_Weapons[SLOT];

        if ((PWeapon != nullptr) && PWeapon->isType(ITEM_WEAPON))
        {
            lua_pushinteger(L, PChar->GetSkill(PWeapon->getSkillType()));
            return 1;
        }
    }
    lua_pushinteger(L, 0);
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStat(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    switch(lua_tointeger(L,1))
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    bool silent = false;

    uint32 n = lua_gettop(L);

    uint16 SpellID = (uint16)lua_tointeger(L, 1);
    if (n > 1)
        silent = lua_toboolean(L, 2);

    if (charutils::addSpell(PChar, SpellID))
    {
        charutils::SaveSpells(PChar);
        PChar->pushPacket(new CCharSpellsPacket(PChar));
        if(!silent)
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 23));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  @addallspells GM command - Adds all Valid spells only                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addAllSpells(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 elements = sizeof ValidSpells / sizeof ValidSpells[0];

    for(uint16 i = 0; i < elements; ++i)
    {
        if (charutils::addSpell(PChar, ValidSpells[i]))
        {
            charutils::SaveSpells(PChar);
        }
    }

    PChar->pushPacket(new CCharSpellsPacket(PChar));
    PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 23));

    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем у персонажа наличие заклинания в списке заклинаний         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 SpellID = (uint16)lua_tointeger(L,1);

    lua_pushboolean(L, (charutils::hasSpell((CCharEntity*)m_PBaseEntity, SpellID) != 0));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::canLearnSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint32 Message = 0;
    uint16 SpellID = (uint16)lua_tointeger(L,1);

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

//==========================================================//

inline int32 CLuaBaseEntity::delSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 SpellID = (uint16)lua_tointeger(L,1);

    if (charutils::delSpell(PChar,SpellID))
    {
        charutils::SaveSpells(PChar);
        PChar->pushPacket(new CCharSpellsPacket(PChar));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Add learned ability (corsair roll)                                   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addLearnedAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 AbilityID = (uint16)lua_tointeger(L,1);

    if (charutils::addLearnedAbility(PChar, AbilityID))
    {
        charutils::addAbility(PChar, AbilityID);
        charutils::SaveLearnedAbilities(PChar);
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 442));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  has learned ability (corsair roll)                                   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasLearnedAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 AbilityID = (uint16)lua_tointeger(L,1);

    lua_pushboolean(L, (charutils::hasLearnedAbility((CCharEntity*)m_PBaseEntity, AbilityID) != 0));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::canLearnAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint32 Message = 0;
    uint16 AbilityID = (uint16)lua_tointeger(L,1);

    if (charutils::hasLearnedAbility((CCharEntity*)m_PBaseEntity,AbilityID))
    {
        Message = 444;
    }
    else if (!ability::CanLearnAbility((CCharEntity*)m_PBaseEntity, AbilityID))
    {
        Message = 443;
    }
    lua_pushinteger( L, Message );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delLearnedAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 AbilityID = (uint16)lua_tointeger(L,1);

    if (charutils::delLearnedAbility(PChar,AbilityID))
    {
        charutils::SaveLearnedAbilities(PChar);
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMainJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMJob() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getMainLvl(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetMLevel() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSubJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSJob() );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSubLvl(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->GetSLevel() );
    return 1;
}

/************************************************************************
*                                                                       *
*  Делаем доступной персонажу указанную профессию. 0 - subjob           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::unlockJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    JOBTYPE JobID = (JOBTYPE)lua_tointeger(L,1);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L,1) && lua_isnumber(L,1))
    {
        uint8 genkai = (uint8)lua_tointeger(L,1);

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
*                                                                       *
*  Устанавливаем/узнаем временное ограничение уровня. Параметр функции  *
*  является новый ограничением уровня, 0 - отмена ограничения уровня.   *
*  Функция всегда возвращается значение текущего/нового ограниченя.     *
*                                                                       *
*  Нужно будет вынести код установки уровня в отдельную функцию         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::levelRestriction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

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
            charutils::RemoveAllEquipMods(PChar);
            PChar->SetMLevel(NewMLevel);
            PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
            charutils::ApplyAllEquipMods(PChar);

            if (PChar->status != STATUS_DISAPPEAR)
            {
                blueutils::ValidateBlueSpells(PChar);
                charutils::BuildingCharSkillsTable(PChar);
                charutils::CalculateStats(PChar);
                charutils::BuildingCharTraitsTable(PChar);
                charutils::BuildingCharAbilityTable(PChar);
                charutils::CheckValidEquipment(PChar);
                PChar->pushPacket(new CCharAbilitiesPacket(PChar));
                charutils::UpdateHealth(PChar);
            }

            if (PChar->PPet)
            {
                CPetEntity* PPet = (CPetEntity*)PChar->PPet;
                if (PPet->getPetType() == PETTYPE_WYVERN)
                {
                    petutils::LoadWyvernStatistics(PChar, PPet, true);
                }
                else
                {
                    petutils::DespawnPet(PChar);
                }
            }
        }
    }
    lua_pushinteger( L, PChar->m_LevelRestriction );
    return 1;
}

/************************************************************************
*                                                                       *
*  Restricts a player's subjob temporarily                              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::sjRestriction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8 job = (uint8)lua_tonumber(L,1);
    bool state = lua_toboolean(L,2);

    if(state)
        PChar->SetSJob(JOB_NON);
    else if(!state && job != JOB_NON)
    {
        PChar->SetSJob(job);
        PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
    }

    charutils::BuildingCharSkillsTable(PChar);
    charutils::CalculateStats(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::CheckValidEquipment(PChar);

    PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CCharHealthPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharRecastPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
    PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::release(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

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

/************************************************************************
*                                                                       *
*  Запускаем событие с указанными параметрами                           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::startEvent(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    int16 textTable = -1;

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
    if( !lua_isnil(L,10) && lua_isnumber(L,10) )
        textTable = (int16)lua_tointeger(L,10);

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
            param7,
            textTable));

    // если требуется вернуть фиктивный результат, то делаем это
    if( !lua_isnil(L,10) && lua_isnumber(L,10) )
    {
        ((CCharEntity*)m_PBaseEntity)->m_event.Option = (int32)lua_tointeger(L,10);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Start event with string (0x33 packet)                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::startEventString(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    if (m_PBaseEntity->animation == ANIMATION_HEALING)
    {
        ((CCharEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }

    uint16 EventID = (uint16)lua_tointeger(L,1);

    string_t string0 = "";
    string_t string1 = "";
    string_t string2 = "";
    string_t string3 = "";

    uint32 param0 = 0;
    uint32 param1 = 0;
    uint32 param2 = 0;
    uint32 param3 = 0;
    uint32 param4 = 0;
    uint32 param5 = 0;
    uint32 param6 = 0;
    uint32 param7 = 0;

    if( !lua_isnil(L,2) && lua_isstring(L,2) )
        string0 = lua_tolstring(L,2,nullptr);
    if( !lua_isnil(L,3) && lua_isstring(L,3) )
        string1 = lua_tolstring(L,3,nullptr);
    if( !lua_isnil(L,4) && lua_isstring(L,4) )
        string2 = lua_tolstring(L,4,nullptr);
    if( !lua_isnil(L,5) && lua_isstring(L,5) )
        string3 = lua_tolstring(L,5,nullptr);
    if( !lua_isnil(L,6) && lua_isnumber(L,6) )
        param0 = (uint32)lua_tointeger(L,6);
    if( !lua_isnil(L,7) && lua_isnumber(L,7) )
        param1 = (uint32)lua_tointeger(L,7);
    if( !lua_isnil(L,8) && lua_isnumber(L,8) )
        param2 = (uint32)lua_tointeger(L,8);
    if( !lua_isnil(L,9) && lua_isnumber(L,9) )
        param3 = (uint32)lua_tointeger(L,9);
    if( !lua_isnil(L,10) && lua_isnumber(L,10) )
        param4 = (uint32)lua_tointeger(L,10);
    if( !lua_isnil(L,11) && lua_isnumber(L,11) )
        param5 = (uint32)lua_tointeger(L,11);
    if( !lua_isnil(L,12) && lua_isnumber(L,12) )
        param6 = (uint32)lua_tointeger(L,12);
    if( !lua_isnil(L,13) && lua_isnumber(L,13) )
        param7 = (uint32)lua_tointeger(L,13);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(
        new CEventStringPacket(
            (CCharEntity*)m_PBaseEntity,
            EventID,
            string0,
            string1,
            string2,
            string3,
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

//==========================================================//

inline int32 CLuaBaseEntity::updateEvent(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

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

/************************************************************************
*                                                                       *
*  Получаем указатель на персонажа, начавшего событие                   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getEventTarget(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (((CCharEntity*)m_PBaseEntity)->m_event.Target == nullptr)
    {
        ShowWarning(CL_YELLOW"EventTarget is empty: %s\n" CL_RESET, m_PBaseEntity->GetName());
    }
    lua_getglobal(L,CLuaBaseEntity::className);
    lua_pushstring(L,"new");
    lua_gettable(L,-2);
    lua_insert(L,-2);
    lua_pushlightuserdata(L,(void*)((CCharEntity*)m_PBaseEntity)->m_event.Target);
    lua_pcall(L,2,1,0);
    return 1;
}

/************************************************************************
*                                                                       *
*  Opens the dialogue box to deliver items to players                   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::openSendBox(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    charutils::OpenSendBox((CCharEntity*)m_PBaseEntity);

    return 0;
}

/************************************************************************
*                                                                       *
*  Отображаем статичный текст от лица NPC                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::showText(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    // DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint16 messageID = (uint16)lua_tointeger(L,2);

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

    if(PLuaBaseEntity != nullptr)
    {
        CBaseEntity* PBaseEntity = PLuaBaseEntity->GetBaseEntity();
        if (PBaseEntity->objtype == TYPE_NPC)
        {
            PBaseEntity->m_TargID = m_PBaseEntity->targid;
            PBaseEntity->loc.p.rotation = getangle(PBaseEntity->loc.p, m_PBaseEntity->loc.p);

            PBaseEntity->loc.zone->PushPacket(
                PBaseEntity,
                CHAR_INRANGE,
                new CEntityUpdatePacket(PBaseEntity,ENTITY_UPDATE, UPDATE_POS));
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

        if(m_PBaseEntity->objtype == TYPE_PC)
        {
            ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSpecialPacket(PBaseEntity, messageID, param0, param1, param2, param3));
        }
        else
        {
            m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity,CHAR_INRANGE,new CMessageSpecialPacket(PBaseEntity, messageID, param0, param1, param3));
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::sendMenu(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint32 menu = (uint32)lua_tointeger(L, 1);

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

/************************************************************************
*                                                                       *
*  Отправляем персонажу меню магазина гильдии                           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::sendGuild(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    uint8 VanadielDay = (uint8)CVanaTime::getInstance()->getWeekday();

    GUILDSTATUS status = GUILD_OPEN;

    if(VanadielDay == holiday)
    {
        status = GUILD_HOLYDAY;
    }
    else if ((VanadielHour < open) || (VanadielHour >= close))
    {
        status = GUILD_CLOSE;
    }
    CItemContainer* PGuildShop = guildutils::GetGuildShop(GuildID);
    ((CCharEntity*)m_PBaseEntity)->PGuildShop = PGuildShop;
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CGuildMenuPacket(status, open, close, holiday));
    if (status == GUILD_OPEN) {
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CGuildMenuBuyPacket((CCharEntity*)m_PBaseEntity, PGuildShop));
    }

    lua_pushboolean( L, status == GUILD_OPEN );
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns item ID and daily remaining points for a guild's GP daily    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getCurrentGPItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    uint16 GuildID = (uint16)lua_tonumber(L, 1);

    CGuild* PGuild = guildutils::GetGuild(GuildID);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    auto GPItem = PGuild->getDailyGPItem(PChar);

    lua_pushinteger(L, GPItem.first);
    lua_pushinteger(L, GPItem.second);

    return 2;
}

/************************************************************************
*                                                                       *
*  Checks if traded item is correct GP item, and adds the points        *
*   earned.  Returns the number of consumed items in the stack          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addGuildPoints(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    uint16 GuildID = (uint16)lua_tonumber(L, 1);
    uint16 slotID = (uint16)lua_tonumber(L, 2);

    CGuild* PGuild = guildutils::GetGuild(GuildID);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    int16 points = 0;
    uint8 items = PGuild->addGuildPoints(PChar, PChar->TradeContainer->getItem(slotID), points);

    lua_pushinteger(L, items);
    lua_pushinteger(L, points);

    return 2;
}

/************************************************************************
*                                                                       *
*  Получаем временные переменные, необходимые для логики поисков        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getVar(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isstring(L,1));

    int32 value = 0;

    const int8* varname  = lua_tostring(L, 1);

    lua_pushinteger(L, charutils::GetVar((CCharEntity*)m_PBaseEntity, varname));
    return 1;
}

/************************************************************************
*                                                                       *
*  Сохраняем временные переменные, необходимые для логики поисков       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setVar(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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

inline int32 CLuaBaseEntity::setPetName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    int32 n = lua_gettop(L);

    uint8 petType = (uint8)lua_tointeger(L, 1);

    if (n == 2)
    {
        uint16 value = (uint16)lua_tointeger(L, 2);

        if (petType == PETTYPE_WYVERN)
        {
            Sql_Query(SqlHandle, "INSERT INTO char_pet SET charid = %u, wyvernid = %u ON DUPLICATE KEY UPDATE wyvernid = %u;", m_PBaseEntity->id, value, value);
        }
        else if (petType == PETTYPE_AUTOMATON)
        {
            Sql_Query(SqlHandle, "INSERT INTO char_pet SET charid = %u, automatonid = %u ON DUPLICATE KEY UPDATE automatonid = %u;", m_PBaseEntity->id, value, value);
            if (((CCharEntity*)m_PBaseEntity)->PAutomaton != nullptr)
            {
                puppetutils::LoadAutomaton((CCharEntity*)m_PBaseEntity);
            }
        }
        /*
        else if (petType == PETTYPE_ADVENTURING_FELLOW)
        {
            Sql_Query(SqlHandle, "INSERT INTO char_pet SET charid = %u, adventuringfellowid = %u ON DUPLICATE KEY UPDATE adventuringfellowid = %u;", m_PBaseEntity->id, value, value);
        }
        */
    }
    else if (n == 3)
    {
        if (petType == PETTYPE_CHOCOBO)
        {
            uint32 chocoboname1 = lua_tointeger(L, 2) & 0x0000FFFF;
            uint32 chocoboname2 = lua_tointeger(L, 3) << 16;

            uint32 value = chocoboname1 + chocoboname2;

            Sql_Query(SqlHandle, "INSERT INTO char_pet SET charid = %u, chocoboid = %u ON DUPLICATE KEY UPDATE chocoboid = %u;", m_PBaseEntity->id, value, value);
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Clears a characters gear set mods                                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::clearGearSetMods(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (uint8 i = 0; i < PChar->m_GearSetMods.size(); ++i)
    {
        GearSetMod_t gearSetMod = PChar->m_GearSetMods.at(i);
        PChar->delModifier(gearSetMod.modId, gearSetMod.modValue);
    }
    PChar->m_GearSetMods.clear();

    lua_pushnil(L);
    return 1;
}

/************************************************************************
*                                                                       *
*  Adds a gear set mod                                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addGearSetMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));

    GearSetMod_t gearSetMod;
    gearSetMod.modNameId = lua_tonumber(L, 1);
    gearSetMod.modId = lua_tonumber(L, 2);
    gearSetMod.modValue = lua_tonumber(L, 3);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (uint8 i = 0; i < PChar->m_GearSetMods.size(); ++i)
    {
        GearSetMod_t exsistingMod = PChar->m_GearSetMods.at(i);

        if (gearSetMod.modNameId == exsistingMod.modNameId)
        {
            lua_pushnil(L);
            return 1;
        }
    }

    PChar->m_GearSetMods.push_back(gearSetMod);
    PChar->addModifier(gearSetMod.modId, gearSetMod.modValue);

    lua_pushnil(L);
    return 1;
}

/************************************************************************
*                                                                       *
*  Checks if character has a gear set mod                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasGearSetMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    uint8 modNameId = lua_tonumber(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (uint8 i = 0; i < PChar->m_GearSetMods.size(); ++i)
    {
        GearSetMod_t exsistingMod = PChar->m_GearSetMods.at(i);

        if (modNameId == exsistingMod.modNameId)
        {
            lua_pushboolean(L, true);
            return 1;
        }
    }

    lua_pushboolean(L, false);
    return 1;
}


inline int32 CLuaBaseEntity::getAutomatonName(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    const int8* Query =
        "SELECT name FROM "
            "char_pet LEFT JOIN pet_name ON automatonid = id "
            "WHERE charid = %u;";

    int32 ret = Sql_Query(SqlHandle,Query,m_PBaseEntity->id);

    if (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        lua_pushstring(L,Sql_GetData(SqlHandle, 0));
        return 1;
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Set a single bit as part of a bitmask in a database variable         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setMaskBit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
*                                                                       *
*  Get a single bit from a bitmask in a database variable               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getMaskBit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

    uint8 bit = (uint8)lua_tointeger(L,-1);

    DSP_DEBUG_BREAK_IF(bit >= 32);

    lua_pushboolean(L, (uint32)lua_tointeger(L,-2) & (1 << bit));
    return 1;
}

/************************************************************************
*                                                                       *
*  Counts the number of "true" bits in a bitmask from a variable        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::countMaskBits(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8  count = 0;
    uint32 value = (uint32)lua_tointeger(L,1);

    for (uint8 bit = 0; bit < 32; bit++)
    {
        if (value & (1 << bit)) count++;
    }
    lua_pushinteger(L, count);
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns true if var of the specified size contains only set bits     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isMaskFull(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (uint8 slotID = 0; slotID < TRADE_CONTAINER_SIZE; ++slotID)
    {
        if(PChar->TradeContainer->getInvSlotID(slotID) != 0xFF)
        {
            uint8 invSlotID = PChar->TradeContainer->getInvSlotID(slotID);
            int32 quantity  = PChar->TradeContainer->getQuantity(slotID);

            charutils::UpdateItem(PChar, LOC_INVENTORY, invSlotID, -quantity);
        }
    }
    PChar->TradeContainer->Clean();
    PChar->pushPacket(new CInventoryFinishPacket());
    return 0;
}

/************************************************************************
*                                                                       *
*  Used in place of traceComplete when a trade uses confirmItem to      *
*  confirm traded items.                                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::confirmTrade(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (uint8 slotID = 0; slotID < TRADE_CONTAINER_SIZE; ++slotID)
    {
        if(PChar->TradeContainer->getInvSlotID(slotID) != 0xFF && PChar->TradeContainer->getConfirmedStatus(slotID))
        {
            uint8 invSlotID = PChar->TradeContainer->getInvSlotID(slotID);
            int32 quantity = dsp_max(PChar->TradeContainer->getQuantity(slotID), PChar->TradeContainer->getConfirmedStatus(slotID));

            charutils::UpdateItem(PChar, LOC_INVENTORY, invSlotID, -quantity);
        }
    }
    PChar->TradeContainer->Clean();
    PChar->pushPacket(new CInventoryFinishPacket());
    return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 TitleID = (uint16)lua_tointeger(L,1);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 TitleID = (uint16)lua_tointeger(L,1);

    charutils::setTitle(PChar, TitleID);

    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем персонажу новое звание                                     *
*                                                                       *
************************************************************************/

inline int CLuaBaseEntity::addTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 TitleID = (uint16)lua_tointeger(L,1);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 TitleID = (uint16)lua_tointeger(L,1);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if( m_PBaseEntity->objtype == TYPE_PC )
    {
        CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

        if(item == nullptr) //Player has no money
        {
            lua_pushinteger( L, 0 );
            return 1;
        }
        else if(!item->isType(ITEM_CURRENCY))
        {
            ShowFatalError(CL_RED"lua::getGil : Item in currency slot is not gil!\n" CL_RESET);
            return 0;
        }

        lua_pushinteger( L, item->getQuantity() );
        return 1;
    }
    if(m_PBaseEntity->objtype == TYPE_MOB)
    {
        CMobEntity * PMob = (CMobEntity*)m_PBaseEntity;
        if(PMob->m_EcoSystem == SYSTEM_BEASTMEN || PMob->m_Type & MOBTYPE_NOTORIOUS)
        {
            lua_pushinteger(L, PMob->GetRandomGil());
            return 1;
        }
    }
    lua_pushinteger(L, 0);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addGil(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

    if(item == nullptr || !item->isType(ITEM_CURRENCY))
    {
        ShowFatalError(CL_RED"lua::addGil : No Gil in currency slot\n" CL_RESET);
        return 0;
    }

    int32 gil = (int32)lua_tointeger(L, 1);

    charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
    return 0;
}

/************************************************************************
*                                                                       *
*  Отнимаем указанное количество gil у персонажа                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::delGil(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    bool result = false;

    CItem* PItem = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

    if (PItem != nullptr && PItem->isType(ITEM_CURRENCY))
    {
        int32 gil = (int32)lua_tointeger(L, 1);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

    if(item == nullptr || !item->isType(ITEM_CURRENCY))
    {
        ShowFatalError(CL_RED"lua::setGil : No Gil in currency slot\n" CL_RESET);
        return 0;
    }

    int32 gil = (int32)lua_tointeger(L, 1) - item->getQuantity();

    charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::messageSpecial(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

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

/************************************************************************
*                                                                       *
*  Отправляем базовое сообщение персонажу                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::messageBasic(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

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

/*
    Prodcast a message to public.
    Example:
        player:messagePublic(125, mob, 41, stolen);
*/
inline int32 CLuaBaseEntity::messagePublic(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 messageID = (uint16)lua_tointeger(L,1);

    uint32 param0 = 0;
    uint32 param1 = 0;

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,2);

    if (PEntity != nullptr)
    {
        if( !lua_isnil(L,2) && lua_isnumber(L,3) )
            param0 = (uint32)lua_tointeger(L,3);
        if( !lua_isnil(L,3) && lua_isnumber(L,4) )
            param1 = (uint32)lua_tointeger(L,4);

        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity,CHAR_INRANGE_SELF,new CMessageBasicPacket(m_PBaseEntity, PEntity->GetBaseEntity(), param0, param1, messageID));
    }
    return 0;
}

inline int32 CLuaBaseEntity::clearTargID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    m_PBaseEntity->m_TargID = 0;
    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity,CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity,ENTITY_UPDATE, UPDATE_POS));
    return 0;
}

//========================================================//

inline int32 CLuaBaseEntity::capSkill(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 skill = lua_tointeger(L, 1);
    if(skill < MAX_SKILLTYPE){
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        CItemWeapon* PItem = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];
        /* let's just ignore this part for the moment
        //remove modifiers if valid
        if(skill>=1 && skill<=12 && PItem!=nullptr && PItem->getSkillType()==skill){
            PChar->delModifier(MOD_ATT, PChar->GetSkill(skill));
            PChar->delModifier(MOD_ACC, PChar->GetSkill(skill));
        }
        */
        uint16 maxSkill = 10*battleutils::GetMaxSkill((SKILLTYPE)skill, PChar->GetMJob(),PChar->GetMLevel());
        PChar->RealSkills.skill[skill] = maxSkill; //set to capped
        PChar->WorkingSkills.skill[skill] = maxSkill/10;
        PChar->WorkingSkills.skill[skill] |= 0x8000; //set blue capped flag
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        charutils::CheckWeaponSkill(PChar, skill);
        /* and ignore this part
        //reapply modifiers if valid
        if(skill>=1 && skill<=12 && PItem!=nullptr && PItem->getSkillType()==skill){
            PChar->addModifier(MOD_ATT, PChar->GetSkill(skill));
            PChar->addModifier(MOD_ACC, PChar->GetSkill(skill));
        }
        */
        charutils::SaveCharSkills(PChar, skill); //save to db
    }
    return 0;
}


//========================================================//

inline int32 CLuaBaseEntity::capAllSkills(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (uint8 i = 1; i < 45; ++i)
    {
        const int8* Query = "INSERT INTO char_skills "
                        "SET "
                        "charid = %u,"
                        "skillid = %u,"
                        "value = %u,"
                        "rank = %u "
                        "ON DUPLICATE KEY UPDATE value = %u, rank = %u;";

                        Sql_Query(SqlHandle, Query,
                        PChar->id,
                        i,
                        5000,
                        PChar->RealSkills.rank[i],
                        5000,
                        PChar->RealSkills.rank[i]);

        uint16 maxSkill = 10*battleutils::GetMaxSkill((SKILLTYPE)i, PChar->GetMJob(),PChar->GetMLevel());
        PChar->RealSkills.skill[i] = maxSkill; //set to capped
        PChar->WorkingSkills.skill[i] = maxSkill/10;
        PChar->WorkingSkills.skill[i] |= 0x8000; //set blue capped flag
    }
    charutils::CheckWeaponSkill(PChar, SKILL_NON);
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    return 0;
}


//==========================================================//

inline int32 CLuaBaseEntity::messageSystem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

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

//==========================================================//

inline int32 CLuaBaseEntity::createShop(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->Container->Clean();
    ((CCharEntity*)m_PBaseEntity)->Container->setSize(lua_tointeger(L,1) + 1);


    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
    {
        ((CCharEntity*)m_PBaseEntity)->Container->setType((uint8)lua_tointeger(L, 2));
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::addShopItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

    uint16 itemID = (uint16)lua_tonumber(L,-2);
    uint32 price  = (uint32)lua_tonumber(L,-1);

    uint8 slotID = ((CCharEntity*)m_PBaseEntity)->Container->getItemsCount();

    ((CCharEntity*)m_PBaseEntity)->Container->setItem(slotID, itemID, 0, price);

    return 0;
}

/************************************************************************
*                                                                       *
*  Узнаем текущее значение известности персонажа                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8  fameArea = (uint8)lua_tointeger(L, 1);
    uint16 fame     = 0;

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (fameArea)
    {
        case 0: // San d'Oria
        case 1: // Bastok
        case 2: // Windurst
            fame = PChar->profile.fame[fameArea];
        break;
        case 3: // Jeuno
            fame = PChar->profile.fame[4] + ((PChar->profile.fame[0] + PChar->profile.fame[1] + PChar->profile.fame[2]) / 3);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

    uint8  fameArea = (uint8) lua_tointeger(L,-2);
    uint16 fame     = (uint16)lua_tointeger(L,-1);

    switch(fameArea)
    {
        case 0: // San d'Oria
        case 1: // Bastok
        case 2: // Windurst
            ((CCharEntity*)m_PBaseEntity)->profile.fame[fameArea] = fame;
        break;
        case 3: // Jeuno
            ((CCharEntity*)m_PBaseEntity)->profile.fame[4] = fame;
        break;
        case 4: // Selbina / Rabao
            ((CCharEntity*)m_PBaseEntity)->profile.fame[0] = fame;
            ((CCharEntity*)m_PBaseEntity)->profile.fame[1] = fame;
        break;
        case 5: // Norg
            ((CCharEntity*)m_PBaseEntity)->profile.fame[3] = fame;
        break;
    }
    charutils::SaveFame((CCharEntity*)m_PBaseEntity);
    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем известность персонажу                                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,-1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,-2) || !lua_isnumber(L,-2));

    uint8  fameArea = (uint8) lua_tointeger(L,-2);
    uint16 fame     = (uint16)lua_tointeger(L,-1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch(fameArea)
    {
        case 0: // San d'Oria
        case 1: // Bastok
        case 2: // Windurst
            PChar->profile.fame[fameArea] += fame;
        break;
        case 3: // Jeuno
            PChar->profile.fame[4] += fame;
        break;
        case 4: // Selbina / Rabao
            PChar->profile.fame[0] += fame;
            PChar->profile.fame[1] += fame;
        break;
        case 5: // Norg
            PChar->profile.fame[3] += fame;
        break;
    }
    charutils::SaveFame(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->animation);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 animation = (uint8)lua_tointeger(L, 1);

    if (m_PBaseEntity->animation != animation)
    {
        m_PBaseEntity->animation = animation;

        if (m_PBaseEntity->objtype == TYPE_PC)
        {
            ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
        }
        m_PBaseEntity->updatemask |= UPDATE_HP;
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Получаем/устанавливаем скорость передвижения сущности                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::speed(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        uint8 speed = (uint8)dsp_min(lua_tointeger(L,1), 255);

        if (m_PBaseEntity->speed != speed)
        {
            m_PBaseEntity->speed = speed;

            if (m_PBaseEntity->objtype == TYPE_PC)
            {
                ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
            } else {
                m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_POS));
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        uint8 animationsub = (uint8)lua_tointeger(L,1);

        if (m_PBaseEntity->animationsub != animationsub)
        {
            m_PBaseEntity->animationsub = animationsub;

            if (m_PBaseEntity->objtype == TYPE_PC)
            {
                ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
            } else {
                m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        uint16 costum = (uint16)lua_tointeger(L,1);

        if (PChar->m_Costum != costum &&
            PChar->status   != STATUS_SHUTDOWN &&
            PChar->status   != STATUS_DISAPPEAR)
        {
            PChar->m_Costum = costum;
            PChar->updatemask |= UPDATE_HP;
            PChar->pushPacket(new CCharUpdatePacket(PChar));
        }
        return 0;
    }
    lua_pushinteger(L, PChar->m_Costum);
    return 1;
}

/************************************************************************
*                                                                       *
*  Set monstrosity costume				                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::costume2(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        uint16 model = (uint16)lua_tointeger(L, 1);

        if (PChar->m_Monstrosity != model &&
            PChar->status != STATUS_SHUTDOWN &&
            PChar->status != STATUS_DISAPPEAR)
        {
            PChar->m_Monstrosity = model;
            PChar->updatemask |= UPDATE_LOOK;
            PChar->pushPacket(new CCharAppearancePacket(PChar));
        }
        return 0;
    }
    lua_pushinteger(L, PChar->m_Monstrosity);
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, может ли персонаж использовать костюм                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::canUseCostume(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (((CCharEntity*)m_PBaseEntity)->m_Costum != 0)
    {
        lua_pushinteger(L, 445);
        return 1;
    }
    lua_pushinteger(L, (m_PBaseEntity->loc.zone->CanUseMisc(MISC_COSTUME) ? 0 : MSGBASIC_CANT_BE_USED_IN_AREA)); //316
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, может ли персонаж использовать chocobo                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::canUseChocobo(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (m_PBaseEntity->animation == ANIMATION_CHOCOBO || !charutils::hasKeyItem((CCharEntity*)m_PBaseEntity, 138)) //keyitem CHOCOBO_LICENSE
    {
        lua_pushinteger(L, 445);
        return 1;
    }
    lua_pushinteger(L, (m_PBaseEntity->loc.zone->CanUseMisc(MISC_CHOCOBO) ? 0 : MSGBASIC_CANT_BE_USED_IN_AREA)); //316
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns true if pets can be summoned in this zone                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::canUsePet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->loc.zone->CanUseMisc(MISC_PET));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::setStatus(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    m_PBaseEntity->status = (STATUSTYPE)lua_tointeger(L, 1);
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getStatus(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L,m_PBaseEntity->status);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::sendTractor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->m_hasTractor == 0 && PChar->m_hasRaise == 0)
    {
        PChar->m_hasTractor = 1;

        PChar->m_StartActionPos.x = (float)lua_tonumber(L,1);
        PChar->m_StartActionPos.y = (float)lua_tonumber(L,2);
        PChar->m_StartActionPos.z = (float)lua_tonumber(L,3);
        PChar->m_StartActionPos.rotation = (uint8)lua_tointeger(L,4);

        PChar->pushPacket(new CRaiseTractorMenuPacket(PChar, TYPE_TRACTOR));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Отправляем персонажу Raise меню                                      *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::sendReraise(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    }
    return 0;
}

inline int32 CLuaBaseEntity::sendRaise(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8 RaiseLevel = (uint8)lua_tonumber(L,1);

    if (RaiseLevel == 0 || RaiseLevel > 3)
    {
        ShowDebug(CL_CYAN"lua::sendRaise raise value is not valide!\n" CL_RESET);
    }
    else if(PChar->m_hasTractor == 0 && PChar->m_hasRaise == 0)
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (lua_isuserdata(L, 1))
    {
        CLuaStatusEffect* PStatusEffect = Lunar<CLuaStatusEffect>::check(L, 1);

        lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(
            new CStatusEffect(*PStatusEffect->GetStatusEffect())));
    }
    else
    {
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));

        int32 n = lua_gettop(L);

        CStatusEffect * PEffect = new CStatusEffect(
            (EFFECT)lua_tointeger(L, 1),
            (uint16)lua_tointeger(L, 1),
            (uint16)lua_tointeger(L, 2),
            (uint16)lua_tointeger(L, 3),
            (uint16)lua_tointeger(L, 4),
            (n >= 5 ? (uint16)lua_tointeger(L, 5) : 0),
            (n >= 6 ? (uint16)lua_tointeger(L, 6) : 0),
            (n >= 7 ? (uint16)lua_tointeger(L, 7) : 0));

        lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect));
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  Добавляем боевой сущности StatusEffect                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addStatusEffectEx(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,5) || !lua_isnumber(L,5));

    int32 n = lua_gettop(L);
    bool silent = false;
    if(lua_isboolean(L,-1))
    {
        silent = lua_toboolean(L,-1);
        n--;
    }

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L,1),
        (uint16)lua_tointeger(L,2),
        (uint16)lua_tointeger(L,3),
        (uint16)lua_tointeger(L,4),
        (uint16)lua_tointeger(L,5),
        (n >= 6 ? (uint16)lua_tointeger(L,6) : 0),
        (n >= 7 ? (uint16)lua_tointeger(L,7) : 0),
        (n >= 8 ? (uint16)lua_tointeger(L,8) : 0));

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect,silent));
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets a party or alliance member relative to the player.              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getPartyMember(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,-1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,-2));

    uint8 member        = (uint8)lua_tonumber(L,-1);
    uint8 allianceparty = (uint8)lua_tonumber(L,-2);

    CBattleEntity* PTargetChar = nullptr;

    if(allianceparty == 0 && member == 0)
            PTargetChar =((CBattleEntity*)m_PBaseEntity);
    else if(((CBattleEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        if(allianceparty == 0 && member <= ((CBattleEntity*)m_PBaseEntity)->PParty->members.size())
            PTargetChar =((CBattleEntity*)m_PBaseEntity)->PParty->members[member];
        else if(((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance != nullptr && member <= ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.at(allianceparty)->members.size())
            PTargetChar =((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.at(allianceparty)->members[member];
    }

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
    ShowError(CL_RED"Lua::getPartyMember :: Member or Alliance Number is not valid.\n" CL_RESET);
    lua_pushnil(L);
    return 1;
}

inline int32 CLuaBaseEntity::getPartySize(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 allianceparty = (uint8)lua_tonumber(L,1);
    uint8 partysize = 1;

    if( ((CBattleEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        if( allianceparty == 0)
            partysize = ((CBattleEntity*)m_PBaseEntity)->PParty->members.size();
        else if( ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance != nullptr)
            partysize = ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.at(allianceparty)->members.size();
    }

    lua_pushnumber( L,partysize );
    return 1;
}

inline int32 CLuaBaseEntity::getAllianceSize(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    uint8 alliancesize = 1;

    if( ((CBattleEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        if( ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance != nullptr)
            alliancesize = ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.size();
    }
    lua_pushnumber( L,alliancesize );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addPartyEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));

    int32 n = lua_gettop(L);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L,1),
        (uint16)lua_tointeger(L,2),
        (uint16)lua_tointeger(L,3),
        (uint16)lua_tointeger(L,4),
        (n >= 5 ? (uint16)lua_tointeger(L,5) : 0),
        (n >= 6 ? (uint16)lua_tointeger(L,6) : 0),
        (n >= 7 ? (uint16)lua_tointeger(L,7) : 0));

    CBattleEntity* PEntity = ((CBattleEntity*)m_PBaseEntity);

    PEntity->ForParty([PEffect](CBattleEntity* PMember)
    {
        PMember->StatusEffectContainer->AddStatusEffect(PEffect);
    });
    return 0;
}

/************************************************************************
*                                                                       *
*  Получаем указатель на эффект по имени                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CStatusEffect* PStatusEffect;

    if (lua_gettop(L) >= 2)
        PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetStatusEffect((EFFECT)lua_tointeger(L, 1), (uint16)lua_tointeger(L, 2));
    else
        PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetStatusEffect((EFFECT)lua_tointeger(L, 1));

    if (PStatusEffect == nullptr)
    {
        lua_pushnil(L);
    }
    else
    {
        lua_pop(L,1);
        lua_getglobal(L, CLuaStatusEffect::className);
        lua_pushstring(L,"new");
        lua_gettable(L,-2);
        lua_insert(L,-2);
        lua_pushlightuserdata(L,(void*)PStatusEffect);

        if( lua_pcall(L,2,1,0) )
        {
            return 0;
        }
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
*                                                                       *
*  Checks to see if a character has an effect with the specified flag   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::hasStatusEffectByFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool hasEffect = false;

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffectByFlag(
        (EFFECT)lua_tointeger(L, 1)));
    return 1;
}

inline int32 CLuaBaseEntity::hasBustEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    bool hasEffect = false;

    hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasBustEffect(
        (EFFECT)lua_tointeger(L,1));

    lua_pushboolean(L, hasEffect);
    return 1;
}

inline int32 CLuaBaseEntity::canGainStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    bool hasEffect = false;

    hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->CanGainStatusEffect(
            (EFFECT)lua_tointeger(L,1),
            (uint16)lua_tointeger(L,2));

    lua_pushboolean(L, hasEffect);
    return 1;
}

/************************************************************************
*                                                                       *
*  Удаляем статус-эффект по его основному и дополнительному типам.      *
*  Возвращаем результат выполнения операции.                            *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::delStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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

inline int32 CLuaBaseEntity::delStatusEffectsByFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffectsByFlag((EFFECTFLAG)lua_tointeger(L,1));

    return 1;
}

inline int32 CLuaBaseEntity::delStatusEffectSilent(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    bool result = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffectSilent((EFFECT)lua_tointeger(L,1));

    lua_pushboolean(L, result);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::removePartyEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

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

//==========================================================//

inline int32 CLuaBaseEntity::hasPartyEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);

    if (PChar->PParty != nullptr)
    {
        for (int i=0; i< PChar->PParty->members.size(); ++i)
        {
            if (PChar->PParty->members[i]->loc.zone == PChar->loc.zone)
            {
                if (PChar->PParty->members[i]->StatusEffectContainer->HasStatusEffect((EFFECT)lua_tointeger(L,1)))
                {
                    lua_pushboolean(L, true);
                    return 1;
                }
            }
        }
    }
    lua_pushboolean(L, false);
    return 1;
}

/************************************************************************
*                                                                       *
*  Adds bard song effect                                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addBardSong(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 5) || !lua_isnumber(L, 5));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 6) || !lua_isnumber(L, 6));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 7) || !lua_isnumber(L, 7));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 8) || !lua_isnumber(L, 8));

    int32 n = lua_gettop(L);

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L, 2),
        (uint16)lua_tointeger(L, 2),
        (uint16)lua_tointeger(L, 3),
        (uint16)lua_tointeger(L, 4),
        (uint16)lua_tointeger(L, 5),
        (uint16)lua_tointeger(L, 6),
        (uint16)lua_tointeger(L, 7),
        (uint16)lua_tointeger(L, 8));
    uint8 maxSongs = 2;
    if (PEntity && PEntity->m_PBaseEntity && PEntity->m_PBaseEntity->objtype == TYPE_PC){
        CCharEntity* PCaster = (CCharEntity*)PEntity->m_PBaseEntity;
        CItemWeapon* PItem = (CItemWeapon*)PCaster->getEquip(SLOT_RANGED);
        if (PItem == nullptr || PItem->getID() == 65535 || !(PItem->getSkillType() == SKILL_STR || PItem->getSkillType() == SKILL_WND)){
            maxSongs = 1;
        }
        maxSongs += PCaster->getMod(MOD_MAXIMUM_SONGS_BONUS);
    }
    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->ApplyBardEffect(PEffect, maxSongs));
    return 1;
}

/************************************************************************
*                                                                       *
*  Adds corsair roll effect                                             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addCorsairRoll(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,3) || !lua_isnumber(L,3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,4) || !lua_isnumber(L,4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,5) || !lua_isnumber(L,5));

    int32 n = lua_gettop(L);

    uint8 casterJob = lua_tointeger(L, 1);
    uint8 bustDuration = lua_tointeger(L, 2);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L,3),
        (uint16)lua_tointeger(L,3),
        (uint16)lua_tointeger(L,4),
        (uint16)lua_tointeger(L,5),
        (uint16)lua_tointeger(L,6),
        (n >= 7 ? (uint16)lua_tointeger(L,7) : 0),
        (n >= 8 ? (uint16)lua_tointeger(L,8) : 0),
        (n >= 9 ? (uint16)lua_tointeger(L,9) : 0));
    uint8 maxRolls = 2;
    if (casterJob != JOB_COR)
    {
        maxRolls = 1;
    }
    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->ApplyCorsairEffect(PEffect, maxRolls, bustDuration));
    return 1;
}

inline int32 CLuaBaseEntity::hasPartyJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 job = lua_tointeger(L, 1);

    if (((CCharEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        for (uint32 i = 0; i < ((CCharEntity*)m_PBaseEntity)->PParty->members.size(); i++)
        {
            CCharEntity* PTarget = (CCharEntity*)((CCharEntity*)m_PBaseEntity)->PParty->members[i];
            if (PTarget->GetMJob() == job)
            {
                lua_pushboolean(L, true);
                return 1;
            }
        }
    }
    lua_pushboolean(L, false);
    return 1;
}


/************************************************************************
*                                                                       *
*  Удаляем первый отрицательный эффект                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::eraseStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->EraseStatusEffect());
    return 1;
}

inline int32 CLuaBaseEntity::healingWaltz(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HealingWaltz());
    return 1;
}
/************************************************************************
*                                                                       *
*                             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::dispelAllStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint32 flag;
    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        flag = lua_tonumber(L, 1);
    }
    else
    {
        flag = EFFECTFLAG_DISPELABLE;
    }

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DispelAllStatusEffect((EFFECTFLAG)flag));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::eraseAllStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->EraseAllStatusEffect());
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStatusEffectElement(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 statusId = lua_tointeger(L,1);

    lua_pushinteger( L, effects::GetEffectElement(statusId));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::stealStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CStatusEffect* PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->StealStatusEffect();

    if (PStatusEffect == nullptr)
        lua_pushnil(L);
    else
    {
        lua_getglobal(L, CLuaStatusEffect::className);
        lua_pushstring(L,"new");
        lua_gettable(L,-2);
        lua_insert(L,-2);
        lua_pushlightuserdata(L,(void*)PStatusEffect);
        lua_pcall(L,2,1,0);

        delete PStatusEffect;
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Удаляем первый положительный эффект                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::dispelStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint32 flag;
    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        flag = lua_tonumber(L, 1);
    }
    else
    {
        flag = EFFECTFLAG_DISPELABLE;
    }

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DispelStatusEffect((EFFECTFLAG)flag));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger(L,((CBattleEntity*)m_PBaseEntity)->getMod(lua_tointeger(L,1)));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::delMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    ((CBattleEntity*)m_PBaseEntity)->setModifier(
        lua_tointeger(L,1),
        lua_tointeger(L,2));
    return 0;
}

inline int32 CLuaBaseEntity::addPetMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->addPetModifier(
        lua_tointeger(L, 1),
        lua_tointeger(L, 2));
    return 0;
}

inline int32 CLuaBaseEntity::delPetMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->delPetModifier(
        lua_tointeger(L, 1),
        lua_tointeger(L, 2));
    return 0;
}

inline int32 CLuaBaseEntity::setPetMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->setPetModifier(
        lua_tointeger(L, 1),
        lua_tointeger(L, 2));
    return 0;
}

inline int32 CLuaBaseEntity::getMobMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(!(m_PBaseEntity->objtype & TYPE_MOB));

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger(L,((CMobEntity*)m_PBaseEntity)->getMobMod(lua_tointeger(L,1)));
    return 1;
}

inline int32 CLuaBaseEntity::setMobMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    // putting this in here to find elusive bug
    if(!(m_PBaseEntity->objtype & TYPE_MOB))
    {
        // this once broke on an entity (17532673) but it could not be found
        ShowError("CLuaBaseEntity::setMobMod Expected type mob (%d) but its a (%d)\n", m_PBaseEntity->id, m_PBaseEntity->objtype);
        return 0;
    }

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    ((CMobEntity*)m_PBaseEntity)->setMobMod(
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    charutils::AddExperiencePoints(false, (CCharEntity*)m_PBaseEntity, m_PBaseEntity, (uint32)lua_tointeger(L,1),0, false);
    return 0;
}

/************************************************************************
*                                                                       *
*  Remove character experience points                                   *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::delExp(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->jobs.exp[PChar->GetMJob()] -= (uint32)lua_tointeger(L,1);
    charutils::SaveCharExp(PChar, PChar->GetMJob());
    PChar->pushPacket(new CCharStatsPacket(PChar));
    return 0;
}

/************************************************************************
*                                                                       *
*  Exposes the isJailed property to lua                                 *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::isJailed(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushboolean(L, (jailutils::InPrison((CCharEntity*)m_PBaseEntity)));
    return 1;
}

/************************************************************************
*                                                                       *
*  GM command @changeJOB !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::changeJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    JOBTYPE prevjob = PChar->GetMJob();

    PChar->resetPetZoningInfo();

    PChar->jobs.unlocked |= (1 << (uint8)lua_tointeger(L,1));
    PChar->SetMJob((uint8)lua_tointeger(L,1));

    if (lua_tointeger(L,1) == JOB_BLU)
    {
        if (prevjob != JOB_BLU)
        {
            blueutils::LoadSetSpells(PChar);
        }
    }
    else if (PChar->GetSJob() != JOB_BLU)
    {
        blueutils::UnequipAllBlueSpells(PChar);
    }
    puppetutils::LoadAutomaton(PChar);
    charutils::SetStyleLock(PChar, false);
    luautils::CheckForGearSet(PChar); // check for gear set on gear change
    charutils::BuildingCharSkillsTable(PChar);
    charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    PChar->PRecastContainer->ResetAbilities();
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);

    PChar->ForParty([](CBattleEntity* PMember)
    {
        ((CCharEntity*)PMember)->PLatentEffectContainer->CheckLatentsPartyJobs();
    });

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
    PChar->pushPacket(new CCharRecastPacket(PChar));
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->jobs.unlocked |= (1 << (uint8)lua_tointeger(L,1));
    PChar->SetSJob((uint8)lua_tointeger(L,1));
    charutils::UpdateSubJob(PChar);

    if (lua_tointeger(L,1) == JOB_BLU)
    {
        blueutils::LoadSetSpells(PChar);
    }
    else
    {
        blueutils::UnequipAllBlueSpells(PChar);
    }
    puppetutils::LoadAutomaton(PChar);

    return 0;
}

/************************************************************************
*                                                                       *
*  GM command @setslevel !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setsLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L,1) > 99);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->jobs.job[PChar->GetSJob()] = (uint8)lua_tointeger(L,1);
    PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
    PChar->jobs.exp[PChar->GetSJob()] = charutils::GetExpNEXTLevel(PChar->jobs.job[PChar->GetSJob()]) - 1;

    charutils::SetStyleLock(PChar, false);
    charutils::BuildingCharSkillsTable(PChar);
    charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);

    PChar->UpdateHealth();
    PChar->health.hp = PChar->GetMaxHP();
    PChar->health.mp = PChar->GetMaxMP();

    charutils::SaveCharStats(PChar);
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    charutils::SaveCharJob(PChar, PChar->GetSJob());
    charutils::SaveCharExp(PChar, PChar->GetMJob());

    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharRecastPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
    return 0;
}

/************************************************************************
*                                                                       *
*  GM command @setlevel !!! FOR DEBUG ONLY !!!                          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L,1) > 99);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->SetMLevel((uint8)lua_tointeger(L,1));
    PChar->jobs.job[PChar->GetMJob()] = (uint8)lua_tointeger(L,1);
    PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
    PChar->jobs.exp[PChar->GetMJob()] = charutils::GetExpNEXTLevel(PChar->jobs.job[PChar->GetMJob()]) - 1;

    charutils::SetStyleLock(PChar, false);
    blueutils::ValidateBlueSpells(PChar);
    charutils::CalculateStats(PChar);
    charutils::CheckValidEquipment(PChar);
    charutils::BuildingCharSkillsTable(PChar);
    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);

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
    PChar->pushPacket(new CCharRecastPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
    return 0;
}

/************************************************************************
*                                                                       *
*  GM command @setMerits !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setMerits(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->PMeritPoints->SetMeritPoints((uint8)lua_tointeger(L,1));

    PChar->pushPacket(new CMenuMeritPacket(PChar));

    charutils::SaveCharExp(PChar, PChar->GetMJob());
    return 0;
}

/************************************************************************
*                                                                       *
*  gets Merit levels for merit type                                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getMerit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    if(m_PBaseEntity->objtype != TYPE_PC){
        // not PC just give em no merits
        lua_pushinteger(L, 0);
    } else {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        lua_pushinteger(L, PChar->PMeritPoints->GetMeritValue((MERIT_TYPE)lua_tointeger(L,1), PChar));
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  gets a players total merits                                          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getMeritCount(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype != TYPE_PC)
        lua_pushinteger(L, 0);
    else
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        lua_pushinteger(L, PChar->PMeritPoints->GetMeritPoints());
    }

    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPlaytime(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    bool update = true;
    if(!lua_isnil(L,1) && lua_isboolean(L,1))
        update = lua_toboolean(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, PChar->GetPlayTime(update));

    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::showPosition(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CCharEntity*)m_PBaseEntity)->nameflags.flags ^= (uint32)lua_tointeger(L,1);
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

/************************************************************************
*                                                                       *
*  Устанавливаем/запрашиваем флаг выхода из MogHouse                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::moghouseFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1));

    uint8 size = 0;
    FILE* File = fopen(lua_tostring(L,1),"rb");

    if (File)
    {
        CBasicPacket * PPacket = new CBasicPacket();

        fseek(File,1,SEEK_SET);
        uint16 returnSize = fread(&size,1,1,File);

        if (size <= 256)
        {
            fseek(File,0,SEEK_SET);
            uint16 read_elements = fread(PPacket,1,size*2,File);

            ((CCharEntity*)m_PBaseEntity)->pushPacket(PPacket);
        }
        fclose(File);
    }
    else
    {
        ShowError(CL_RED"CLuaBaseEntity::injectPacket : Cannot open file\n" CL_RESET);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Returns the ItemId of the equipped item in the associated slot       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getEquipID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC && m_PBaseEntity->objtype != TYPE_PET && m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    if(m_PBaseEntity->objtype == TYPE_PC)
    {
        uint8 SLOT = (uint8)lua_tointeger(L,1);

        DSP_DEBUG_BREAK_IF(SLOT > 15);

        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        CItem* PItem = PChar->getEquip((SLOTTYPE)SLOT);

        if((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
        {
            lua_pushinteger(L,PItem->getID());
            return 1;
        }
    }
    lua_pushinteger(L,0);
    return 1;
}

inline int32 CLuaBaseEntity::getShieldSize(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC && m_PBaseEntity->objtype != TYPE_PET);

    if(m_PBaseEntity->objtype == TYPE_PC)
    {
        lua_pushinteger(L,((CCharEntity*)m_PBaseEntity)->getShieldSize());
        return 1;
    }
    lua_pushinteger(L,0);
    return 1;
}

/*
Pass in an item id and it will search and equip it.

Example:
    player:equipItem(itemId)
*/
inline int32 CLuaBaseEntity::equipItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 itemID = (uint16)lua_tointeger(L,1);
    uint8 containerID;
    if (lua_isnil(L, 2) || !lua_isnumber(L, 2))
        containerID = LOC_INVENTORY;
    else
        containerID = (uint8)lua_tointeger(L, 2);
    uint8 SLOT = PChar->getStorage(containerID)->SearchItem(itemID);
    CItemArmor* PItem;

    if(SLOT != ERROR_SLOTID){
        PItem = (CItemArmor*)PChar->getStorage(containerID)->GetItem(SLOT);
        charutils::EquipItem(PChar, SLOT, PItem->getSlotType(), containerID);
        charutils::SaveCharEquip(PChar);
        charutils::SaveCharLook(PChar);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  блокируем ячейку экипировки                                          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::lockEquipSlot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 SLOT = (uint8)lua_tointeger(L,1);

    DSP_DEBUG_BREAK_IF(SLOT > 15);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::EquipItem(PChar, 0, SLOT, LOC_INVENTORY);

    PChar->m_EquipBlock |= 1 << SLOT;
    PChar->pushPacket(new CCharAppearancePacket(PChar));
    PChar->pushPacket(new CEquipPacket(0, SLOT, LOC_INVENTORY));
    PChar->pushPacket(new CCharJobsPacket(PChar));
    PChar->updatemask |= UPDATE_LOOK;

    return 0;
}

/************************************************************************
*                                                                       *
*  Cнимаем блокировку с ячейки экипировки                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::unlockEquipSlot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint8 SLOT = (uint8)lua_tointeger(L,1);

    DSP_DEBUG_BREAK_IF(SLOT > 15);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->m_EquipBlock &= ~(1 << SLOT);
    PChar->pushPacket(new CCharJobsPacket(PChar));

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::canEquipItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    uint16 itemID = (uint16)lua_tointeger(L,1);
    DSP_DEBUG_BREAK_IF(itemID > MAX_ITEMID);

    bool checkLevel = false;
    if(!lua_isnil(L,2) && lua_isboolean(L,2))
        checkLevel = lua_toboolean(L,2);

    CItemArmor* PItem = (CItemArmor*)itemutils::GetItem(itemID);
    CBattleEntity* PChar = (CBattleEntity*)m_PBaseEntity;

    if (!(PItem->getJobs() & (1 << (PChar->GetMJob() -1))))
    {
        lua_pushboolean(L, false);
        return 1;
    }
    if(checkLevel && (PItem->getReqLvl() > PChar->GetMLevel()))
    {
        lua_pushboolean(L, false);
        return 1;
    }
    //ShowDebug("Item ID: %u Item Jobs: %u Player Job: %u\n",itemID,PItem->getJobs(),PChar->GetMJob());
    lua_pushboolean(L, true);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPetElement(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if(((CBattleEntity*)m_PBaseEntity)->PPet){
        lua_pushinteger(L, ((CPetEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->m_Element);
    } else {
        lua_pushinteger(L, 0);
    }
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getPetName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if(((CBattleEntity*)m_PBaseEntity)->PPet){
        lua_pushstring(L, (((CBattleEntity*)m_PBaseEntity)->PPet)->name.c_str());
    } else {
        lua_pushstring(L, "");
    }
    return 1;
}

/*
Checks if the current entity has an alive pet.
*/
inline int32 CLuaBaseEntity::hasPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PTarget = (CBattleEntity*)m_PBaseEntity;

    lua_pushboolean(L, (PTarget->PPet != nullptr && PTarget->PPet->status != STATUS_DISAPPEAR));
    return 1;
}

/************************************************************************
*                                                                       *
*  Сущность призывает питомца                                           *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::spawnPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if ( m_PBaseEntity->objtype == TYPE_PC )
    {
        if( !lua_isnil(L,1) && lua_isstring(L,1) )
        {
            uint8 petId = lua_tointeger(L,1);
            if (petId == PETID_HARLEQUINFRAME)
            {
                if (((CCharEntity*)m_PBaseEntity)->PAutomaton)
                {
                    petId = PETID_HARLEQUINFRAME + ((CCharEntity*)m_PBaseEntity)->PAutomaton->getFrame() - 0x20;
                }
                else
                {
                    ShowError(CL_RED"CLuaBaseEntity::spawnPet : PetID is NULL\n" CL_RESET);
                    return 0;
                }
            }
            petutils::SpawnPet((CBattleEntity*)m_PBaseEntity, lua_tointeger(L,1), false);
        }
        else
        {
            ShowError(CL_RED"CLuaBaseEntity::spawnPet : PetID is NULL\n" CL_RESET);
        }
    }
    else if( m_PBaseEntity->objtype == TYPE_MOB)
    {
        CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

        if(PMob->PPet == nullptr)
        {
            ShowError("lua_baseentity::spawnPet PMob (%d) trying to spawn pet but its nullptr\n", PMob->id);
            return 0;
        }

        CMobEntity* PPet = (CMobEntity*)PMob->PPet;

        // if a number is given its an avatar or elemental spawn
        if( !lua_isnil(L,1) && lua_isstring(L,1) )
        {
            petutils::SpawnMobPet(PMob, lua_tointeger(L,1));
        }

        // always spawn on master
        PPet->m_SpawnPoint = nearPosition(PMob->loc.p, 2.2f, M_PI);

        // setup AI
        PPet->PBattleAI->SetCurrentAction(ACTION_SPAWN);

    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::petAttack(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);
    if(((CBattleEntity*)m_PBaseEntity)->PPet!=nullptr){
        petutils::AttackTarget((CBattleEntity*)m_PBaseEntity,(CBattleEntity*)PEntity->GetBaseEntity());
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::petRetreat(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if(((CBattleEntity*)m_PBaseEntity)->PPet!=nullptr){
        petutils::RetreatToMaster((CBattleEntity*)m_PBaseEntity);
    }
    return 0;
}


//==========================================================//

inline int32 CLuaBaseEntity::petAbility(lua_State *L)
{
    return 0;
}

/************************************************************************
*                                                                       *
*  Сущность освобождает питомца                                         *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::despawnPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if(((CBattleEntity*)m_PBaseEntity)->PPet!=nullptr){
        petutils::DespawnPet((CBattleEntity*)m_PBaseEntity);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

  //DSP_DEBUG_BREAK_IF(lua_gettop(L) > 1);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);

    if (PEntity != nullptr &&
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
    {
        ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->AddBaseEnmity((CBattleEntity*)PEntity->GetBaseEntity());
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  updates enmity and claims monster									*
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::updateClaim(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == NULL);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    //DSP_DEBUG_BREAK_IF(lua_gettop(L) > 1);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    if (PEntity != NULL &&
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
    {
        battleutils::ClaimMob((CMobEntity*)m_PBaseEntity, (CBattleEntity*)PEntity->GetBaseEntity());
    }
    return 0;
}

/************************************************************************
    Resets all enmity of player on mob.
    Example:
    mob:resetEnmity(target)
************************************************************************/

inline int32 CLuaBaseEntity::resetEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

  //DSP_DEBUG_BREAK_IF(lua_gettop(L) > 1);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);

    if (PEntity != nullptr &&
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
    {
        ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->LowerEnmityByPercent((CBattleEntity*)PEntity->GetBaseEntity(), 100, nullptr);
    }
    return 0;
}

/************************************************************************
Lowers enmity of player on mob
Example:
mob:lowerEnmity(target, 50)
************************************************************************/

inline int32 CLuaBaseEntity::lowerEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    if (PEntity != nullptr &&
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
    {
        ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->LowerEnmityByPercent((CBattleEntity*)PEntity->GetBaseEntity(), lua_tonumber(L, 2), nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    ((CMobEntity*)m_PBaseEntity)->addRageMode();
    return 0;
}

/************************************************************************
*                                                                       *
*  Check if the mob is an undead                                        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isUndead(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->m_EcoSystem == SYSTEM_UNDEAD);
    return 1;
}

inline int32 CLuaBaseEntity::getSystem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    uint8 system = ((CMobEntity*)m_PBaseEntity)->m_EcoSystem;

    lua_pushinteger(L, system);
    return 1;
}

inline int32 CLuaBaseEntity::getFamily(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    uint16 family = ((CMobEntity*)m_PBaseEntity)->m_Family;

    lua_pushinteger(L, family);
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns true if mob is of passed in type                             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isMobType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if(m_PBaseEntity->objtype != TYPE_MOB)
    {
        lua_pushboolean(L, false);
        return 1;
    }

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    lua_pushboolean(L, PMob->m_Type & lua_tointeger(L,1));
    return 1;
}

/************************************************************************
            Calculates the enmity produced by the input cure and
            applies it to all on the base entity's enemies hate list
            FORMAT: phealer:(ptarget,amount)
************************************************************************/

inline int32 CLuaBaseEntity::updateEnmityFromCure(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L,2) < 0);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);
    uint32 amount = lua_tointeger(L,2);

    if (PEntity != nullptr &&
        PEntity->GetBaseEntity()->objtype == TYPE_PC)
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    int32 damage = lua_tointeger(L, 2);

    if (m_PBaseEntity->objtype == TYPE_PC || (m_PBaseEntity->objtype == TYPE_MOB && ((CMobEntity*)m_PBaseEntity)->isCharmed) ||
        m_PBaseEntity->objtype == TYPE_PET)
    {
        if (PEntity && PEntity->GetBaseEntity() && PEntity->GetBaseEntity()->objtype == TYPE_MOB)
        {
            ((CMobEntity*)PEntity->GetBaseEntity())->PEnmityContainer->UpdateEnmityFromAttack((CBattleEntity*)m_PBaseEntity, damage);
        }
    }
    else if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        if (PEntity != nullptr && damage > 0 &&
            PEntity->GetBaseEntity()->objtype != TYPE_NPC)
        {
            ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->UpdateEnmityFromDamage((CBattleEntity*)PEntity->GetBaseEntity(), damage);
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Adds a specified amount of enmity towards the target if the base     *
*  entity is a mob, or towards the base entity if the base entity is a  *
*  player.                                                              *
*  paremters: (CLuaBaseEntity target,int CE,int VE)                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    int32 CE = lua_tointeger(L, 2);
    int32 VE = lua_tointeger(L, 3);

    if (m_PBaseEntity->objtype == TYPE_PC || (m_PBaseEntity->objtype == TYPE_MOB && ((CMobEntity*)m_PBaseEntity)->isCharmed) ||
        m_PBaseEntity->objtype == TYPE_PET)
    {
        if (PEntity && PEntity->GetBaseEntity() && PEntity->GetBaseEntity()->objtype == TYPE_MOB)
        {
            ((CMobEntity*)PEntity->GetBaseEntity())->PEnmityContainer->UpdateEnmity((CBattleEntity*)m_PBaseEntity, CE, VE);
        }
    }
    else if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        if (PEntity != nullptr && (CE > 0 || VE >0) &&
            PEntity->GetBaseEntity()->objtype != TYPE_NPC)
        {
            ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->UpdateEnmity((CBattleEntity*)PEntity->GetBaseEntity(), CE, VE);
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем, покидал ли персонаж зону после поднятия флага             *
*  необходимости ее покинуть. С параметром устанавливаем флаг, без      *
*  параметра узнаем результат.                                          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::needToZone(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (!lua_isnil(L,1) && lua_isboolean(L,1))
    {
        m_PBaseEntity->loc.zoning = lua_toboolean(L,1);
        return 0;
    }
    lua_pushboolean( L, m_PBaseEntity->loc.zoning );
    return 1;
}

/************************************************************************
*                                                                       *
*   Get Container Size                                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getContainerSize(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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
*  Get Entity's id                                                      *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger( L, m_PBaseEntity->id );
    return 1;
}

// TODO: should be renamed to targid
inline int32 CLuaBaseEntity::getShortID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger( L, m_PBaseEntity->targid );
    return 1;
}

// For use in GM command @getid to get the ID of MOBs, NPCs, and even Players.
inline int32 CLuaBaseEntity::fetchTargetsID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CBattleEntity* PTarget = (CBattleEntity*)PChar->loc.zone->GetEntity(PChar->m_TargID);

    if (PTarget == NULL)
    {
        ShowDebug(CL_CYAN"lua::Tried to fetch target's ID with no target selected. \n" CL_RESET);
        lua_pushnil(L);
    }
    else
    {
        ShowDebug("Currently selected target's ID is: %i \n", PTarget->id);
        lua_pushinteger( L, PTarget->id );
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  Get Entity's name                                                    *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint16 weapondam = ((CBattleEntity*)m_PBaseEntity)->GetMainWeaponDmg();

    lua_pushinteger( L, weapondam );
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current offhand weapon's base DMG; used for WS calcs        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getOffhandDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint16 weapondam = ((CBattleEntity*)m_PBaseEntity)->GetSubWeaponDmg();

    lua_pushinteger( L, weapondam );
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current weapon's base DMG; used for WS calcs                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getWeaponDmgRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint16 weapondam = ((CBattleEntity*)m_PBaseEntity)->GetMainWeaponRank() * 9;

    lua_pushinteger( L, weapondam );
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current offhand weapon's base DMG; used for WS calcs        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getOffhandDmgRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint16 weapondam = ((CBattleEntity*)m_PBaseEntity)->GetSubWeaponRank() * 9;

    lua_pushinteger( L, weapondam );
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the skill type of weapon in slot                                *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getWeaponSkillType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        uint8 SLOT = (uint8)lua_tointeger(L,1);
        if (SLOT > 3)
        {
            lua_pushinteger(L,0);
            return 1;
        }
        CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT];
        if(weapon == nullptr)
        {
            lua_pushinteger(L,0);
            return 1;
        }
        lua_pushinteger( L, weapon->getSkillType() );
        return 1;
    }
    ShowError(CL_RED"lua::getWeaponSkillType :: Invalid slot specified!" CL_RESET);
    return 0;
}

/************************************************************************
*                                                                       *
*  Gets the subskill type of weapon in slot                             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getWeaponSubSkillType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if( !lua_isnil(L,1) && lua_isstring(L,1) )
    {
        uint8 SLOT = (uint8)lua_tointeger(L,1);
        if (SLOT > 3)
        {
            ShowDebug(CL_CYAN"lua::getWeaponSubskillType slot not a weapon\n" CL_RESET);
            lua_pushinteger(L,0);
            return 1;
        }
        CItemWeapon* weapon = (CItemWeapon*)((CCharEntity*)m_PBaseEntity)->getEquip((SLOTTYPE)SLOT);

        if(weapon == nullptr)
        {
            ShowDebug(CL_CYAN"lua::getWeaponSubskillType weapon in specified slot is NULL!\n" CL_RESET);
            return 0;
        }

        lua_pushinteger( L, weapon->getSubSkillType() );
        return 1;
    }
    ShowError(CL_RED"lua::getWeaponSubskillType :: Invalid slot specified!" CL_RESET);
    return 0;
}

/************************************************************************
*                                                                       *
*  Returns weapon skill's skillchain properties (up to 3)               *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::getWSSkillchainProp(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CWeaponSkill* WSkill = ((CCharEntity*)m_PBaseEntity)->PBattleAI->GetCurrentWeaponSkill();

    if (WSkill)
    {
        lua_pushinteger(L, WSkill->getPrimarySkillchain());
        lua_pushinteger(L, WSkill->getSecondarySkillchain());
        lua_pushinteger(L, WSkill->getTertiarySkillchain());

        return 3;
    }

    lua_pushnil(L);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRangedDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint16 weapondam = ((CBattleEntity*)m_PBaseEntity)->GetRangedWeaponDmg();

    lua_pushinteger( L, weapondam);
    return 1;
}

inline int32 CLuaBaseEntity::getRangedDmgForRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint16 weaponrank = ((CBattleEntity*)m_PBaseEntity)->GetRangedWeaponRank() * 9;

    lua_pushinteger( L, weaponrank);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getAmmoDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_AMMO];

    if(weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getAmmoDmg weapon in ammo slot is NULL!\n" CL_RESET);
        return 0;
    }
    lua_pushinteger( L, weapon->getDamage());
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRATT(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];

    if(weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getRATT weapon in ranged slot is NULL!\n" CL_RESET);
        return 0;
    }

    lua_pushinteger( L, ((CBattleEntity*)m_PBaseEntity)->RATT(weapon->getSkillType(), weapon->getILvlSkill()));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getRACC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];

    if(weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getRACC weapon in ranged slot is NULL!\n" CL_RESET);
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

inline int32 CLuaBaseEntity::getACC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    uint8 slot = SLOT_MAIN;
    uint8 offsetAccuracy = 0;
    // if((L,1) == 1){
    //  slot = SLOT_SUB;
    //}
    if((L,2) > 0){
        offsetAccuracy = (L,2);
    }

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    uint16 ACC = PEntity->ACC(slot,offsetAccuracy);

    lua_pushinteger(L,ACC);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getEVA(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    uint16 EVA = PEntity->EVA();

    lua_pushinteger(L,EVA);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::isWeaponTwoHanded(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];

    if(weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getWeaponDmg weapon in main slot is NULL!\n" CL_RESET);
        return 0;
    }
    lua_pushboolean( L, weapon->isTwoHanded() );
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

    CBattleEntity* PAttacker = (CBattleEntity*)m_PBaseEntity;
    CBattleEntity* PDefender = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();
    int hitrate = battleutils::GetHitRate(PAttacker, PDefender);
    if(!lua_isnil(L,2) && lua_isnumber(L,2)){
        hitrate = lua_tointeger(L,2);
    }

    if(WELL512::GetRandomNumber(100) < hitrate){
        float DamageRatio = battleutils::GetDamageRatio(PAttacker, PDefender, false, 0);
        int damage = (uint16)((PAttacker->GetMainWeaponDmg() + battleutils::GetFSTR(PAttacker,PDefender,SLOT_MAIN)) * DamageRatio);
        lua_pushinteger( L,damage );
        return 1;
    }
    lua_pushinteger( L,-1 );
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::resetRecasts(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    // only reset for players
    if(m_PBaseEntity->objtype == TYPE_PC){
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        PChar->PRecastContainer->Del(RECAST_MAGIC);
        PChar->PRecastContainer->Del(RECAST_ABILITY);
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharRecastPacket(PChar));
        return 0;
    }

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::resetRecast(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    // only reset for players
    if(m_PBaseEntity->objtype == TYPE_PC){
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        RECASTTYPE recastContainer = (RECASTTYPE)lua_tointeger(L,1);
        uint16 recastID = lua_tointeger(L,2);

        if (PChar->PRecastContainer->Has(recastContainer, recastID))
        {
            PChar->PRecastContainer->Del(recastContainer, recastID);
            PChar->PRecastContainer->Add(recastContainer, recastID, 0);
        }

        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharRecastPacket(PChar));
        return 0;
    }

    return 0;
}

/***************************************************************
  Attempts to register a BCNM or Dynamis battlefield.
  INPUT: The BCNM ID to register.
  OUTPUT: The battlefield number assigned, or -1 if it's all full.
  Call on: The Orb trader
****************************************************************/

inline int32 CLuaBaseEntity::bcnmRegister(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    int bcnm = 0;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int ZoneID = PZone->GetID();

    if(ZoneID == 37 || ZoneID == 38){
                   if(PZone->m_BattlefieldHandler->hasFreeSpecialBattlefield(lua_tointeger(L,1))){
                           ShowDebug("Free Special Battlefield found for BCNMID %i \n",lua_tointeger(L,1));
                           bcnm = PZone->m_BattlefieldHandler->registerBcnm(lua_tointeger(L, 1), PChar);

                           if (bcnm != -1){
                                ShowDebug("Registration successful!\n");
                                lua_pushinteger(L, bcnm);
                                 }
                                 else{
                                 ShowDebug("Unable to register BCNM Special Battlefield.\n");
                                 lua_pushinteger(L, bcnm);
                                 }
                   }
                   else
                   {
                        ShowDebug("BCNM Registration Failed : No free Special battlefields for BCNMID %i \n",lua_tointeger(L,1));
                        lua_pushinteger( L,-1);
                   }
    }
    else
    if(PZone->m_BattlefieldHandler->hasFreeBattlefield()){

            if(ZoneID > 184 && ZoneID < 189 || ZoneID > 133 && ZoneID < 136 || ZoneID > 38  && ZoneID < 43 ){
               ShowDebug("Free Dynamis Battlefield found for BCNMID %i \n",lua_tointeger(L,1));
               bcnm = PZone->m_BattlefieldHandler->registerDynamis(lua_tointeger(L, 1), PChar);
            }
            else{
               ShowDebug("Free BCNM Battlefield found for BCNMID %i \n",lua_tointeger(L,1));
               bcnm = PZone->m_BattlefieldHandler->registerBcnm(lua_tointeger(L, 1), PChar);
            }

            if (bcnm != -1){
            ShowDebug("Registration successful!\n");
            lua_pushinteger(L, bcnm);
           }
           else{
            ShowDebug("Unable to register BCNM Battlefield.\n");
            lua_pushinteger(L, bcnm);
        }
    }
    else{
        ShowDebug("BCNM Registration Failed : No free battlefields for BCNMID %i \n",lua_tointeger(L,1));
     lua_pushinteger( L,-1);
    }

    return 1;
}

/***************************************************************
  Attempts to enter a BCNM or Dynamis battlefield.
  OUTPUT: 1 if successful, 0 if not.
  Call on: Any player. (e.g. non-orb trader in same pt)
****************************************************************/

inline int32 CLuaBaseEntity::bcnmEnter(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int ZoneID = PZone->GetID();

    if(ZoneID > 184 && ZoneID < 189 || ZoneID > 133 && ZoneID < 136 || ZoneID > 38  && ZoneID < 43 ){
        if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DYNAMIS, 0)){
            uint16 effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DYNAMIS,0)->GetPower();
            if(PZone->m_BattlefieldHandler->enterBcnm(effect_bcnmid,PChar)){
                lua_pushinteger( L,1);
                return 1;
            }
        }
    }
    else{
        if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD)){
            uint16 effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD,0)->GetPower();
            if(PZone->m_BattlefieldHandler->enterBcnm(effect_bcnmid,PChar)){
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
  Attempts to leave a BCNM battlefield.
  INPUT: The type of leave (1=RUN AWAY, 2=TREASURE CHEST)
  OUTPUT: 1 if successful, 0 if not.
  Call on: Anyone who selects "Leave" or "Run Away"
****************************************************************/

inline int32 CLuaBaseEntity::bcnmLeave(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    if(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD)){
        uint16 effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD,0)->GetPower();
        uint8 typeOfExit = lua_tointeger(L,1);
        if(typeOfExit==1 && PChar->loc.zone->m_BattlefieldHandler->leaveBcnm(effect_bcnmid,PChar)){
            ShowDebug("BCNM Leave :: %s left BCNMID %i \n",PChar->GetName(),effect_bcnmid);
        }
        else if(typeOfExit==2 && PChar->loc.zone->m_BattlefieldHandler->winBcnm(effect_bcnmid,PChar)){
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
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->PBCNM){
        lua_pushinteger( L,1);
        return 1;
    }
    lua_pushinteger( L,0);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::getBattlefieldID(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    uint8 inst = 255;

    if(PChar->loc.zone != nullptr && PChar->loc.zone->m_BattlefieldHandler != nullptr){
        inst = PChar->loc.zone->m_BattlefieldHandler->findBattlefieldIDFor(PChar);
    }

    lua_pushinteger( L,inst);
    return 1;
}


//==========================================================//

inline int32 CLuaBaseEntity::getBCNMloot(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    uint8 inst = 255;

    if(PChar->loc.zone != nullptr && PChar->loc.zone->m_BattlefieldHandler != nullptr){
        inst = PChar->loc.zone->m_BattlefieldHandler->findBattlefieldIDFor(PChar);
        PChar->loc.zone->m_BattlefieldHandler->openTreasureChest(PChar);
    }

    lua_pushinteger( L,inst);
    return 1;
}


//==========================================================//

//returns 1 if all 3 battlefields are full. Temp measure until event param struct is found out.
inline int32 CLuaBaseEntity::isBcnmsFull(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    uint8 full = 1;

    if(PZone != nullptr && PZone->m_BattlefieldHandler != nullptr &&
        PZone->m_BattlefieldHandler->hasFreeBattlefield()){

        full = 0;
    }
    lua_pushinteger( L,full);
    return 1;
}

inline int32 CLuaBaseEntity::isSpecialBattlefieldEmpty(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    uint8 full = 1;


    if(PZone != nullptr && PZone->m_BattlefieldHandler != nullptr &&
        PZone->m_BattlefieldHandler->hasSpecialBattlefieldEmpty(lua_tointeger(L,1))){

        full = 0;
    }
    lua_pushinteger( L,full);
    return 1;
}

inline int32 CLuaBaseEntity::getSpecialBattlefieldLeftTime(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    uint16 Leftime = 0;


    if(PZone != nullptr && PZone->m_BattlefieldHandler != nullptr){
             Leftime = PZone->m_BattlefieldHandler->SpecialBattlefieldLeftTime(lua_tointeger(L,1),gettick());
    }

    lua_pushinteger( L,Leftime);
    return 1;
}
// Add time on your Special battlefield
inline int32 CLuaBaseEntity::addTimeToSpecialBattlefield(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    PZone->m_BattlefieldHandler->GiveTimeToBattlefield(lua_tointeger(L,1),lua_tointeger(L,2));

    return 1;
}
inline int32 CLuaBaseEntity::BCNMSetLoot(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);
        if(PChar->loc.zone!=nullptr && PChar->loc.zone->m_BattlefieldHandler!=nullptr){
            PChar->loc.zone->m_BattlefieldHandler->SetLootToBCNM(lua_tointeger(L,1),lua_tointeger(L,2),lua_tointeger(L,3));
        }
    return 0;
}

inline int32 CLuaBaseEntity::RestoreAndHealOnBattlefield(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    // only reset for players
    if(m_PBaseEntity->objtype == TYPE_PC){
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
         PChar->loc.zone->m_BattlefieldHandler->RestoreOnBattlefield(lua_tointeger(L,1));
        return 0;
    }
    return 0;
}
inline int32 CLuaBaseEntity::setSpawn(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
        PMob->m_SpawnPoint.x = (float) lua_tonumber(L,1);
    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
        PMob->m_SpawnPoint.y = (float) lua_tonumber(L,2);
    if( !lua_isnil(L,3) && lua_isnumber(L,3) )
        PMob->m_SpawnPoint.z = (float) lua_tonumber(L,3);
    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
        PMob->m_SpawnPoint.rotation = lua_tointeger(L,4);

    return 0;
}

inline int32 CLuaBaseEntity::setRespawnTime(lua_State* L)
{

    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if( !lua_isnil(L,1) && lua_isnumber(L,1) )
    {
        PMob->m_RespawnTime = lua_tointeger(L, 1) * 1000;

        if( !lua_isnil(L,2) && lua_isboolean(L,2) && lua_toboolean(L,2) ) //set optional parameter to true to only modify the timer
            return 0;

        PMob->PBattleAI->SetLastActionTime(gettick());
        if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE)
        {
            PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
        }
    }
    else
    {
        ShowWarning("CLuaBaseEntity::setRespawnTime (%d) Tried to set respawn without a time\n", PMob->id);
    }

    PMob->m_AllowRespawn = true;

    return 0;
}
inline int32 CLuaBaseEntity::addPlayerToSpecialBattlefield(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int bcnm = PZone->m_BattlefieldHandler->SpecialBattlefieldAddPlayer(lua_tointeger(L, 1), PChar);

    if (bcnm != -1){
        ShowDebug("Registration successful!\n");
        lua_pushinteger(L, bcnm);
    }
    else{
        ShowDebug("Unable to register BCNM.\n");
        lua_pushinteger( L,-1);
    }

    return 1;
}

// Return unique ID for Dynamis
inline int32 CLuaBaseEntity::getDynamisUniqueID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    lua_pushinteger( L, PZone->m_BattlefieldHandler->getUniqueDynaID(lua_tointeger(L,1)));

    return 1;
}

// Add time on your dynamis battlefield
inline int32 CLuaBaseEntity::addTimeToDynamis(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    PZone->m_BattlefieldHandler->dynamisMessage(448,lua_tointeger(L,1));

    return 1;
}

//Launch dynamis mob part 2 (when mega boss is defeated)
inline int32 CLuaBaseEntity::launchDynamisSecondPart(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    PChar->loc.zone->m_BattlefieldHandler->launchDynamisSecondPart();

    return 1;
}

inline int32 CLuaBaseEntity::addPlayerToDynamis(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int bcnm = PZone->m_BattlefieldHandler->dynamisAddPlayer(lua_tointeger(L, 1), PChar);

    if (bcnm != -1){
        ShowDebug("Registration successful!\n");
        lua_pushinteger(L, bcnm);
    }
    else{
        ShowDebug("Unable to register BCNM Battlefield.\n");
        lua_pushinteger( L,-1);
    }

    return 1;
}

inline int32 CLuaBaseEntity::isInDynamis(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->isInDynamis());
    return 1;
}

inline int32 CLuaBaseEntity::setStatPoppedMobs(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    if (!lua_isnil(L,1) && lua_isboolean(L,1))
        ((CMobEntity*)m_PBaseEntity)->m_StatPoppedMobs = true;
    else
        ((CMobEntity*)m_PBaseEntity)->m_StatPoppedMobs = false;
    return 0;
}

inline int32 CLuaBaseEntity::getStatPoppedMobs(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    bool isPopped = ((CMobEntity*)m_PBaseEntity)->m_StatPoppedMobs;

    lua_pushboolean(L, isPopped);
    return 1;
}

/************************************************************************
*                                                                       *
*  Check if mob is in battlefield list                                  *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isInBattlefieldList(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if(PMob->loc.zone->m_BattlefieldHandler->checkMonsterInList(PMob))
        lua_pushboolean(L, true);
    else
        lua_pushboolean(L, false);

    return 1;
}

/************************************************************************
*                                                                       *
*  Add mob in battlefield list                                          *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::addInBattlefieldList(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    PMob->loc.zone->m_BattlefieldHandler->insertMonsterInList(PMob);

    return 0;
}

/************************************************************************
*                                                                       *
*  Открываем дверь и автоматически закрываем через 7 секунд             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::openDoor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->animation == ANIMATION_CLOSE_DOOR)
    {
        uint32 OpenTime = (!lua_isnil(L,1) && lua_isnumber(L,1)) ? (uint32)lua_tointeger(L,1) * 1000 : 7000;

        m_PBaseEntity->animation = ANIMATION_OPEN_DOOR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));

        CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_door", gettick() + OpenTime, m_PBaseEntity, CTaskMgr::TASK_ONCE, close_door));
    }
    return 0;
}

inline int32 CLuaBaseEntity::closeDoor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->animation == ANIMATION_OPEN_DOOR)
    {
        uint32 CloseTime = (!lua_isnil(L,1) && lua_isnumber(L,1)) ? (uint32) lua_tointeger(L,1) * 1000 : 7000;
        m_PBaseEntity->animation = ANIMATION_CLOSE_DOOR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));
        CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("open_door", gettick() + CloseTime, m_PBaseEntity, CTaskMgr::TASK_ONCE, open_door));
    }
    return 0;
}

/************************************************
 * Just for debugging. Similar to @animatoin.   *
 * Injects an action packet with the specified  *
 * parameters. Used for quickly finding anims.  *
 ************************************************/
inline int32 CLuaBaseEntity::injectActionPacket(lua_State* L) {
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint16 action = (uint16)lua_tointeger(L,1);
    uint16 anim = (uint16)lua_tointeger(L,2);

    ACTIONTYPE actiontype = ACTION_MAGIC_FINISH;
    switch (action)
    {
        case 3: actiontype = ACTION_WEAPONSKILL_FINISH; break;
        case 4: actiontype = ACTION_MAGIC_FINISH; break;
        case 5: actiontype = ACTION_ITEM_FINISH; break;
        case 6: actiontype = ACTION_JOBABILITY_FINISH; break;
        case 11: actiontype = ACTION_MOBABILITY_FINISH; break;
        case 13: actiontype = ACTION_RAISE_MENU_SELECTION; break;
        case 14: actiontype = ACTION_DANCE; break;
    }

    apAction_t Action;
    PChar->m_ActionList.clear();

    Action.ActionTarget = PChar;
    Action.reaction   = REACTION_NONE;
    Action.speceffect = SPECEFFECT_NONE;
    Action.animation  = anim;
    Action.param      = 10;
    Action.messageID  = 0;

    // If you use ACTION_MOBABILITY_FINISH, the first param = anim, the second param = skill id.
    if (actiontype == ACTION_MOBABILITY_FINISH || actiontype == ACTION_RAISE_MENU_SELECTION) {
        CBattleEntity* PTarget = (CBattleEntity*)PChar->loc.zone->GetEntity(PChar->m_TargID);
        if (PTarget == nullptr) {
            ShowError("Cannot use MOBABILITY_FINISH on a nullptr battle target! Target a mob! \n");
            return 0;
        }
        else if(PTarget->objtype != TYPE_MOB) {
            ShowError("Battle target must be a monster for MOBABILITY_FINISH \n");
            return 0;
        }
        CMobEntity* PMob = (CMobEntity*)PTarget;
        PMob->m_ActionList.clear();

        ACTIONTYPE oldAction = PMob->PBattleAI->GetCurrentAction();
        PMob->PBattleAI->SetCurrentAction(actiontype);
        // we have to make a fake mob skill for this to work.
        CMobSkill* skill = new CMobSkill(1);
        skill->setAnimationID(anim);
        Action.animation = anim;
        skill->setMsg(185); // takes damage default msg
        Action.messageID = 185;
        PMob->PBattleAI->SetCurrentMobSkill(skill);
        PMob->m_ActionList.push_back(Action);
        PMob->loc.zone->PushPacket(PMob, CHAR_INRANGE, new CActionPacket(PMob));
        PMob->PBattleAI->SetCurrentAction(oldAction);
        PMob->PBattleAI->SetCurrentMobSkill(nullptr);
        delete skill;
        skill = nullptr;
        return 0;
    }

    ACTIONTYPE oldAction = PChar->PBattleAI->GetCurrentAction();
    PChar->PBattleAI->SetCurrentSpell(1);
    PChar->PBattleAI->SetCurrentJobAbility(1);
    PChar->PBattleAI->SetCurrentWeaponSkill(1);
    PChar->PBattleAI->SetCurrentAction(actiontype);

    PChar->m_ActionList.push_back(Action);
    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CActionPacket(PChar));
    PChar->PBattleAI->SetCurrentAction(oldAction);

    return 0;
}

/************************************************************************
*                                                                       *
* Used to manipulate the mob's flags for testing.                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setMobFlags(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if( !lua_isnil(L,2) && lua_isnumber(L,2) )
    {
        uint32 mobid = (uint32)lua_tointeger(L,2);
        CMobEntity* PMob = nullptr;

        if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
        {
            CLuaInstance* PLuaInstance = Lunar<CLuaInstance>::check(L, 2);
            PMob = (CMobEntity*)PLuaInstance->GetInstance()->GetEntity(mobid & 0xFFF, TYPE_MOB);
        }
        else
        {
            PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
        }

        if (PMob != nullptr)
        {
            if( !lua_isnil(L,1) && lua_isnumber(L,1) )
            {
                ((CMobEntity*)PMob)->setMobFlags((uint32)(lua_tointeger(L,1)));
                PMob->updatemask |= UPDATE_HP;
            }
        }
    }
    else
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        CBattleEntity* PTarget = (CBattleEntity*)PChar->loc.zone->GetEntity(PChar->m_TargID);

        if (PTarget == nullptr)
        {
            ShowError("Must target a monster to use for setMobFlags \n");
            return 0;
        }
        else if(PTarget->objtype != TYPE_MOB)
        {
            ShowError("Battle target must be a monster to use setMobFlags \n");
            return 0;
        }
        if( !lua_isnil(L,1) && lua_isnumber(L,1) )
        {
            ((CMobEntity*)PTarget)->setMobFlags((uint32)(lua_tointeger(L,1)));
            PTarget->updatemask |= UPDATE_HP;
        }
    }
    return 0;
}

/************************************************************************
* Can be used by all npc to appear for a certain time then despawn      *
* npc:showNPC() : appear for 15 secs                                    *
* you can add time in second : showNPC(30) : appear for 30 secs         *
************************************************************************/

inline int32 CLuaBaseEntity::showNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    uint32 OpenTime = (!lua_isnil(L,1) && lua_isnumber(L,1)) ? (uint32)lua_tointeger(L,1) * 1000 : 15000;

    m_PBaseEntity->status = STATUS_NORMAL;
    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));

    CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("disappear_npc", gettick() + OpenTime, m_PBaseEntity, CTaskMgr::TASK_ONCE, disappear_npc));

    return 0;
}

/************************************************************************
* can be used by all npc for disappear a certain time                   *
* npc:hideNPC() : disappear for 15sec                                   *
* you can add time in second : hideNPC(30) : disappear for 30sec        *
************************************************************************/

inline int32 CLuaBaseEntity::hideNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->status == STATUS_NORMAL)
    {
        uint32 OpenTime = (!lua_isnil(L,1) && lua_isnumber(L,1)) ? (uint32)lua_tointeger(L,1) * 1000 : 15000;

        m_PBaseEntity->status = STATUS_DISAPPEAR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_DESPAWN, UPDATE_NONE));

        CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("reappear_npc", gettick() + OpenTime, m_PBaseEntity, CTaskMgr::TASK_ONCE, reappear_npc));
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    const char* type = lua_tostring(L,1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, charutils::GetPoints(PChar, type));

    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* type = lua_tostring(L,1);
    int32 amount = (int32)lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, type, amount);

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* type = lua_tostring(L,1);
    int32 amount = (int32)lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, type, -amount);

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getCP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, charutils::GetPoints(PChar, charutils::GetConquestPointsName(PChar).c_str()));
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addCP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int32 cp = (int32)lua_tointeger(L,1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, charutils::GetConquestPointsName(PChar).c_str(), cp);
    PChar->pushPacket(new CConquestPacket(PChar));

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delCP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int32 cp = (int32)lua_tointeger(L,1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, charutils::GetConquestPointsName(PChar).c_str(), -cp);
    PChar->pushPacket(new CConquestPacket(PChar));

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getSeals(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    uint32 type = lua_tointeger(L, 1);

    switch (type)
    {
    case 0:
        lua_pushinteger(L, charutils::GetPoints(PChar, "beastman_seal"));
        break;
    case 1:
        lua_pushinteger(L, charutils::GetPoints(PChar, "kindred_seal"));
        break;
    case 2:
        lua_pushinteger(L, charutils::GetPoints(PChar, "kindred_crest"));
        break;
    case 3:
        lua_pushinteger(L, charutils::GetPoints(PChar, "high_kindred_crest"));
        break;
    case 4:
        lua_pushinteger(L, charutils::GetPoints(PChar, "sacred_kindred_crest"));
        break;
    default:
        lua_pushinteger(L, 0);
    }
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addSeals(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    int32 points = lua_tointeger(L, 1);
    uint32 type = lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (type)
    {
    case 0:
        charutils::AddPoints(PChar, "beastman_seal", points);
        break;
    case 1:
        charutils::AddPoints(PChar, "kindred_seal", points);
        break;
    case 2:
        charutils::AddPoints(PChar, "kindred_crest", points);
        break;
    case 3:
        charutils::AddPoints(PChar, "high_kindred_crest", points);
        break;
    case 4:
        charutils::AddPoints(PChar, "sacred_kindred_crest", points);
        break;
    default:
        break;
    }

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delSeals(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    int32 points = lua_tointeger(L, 1);
    uint32 type = lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (type)
    {
    case 0:
        charutils::AddPoints(PChar, "beastman_seal", -points);
        break;
    case 1:
        charutils::AddPoints(PChar, "kindred_seal", -points);
        break;
    case 2:
        charutils::AddPoints(PChar, "kindred_crest", -points);
        break;
    case 3:
        charutils::AddPoints(PChar, "high_kindred_crest", -points);
        break;
    case 4:
        charutils::AddPoints(PChar, "sacred_kindred_crest", -points);
        break;
    default:
        break;
    }
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::getAssaultPoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    uint32 region = lua_tointeger(L, 1);

    switch (region)
    {
    case 0:
        lua_pushinteger(L, charutils::GetPoints(PChar, "leujaoam_assault_point"));
        break;
    case 1:
        lua_pushinteger(L, charutils::GetPoints(PChar, "mamool_assault_point"));
        break;
    case 2:
        lua_pushinteger(L, charutils::GetPoints(PChar, "lebros_assault_point"));
        break;
    case 3:
        lua_pushinteger(L, charutils::GetPoints(PChar, "periqia_assault_point"));
        break;
    case 4:
        lua_pushinteger(L, charutils::GetPoints(PChar, "ilrusi_assault_point"));
        break;
    default:
        lua_pushinteger(L, 0);
    }
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::addAssaultPoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    uint32 region = lua_tointeger(L, 1);
    int32 points = lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (region)
    {
    case 0:
        charutils::AddPoints(PChar, "leujaoam_assault_point", points);
        break;
    case 1:
        charutils::AddPoints(PChar, "mamool_assault_point", points);
        break;
    case 2:
        charutils::AddPoints(PChar, "lebros_assault_point", points);
        break;
    case 3:
        charutils::AddPoints(PChar, "periqia_assault_point", points);
        break;
    case 4:
        charutils::AddPoints(PChar, "ilrusi_assault_point", points);
        break;
    default:
        break;
    }

    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::delAssaultPoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    int32 points = lua_tointeger(L, 1);
    uint32 region = lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (region)
    {
    case 0:
        charutils::AddPoints(PChar, "leujaoam_assault_point", -points);
        break;
    case 1:
        charutils::AddPoints(PChar, "mamool_assault_point", -points);
        break;
    case 2:
        charutils::AddPoints(PChar, "lebros_assault_point", -points);
        break;
    case 3:
        charutils::AddPoints(PChar, "periqia_assault_point", -points);
        break;
    case 4:
        charutils::AddPoints(PChar, "ilrusi_assault_point", -points);
        break;
    default:
        break;
    }
    return 0;
}

//==========================================================//

/************************************************************************
*   player:getNationTeleport(tpID) : return the player's teleport       *
*   tpID: supply(0~2) runic(3) maw(4) past(5~7)...                      *
*   full list in charutils.cpp                                          *
************************************************************************/

inline int32 CLuaBaseEntity::getNationTeleport(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    int32 nation = (int32)lua_tointeger(L,1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch(nation)
    {
        case 0: lua_pushinteger( L, PChar->nationtp.sandoria ); return 1; break;
        case 1: lua_pushinteger( L, PChar->nationtp.bastok ); return 1; break;
        case 2: lua_pushinteger( L, PChar->nationtp.windurst ); return 1; break;
        case 3: lua_pushinteger( L, PChar->nationtp.ahturhgan ); return 1; break;
        case 4: lua_pushinteger( L, PChar->nationtp.maw ); return 1; break;
        case 5: lua_pushinteger( L, PChar->nationtp.pastsandoria ); return 1; break;
        case 6: lua_pushinteger( L, PChar->nationtp.pastbastok ); return 1; break;
        case 7: lua_pushinteger( L, PChar->nationtp.pastwindurst ); return 1; break;
        default :
            ShowDebug(CL_CYAN"lua::getNationTeleport no region with this number!\n" CL_RESET);
            return 0;
    }
}

/************************************************************************
*   player:addNationTeleport(tpID,number) : add tp to a player variable *
*   tpID: supply(0~2) runic(3) maw(4) past(5~7)...                      *
*   number: 1,2,4,8,16,32,64,...                                        *
*   full list in charutils.cpp                                          *
************************************************************************/

inline int32 CLuaBaseEntity::addNationTeleport(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L,2) || !lua_isnumber(L,2));

    uint16 nation = (uint16)lua_tointeger(L,1);
    uint32 newTP = (uint32)lua_tointeger(L,2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch(nation)
    {
        case 0: PChar->nationtp.sandoria |= newTP; break;
        case 1: PChar->nationtp.bastok |= newTP; break;
        case 2: PChar->nationtp.windurst |= newTP; break;
        case 3: PChar->nationtp.ahturhgan |= newTP; break;
        case 4: PChar->nationtp.maw |= newTP; break;
        case 5: PChar->nationtp.pastsandoria |= newTP; break;
        case 6: PChar->nationtp.pastbastok |= newTP; break;
        case 7: PChar->nationtp.pastwindurst |= newTP; break;
        default :
            ShowDebug(CL_CYAN"lua::addNationTeleport no region with this number!\n" CL_RESET);
            return 0;
    }

    charutils::SaveCharPoints(PChar);
    return 0;
}

//==========================================================//

inline int32 CLuaBaseEntity::isBehind(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);
    uint8 angle = 42;
    if (lua_gettop(L) > 1)
    {
        angle = lua_tonumber(L, 2);
    }

    uint8 turn = PLuaBaseEntity->GetBaseEntity()->loc.p.rotation - getangle(PLuaBaseEntity->GetBaseEntity()->loc.p, m_PBaseEntity->loc.p);

    lua_pushboolean(L, (turn > 128 - angle && turn < 128 + angle));

    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::isFacing(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

    DSP_DEBUG_BREAK_IF(PLuaBaseEntity == nullptr);

    lua_pushboolean( L, isFaceing(m_PBaseEntity->loc.p, PLuaBaseEntity->GetBaseEntity()->loc.p, 45));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getAngle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    DSP_DEBUG_BREAK_IF(PLuaBaseEntity == nullptr);

    lua_pushnumber(L, getangle(m_PBaseEntity->loc.p, PLuaBaseEntity->GetBaseEntity()->loc.p));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getStealItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DropList_t* DropList = itemutils::GetDropList(((CMobEntity*)m_PBaseEntity)->m_DropID);

    if ( !(((CMobEntity*)m_PBaseEntity)->m_ItemStolen) && (DropList != nullptr && DropList->size()))
    {
        for(uint8 i = 0; i < DropList->size(); ++i)
        {
            if (DropList->at(i).DropType == 2)
            {
                lua_pushinteger(L, DropList->at(i).ItemID);
                return 1;
            }
        }
    }
    lua_pushinteger(L, 0);
    return 1;
}

inline int32 CLuaBaseEntity::itemStolen(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    ((CMobEntity*)m_PBaseEntity)->m_ItemStolen = true;
    lua_pushboolean(L, 1);
    return 1;
}

//==========================================================//

inline int32 CLuaBaseEntity::checkDistance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;
    CBattleEntity* PMob = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();

    float calcdistance = distance(PBattle->loc.p, PMob->loc.p);

    lua_pushnumber( L,calcdistance);
    return 1;
}

inline int32 CLuaBaseEntity::checkBaseExp(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    bool isbaseexp = false;
    uint32 baseexp = charutils::GetRealExp(PMob->m_HiPCLvl, PMob->GetMLevel());
    if (baseexp != 0) isbaseexp = true;

    lua_pushboolean( L,isbaseexp);
    return 1;
}

inline int32 CLuaBaseEntity::checkSoloPartyAlliance(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    uint8 SoloPartyAlliance = 0;
    if (PChar->PParty != nullptr)
    {
        SoloPartyAlliance = 1;
        if (PChar->PParty->m_PAlliance != nullptr) SoloPartyAlliance = 2;
    }

    lua_pushinteger( L,SoloPartyAlliance);
    return 1;
}

/************************************************************************
*                                                                       *
*   TODO: Is this needed?                                               *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::checkExpPoints(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
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

/************************************************************************
*                                                                       *
*   Checks whether alliances can do FoV pages                           *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::checkFovAllianceAllowed(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    uint8 FovAlliance = map_config.fov_allow_alliance;

    lua_pushinteger( L,FovAlliance);
    return 1;
}

/************************************************************************
*                                                                       *
*   Checks whether FoV distance from mob penalty applies                *
*                                                                       *
************************************************************************/
inline int32 CLuaBaseEntity::checkFovDistancePenalty(lua_State *L){
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    uint8 FovDistancePenalty = map_config.fov_party_gap_penalties;

    lua_pushinteger(L, FovDistancePenalty);
    return 1;
}

/************************************************************************
*                                                                       *
*   Charm a monster                                                     *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::charmPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if ( m_PBaseEntity != nullptr )
    {
        if ( m_PBaseEntity->objtype != TYPE_MOB )
        {
            CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L,1);
            battleutils::tryToCharm((CBattleEntity*)m_PBaseEntity, (CBattleEntity*)PEntity->GetBaseEntity());
        }
    }
    return 0;
}

inline int32 CLuaBaseEntity::charm(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PTarget = Lunar<CLuaBaseEntity>::check(L, 1);
    battleutils::applyCharm((CBattleEntity*)m_PBaseEntity, (CBattleEntity*)PTarget->GetBaseEntity());

    return 0;
}

inline int32 CLuaBaseEntity::uncharm(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    battleutils::unCharm((CBattleEntity*)m_PBaseEntity);

    return 0;
}

/************************************************************************
*                                                                       *
*   Makes your pet stay put                                             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::petStay(lua_State *L)
{
    if ( m_PBaseEntity != nullptr )
    {
        if ( m_PBaseEntity->objtype != TYPE_MOB )
        {
            petutils::MakePetStay((CBattleEntity*)m_PBaseEntity);
        }
    }
    return 0;
}

inline int32 CLuaBaseEntity::getObjType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->objtype);
    return 1;
}

inline int32 CLuaBaseEntity::isPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean( L, m_PBaseEntity->objtype == TYPE_PC);
    return 1;
}

inline int32 CLuaBaseEntity::isNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean( L, m_PBaseEntity->objtype == TYPE_NPC);
    return 1;
}

inline int32 CLuaBaseEntity::isMob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean( L, m_PBaseEntity->objtype == TYPE_MOB);
    return 1;
}

inline int32 CLuaBaseEntity::isPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean( L, m_PBaseEntity->objtype == TYPE_PET);
    return 1;
}

inline int32 CLuaBaseEntity::hasTrait(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushboolean( L, charutils::hasTrait((CCharEntity*)m_PBaseEntity, lua_tointeger(L, 1)));
    return 1;
}

inline int32 CLuaBaseEntity::isTrickAttackAvailable(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isuserdata(L,1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);
    CBattleEntity* PMob = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();
    if (PMob != nullptr)
    {
        CBattleEntity* taTarget = battleutils::getAvailableTrickAttackChar((CBattleEntity*)m_PBaseEntity, PMob);
        lua_pushboolean( L, (taTarget != nullptr ? true : false));
        return 1;
    }
    return 0;
}


inline int32 CLuaBaseEntity::setDelay(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CMobEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN]->setDelay(lua_tonumber(L, 1));
    return 0;
}
inline int32 CLuaBaseEntity::setDamage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    ((CMobEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN]->setDamage(lua_tonumber(L, 1));
    return 0;
}

//cast spell in parameter - if no parameter, cast any spell in the spell list
inline int32 CLuaBaseEntity::castSpell(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (lua_isnumber(L,1))
    {
        quAction_t action;
        action.action = ACTION_MAGIC_START;
        action.param = lua_tointeger(L,1);

        if (!lua_isnil(L, 1) && lua_isuserdata(L, 1))
        {
            CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
            action.target = (CBattleEntity*)PLuaBaseEntity->m_PBaseEntity;
        }
        else
        {
            action.target = nullptr;
        }

        ((CMobEntity*)m_PBaseEntity)->PBattleAI->m_actionQueue.push(action);
    } else {
        ((CMobEntity*)m_PBaseEntity)->PBattleAI->SetLastMagicTime(0);
    }
    return 0;
}
inline int32 CLuaBaseEntity::useMobAbility(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    quAction_t action;
    action.action = ACTION_MOBABILITY_START;
    action.param = (lua_isnumber(L,1) ? lua_tointeger(L,1) : 0);
    action.target = nullptr;
    ((CMobEntity*)m_PBaseEntity)->PBattleAI->m_actionQueue.push(action);

    return 0;
}

inline int32 CLuaBaseEntity::actionQueueEmpty(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L,m_PBaseEntity->PBattleAI->m_actionQueue.empty());

    return 1;
}

inline int32 CLuaBaseEntity::actionQueueAbility(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    lua_pushboolean(L, ((CAIMobDummy*)(m_PBaseEntity->PBattleAI))->isActionQueueAttack());

    return 1;
}

inline int32 CLuaBaseEntity::SetAutoAttackEnabled(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isboolean(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->PBattleAI->SetAutoAttackEnabled(lua_toboolean(L, 1));

    return 0;
}

inline int32 CLuaBaseEntity::SetMagicCastingEnabled(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isboolean(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->PBattleAI->SetMagicCastingEnabled(lua_toboolean(L, 1));

    return 0;
}

inline int32 CLuaBaseEntity::SetMobAbilityEnabled(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isboolean(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->PBattleAI->SetMobAbilityEnabled(lua_toboolean(L, 1));

    return 0;
}

inline int32 CLuaBaseEntity::SetMobSkillAttack(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    ((CAIMobDummy*)m_PBaseEntity->PBattleAI)->setMobSkillAttack(lua_toboolean(L, 1));

    return 0;
}

inline int32 CLuaBaseEntity::updateTarget(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    ((CMobEntity*)m_PBaseEntity)->PBattleAI->SetBattleTarget(((CMobEntity*)m_PBaseEntity)->PEnmityContainer->GetHighestEnmity());

    return 0;
}

/************************************************************************
*                                                                       *
*   Gets a local var stored in the entity.                              *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getLocalVar(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    const char* var = lua_tostring(L,1);

    lua_pushinteger(L, m_PBaseEntity->GetLocalVar(var));

    return 1;
}

/************************************************************************
*                                                                       *
*  Sets a local var stored in the entity.                               *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::setLocalVar(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* var = lua_tostring(L, 1);
    uint32 val = lua_tointeger(L, 2);

    m_PBaseEntity->SetLocalVar(var, val);

    return 0;
}

inline int32 CLuaBaseEntity::resetLocalVars(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    m_PBaseEntity->ResetLocalVars();

    return 0;
}

inline int32 CLuaBaseEntity::setSpellList(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    mobutils::SetSpellList((CMobEntity*)m_PBaseEntity, lua_tonumber(L,1));

    return 0;
}

inline int32 CLuaBaseEntity::hasValidJugPetItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CItemWeapon* PItem = (CItemWeapon*)((CCharEntity*)m_PBaseEntity)->getEquip(SLOT_AMMO);

    if (PItem != nullptr && PItem->getSubSkillType() >= SUBSKILL_SHEEP && PItem->getSubSkillType() <= SUBSKILL_TOLOI)
    {
        lua_pushboolean(L, true);
        return 1;
    }
    else
    {
        lua_pushboolean(L, false);
        return 1;
    }
}

inline int32 CLuaBaseEntity::getTarget(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (((CBattleEntity*)m_PBaseEntity)->PBattleAI->GetBattleTarget())
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, ((CBattleEntity*)m_PBaseEntity)->PBattleAI->GetBattleTarget());
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    else
    {
        lua_pushnil(L);
        return 1;
    }
}

inline int32 CLuaBaseEntity::setBattleSubTarget(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L,1);
    CBattleEntity* PTarget = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();

    ((CBattleEntity*)m_PBaseEntity)->PBattleAI->SetBattleSubTarget(PTarget);

    return 0;
}

inline int32 CLuaBaseEntity::hasTPMoves(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF((m_PBaseEntity->objtype == TYPE_NPC) || (m_PBaseEntity->objtype == TYPE_PC));

    uint16 familyID = 0;

    if (m_PBaseEntity->objtype & TYPE_PET)
    {
        familyID = ((CPetEntity*)m_PBaseEntity)->m_Family;
    }
    else if (m_PBaseEntity->objtype & TYPE_MOB)
    {
        familyID = ((CMobEntity*)m_PBaseEntity)->m_Family;
    }
    std::vector<CMobSkill*> MobSkills = battleutils::GetMobSkillsByFamily(familyID);
    lua_pushboolean(L,MobSkills.size() != 0);
    return 1;
}

inline int32 CLuaBaseEntity::getMaster(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC)

    if(((CBattleEntity*)m_PBaseEntity)->PMaster != nullptr)
    {
        //uint32 petid = (uint32);

        CBaseEntity* PMaster = ((CBattleEntity*)m_PBaseEntity)->PMaster;

        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L,"new");
        lua_gettable(L,-2);
        lua_insert(L,-2);
        lua_pushlightuserdata(L,(void*)PMaster);
        lua_pcall(L,2,1,0);
        return 1;
    }
    lua_pushnil(L);
    return 1;
}

inline int32 CLuaBaseEntity::recalculateAbilitiesTable(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC)

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::BuildingCharAbilityTable(PChar);
    charutils::BuildingCharTraitsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);
    if (PChar->PPet != nullptr && PChar->PPet->objtype == TYPE_PET)
        charutils::BuildingCharPetAbilityTable(PChar, (CPetEntity*)PChar->PPet, ((CPetEntity*)PChar->PPet)->m_PetID);

    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    return 0;
}

inline int32 CLuaBaseEntity::recalculateSkillsTable(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC)

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::BuildingCharSkillsTable(PChar);
    charutils::BuildingCharWeaponSkills(PChar);

    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharRecastPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    return 0;
}

inline int32 CLuaBaseEntity::isSpellAoE(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    CSpell* PSpell = spell::GetSpell(lua_tonumber(L,1));

    if (PSpell != nullptr)
    {
        lua_pushboolean(L,battleutils::GetSpellAoEType(PEntity, PSpell) > 0);
    }
    else
    {
        lua_pushboolean(L,false);
    }

    return 1;
}

inline int32 CLuaBaseEntity::getBaseHP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushnumber(L,PEntity->health.maxhp);
    return 1;
}

inline int32 CLuaBaseEntity::getBaseMP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushnumber(L,PEntity->health.maxmp);
    return 1;
}

inline int32 CLuaBaseEntity::checkNameFlags(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if(PChar->nameflags.flags & (uint32)lua_tonumber(L,1))
        lua_pushboolean(L,true);
    else
        lua_pushboolean(L,false);
    return 1;
}

inline int32 CLuaBaseEntity::getGMLevel(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushnumber(L,PChar->m_GMlevel);
    return 1;
}

inline int32 CLuaBaseEntity::setGMLevel(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->m_GMlevel = (uint8)lua_tonumber(L,1);
    charutils::SaveCharGMLevel(PChar);
    return 0;
}

inline int32 CLuaBaseEntity::getGMHidden(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    lua_pushboolean(L, PChar->m_isGMHidden);
    return 1;
}

inline int32 CLuaBaseEntity::setGMHidden(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    PChar->m_isGMHidden = lua_toboolean(L, 1);

    if (PChar->loc.zone)
    {
        if (PChar->m_isGMHidden)
            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharPacket(PChar, ENTITY_DESPAWN, 0));
        else
            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharPacket(PChar, ENTITY_SPAWN, 0));
    }

    return 0;
}

inline int32 CLuaBaseEntity::PrintToPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isstring(L, 1));

    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CChatMessagePacket((CCharEntity*)m_PBaseEntity,MESSAGE_SYSTEM_1,(char*)lua_tostring(L,1)));

    return 0;
}
/*
Walk through the given points. NPC only.

Usage:

    npc:pathThrough({
        -217, -57, 379, -- point 1
        -264, -55, 378 -- point 2
    }, PATHFLAG_RUN | PATHFLAG_WALLHACK);
*/
inline int32 CLuaBaseEntity::pathThrough(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    position_t points[50];

    uint8 length = lua_objlen(L, 1);
    uint8 pos = 0;

    DSP_DEBUG_BREAK_IF(length > 50*3);

    // Grab points from array and store in points array
    for(uint8 i=1; i<length; i+=3)
    {
        lua_rawgeti(L, 1, i);
        points[pos].x = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, i+1);
        points[pos].y = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, i+2);
        points[pos].z = lua_tonumber(L, -1);
        lua_pop(L,1);

        pos++;
    }

    uint8 flags = 0;

    if(lua_isnumber(L, 2))
    {
        flags = lua_tointeger(L, 2);
    }

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    if(PBattle->PBattleAI->m_PPathFind->PathThrough(points, pos, flags))
    {
        PBattle->PBattleAI->SetCurrentAction(ACTION_ROAMING);
        lua_pushboolean(L, true);
    }
    else
    {
        lua_pushboolean(L, false);
    }

    return 1;
}

/*
Usage:

    npc:atPoint(-200, 10, -300);
    npc:atPoint({-200, 10, -300});
*/
inline int32 CLuaBaseEntity::atPoint(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    float posX = 0;
    float posY = 0;
    float posZ = 0;

    if(lua_isnumber(L, 1))
    {
        posX = lua_tonumber(L,1);
        posY = lua_tonumber(L,2);
        posZ = lua_tonumber(L,3);
    }
    else
    {
        // It's a table
        lua_rawgeti(L, 1, 1);
        posX = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, 2);
        posY = lua_tonumber(L, -1);
        lua_pop(L,1);

        lua_rawgeti(L, 1, 3);
        posZ = lua_tonumber(L, -1);
        lua_pop(L,1);
    }

    lua_pushboolean(L, m_PBaseEntity->loc.p.x == posX && m_PBaseEntity->loc.p.y == posY && m_PBaseEntity->loc.p.z == posZ);

    return 1;
}

/*
Usage:

    npc:lookAt(-200, 10, -300);
    npc:lookAt({-200, 10, -300});
*/
inline int32 CLuaBaseEntity::lookAt(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    float posX = 0;
    float posY = 0;
    float posZ = 0;

    if(lua_isnumber(L, 1))
    {
        posX = lua_tonumber(L,1);
        posY = lua_tonumber(L,2);
        posZ = lua_tonumber(L,3);
    }
    else
    {
        lua_getfield(L, 1, "x");
        posX = lua_tonumber(L, -1);
        lua_getfield(L, 1, "y");
        posY = lua_tonumber(L, -1);
        lua_getfield(L, 1, "z");
        posZ = lua_tonumber(L, -1);
    }

    position_t point;

    point.x = posX;
    point.y = posY;
    point.z = posZ;

    m_PBaseEntity->loc.p.rotation = getangle(m_PBaseEntity->loc.p, point);

    m_PBaseEntity->updatemask |= UPDATE_POS;

    return 0;
}

/*
Checks if the entity is following a path.
*/
inline int32 CLuaBaseEntity::isFollowingPath(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    lua_pushboolean(L, PBattle->PBattleAI != nullptr &&
        PBattle->PBattleAI->m_PPathFind != nullptr &&
        PBattle->PBattleAI->m_PPathFind->IsFollowingPath());

    return 1;
}

/*
Clears the current path and stops moving.
*/
inline int32 CLuaBaseEntity::clearPath(lua_State* L)
{
    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PBattle->PBattleAI == nullptr);

    if(PBattle->PBattleAI->m_PPathFind != nullptr)
    {
        PBattle->PBattleAI->m_PPathFind->Clear();
    }

    return 0;
}

/*
Wait for a given number of milliseconds.

Usage:

    npc:wait(1000); -- wait one second
*/
inline int32 CLuaBaseEntity::wait(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_PC);

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    DSP_DEBUG_BREAK_IF(PBattle->PBattleAI == nullptr);

    int32 waitTime = 4000;

    if(lua_isnumber(L, 1)){
        waitTime = lua_tonumber(L, 1);
    }

    PBattle->PBattleAI->Wait(waitTime);

    return 0;
}

inline int32 CLuaBaseEntity::pathTo(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));

    position_t point;

    point.x = (float)lua_tonumber(L, 1);
    point.y = (float)lua_tonumber(L, 2);
    point.z = (float)lua_tonumber(L, 3);

    if (m_PBaseEntity->PBattleAI && m_PBaseEntity->PBattleAI->m_PPathFind)
    {
        m_PBaseEntity->PBattleAI->m_PPathFind->PathTo(point, PATHFLAG_RUN | PATHFLAG_WALLHACK | PATHFLAG_SCRIPT);
    }

    return 0;
}

inline int32 CLuaBaseEntity::unlockAttachment(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L,-1));

    uint16 itemID = lua_tointeger(L, -1);

    CItem* PItem = itemutils::GetItem(itemID);
    lua_pushboolean(L,puppetutils::UnlockAttachment((CCharEntity*)m_PBaseEntity, PItem));
    return 1;
}

inline int32 CLuaBaseEntity::hasAttachment(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L,-1));

    uint16 itemID = lua_tointeger(L, -1);

    CItem* PItem = itemutils::GetItem(itemID);
    lua_pushboolean(L,puppetutils::HasAttachment((CCharEntity*)m_PBaseEntity, PItem));
    return 1;
}

inline int32 CLuaBaseEntity::disableLevelSync(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    if (PChar->PParty && PChar->PParty->GetSyncTarget() == PChar)
        PChar->PParty->DisableSync();
    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharSyncPacket(PChar));
    return 0;
}

inline int32 CLuaBaseEntity::updateHealth(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    ((CBattleEntity*)m_PBaseEntity)->UpdateHealth();
    return 0;
}

inline int32 CLuaBaseEntity::fold(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    PEntity->StatusEffectContainer->Fold(PEntity->id);

    return 0;
}

inline int32 CLuaBaseEntity::hasCorsairEffect(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushboolean(L, PEntity->StatusEffectContainer->HasCorsairEffect(PEntity->id));

    return 1;
}

inline int32 CLuaBaseEntity::initNpcAi(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    m_PBaseEntity->PBattleAI = new CAINpcDummy((CNpcEntity*)m_PBaseEntity);
    m_PBaseEntity->PBattleAI->SetCurrentAction(ACTION_ROAMING);
    return 0;
}

inline int32 CLuaBaseEntity::isNM(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_MOB && ((CMobEntity*)m_PBaseEntity)->m_Type & MOBTYPE_NOTORIOUS)
    {
        lua_pushboolean(L, true);
    }
    else
    {
        lua_pushboolean(L, false);
    }
    return 1;
}

inline int32 CLuaBaseEntity::setUnkillable(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    ((CBattleEntity*)m_PBaseEntity)->m_unkillable = lua_toboolean(L, 1);

    return 0;

}

inline int32 CLuaBaseEntity::getBattlefield(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->PBCNM)
    {
        lua_getglobal(L, CLuaBattlefield::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)m_PBaseEntity->PBCNM);
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

inline int32 CLuaBaseEntity::SendRevision(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    char version[100];
    strcpy(version, "Revision is: ");
    strcat(version, get_git_revision());
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CChatMessagePacket((CCharEntity*)m_PBaseEntity, MESSAGE_SYSTEM_1, version));

    return 0;
}


inline int32 CLuaBaseEntity::getNewPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushboolean(L, ((CCharEntity*)m_PBaseEntity)->m_isNewPlayer);
    return 1;
}

inline int32 CLuaBaseEntity::setNewPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isboolean(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    PChar->m_isNewPlayer = lua_toboolean(L, 1);
    PChar->updatemask |= UPDATE_HP;
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    return 0;
}

inline int32 CLuaBaseEntity::getMentor(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    lua_pushnumber(L,PChar->m_mentor);
    return 1;
}

inline int32 CLuaBaseEntity::setMentor(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    PChar->m_mentor = (uint8)lua_tonumber(L,1);
    charutils::mentorMode(PChar);
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->updatemask |= UPDATE_HP;
    return 0;
}

inline int32 CLuaBaseEntity::hideName(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));

    m_PBaseEntity->HideName(lua_toboolean(L, 1));
    return 0;
}

inline int32 CLuaBaseEntity::untargetable(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB && m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        ((CMobEntity*)m_PBaseEntity)->Untargetable(lua_toboolean(L, 1));
    }
    else if (m_PBaseEntity->objtype == TYPE_NPC)
    {
        ((CNpcEntity*)m_PBaseEntity)->Untargetable(lua_toboolean(L, 1));
    }
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

inline int32 CLuaBaseEntity::hideHP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB && m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        ((CMobEntity*)m_PBaseEntity)->HideHP(lua_toboolean(L, 1));
    }
    else if (m_PBaseEntity->objtype == TYPE_NPC)
    {
        ((CNpcEntity*)m_PBaseEntity)->HideHP(lua_toboolean(L, 1));
    }
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

inline int32 CLuaBaseEntity::entityVisualPacket(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    int32 n = lua_gettop(L);
    DSP_DEBUG_BREAK_IF(n < 1 || n > 2);

    const char* command = lua_tostring(L, -1);

    CBaseEntity* PNpc = nullptr;
    if (n == 2 && lua_isuserdata(L, 1))
    {
        CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
        PNpc = PLuaBaseEntity->m_PBaseEntity;
    }
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CEntityVisualPacket(PNpc, command));
    return 0;
}

inline int32 CLuaBaseEntity::entityAnimationPacket(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    const char* command = lua_tostring(L, 1);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CEntityAnimationPacket(m_PBaseEntity, command));
    }
    else
    {
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityAnimationPacket(m_PBaseEntity, command));
    }
    return 0;
}


/************************************************************************
*                                                                       *
*  Returns name of the players party leader (if in a party)             *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getPartyLeader(lua_State* L) // Todo: also add ability for find Alliance Leader via lua?
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    if (PChar->PParty)
    {
        CBattleEntity* PLeader = PChar->PParty->GetLeader();
        if (PLeader != nullptr)
        {
            const int8* PLeaderName = PLeader->GetName();
            if (PLeaderName != nullptr)
            {
                lua_pushstring(L, PLeaderName);
                return 1;
            }
        }
    }

    lua_pushnil(L);
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns a characters party as a lua array of CLuaBaseEntities        *
*                                                                       *
************************************************************************/

inline int32 CLuaBaseEntity::getParty(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CParty* party = ((CBattleEntity*)m_PBaseEntity)->PParty;

    int size = 0;
    if (party)
    {
        size = party->MemberCount(m_PBaseEntity->getZone());
    }
    else
    {
        size = 1;
    }

    lua_createtable(L, size, 0);
    int i = 1;
    ((CBattleEntity*)m_PBaseEntity)->ForParty([this, &L, &i](CBattleEntity* member)
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)member);
        lua_pcall(L, 2, 1, 0);

        lua_rawseti(L, -2, i++);
    });

    return 1;
}

inline int32 CLuaBaseEntity::getAlliance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    int size = 1;

    if (PChar->PParty && PChar->PParty->m_PAlliance)
    {
        for (auto PParty : PChar->PParty->m_PAlliance->partyList)
        {
            size += PParty->MemberCount(m_PBaseEntity->getZone());
        }
    }
    else if (PChar->PParty)
    {
        size = PChar->PParty->MemberCount(m_PBaseEntity->getZone());
    }

    lua_createtable(L, size, 0);
    int i = 0;

    PChar->ForAlliance([this, &L, &i](CBattleEntity* PMember)
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PMember);
        lua_pcall(L, 2, 1, 0);

        lua_rawseti(L, -2, i++);
    });

    return 1;
}

inline int32 CLuaBaseEntity::messageText(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    CBaseEntity* PTarget = PLuaBaseEntity->m_PBaseEntity;

    uint16 messageID = (uint16)lua_tointeger(L, 2);

    bool showName = true;
    uint8 mode = 0;

    if (!lua_isnil(L, 3))
    {
        if (lua_isboolean(L, 3))
            showName = lua_toboolean(L, 3);
        else if (lua_isnumber(L, 3))
            mode = lua_tointeger(L, 3);
    }

    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
    {
        mode = lua_tointeger(L, 4);
    }

    if (m_PBaseEntity->objtype == TYPE_PC){
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageTextPacket(PTarget, messageID, showName, mode));
    }
    else{//broadcast in range
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CMessageTextPacket(PTarget, messageID, showName, mode));
    }
    return 0;
}

inline int32 CLuaBaseEntity::instanceEntry(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    CBaseEntity* PTarget = PLuaBaseEntity->m_PBaseEntity;

    uint8 response = lua_tointeger(L, 2);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CInstanceEntryPacket(PTarget, response));

    return 0;
}

inline int32 CLuaBaseEntity::getInstance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->PInstance)
    {
        lua_getglobal(L, CLuaInstance::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)m_PBaseEntity->PInstance);
        lua_pcall(L, 2, 1, 0);
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

inline int32 CLuaBaseEntity::breathDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger( L, battleutils::BreathDmgTaken((CBattleEntity*)m_PBaseEntity, lua_tointeger(L,1)) );
    return 1;
}

inline int32 CLuaBaseEntity::magicDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2) && lua_tointeger(L, 2) > 0 && lua_tointeger(L, 2) < 9)
        lua_pushinteger(L, battleutils::MagicDmgTaken((CBattleEntity*)m_PBaseEntity, lua_tointeger(L, 1), (ELEMENT)lua_tointeger(L, 2)));
    else
        lua_pushinteger(L, battleutils::MagicDmgTaken((CBattleEntity*)m_PBaseEntity, lua_tointeger(L, 1), ELEMENT_NONE));

    return 1;
}

inline int32 CLuaBaseEntity::physicalDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger( L, battleutils::PhysicalDmgTaken((CBattleEntity*)m_PBaseEntity, lua_tointeger(L,1)) );
    return 1;
}

inline int32 CLuaBaseEntity::rangedDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L,1) || !lua_isnumber(L,1));

    lua_pushinteger( L, battleutils::RangedDmgTaken((CBattleEntity*)m_PBaseEntity, lua_tointeger(L,1)) );
    return 1;
}

inline int32 CLuaBaseEntity::setInstance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaInstance* PLuaInstance = Lunar<CLuaInstance>::check(L, 1);
    CInstance* PInstance = PLuaInstance->GetInstance();
    m_PBaseEntity->PInstance = PInstance;

    if (PInstance)
    {
        PInstance->RegisterChar(dynamic_cast<CCharEntity*>(m_PBaseEntity));
    }

    return 0;
}

inline int32 CLuaBaseEntity::createInstance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    uint8 instanceid = lua_tonumber(L, 1);
    uint16 zoneid = lua_tonumber(L, 2);

    instanceutils::LoadInstance(instanceid, zoneid, (CCharEntity*)m_PBaseEntity);

    return 0;
}

inline int32 CLuaBaseEntity::getEnmityList(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    EnmityList_t* enmityList = ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->GetEnmityList();

    if (enmityList)
    {
        lua_createtable(L, enmityList->size(), 0);
        int8 newTable = lua_gettop(L);
        int i = 1;
        for (auto member : *enmityList)
        {
            lua_getglobal(L, CLuaBaseEntity::className);
            lua_pushstring(L, "new");
            lua_gettable(L, -2);
            lua_insert(L, -2);
            lua_pushlightuserdata(L, (void*)member.second->PEnmityOwner);
            lua_pcall(L, 2, 1, 0);

            lua_rawseti(L, -2, i++);
        }
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

inline int32 CLuaBaseEntity::spawn(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        PMob->SetDespawnTimer((uint32)lua_tointeger(L, 2));
    }

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        PMob->m_RespawnTime = (uint32)lua_tointeger(L, 3) * 1000;
        PMob->m_AllowRespawn = true;
        PMob->PBattleAI->SetLastActionTime(gettick());
        if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE)
        {
            PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
        }
    }
    else {
        if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE ||
            PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
        {
            PMob->PBattleAI->SetLastActionTime(0);
            PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
        }
        else {
            ShowDebug(CL_CYAN"SpawnMob: <%s> is already spawned\n" CL_RESET, PMob->GetName());
        }
    }
    return 0;
}

inline int32 CLuaBaseEntity::getCurrentAction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->PBattleAI->GetCurrentAction());

    return 1;
}

inline int32 CLuaBaseEntity::getAllegiance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->allegiance);

    return 1;
}

inline int32 CLuaBaseEntity::stun(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CAIMobDummy*)m_PBaseEntity->PBattleAI)->Stun(lua_tointeger(L, 1));

    return 0;
}

inline int32 CLuaBaseEntity::weaknessTrigger(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    mobutils::WeaknessTrigger(m_PBaseEntity, (WeaknessType)lua_tointeger(L, 1));

    return 0;
}

inline int32 CLuaBaseEntity::setBehaviour(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Behaviour = lua_tointeger(L, 1);

    return 0;
}

inline int32 CLuaBaseEntity::getBehaviour(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    lua_pushinteger(L,((CMobEntity*)m_PBaseEntity)->m_Behaviour);

    return 1;
}

inline int32 CLuaBaseEntity::reloadParty(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    ((CCharEntity*)m_PBaseEntity)->ReloadPartyInc();

    return 0;
}

inline int32 CLuaBaseEntity::setModelId(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

        switch ((SLOTTYPE)lua_tointeger(L, 2))
        {
        case SLOT_MAIN:
            m_PBaseEntity->look.main = lua_tointeger(L, 1);
            break;
        case SLOT_SUB:
            m_PBaseEntity->look.sub = lua_tointeger(L, 1);
            break;
        case SLOT_RANGED:
            m_PBaseEntity->look.ranged = lua_tointeger(L, 1);
            break;
        case SLOT_HEAD:
            m_PBaseEntity->look.head = lua_tointeger(L, 1);
            break;
        case SLOT_BODY:
            m_PBaseEntity->look.body = lua_tointeger(L, 1);
            break;
        case SLOT_HANDS:
            m_PBaseEntity->look.hands = lua_tointeger(L, 1);
            break;
        case SLOT_LEGS:
            m_PBaseEntity->look.legs = lua_tointeger(L, 1);
            break;
        case SLOT_FEET:
            m_PBaseEntity->look.feet = lua_tointeger(L, 1);
            break;
        }
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharAppearancePacket((CCharEntity*)m_PBaseEntity));
    }
    else
    {
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

        m_PBaseEntity->SetModelId(lua_tointeger(L, 1));
    }
    m_PBaseEntity->updatemask |= UPDATE_LOOK;

    return 0;
}

inline int32 CLuaBaseEntity::getModelId(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->GetModelId());

    return 1;
}

inline int32 CLuaBaseEntity::setAggroFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Aggro |= lua_tointeger(L, -1);

    return 0;
}

inline int32 CLuaBaseEntity::unsetAggroFlag(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Aggro &= ~lua_tointeger(L, -1);

    return 0;
}

inline int32 CLuaBaseEntity::instantiateMob(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CMobEntity* newMob = mobutils::InstantiateAlly(lua_tointeger(L, 1), m_PBaseEntity->getZone());

    newMob->loc.p = m_PBaseEntity->loc.p;
    newMob->m_SpawnPoint = newMob->loc.p;
    newMob->PBattleAI->SetLastActionTime(0);
    newMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);

    return 0;
}

inline int32 CLuaBaseEntity::getActiveManeuvers(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushinteger(L, PEntity->StatusEffectContainer->GetActiveManeuvers());

    return 1;
}

inline int32 CLuaBaseEntity::removeOldestManeuver(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    PEntity->StatusEffectContainer->RemoveOldestManeuver();

    return 0;
}

inline int32 CLuaBaseEntity::addBurden(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    if (((CBattleEntity*)m_PBaseEntity)->PPet && ((CPetEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->getPetType() == PETTYPE_AUTOMATON)
    {
        lua_pushinteger(L, ((CAutomatonEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->addBurden(lua_tointeger(L, 1), lua_tointeger(L, 2)));
    }
    else
    {
        lua_pushinteger(L, 0);
    }
    return 1;
}

inline int32 CLuaBaseEntity::removeAllManeuvers(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    PEntity->StatusEffectContainer->RemoveAllManeuvers();

    return 0;
}

inline int32 CLuaBaseEntity::setElevator(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 3));

    Elevator_t elevator;

    // id should be 0 for most elevators, except special ones such as port bastok drawbridge
    elevator.id = (uint8)lua_tointeger(L, 1);
    elevator.LowerDoor = (CNpcEntity*)zoneutils::GetEntity(lua_tointeger(L, 2), TYPE_NPC);
    elevator.UpperDoor = (CNpcEntity*)zoneutils::GetEntity(lua_tointeger(L, 3), TYPE_NPC);
    elevator.Elevator = (CNpcEntity*)zoneutils::GetEntity(lua_tointeger(L, 4), TYPE_NPC);

    if (!elevator.Elevator)
    {
        ShowWarning("Elevator id %d initialization failed - elevator ID resolved to no entity.", lua_tointeger(L, 4));
        return 0;
    }

    elevator.isMoving = false;
    elevator.isStarted = (!lua_isnil(L, 5) && lua_isnumber(L, 5)) ? (lua_tointeger(L, 5) != 0) : 0;
    elevator.isPermanent = (!lua_isnil(L, 6) && lua_isnumber(L, 6)) ? (lua_tointeger(L, 6) != 0) : 0;

    elevator.movetime = ((elevator.UpperDoor == nullptr) || (elevator.LowerDoor == nullptr) ? 0 : 3);
    elevator.interval = 8;// ((elevator.UpperDoor == nullptr) || (elevator.LowerDoor == nullptr) || (!elevator.isPermanent) ? 8 : 8);

    elevator.zone = m_PBaseEntity->loc.zone->GetID();

    elevator.Elevator->name.resize(10);
    CTransportHandler::getInstance()->insertElevator(elevator);

    return 0;
}

inline int32 CLuaBaseEntity::storeWithPorterMoogle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    lua_settop(L, 3);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_istable(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_istable(L, 3));

    auto slipId = (uint16)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto slipSlotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(slipId);
    if (slipSlotId == 255) { return 0; }
    auto slip = PChar->getStorage(LOC_INVENTORY)->GetItem(slipSlotId);

    auto extraSize = lua_objlen(L, 2);
    uint8 extraData[24];
    lua_pushnil(L);
    for (int i = 0; i < extraSize && lua_next(L, 2) != 0; i++)
    {
        auto extra = (uint8)lua_tonumber(L, -1);
        if ((slip->m_extra[i] & extra) != 0) {
            lua_pushinteger(L, 1);
            return 1;
        }
        slip->m_extra[i] |= extra;
        lua_pop(L, 1);
    }

    auto storableSize = lua_objlen(L, 3);
    uint16 storedItemIds[7];

    lua_pushnil(L);
    for (int i = 0; i < storableSize && lua_next(L, 3) != 0; i++)
    {
        auto itemId = (uint16)lua_tonumber(L, -1);
        if (itemId != 0) {
            storedItemIds[i] = itemId;
        }
        else {
            storedItemIds[i] = 0;
        }
        lua_pop(L, 1);
    }

    for (auto itemId : storedItemIds)
    {
        if (itemId != 0) {
            auto slotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(itemId);
            if (slotId != 255) {
                // TODO: Items need to be checked for an in-progress magian trial before storing.
                //auto item = PChar->getStorage(LOC_INVENTORY)->GetItem(slotId);
                //if (item->isType(ITEM_ARMOR) && ((CItemArmor*)item)->getTrialNumber() != 0)
                charutils::UpdateItem(PChar, LOC_INVENTORY, slotId, -1);
                //else 
                //{
                //lua_pushinteger(L, 2);
                //return 1;
                //}
            }
        }
    }

    int8 extra[sizeof(slip->m_extra) * 2 + 1];
    Sql_EscapeStringLen(SqlHandle, extra, (const int8*)slip->m_extra, sizeof(slip->m_extra));

    const int8* Query =
        "UPDATE char_inventory "
        "SET extra = '%s' "
        "WHERE charid = %u AND location = %u AND slot = %u;";

    Sql_Query(SqlHandle, Query, extra, PChar->id, slip->getLocationID(), slip->getSlotID());

    lua_pushinteger(L, 0);
    return 1;
}

inline int32 CLuaBaseEntity::getRetrievableItemsForSlip(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    lua_settop(L, 1);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto slipId = (uint16)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto slipSlotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(slipId);
    if (slipSlotId == 255) { return 0; }
    auto slip = PChar->getStorage(LOC_INVENTORY)->GetItem(slipSlotId);

    lua_newtable(L);
    // TODO Is extra sized defined anywhere?
    for (int i = 0; i < 24; i++) {
        lua_pushnumber(L, slip->m_extra[i]);
        lua_rawseti(L, -2, i + 1);
    }

    return 1;
}

inline int32 CLuaBaseEntity::retrieveItemFromSlip(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    lua_settop(L, 4);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));

    auto slipId = (uint16)lua_tointeger(L, 1);
    auto itemId = (uint16)lua_tointeger(L, 2);
    auto extraId = (uint16)lua_tointeger(L, 3);
    auto extraData = (uint8)lua_tointeger(L, 4);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto slipSlotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(slipId);
    if (slipSlotId == 255) { return 0; }
    auto slip = PChar->getStorage(LOC_INVENTORY)->GetItem(slipSlotId);

    slip->m_extra[extraId] &= extraData;

    int8 extra[sizeof(slip->m_extra) * 2 + 1];
    Sql_EscapeStringLen(SqlHandle, extra, (const int8*)slip->m_extra, sizeof(slip->m_extra));

    const int8* Query =
        "UPDATE char_inventory "
        "SET extra = '%s' "
        "WHERE charid = %u AND location = %u AND slot = %u;";

    Sql_Query(SqlHandle, Query, extra, PChar->id, slip->getLocationID(), slip->getSlotID());

    auto item = itemutils::GetItem(itemId);
    item->setQuantity(1);
    auto slotId = charutils::AddItem(PChar, LOC_INVENTORY, item);

    return 0;
}

inline int32 CLuaBaseEntity::getILvlMacc(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L,((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN]->getILvlMacc());

    return 1;
}

//==========================================================//

const int8 CLuaBaseEntity::className[] = "CBaseEntity";

Lunar<CLuaBaseEntity>::Register_t CLuaBaseEntity::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,ChangeMusic),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,warp),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,leavegame),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getShortID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,fetchTargetsID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getHPP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,restoreHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,restoreMP),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTempItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSpawnPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFreeSlotsCount),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getXPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getYPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRotPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZone),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZoneID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getZoneName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isInMogHouse),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrentRegion),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPreviousZone),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getContinentID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isZoneVisited),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeather),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setWeather),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,teleport),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPos),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRace),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNation),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setNation),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCampaignAllegiance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setCampaignAllegiance),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addAssault),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delAssault),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrentAssault),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCompletedAssault),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,completeAssault),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setSkillLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaxSkillLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSkillRank),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setSkillRank),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponSkillLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canLearnSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addLearnedAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasLearnedAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canLearnAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delLearnedAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMainJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMainLvl),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSubJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSubLvl),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,unlockJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,levelCap),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,levelRestriction),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,sjRestriction),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getVar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setVar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addVar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,clearGearSetMods),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addGearSetMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasGearSetMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setPetName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAutomatonName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMaskBit),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaskBit),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,countMaskBits),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isMaskFull),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,release),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,startEvent),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,startEventString),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEvent),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEventTarget),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,openSendBox),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,showText),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageBasic),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,messagePublic),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageSpecial),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageSystem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,clearTargID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendMenu),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendGuild),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrentGPItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addGuildPoints),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setHomePoint),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,tradeComplete),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,confirmTrade),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delExp),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetPlayer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,costume),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,costume2),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canUseCostume),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canUseChocobo),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canUsePet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setStatus),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStatus),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendRaise),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendReraise),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,sendTractor),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addStatusEffectEx),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canGainStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasStatusEffectByFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasBustEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStatusEffectElement),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delStatusEffectsByFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delStatusEffectSilent),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,eraseStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,healingWaltz),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,dispelStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,dispelAllStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,eraseAllStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,stealStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addBardSong),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addCorsairRoll),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasPartyJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,fold),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCorsairEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMobMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMobMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,moghouseFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,injectPacket),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,showPosition),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateClaim),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,lowerEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmityFromDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEquipID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getShieldSize),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,lockEquipSlot),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,unlockEquipSlot),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canEquipItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,equipItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPetElement),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPetName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,charmPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,charm),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,uncharm),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,spawnPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,despawnPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,petAttack),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,petRetreat),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,petStay),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,petAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,familiar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPetID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isJugPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,needToZone),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getContainerSize),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,changeContainerSize),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPartyMember),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPartySize),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAllianceSize),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addPartyEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,removePartyEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasPartyEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isJailed),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setsLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,changeJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,changesJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMerits),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMerit),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMeritCount),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPlaytime),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponDmg),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getOffhandDmg),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponDmgRank),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getOffhandDmgRank),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,openDoor),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,closeDoor),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,wakeUp),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmityFromCure),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isWeaponTwoHanded),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponSkillType),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponSubSkillType),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWSSkillchainProp),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRangedDmg),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRangedDmgForRank),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAmmoDmg),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRATT),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRACC),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getACC),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEVA),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,capSkill),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,capAllSkills),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addAllSpells),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMeleeHitDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetRecasts),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetRecast),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,bcnmRegister),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,bcnmEnter),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,bcnmLeave),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isInBcnm),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isBcnmsFull),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isSpecialBattlefieldEmpty),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSpecialBattlefieldLeftTime),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,RestoreAndHealOnBattlefield),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,BCNMSetLoot),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBattlefieldID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrency),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addCurrency),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delCurrency),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addCP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delCP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSeals),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addSeals),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delSeals),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAssaultPoint),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addAssaultPoint),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delAssaultPoint),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addNationTeleport),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNationTeleport),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isBehind),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isFacing),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAngle),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,showNPC),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hideNPC),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStealItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,itemStolen),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBCNMloot),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getDynamisUniqueID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addPlayerToDynamis),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTimeToDynamis),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,launchDynamisSecondPart),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isInDynamis),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStatPoppedMobs),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setStatPoppedMobs),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isInBattlefieldList),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addInBattlefieldList),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addPlayerToSpecialBattlefield),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTimeToSpecialBattlefield),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkDistance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkBaseExp),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkSoloPartyAlliance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkExpPoints),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkFovAllianceAllowed),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkFovDistancePenalty),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasImmunity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,rageMode),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isUndead),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isMobType),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBattleTime),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getSystem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getFamily),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,createWornItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasWornItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStorageItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getObjType),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isPC),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isNPC),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isMob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,injectActionPacket),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMobFlags),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasTrait),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isTrickAttackAvailable),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setDelay),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,castSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,useMobAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,actionQueueEmpty),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,actionQueueAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,SetAutoAttackEnabled),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,SetMagicCastingEnabled),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,SetMobAbilityEnabled),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,SetMobSkillAttack),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateTarget),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getLocalVar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setLocalVar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetLocalVars),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setSpellList),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasValidJugPetItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTarget),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setBattleSubTarget),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasTPMoves),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaster),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,recalculateAbilitiesTable),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,recalculateSkillsTable),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isSpellAoE),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBaseHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBaseMP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkNameFlags),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getGMLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setGMLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getGMHidden),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setGMHidden),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,PrintToPlayer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBaseMP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,pathThrough),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,atPoint),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,lookAt),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,clearPath),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isFollowingPath),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,wait),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,pathTo),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setSpawn),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setRespawnTime),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,unlockAttachment),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,disableLevelSync),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateHealth),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,initNpcAi),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isNM),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setUnkillable),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBattlefield),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,SendRevision),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNewPlayer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setNewPlayer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMentor),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMentor),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hideName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,untargetable),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hideHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,breathDmgTaken),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,magicDmgTaken),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,physicalDmgTaken),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,rangedDmgTaken),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,entityVisualPacket),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,entityAnimationPacket),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPartyLeader),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getParty),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAlliance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,messageText),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,instanceEntry),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getInstance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setInstance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,createInstance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEnmityList),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,spawn),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCurrentAction),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAllegiance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,stun),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,weaknessTrigger),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBehaviour),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setBehaviour),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,reloadParty),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getModelId),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setModelId),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setAggroFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,unsetAggroFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,instantiateMob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getActiveManeuvers),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,removeOldestManeuver),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,removeAllManeuvers),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addBurden),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setElevator),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,storeWithPorterMoogle),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRetrievableItemsForSlip),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,retrieveItemFromSlip),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getILvlMacc),
    {nullptr,nullptr}
};
