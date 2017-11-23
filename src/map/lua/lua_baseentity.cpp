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
#include "../packets/event_update_string.h"
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
#include "../utils/mobutils.h"
#include "../map.h"
#include "../alliance.h"
#include "../entities/mobentity.h"
#include "../entities/automatonentity.h"
#include "../mobskill.h"
#include "../entities/npcentity.h"
#include "../entities/petentity.h"
#include "../utils/petutils.h"
#include "../spell.h"
#include "../weapon_skill.h"
#include "../trade_container.h"
#include "../utils/zoneutils.h"
#include "../entities/charentity.h"
#include "../status_effect_container.h"
#include "../item_container.h"
#include "../recast_container.h"
#include "../latent_effect_container.h"
#include "../instance.h"
#include "../enmity_container.h"
#include "../mob_spell_container.h"

#include "../ai/ai_container.h"
#include "../ai/controllers/mob_controller.h"
#include "../ai/states/weaponskill_state.h"
#include "../ai/states/respawn_state.h"
#include "../ai/states/inactive_state.h"
#include "../ai/states/item_state.h"
#include "../ai/states/death_state.h"
#include "../ai/states/raise_state.h"
#include "../ai/states/mobskill_state.h"
#include "../ai/states/attack_state.h"
#include "../ai/states/range_state.h"
#include "../ai/states/ability_state.h"
#include "../ai/states/magic_state.h"

#include "../transport.h"
#include "../treasure_pool.h"
#include "../mob_modifier.h"
#include "../message.h"

CLuaBaseEntity::CLuaBaseEntity(lua_State* L)
{
    if (!lua_isnil(L, 1))
    {
        m_PBaseEntity = (CBaseEntity*)lua_touserdata(L, 1);
        lua_pop(L, 1);
    }
    else
    {
        m_PBaseEntity = nullptr;
    }
}

//======================================================//

CLuaBaseEntity::CLuaBaseEntity(CBaseEntity* PEntity)
{
    m_PBaseEntity = PEntity;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::leavegame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->status = STATUS_SHUTDOWN;
    charutils::SendToZone((CCharEntity*)m_PBaseEntity, 1, 0);

    return 0;
}

inline std::int32_t CLuaBaseEntity::bringPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    bool found = false;

    if (!lua_isnil(L, 1) && lua_isstring(L, 1))
    {
        const char* fmtQuery = "SELECT charid FROM chars WHERE charname = '%s';";
        std::int32_t ret = Sql_Query(SqlHandle, fmtQuery, std::string(lua_tostring(L, 1)).c_str());
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            char buf[30];
            memset(&buf[0], 0, sizeof(buf));

            WBUFW(&buf, 0) = Sql_GetUIntData(SqlHandle, 0); // target char
            WBUFW(&buf, 4) = 0; // wanting to bring target char here so wont give our id
            WBUFW(&buf, 8) = m_PBaseEntity->getZone();
            WBUFW(&buf, 10) = (std::uint16_t)m_PBaseEntity->loc.p.x;
            WBUFW(&buf, 14) = (std::uint16_t)m_PBaseEntity->loc.p.y;
            WBUFW(&buf, 18) = (std::uint16_t)m_PBaseEntity->loc.p.z;
            WBUFB(&buf, 22) = m_PBaseEntity->loc.p.rotation;
            
            if (m_PBaseEntity->objtype == TYPE_PC)
                WBUFL(&buf, 23) = ((CCharEntity*)m_PBaseEntity)->m_moghouseID;

            message::send(MSG_SEND_TO_ZONE, &buf[0], sizeof(buf), nullptr);
            found = true;
        }
    }
    lua_pushboolean(L, found);
    return 1;
}

std::int32_t CLuaBaseEntity::gotoPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    bool found = false;
    if (!lua_isnil(L, 1) && lua_isstring(L, 1))
    {
        const char* fmtQuery = "SELECT charid FROM chars WHERE charname = '%s';";
        std::int32_t ret = Sql_Query(SqlHandle, fmtQuery, std::string(lua_tostring(L, 1)).c_str());

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            char buf[30];
            memset(&buf[0], 0, sizeof(buf));

            WBUFW(&buf, 0) = Sql_GetUIntData(SqlHandle, 0); // target char
            WBUFW(&buf, 4) = m_PBaseEntity->id; // warping to target char, their server will send us a zoning message with their pos
            
            message::send(MSG_SEND_TO_ZONE, &buf[0], sizeof(buf), nullptr);
            found = true;
        }
    }
    lua_pushboolean(L, found);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::ChangeMusic(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint8_t  BlockID = (std::uint32_t)lua_tointeger(L, 1);
    std::uint32_t MusicTrackID = (std::uint32_t)lua_tointeger(L, 2);

    PChar->pushPacket(new CChangeMusicPacket(BlockID, MusicTrackID));
    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::warp(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
    ((CCharEntity*)m_PBaseEntity)->m_moghouseID = 0;
    ((CCharEntity*)m_PBaseEntity)->loc.p = ((CCharEntity*)m_PBaseEntity)->profile.home_point.p;
    ((CCharEntity*)m_PBaseEntity)->loc.destination = ((CCharEntity*)m_PBaseEntity)->profile.home_point.destination;

    ((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
    ((CCharEntity*)m_PBaseEntity)->animation = ANIMATION_NONE;

    ((CCharEntity*)m_PBaseEntity)->clearPacketList();
    charutils::SendToZone((CCharEntity*)m_PBaseEntity, 2, zoneutils::GetZoneIPP(m_PBaseEntity->loc.destination));

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->health.hp);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getHPP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetHPP());
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::addHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    std::int32_t result = PBattle->addHP((std::int32_t)lua_tointeger(L, 1));

    // will always remove sleep effect
    PBattle->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP);
    PBattle->StatusEffectContainer->DelStatusEffect(EFFECT_SLEEP_II);
    PBattle->StatusEffectContainer->DelStatusEffect(EFFECT_LULLABY);

    lua_pushinteger(L, result);
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::restoreHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->animation != ANIMATION_DEATH)
    {
        std::int32_t result = ((CBattleEntity*)m_PBaseEntity)->addHP((std::int32_t)lua_tointeger(L, 1));

        lua_pushinteger(L, result);
        return 1;
    }
    lua_pushinteger(L, 0);
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::delHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->addHP((std::int32_t)(-lua_tointeger(L, 1)));

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::setHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->health.hp = 0;
    auto value = (std::int32_t)lua_tointeger(L, 1);
    ((CBattleEntity*)m_PBaseEntity)->addHP(value);
    m_PBaseEntity->updatemask |= UPDATE_HP;

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getPet(lua_State* L)
{
    if (((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        //std::uint32_t petid = (std::uint32_t);

        CBattleEntity* PPet = ((CBattleEntity*)m_PBaseEntity)->PPet;

        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PPet);
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    lua_pushnil(L);
    return 1;
}

inline std::int32_t CLuaBaseEntity::familiar(lua_State* L)
{
    if (((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        //std::uint32_t petid = (std::uint32_t);

        CBattleEntity* PPet = ((CBattleEntity*)m_PBaseEntity)->PPet;

        petutils::Familiar(PPet);
    }

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getPetID(lua_State* L)
{
    if (m_PBaseEntity != nullptr)
    {
        if (((CBattleEntity*)m_PBaseEntity)->PPet)
        {
            lua_pushinteger(L, ((CPetEntity*)(((CBattleEntity*)m_PBaseEntity)->PPet))->m_PetID);
            return 1;
        }
    }
    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::isJugPet(lua_State* L)
{
    if (m_PBaseEntity != nullptr)
    {
        if (((CBattleEntity*)m_PBaseEntity)->PPet)
        {
            lua_pushboolean(L, ((CPetEntity*)(((CBattleEntity*)m_PBaseEntity)->PPet))->getPetType() == PETTYPE_JUG_PET);
            return 1;
        }
    }
    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getCharmChance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr || m_PBaseEntity->objtype == TYPE_NPC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    auto PCharmer = static_cast<CBattleEntity*>(m_PBaseEntity);
    auto PTarget = static_cast<CBattleEntity*>(PLuaBaseEntity->GetBaseEntity());

    bool includeCharmAffinityAndChanceMods = true;
    if (!lua_isnil(L, 2) && lua_isboolean(L, 2))
        includeCharmAffinityAndChanceMods = lua_toboolean(L, 2);;

    float charmChance = battleutils::GetCharmChance(PCharmer, PTarget, includeCharmAffinityAndChanceMods);
    lua_pushnumber(L, charmChance);

    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->health.mp);
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::addMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::int32_t result = ((CBattleEntity*)m_PBaseEntity)->addMP((std::int32_t)lua_tointeger(L, 1));

    lua_pushinteger(L, result);
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::restoreMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->animation != ANIMATION_DEATH)
    {
        std::int32_t result = ((CBattleEntity*)m_PBaseEntity)->addMP((std::int32_t)lua_tointeger(L, 1));

        lua_pushinteger(L, result);
        return 1;
    }
    lua_pushinteger(L, 0);
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::delMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->addMP((std::int32_t)(-lua_tointeger(L, 1)));

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::setMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->health.mp = 0;
    std::int32_t value = (std::int32_t)(lua_tointeger(L, 1) - ((CBattleEntity*)m_PBaseEntity)->health.mp);
    ((CBattleEntity*)m_PBaseEntity)->addMP(value);

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushnumber(L, (float)((CBattleEntity*)m_PBaseEntity)->health.tp);
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::addTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->addTP((std::int16_t)lua_tointeger(L, 1));

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::delTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->addTP((std::int16_t)(-lua_tointeger(L, 1)));

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::setTP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::int16_t value = (std::int16_t)((lua_tointeger(L, 1)) - ((CBattleEntity*)m_PBaseEntity)->health.tp);
    ((CBattleEntity*)m_PBaseEntity)->addTP(value);

    return 0;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getMaxHP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetMaxHP());
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getMaxMP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetMaxMP());
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getXPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetXPos());
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getYPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetYPos());
    return 1;
}

//======================================================//

inline std::int32_t CLuaBaseEntity::getZPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetZPos());
    return 1;
}

inline std::int32_t CLuaBaseEntity::getRotPos(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushnumber(L, m_PBaseEntity->GetRotPos());
    return 1;
}

//======================================================//

//======================================================//

inline std::int32_t CLuaBaseEntity::getRace(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger(L, ((CCharEntity*)m_PBaseEntity)->look.race);
    return 1;
}

/************************************************************************
*                                                                       *
*  Мгновенное перемещение сущности                                      *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setPos(lua_State *L)
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

    if (lua_isnumber(L, 1))
    {

        if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
            m_PBaseEntity->loc.p.x = (float)lua_tonumber(L, 1);
        if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
            m_PBaseEntity->loc.p.y = (float)lua_tonumber(L, 2);
        if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
            m_PBaseEntity->loc.p.z = (float)lua_tonumber(L, 3);
        if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
            m_PBaseEntity->loc.p.rotation = (std::uint8_t)lua_tointeger(L, 4);
    }
    else
    {
        // its a table
        lua_rawgeti(L, 1, 1);
        m_PBaseEntity->loc.p.x = (float)lua_tonumber(L, -1);
        lua_pop(L, 1);

        lua_rawgeti(L, 1, 2);
        m_PBaseEntity->loc.p.y = (float)lua_tonumber(L, -1);
        lua_pop(L, 1);

        lua_rawgeti(L, 1, 3);
        m_PBaseEntity->loc.p.z = (float)lua_tonumber(L, -1);
        lua_pop(L, 1);

        lua_rawgeti(L, 1, 4);
        m_PBaseEntity->loc.p.rotation = (std::uint8_t)lua_tointeger(L, -1);
        lua_pop(L, 1);
    }

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
        {
            if ((std::uint16_t)lua_tointeger(L, 5) >= MAX_ZONEID)
                return 0;

            ((CCharEntity*)m_PBaseEntity)->loc.destination = (std::uint16_t)lua_tointeger(L, 5);
            ((CCharEntity*)m_PBaseEntity)->status = STATUS_DISAPPEAR;
            ((CCharEntity*)m_PBaseEntity)->loc.boundary = 0;
            ((CCharEntity*)m_PBaseEntity)->m_moghouseID = 0;
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

inline std::int32_t CLuaBaseEntity::teleport(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));

    lua_getfield(L, 1, "x");
    m_PBaseEntity->loc.p.x = (float)lua_tonumber(L, -1);
    lua_getfield(L, 1, "y");
    m_PBaseEntity->loc.p.y = (float)lua_tonumber(L, -1);
    lua_getfield(L, 1, "z");
    m_PBaseEntity->loc.p.z = (float)lua_tonumber(L, -1);

    if (lua_isnumber(L, 2))
        m_PBaseEntity->loc.p.rotation = (std::uint8_t)lua_tonumber(L, 2);
    else if (lua_isuserdata(L, 2))
    {
        CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
        m_PBaseEntity->loc.p.rotation = getangle(m_PBaseEntity->loc.p, PLuaBaseEntity->GetBaseEntity()->loc.p);
    }

    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CPositionPacket(m_PBaseEntity));
    m_PBaseEntity->updatemask |= UPDATE_POS;
    return 0;
}

inline std::int32_t CLuaBaseEntity::getPos(lua_State* L)
{
    lua_createtable(L, 4, 0);
    std::int8_t newTable = lua_gettop(L);

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

inline std::int32_t CLuaBaseEntity::getSpawnPos(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(!(m_PBaseEntity->objtype & TYPE_MOB));

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    lua_createtable(L, 4, 0);
    std::int8_t newTable = lua_gettop(L);

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

inline std::int32_t CLuaBaseEntity::addTreasure(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->PTreasurePool != nullptr)
    {
        if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
        {
            // The specified PEntity can be a Mob or NPC
            CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
            PChar->PTreasurePool->AddItem((std::uint16_t)lua_tointeger(L, 1), PEntity);
        }
        else // Entity can be nullptr - this is intentional
        {
            PChar->PTreasurePool->AddItem((std::uint16_t)lua_tointeger(L, 1), nullptr);
        }
    }

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool silence = false;
    std::uint16_t itemID = (std::uint16_t)lua_tointeger(L, 1);
    std::uint32_t quantity = 1;
    std::uint16_t augment0 = 0; std::uint8_t augment0val = 0;
    std::uint16_t augment1 = 0; std::uint8_t augment1val = 0;
    std::uint16_t augment2 = 0; std::uint8_t augment2val = 0;
    std::uint16_t augment3 = 0; std::uint8_t augment3val = 0;
    std::uint16_t trialNumber = 0;

    if (!lua_isnil(L, 2) && lua_isboolean(L, 2))
        silence = (std::uint32_t)lua_toboolean(L, 2);
    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        quantity = (std::uint32_t)lua_tointeger(L, 2);

    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        augment0 = (std::uint16_t)lua_tointeger(L, 3);
    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
        augment0val = (std::uint8_t)lua_tointeger(L, 4);
    if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
        augment1 = (std::uint16_t)lua_tointeger(L, 5);
    if (!lua_isnil(L, 6) && lua_isnumber(L, 6))
        augment1val = (std::uint8_t)lua_tointeger(L, 6);
    if (!lua_isnil(L, 7) && lua_isnumber(L, 7))
        augment2 = (std::uint16_t)lua_tointeger(L, 7);
    if (!lua_isnil(L, 8) && lua_isnumber(L, 8))
        augment2val = (std::uint8_t)lua_tointeger(L, 8);
    if (!lua_isnil(L, 9) && lua_isnumber(L, 9))
        augment3 = (std::uint16_t)lua_tointeger(L, 9);
    if (!lua_isnil(L, 10) && lua_isnumber(L, 10))
        augment3val = (std::uint8_t)lua_tointeger(L, 10);

    if (!lua_isnil(L, 11) && lua_isnumber(L, 11))
        trialNumber = (std::uint16_t)lua_tointeger(L, 11);

    std::uint8_t SlotID = ERROR_SLOTID;

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
    lua_pushboolean(L, (SlotID != ERROR_SLOTID));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addUsedItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t itemID = (std::uint16_t)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t SlotID = ERROR_SLOTID;

    if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0)
    {
        CItem* PItem = itemutils::GetItem(itemID);

        if (PItem != nullptr)
        {
            if (PItem->isSubType(ITEM_CHARGED))
            {
                // Add charged item with use timer already on full cooldown
                auto PUsable = static_cast<CItemUsable*>(PItem);
                PUsable->setQuantity(1);
                PUsable->setLastUseTime(CVanaTime::getInstance()->getVanaTime());
                SlotID = charutils::AddItem(PChar, LOC_INVENTORY, PUsable, false);
            }
            else
            {
                ShowWarning(CL_YELLOW"addUsedItem: tried to setLastUseTime but itemID <%i> is not type ITEM_CHARGED\n" CL_RESET, itemID);
            }
        }
        else
        {
            ShowWarning(CL_YELLOW"charplugin::AddItem: Item <%i> is not found in a database\n" CL_RESET, itemID);
        }
    }
    lua_pushboolean(L, (SlotID != ERROR_SLOTID));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addTempItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t itemID = (std::uint16_t)lua_tointeger(L, 1);
    std::uint32_t quantity = 1;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        quantity = (std::uint32_t)lua_tointeger(L, 2);

    std::uint8_t SlotID = ERROR_SLOTID;

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


std::int32_t CLuaBaseEntity::delItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    auto quantity = 0;
    auto location = 0;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        quantity = (std::uint32_t)lua_tointeger(L, 2);
    }

    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
    {
        if ((std::uint32_t)lua_tointeger(L, 3) < MAX_CONTAINER_ID)
        {
            location = (std::uint32_t)lua_tointeger(L, 3);
        }
        else
        {
            ShowWarning(CL_YELLOW"Lua::delItem: Attempting to delete an item from an invalid slot. Defaulting to main inventory.\n" CL_RESET);
        }
    }

    auto PChar = static_cast<CCharEntity*>(m_PBaseEntity);
    auto SlotID = PChar->getStorage(location)->SearchItem((std::uint16_t)lua_tointeger(L, 1));
    if (SlotID != ERROR_SLOTID)
    {
        charutils::UpdateItem(PChar, location, SlotID, -quantity);
        lua_pushboolean(L, true);
        PChar->pushPacket(new CInventoryFinishPacket());
        return 1;
    }
    lua_pushboolean(L, false);
    return 1;
}

inline std::int32_t CLuaBaseEntity::resetPlayer(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));

    const char* charName = lua_tostring(L, 1);
    std::uint32_t id = 0;


    // char will not be logged in so get the id manually
    const char* Query = "SELECT charid FROM chars WHERE charname = '%s';";
    std::int32_t ret = Sql_Query(SqlHandle, Query, charName);

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        id = (std::int32_t)Sql_GetIntData(SqlHandle, 0);


    // could not get player from database
    if (id == 0)
    {
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
        "boundary = %u,"
        "moghouse = %u "
        "WHERE charid = %u;";

    Sql_Query(SqlHandle, Query,
        245,        // lower jeuno
        122,        // prev zone
        86,         // rotation
        33.464f,    // x
        -5.000f,    // y
        69.162f,    // z
        0,          //boundary,
        0,          //moghouse,
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

inline std::int32_t CLuaBaseEntity::wakeUp(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::hasItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t ItemID = (std::uint16_t)lua_tointeger(L, 1);

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        std::uint8_t  locationID = LOC_INVENTORY;

        locationID = (std::uint8_t)lua_tointeger(L, 2);
        locationID = (locationID < MAX_CONTAINER_ID ? locationID : LOC_INVENTORY);

        lua_pushboolean(L, PChar->getStorage(locationID)->SearchItem(ItemID) != ERROR_SLOTID);
        return 1;
    }
    lua_pushboolean(L, charutils::HasItem(PChar, ItemID));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getFreeSlotsCount(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    std::uint8_t  locationID = LOC_INVENTORY;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        locationID = (std::uint8_t)lua_tointeger(L, 1);
        locationID = (locationID < MAX_CONTAINER_ID ? locationID : LOC_INVENTORY);
    }

    std::uint8_t FreeSlots = ((CCharEntity*)m_PBaseEntity)->getStorage(locationID)->GetFreeSlotsCount();

    lua_pushinteger(L, FreeSlots);
    return 1;
}

/************************************************************************
*  player:createWornItem(item)                                          *
*  Item cannot be used a second time                                    *
*  For BCNM Item and Testimony (Maat battle)                            *
************************************************************************/

inline std::int32_t CLuaBaseEntity::createWornItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem((std::uint16_t)lua_tointeger(L, 1));

    if (slotID != -1)
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);
        PItem->m_extra[0] = 1;

        char extra[sizeof(PItem->m_extra) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, extra, (const char*)PItem->m_extra, sizeof(PItem->m_extra));

        const char* Query =
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

inline std::int32_t CLuaBaseEntity::hasWornItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem((std::uint16_t)lua_tointeger(L, 1));

    if (slotID != ERROR_SLOTID)
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

inline std::int32_t CLuaBaseEntity::getStorageItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    auto container = (std::uint8_t)lua_tointeger(L, 1); // LOC_INVENTORY etc
    auto slotID = (std::uint8_t)lua_tointeger(L, 2);   // slot in container
    auto equipID = (std::uint8_t)(!lua_isnil(L, 3) ? lua_tointeger(L, 3) : 255); // SLOT_MAIN etc

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

inline std::int32_t CLuaBaseEntity::getZone(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::getZoneID(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::getZoneName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->loc.zone == nullptr);

    lua_pushstring(L, (const char*)m_PBaseEntity->loc.zone->GetName());
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::isInMogHouse(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushboolean(L, ((CCharEntity*)m_PBaseEntity)->m_moghouseID);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getCurrentRegion(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, zoneutils::GetCurrentRegion(m_PBaseEntity->getZone()));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getPreviousZone(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->loc.prevzone);
    return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем континент, на котором находится сущность                      *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getContinentID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->loc.zone->GetContinentID());
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, посещалась ли указанная зона персонажем ранее             *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::isZoneVisited(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushboolean(L, hasBit((std::uint16_t)lua_tointeger(L, 1), PChar->m_ZonesList, sizeof(PChar->m_ZonesList)));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/
inline std::int32_t CLuaBaseEntity::getWeather(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    WEATHER weather = WEATHER_NONE;
    if (m_PBaseEntity->objtype & TYPE_PC || m_PBaseEntity->objtype & TYPE_MOB)
        weather = battleutils::GetWeather((CBattleEntity*)m_PBaseEntity, false);
    else
        weather = zoneutils::GetZone(m_PBaseEntity->getZone())->GetWeather();

    lua_pushinteger(L, weather);

    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setWeather(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t weather = (std::uint8_t)lua_tointeger(L, 1);

    if (weather < MAX_WEATHER_ID)
    {
        zoneutils::GetZone(m_PBaseEntity->getZone())->SetWeather((WEATHER)weather);
        luautils::OnZoneWeatherChange(m_PBaseEntity->getZone(), weather);
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getNation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger(L, ((CCharEntity*)m_PBaseEntity)->profile.nation);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setNation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.nation = (std::uint8_t)lua_tointeger(L, 1);
    charutils::SaveCharNation(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getCampaignAllegiance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger(L, ((CCharEntity*)m_PBaseEntity)->profile.campaign_allegiance);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setCampaignAllegiance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.campaign_allegiance = (std::uint8_t)lua_tointeger(L, 1);
    charutils::SaveCampaignAllegiance(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger(L, ((CCharEntity*)m_PBaseEntity)->profile.rankpoints);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.rankpoints = (std::int32_t)lua_tointeger(L, 1);
    charutils::SaveMissionsList(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addRankPoints(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.rankpoints += (std::int32_t)lua_tointeger(L, 1);;
    charutils::SaveMissionsList(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity * PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, PChar->profile.rank[PChar->profile.nation]);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.rank[PChar->profile.nation] = (std::int32_t)lua_tointeger(L, 1);;
    charutils::SaveMissionsList(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "quest_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t questLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t questID = (std::uint8_t)lua_tointeger(L, 2);

    if (questLogID < MAX_QUESTAREA && questID < MAX_QUESTID)
    {
        std::uint8_t current = PChar->m_questLog[questLogID].current[questID / 8] & (1 << (questID % 8));
        std::uint8_t complete = PChar->m_questLog[questLogID].complete[questID / 8] & (1 << (questID % 8));

        if ((current == 0) && (complete == 0))
        {
            PChar->m_questLog[questLogID].current[questID / 8] |= (1 << (questID % 8));
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, questLogID, LOG_QUEST_CURRENT));

            charutils::SaveQuestsList(PChar);
        }
    }
    else
    {
        ShowError(CL_RED"Lua::addQuest: questLogID %i or QuestID %i is invalid\n" CL_RESET, questLogID, questID);
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "quest_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t questLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t questID = (std::uint8_t)lua_tointeger(L, 2);

    if (questLogID < MAX_QUESTAREA && questID < MAX_QUESTID)
    {
        std::uint8_t current = PChar->m_questLog[questLogID].current[questID / 8] & (1 << (questID % 8));
        std::uint8_t complete = PChar->m_questLog[questLogID].complete[questID / 8] & (1 << (questID % 8));

        if ((current != 0) || (complete != 0))
        {
            PChar->m_questLog[questLogID].current[questID / 8] &= ~(1 << (questID % 8));
            PChar->m_questLog[questLogID].complete[questID / 8] &= ~(1 << (questID % 8));

            PChar->pushPacket(new CQuestMissionLogPacket(PChar, questLogID, LOG_QUEST_CURRENT));
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, questLogID, LOG_QUEST_COMPLETE));

            charutils::SaveQuestsList(PChar);
        }
    }
    else
    {
        ShowError(CL_RED"Lua::delQuest: questLogID %i or QuestID %i is invalid\n" CL_RESET, questLogID, questID);
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getQuestStatus(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "quest_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t questLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t questID = (std::uint8_t)lua_tointeger(L, 2);

    if (questLogID < MAX_QUESTAREA && questID < MAX_QUESTID)
    {
        std::uint8_t current = ((CCharEntity*)m_PBaseEntity)->m_questLog[questLogID].current[questID / 8] & (1 << (questID % 8));
        std::uint8_t complete = ((CCharEntity*)m_PBaseEntity)->m_questLog[questLogID].complete[questID / 8] & (1 << (questID % 8));

        lua_pushinteger(L, (complete != 0 ? 2 : (current != 0 ? 1 : 0)));
        return 1;
    }
    else
    {
        ShowError(CL_RED"Lua::getQuestStatus: questLogID %i or QuestID %i is invalid\n" CL_RESET, questLogID, questID);
    }
    lua_pushnil(L);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::completeQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "quest_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t questLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t questID = (std::uint8_t)lua_tointeger(L, 2);

    if (questLogID < MAX_QUESTAREA && questID < MAX_QUESTID)
    {
        std::uint8_t complete = PChar->m_questLog[questLogID].complete[questID / 8] & (1 << (questID % 8));

        if (complete == 0)
        {
            PChar->m_questLog[questLogID].current[questID / 8] &= ~(1 << (questID % 8));
            PChar->m_questLog[questLogID].complete[questID / 8] |= (1 << (questID % 8));

            PChar->pushPacket(new CQuestMissionLogPacket(PChar, questLogID, LOG_QUEST_CURRENT));
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, questLogID, LOG_QUEST_COMPLETE));
        }
        charutils::SaveQuestsList(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::completeQuest: questLogID %i or QuestID %i is invalid\n" CL_RESET, questLogID, questID);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем, завершил ли персонаж задачу (quest)                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::hasCompleteQuest(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "quest_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t questLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t questID = (std::uint8_t)lua_tointeger(L, 2);

    if (questLogID < MAX_QUESTAREA && questID < MAX_QUESTID)
    {
        std::uint8_t complete = ((CCharEntity*)m_PBaseEntity)->m_questLog[questLogID].complete[questID / 8] & (1 << (questID % 8));

        lua_pushboolean(L, (complete != 0));
        return 1;
    }
    ShowError(CL_RED"Lua::hasCompleteQuest: questLogID %i or QuestID %i is invalid\n" CL_RESET, questLogID, questID);
    lua_pushboolean(L, false);
    return 1;
}

/************************************************************************
*                                                                       *
*  Добавляем выбранную миссию                                           *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "mission_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t missionLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 2);

    if (missionLogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        if (PChar->m_missionLog[missionLogID].current != (missionLogID > 2 ? 0 : -1))
        {
            ShowWarning(CL_YELLOW"Lua::addMission: player has a current mission\n" CL_RESET, missionLogID);
        }
        PChar->m_missionLog[missionLogID].current = MissionID;
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, missionLogID, LOG_MISSION_CURRENT));

        charutils::SaveMissionsList(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::delMission: missionLogID %i or Mission %i is invalid\n" CL_RESET, missionLogID, MissionID);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Удаляем выбранную миссию                                             *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::delMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "mission_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t missionLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 2);

    if (missionLogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        auto current = (std::uint8_t)PChar->m_missionLog[missionLogID].current;
        bool complete = (missionLogID == MISSION_COP || MissionID >= 64) ? false : PChar->m_missionLog[missionLogID].complete[MissionID];

        if (current == MissionID)
        {
            PChar->m_missionLog[missionLogID].current = missionLogID > 2 ? 0 : -1;
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, missionLogID, LOG_MISSION_CURRENT));
        }
        if (complete)
        {
            PChar->m_missionLog[missionLogID].complete[MissionID] = false;
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, missionLogID, LOG_MISSION_COMPLETE));
        }
        charutils::SaveMissionsList(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::delMission: missionLogID %i or Mission %i is invalid\n" CL_RESET, missionLogID, MissionID);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем, завершил ли персонаж выбранную миссию                     *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::hasCompletedMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "mission_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t missionLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 2);

    bool complete = false;

    if (missionLogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        complete = (missionLogID == MISSION_COP || MissionID >= 64) ? MissionID < ((CCharEntity*)m_PBaseEntity)->m_missionLog[missionLogID].current :
            ((CCharEntity*)m_PBaseEntity)->m_missionLog[missionLogID].complete[MissionID];
    }
    else
    {
        ShowError(CL_RED"Lua::hasCompletedMission: missionLogID %i or Mission %i is invalid\n" CL_RESET, missionLogID, MissionID);
    }
    lua_pushboolean(L, complete);
    return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем текущую миссию                                                *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getCurrentMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "mission_log");
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    std::uint8_t missionLogID = (std::uint8_t)lua_tointeger(L, -1);
    std::uint8_t MissionID = 0;

    if (missionLogID < MAX_MISSIONAREA)
    {
        MissionID = (std::uint8_t)((CCharEntity*)m_PBaseEntity)->m_missionLog[missionLogID].current;
    }
    else
    {
        ShowError(CL_RED"Lua::getCurrentMission: missionLogID %i is invalid\n" CL_RESET, missionLogID);
    }
    lua_pushinteger(L, MissionID);
    return 1;
}

/************************************************************************
*                                                                       *
*  Завершаем выбранную миссию                                           *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::completeMission(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "mission_log");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t missionLogID = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 2);

    if (missionLogID < MAX_MISSIONAREA && MissionID < MAX_MISSIONID)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        if (PChar->m_missionLog[missionLogID].current != MissionID)
        {
            ShowWarning(CL_YELLOW"Lua::completeMission: can't complete non current mission\n" CL_RESET, missionLogID);
        }
        else
        {
            PChar->m_missionLog[missionLogID].current = missionLogID > 2 ? 0 : -1;
            if ((missionLogID != MISSION_COP) && (MissionID < 64))
            {
                PChar->m_missionLog[missionLogID].complete[MissionID] = true;
                PChar->pushPacket(new CQuestMissionLogPacket(PChar, missionLogID, LOG_MISSION_COMPLETE));
            }
            PChar->pushPacket(new CQuestMissionLogPacket(PChar, missionLogID, LOG_MISSION_CURRENT));

            charutils::SaveMissionsList(PChar);
        }
    }
    else
    {
        ShowError(CL_RED"Lua::completeMission: missionLogID %i or Mission %i is invalid\n" CL_RESET, missionLogID, MissionID);
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::addAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->m_assaultLog.current != 0)
    {
        ShowWarning(CL_YELLOW"Lua::addAssault: player has a current assault\n" CL_RESET);
    }
    PChar->m_assaultLog.current = MissionID;
    PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, LOG_MISSION_CURRENT));

    charutils::SaveMissionsList(PChar);

    return 0;
}

inline std::int32_t CLuaBaseEntity::delAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    auto current = (std::uint8_t)PChar->m_assaultLog.current;

    if (current == MissionID)
    {
        PChar->m_assaultLog.current = 0;
        PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, LOG_MISSION_CURRENT));
    }
    charutils::SaveMissionsList(PChar);

    return 0;
}

inline std::int32_t CLuaBaseEntity::hasCompletedAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 1);

    bool complete = ((CCharEntity*)m_PBaseEntity)->m_assaultLog.complete[MissionID];

    lua_pushboolean(L, complete);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getCurrentAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    std::uint8_t MissionID = (std::uint8_t)((CCharEntity*)m_PBaseEntity)->m_assaultLog.current;

    lua_pushinteger(L, MissionID);
    return 1;
}

inline std::int32_t CLuaBaseEntity::completeAssault(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t MissionID = (std::uint8_t)lua_tointeger(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->m_assaultLog.current != MissionID)
    {
        ShowWarning(CL_YELLOW"Lua::completeAssault: completion of not current assault\n" CL_RESET);
    }
    PChar->m_assaultLog.current = 0;
    PChar->m_assaultLog.complete[MissionID] = true;
    PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, LOG_MISSION_CURRENT));
    PChar->pushPacket(new CQuestMissionLogPacket(PChar, MISSION_ASSAULT, LOG_MISSION_COMPLETE));

    charutils::SaveMissionsList(PChar);

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t KeyItemID = (std::uint16_t)lua_tointeger(L, 1);

    charutils::addKeyItem(PChar, KeyItemID);
    PChar->pushPacket(new CKeyItemsPacket(PChar, (KEYS_TABLE)(KeyItemID >> 9)));

    charutils::SaveKeyItems(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t KeyItemID = (std::uint16_t)lua_tointeger(L, 1);

    charutils::delKeyItem(PChar, KeyItemID);
    PChar->pushPacket(new CKeyItemsPacket(PChar, (KEYS_TABLE)(KeyItemID >> 9)));

    charutils::SaveKeyItems(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::hasKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t KeyItemID = (std::uint16_t)lua_tointeger(L, 1);

    lua_pushboolean(L, (charutils::hasKeyItem((CCharEntity*)m_PBaseEntity, KeyItemID) != 0));
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем, было ли описание ключевого предмета прочитано             *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::seenKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t KeyItemID = (std::uint16_t)lua_tointeger(L, 1);

    lua_pushboolean(L, (charutils::seenKeyItem((CCharEntity*)m_PBaseEntity, KeyItemID) != 0));
    return 1;
}

/************************************************************************
*                                                                       *
*  Should remove the key item from the seen list                        *
*                                                                       *
************************************************************************/


inline std::int32_t CLuaBaseEntity::unseenKeyItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t KeyItemID = (std::uint16_t)lua_tointeger(L, 1);

    charutils::unseenKeyItem(PChar, KeyItemID);
    PChar->pushPacket(new CKeyItemsPacket(PChar, (KEYS_TABLE)(KeyItemID >> 9)));

    charutils::SaveKeyItems(PChar);
    return 0;
}

/************************************************************************
*                                                                       *
*  получить текущий уровень мастерства                                  *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype & TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 1) >= MAX_SKILLTYPE);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetSkill((std::uint16_t)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::setSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 1) >= MAX_SKILLTYPE);

    auto SkillID = (std::uint8_t)lua_tointeger(L, 1);
    auto SkillAmount = (std::uint16_t)lua_tointeger(L, 2);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->RealSkills.skill[SkillID] = SkillAmount;
    PChar->WorkingSkills.skill[SkillID] = (SkillAmount / 10) * 0x20 + PChar->WorkingSkills.rank[SkillID];

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

inline std::int32_t CLuaBaseEntity::getMaxSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isnumber(L, -2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -3) || !lua_isnumber(L, -3));

    SKILLTYPE skill = (SKILLTYPE)lua_tointeger(L, -1);
    JOBTYPE job = (JOBTYPE)lua_tointeger(L, -2);
    auto level = (std::uint8_t)lua_tointeger(L, -3);

    lua_pushinteger(L, battleutils::GetMaxSkill(skill, job, level));
    return 1;
}

/************************************************************************
*                                                                       *
*  Get craft skill Rank player:getSkillRank(SKILLID)                    *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getSkillRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    std::uint8_t rankID = (std::uint8_t)lua_tointeger(L, 1);

    lua_pushinteger(L, PChar->RealSkills.rank[rankID]);
    return 1;
}

/************************************************************************
*                                                                       *
*  Set craft skill rank player:setSkillRank(SKILLID,newRank)            *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setSkillRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto skillID = (std::uint8_t)lua_tointeger(L, 1);
    auto newrank = (std::uint8_t)lua_tointeger(L, 2);

    PChar->WorkingSkills.rank[skillID] = newrank;
    PChar->WorkingSkills.skill[skillID] = (PChar->RealSkills.skill[skillID] / 10) * 0x20 + newrank;
    PChar->RealSkills.rank[skillID] = newrank;
    //PChar->RealSkills.skill[skillID] += 1;

    charutils::BuildingCharSkillsTable(PChar);
    charutils::SaveCharSkills(PChar, skillID);
    PChar->pushPacket(new CCharSkillsPacket(PChar));

    return 0;
}

/************************************************************************
*                                                                       *
*  Get craft char skill level player:getCharSkillLevel(SKILLID)         *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getCharSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype != TYPE_PC)
    {
        lua_pushinteger(L, 0);
    }
    else
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        std::uint8_t skillID = (std::uint8_t)lua_tointeger(L, 1);

        lua_pushinteger(L, PChar->RealSkills.skill[skillID]);
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  Returns the skill level of the equipped item in the associated slot  *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getWeaponSkillLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC && m_PBaseEntity->objtype != TYPE_PET && m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        std::uint8_t SLOT = (std::uint8_t)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::getStat(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    switch (static_cast<Mod>(lua_tointeger(L, 1)))
    {
        case Mod::STR:  lua_pushinteger(L, PEntity->STR()); break;
        case Mod::DEX:  lua_pushinteger(L, PEntity->DEX()); break;
        case Mod::VIT:  lua_pushinteger(L, PEntity->VIT()); break;
        case Mod::AGI:  lua_pushinteger(L, PEntity->AGI()); break;
        case Mod::INT:  lua_pushinteger(L, PEntity->INT()); break;
        case Mod::MND:  lua_pushinteger(L, PEntity->MND()); break;
        case Mod::CHR:  lua_pushinteger(L, PEntity->CHR()); break;
        case Mod::ATT:  lua_pushinteger(L, PEntity->ATT()); break;
        case Mod::DEF:  lua_pushinteger(L, PEntity->DEF()); break;
        default: lua_pushnil(L);
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Добавляем персонажу заклинание с отображением сообщения              *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    bool silent = false;
    bool save = true;

    std::int32_t n = lua_gettop(L);
    if (n > 1)
    {
        silent = lua_toboolean(L, 2);
        if (n > 2)
            save = lua_toboolean(L, 3);
    }


    std::uint16_t SpellID = (std::uint16_t)lua_tointeger(L, 1);

    if (charutils::addSpell(PChar, SpellID))
    {
        if (!silent)
        {
            PChar->pushPacket(new CCharSpellsPacket(PChar));
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 23));
        }

        if (save)
            charutils::SaveSpell(PChar, SpellID);
    }
    return 0;
}


/************************************************************************
*                                                                       *
*  Проверяем у персонажа наличие заклинания в списке заклинаний         *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::hasSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t SpellID = (std::uint16_t)lua_tointeger(L, 1);

    lua_pushboolean(L, (charutils::hasSpell((CCharEntity*)m_PBaseEntity, SpellID) != 0));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::canLearnSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint32_t Message = 0;
    std::uint16_t spellID = (std::uint16_t)lua_tointeger(L, 1);

    if (charutils::hasSpell((CCharEntity*)m_PBaseEntity, spellID))
    {
        Message = 96;
    }
    else if (!spell::CanUseSpell((CCharEntity*)m_PBaseEntity, static_cast<SpellID>(spellID)))
    {
        Message = 95;
    }
    lua_pushinteger(L, Message);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delSpell(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t SpellID = (std::uint16_t)lua_tointeger(L, 1);

    if (charutils::delSpell(PChar, SpellID))
    {
        charutils::DeleteSpell(PChar, SpellID);
        PChar->pushPacket(new CCharSpellsPacket(PChar));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Add learned ability (corsair roll)                                   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addLearnedAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t AbilityID = (std::uint16_t)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::hasLearnedAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t AbilityID = (std::uint16_t)lua_tointeger(L, 1);

    lua_pushboolean(L, (charutils::hasLearnedAbility((CCharEntity*)m_PBaseEntity, AbilityID) != 0));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::canLearnAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint32_t Message = 0;
    std::uint16_t AbilityID = (std::uint16_t)lua_tointeger(L, 1);

    if (charutils::hasLearnedAbility((CCharEntity*)m_PBaseEntity, AbilityID))
    {
        Message = 444;
    }
    else if (!ability::CanLearnAbility((CCharEntity*)m_PBaseEntity, AbilityID))
    {
        Message = 443;
    }
    lua_pushinteger(L, Message);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delLearnedAbility(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t AbilityID = (std::uint16_t)lua_tointeger(L, 1);

    if (charutils::delLearnedAbility(PChar, AbilityID))
    {
        charutils::SaveLearnedAbilities(PChar);
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::addLearnedWeaponskill(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    auto wsid = (std::uint8_t)lua_tointeger(L, 1);

    charutils::addLearnedWeaponskill(PChar, wsid);
    charutils::BuildingCharWeaponSkills(PChar);
    charutils::SaveLearnedAbilities(PChar);
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    return 0;
}

inline std::int32_t CLuaBaseEntity::hasLearnedWeaponskill(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto wsid = (std::uint8_t)lua_tointeger(L, 1);

    lua_pushboolean(L, (charutils::hasLearnedWeaponskill((CCharEntity*)m_PBaseEntity, wsid) != 0));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delLearnedWeaponskill(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    auto wsid = (std::uint8_t)lua_tointeger(L, 1);

    charutils::delLearnedWeaponskill(PChar, wsid);
    charutils::BuildingCharWeaponSkills(PChar);
    charutils::SaveLearnedAbilities(PChar);
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getMainJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetMJob());
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getMainLvl(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetMLevel());
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getSubJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetSJob());
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getSubLvl(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->GetSLevel());
    return 1;
}

/************************************************************************
*                                                                       *
*  Делаем доступной персонажу указанную профессию. 0 - subjob           *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::unlockJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    JOBTYPE JobID = (JOBTYPE)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::levelCap(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        std::uint8_t genkai = (std::uint8_t)lua_tointeger(L, 1);

        if (PChar->jobs.genkai != genkai)
        {
            PChar->jobs.genkai = (std::uint8_t)lua_tointeger(L, 1);

            Sql_Query(SqlHandle, "UPDATE char_jobs SET genkai = %u WHERE charid = %u LIMIT 1", PChar->jobs.genkai, PChar->id);
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

inline std::int32_t CLuaBaseEntity::levelRestriction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        PChar->m_LevelRestriction = (std::uint32_t)lua_tointeger(L, 1);

        std::uint8_t NewMLevel = 0;

        if (PChar->m_LevelRestriction != 0 &&
            PChar->m_LevelRestriction < PChar->jobs.job[PChar->GetMJob()])
        {
            NewMLevel = PChar->m_LevelRestriction;
        }
        else
        {
            NewMLevel = PChar->jobs.job[PChar->GetMJob()];
        }

        if (PChar->GetMLevel() != NewMLevel)
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
                PChar->updatemask |= UPDATE_HP;
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
    lua_pushinteger(L, PChar->m_LevelRestriction);
    return 1;
}

/************************************************************************
*                                                                       *
*  Restricts a player's subjob temporarily                              *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::sjRestriction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint8_t job = (std::uint8_t)lua_tonumber(L, 1);
    bool state = lua_toboolean(L, 2);

    if (state)
        PChar->SetSJob(JOB_NON);
    else if (!state && job != JOB_NON)
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

inline std::int32_t CLuaBaseEntity::release(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    RELEASE_TYPE releaseType = RELEASE_STANDARD;

    if (PChar->m_event.EventID != -1)
    {
        // Message: Event skipped
        releaseType = RELEASE_SKIPPING;
        PChar->pushPacket(new CMessageSystemPacket(0, 0, 117));
    }
    PChar->pushPacket(new CReleasePacket(PChar, releaseType));
    PChar->pushPacket(new CReleasePacket(PChar, RELEASE_EVENT));
    return 0;
}

/************************************************************************
*                                                                       *
*  Запускаем событие с указанными параметрами                           *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::startEvent(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::int32_t n = lua_gettop(L);

    if (n > 10)
    {
        ShowError("CLuaBaseEntity::startEvent: Could not start event, Lack of arguments.\n");
        lua_settop(L, -n);
        return 0;
    }
    if (m_PBaseEntity->animation == ANIMATION_HEALING)
    {
        ((CCharEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }

    std::uint16_t EventID = (std::uint16_t)lua_tointeger(L, 1);

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;
    std::uint32_t param2 = 0;
    std::uint32_t param3 = 0;
    std::uint32_t param4 = 0;
    std::uint32_t param5 = 0;
    std::uint32_t param6 = 0;
    std::uint32_t param7 = 0;
    std::int16_t textTable = -1;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        param0 = (std::uint32_t)lua_tointeger(L, 2);
    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        param1 = (std::uint32_t)lua_tointeger(L, 3);
    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
        param2 = (std::uint32_t)lua_tointeger(L, 4);
    if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
        param3 = (std::uint32_t)lua_tointeger(L, 5);
    if (!lua_isnil(L, 6) && lua_isnumber(L, 6))
        param4 = (std::uint32_t)lua_tointeger(L, 6);
    if (!lua_isnil(L, 7) && lua_isnumber(L, 7))
        param5 = (std::uint32_t)lua_tointeger(L, 7);
    if (!lua_isnil(L, 8) && lua_isnumber(L, 8))
        param6 = (std::uint32_t)lua_tointeger(L, 8);
    if (!lua_isnil(L, 9) && lua_isnumber(L, 9))
        param7 = (std::uint32_t)lua_tointeger(L, 9);
    if (!lua_isnil(L, 10) && lua_isnumber(L, 10))
        textTable = (std::int16_t)lua_tointeger(L, 10);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(
        new CEventPacket(
            (CCharEntity*)m_PBaseEntity,
            EventID,
            n - 1,
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
    if (!lua_isnil(L, 10) && lua_isnumber(L, 10))
    {
        ((CCharEntity*)m_PBaseEntity)->m_event.Option = (std::int32_t)lua_tointeger(L, 10);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Start event with string (0x33 packet)                                *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::startEventString(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->animation == ANIMATION_HEALING)
    {
        ((CCharEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }

    std::uint16_t EventID = (std::uint16_t)lua_tointeger(L, 1);

    string_t string0 = "";
    string_t string1 = "";
    string_t string2 = "";
    string_t string3 = "";

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;
    std::uint32_t param2 = 0;
    std::uint32_t param3 = 0;
    std::uint32_t param4 = 0;
    std::uint32_t param5 = 0;
    std::uint32_t param6 = 0;
    std::uint32_t param7 = 0;

    if (!lua_isnil(L, 2) && lua_isstring(L, 2))
        string0 = lua_tolstring(L, 2, nullptr);
    if (!lua_isnil(L, 3) && lua_isstring(L, 3))
        string1 = lua_tolstring(L, 3, nullptr);
    if (!lua_isnil(L, 4) && lua_isstring(L, 4))
        string2 = lua_tolstring(L, 4, nullptr);
    if (!lua_isnil(L, 5) && lua_isstring(L, 5))
        string3 = lua_tolstring(L, 5, nullptr);
    if (!lua_isnil(L, 6) && lua_isnumber(L, 6))
        param0 = (std::uint32_t)lua_tointeger(L, 6);
    if (!lua_isnil(L, 7) && lua_isnumber(L, 7))
        param1 = (std::uint32_t)lua_tointeger(L, 7);
    if (!lua_isnil(L, 8) && lua_isnumber(L, 8))
        param2 = (std::uint32_t)lua_tointeger(L, 8);
    if (!lua_isnil(L, 9) && lua_isnumber(L, 9))
        param3 = (std::uint32_t)lua_tointeger(L, 9);
    if (!lua_isnil(L, 10) && lua_isnumber(L, 10))
        param4 = (std::uint32_t)lua_tointeger(L, 10);
    if (!lua_isnil(L, 11) && lua_isnumber(L, 11))
        param5 = (std::uint32_t)lua_tointeger(L, 11);
    if (!lua_isnil(L, 12) && lua_isnumber(L, 12))
        param6 = (std::uint32_t)lua_tointeger(L, 12);
    if (!lua_isnil(L, 13) && lua_isnumber(L, 13))
        param7 = (std::uint32_t)lua_tointeger(L, 13);

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

inline std::int32_t CLuaBaseEntity::updateEvent(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    std::int32_t n = lua_gettop(L);

    if (n > 8)
    {
        ShowError("CLuaBaseEntity::updateEvent: Could not update event, Lack of arguments.\n");
        lua_settop(L, -n);
        return 0;
    }

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;
    std::uint32_t param2 = 0;
    std::uint32_t param3 = 0;
    std::uint32_t param4 = 0;
    std::uint32_t param5 = 0;
    std::uint32_t param6 = 0;
    std::uint32_t param7 = 0;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
        param0 = (std::uint32_t)lua_tointeger(L, 1);
    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        param1 = (std::uint32_t)lua_tointeger(L, 2);
    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        param2 = (std::uint32_t)lua_tointeger(L, 3);
    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
        param3 = (std::uint32_t)lua_tointeger(L, 4);
    if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
        param4 = (std::uint32_t)lua_tointeger(L, 5);
    if (!lua_isnil(L, 6) && lua_isnumber(L, 6))
        param5 = (std::uint32_t)lua_tointeger(L, 6);
    if (!lua_isnil(L, 7) && lua_isnumber(L, 7))
        param6 = (std::uint32_t)lua_tointeger(L, 7);
    if (!lua_isnil(L, 8) && lua_isnumber(L, 8))
        param7 = (std::uint32_t)lua_tointeger(L, 8);

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

inline std::int32_t CLuaBaseEntity::updateEventString(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    std::string string0 = "";
    std::string string1 = "";
    std::string string2 = "";
    std::string string3 = "";

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;
    std::uint32_t param2 = 0;
    std::uint32_t param3 = 0;
    std::uint32_t param4 = 0;
    std::uint32_t param5 = 0;
    std::uint32_t param6 = 0;
    std::uint32_t param7 = 0;
    std::uint32_t param8 = 0;

    if (!lua_isnil(L, 1) && lua_isstring(L, 1))
        string0 = std::string(lua_tostring(L, 1));
    if (!lua_isnil(L, 2) && lua_isstring(L, 2))
        string1 = std::string(lua_tostring(L, 2));
    if (!lua_isnil(L, 3) && lua_isstring(L, 3))
        string2 = std::string(lua_tostring(L, 3));
    if (!lua_isnil(L, 4) && lua_isstring(L, 4))
        string3 = std::string(lua_tostring(L, 4));


    if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
        param0 = (std::uint32_t)lua_tointeger(L, 5);
    if (!lua_isnil(L, 6) && lua_isnumber(L, 6))
        param1 = (std::uint32_t)lua_tointeger(L, 6);
    if (!lua_isnil(L, 7) && lua_isnumber(L, 7))
        param2 = (std::uint32_t)lua_tointeger(L, 7);
    if (!lua_isnil(L, 8) && lua_isnumber(L, 8))
        param3 = (std::uint32_t)lua_tointeger(L, 8);
    if (!lua_isnil(L, 9) && lua_isnumber(L, 9))
        param4 = (std::uint32_t)lua_tointeger(L, 9);
    if (!lua_isnil(L, 10) && lua_isnumber(L, 10))
        param5 = (std::uint32_t)lua_tointeger(L, 10);
    if (!lua_isnil(L, 11) && lua_isnumber(L, 11))
        param6 = (std::uint32_t)lua_tointeger(L, 11);
    if (!lua_isnil(L, 12) && lua_isnumber(L, 12))
        param7 = (std::uint32_t)lua_tointeger(L, 12);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(
        new CEventUpdateStringPacket(
            string0, string1, string2, string3,
            param0, param1, param2, param3, param4,
            param5, param6, param7, param8
        )
    );
    return 0;
}

/************************************************************************
*                                                                       *
*  Получаем указатель на персонажа, начавшего событие                   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getEventTarget(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (((CCharEntity*)m_PBaseEntity)->m_event.Target == nullptr)
    {
        ShowWarning(CL_YELLOW"EventTarget is empty: %s\n" CL_RESET, m_PBaseEntity->GetName());
    }
    lua_getglobal(L, CLuaBaseEntity::className);
    lua_pushstring(L, "new");
    lua_gettable(L, -2);
    lua_insert(L, -2);
    lua_pushlightuserdata(L, (void*)((CCharEntity*)m_PBaseEntity)->m_event.Target);
    lua_pcall(L, 2, 1, 0);
    return 1;
}

/************************************************************************
*                                                                       *
*  Opens the dialogue box to deliver items to players                   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::openSendBox(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::showText(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    // DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint16_t messageID = (std::uint16_t)lua_tointeger(L, 2);

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    if (PLuaBaseEntity != nullptr)
    {
        CBaseEntity* PBaseEntity = PLuaBaseEntity->GetBaseEntity();
        if (PBaseEntity->objtype == TYPE_NPC)
        {
            PBaseEntity->m_TargID = m_PBaseEntity->targid;
            PBaseEntity->loc.p.rotation = getangle(PBaseEntity->loc.p, m_PBaseEntity->loc.p);

            PBaseEntity->loc.zone->PushPacket(
                PBaseEntity,
                CHAR_INRANGE,
                new CEntityUpdatePacket(PBaseEntity, ENTITY_UPDATE, UPDATE_POS));
        }

        std::uint32_t param0 = 0;
        std::uint32_t param1 = 0;
        std::uint32_t param2 = 0;
        std::uint32_t param3 = 0;

        if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
            param0 = (std::uint32_t)lua_tointeger(L, 3);
        if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
            param1 = (std::uint32_t)lua_tointeger(L, 4);
        if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
            param2 = (std::uint32_t)lua_tointeger(L, 5);
        if (!lua_isnil(L, 6) && lua_isnumber(L, 6))
            param3 = (std::uint32_t)lua_tointeger(L, 6);

        if (m_PBaseEntity->objtype == TYPE_PC)
        {
            ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSpecialPacket(PBaseEntity, messageID, param0, param1, param2, param3));
        }
        else
        {
            m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CMessageSpecialPacket(PBaseEntity, messageID, param0, param1, param3));
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::sendMenu(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint32_t menu = (std::uint32_t)lua_tointeger(L, 1);

    switch (menu)
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

inline std::int32_t CLuaBaseEntity::sendGuild(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));

    std::uint16_t GuildID = (std::uint16_t)lua_tonumber(L, 1);
    std::uint8_t  open = (std::uint8_t)lua_tonumber(L, 2);
    std::uint8_t  close = (std::uint8_t)lua_tonumber(L, 3);
    std::uint8_t  holiday = (std::uint8_t)lua_tonumber(L, 4);

    DSP_DEBUG_BREAK_IF(open > close);

    std::uint8_t VanadielHour = (std::uint8_t)CVanaTime::getInstance()->getHour();
    std::uint8_t VanadielDay = (std::uint8_t)CVanaTime::getInstance()->getWeekday();

    GUILDSTATUS status = GUILD_OPEN;

    if (VanadielDay == holiday)
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
    if (status == GUILD_OPEN)
    {
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CGuildMenuBuyPacket((CCharEntity*)m_PBaseEntity, PGuildShop));
    }

    lua_pushboolean(L, status == GUILD_OPEN);
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns item ID and daily remaining points for a guild's GP daily    *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getCurrentGPItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto GuildID = (std::uint8_t)lua_tonumber(L, 1);

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

inline std::int32_t CLuaBaseEntity::addGuildPoints(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    auto GuildID = (std::uint8_t)lua_tonumber(L, 1);
    auto slotID = (std::uint8_t)lua_tonumber(L, 2);

    CGuild* PGuild = guildutils::GetGuild(GuildID);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::int16_t points = 0;
    std::uint8_t items = PGuild->addGuildPoints(PChar, PChar->TradeContainer->getItem(slotID), points);

    lua_pushinteger(L, items);
    lua_pushinteger(L, points);

    return 2;
}

/************************************************************************
*                                                                       *
*  Получаем временные переменные, необходимые для логики поисков        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getVar(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    const char* varname = lua_tostring(L, 1);

    lua_pushinteger(L, charutils::GetVar((CCharEntity*)m_PBaseEntity, varname));
    return 1;
}

/************************************************************************
*                                                                       *
*  Сохраняем временные переменные, необходимые для логики поисков       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setVar(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isstring(L, -2));

    const char* varname = lua_tostring(L, -2);
    std::int32_t value = (std::int32_t)lua_tointeger(L, -1);

    if (value == 0)
    {
        Sql_Query(SqlHandle, "DELETE FROM char_vars WHERE charid = %u AND varname = '%s' LIMIT 1;", m_PBaseEntity->id, varname);
        return 0;
    }

    const char* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = %i;";

    Sql_Query(SqlHandle, fmtQuery, m_PBaseEntity->id, varname, value, value);

    lua_pushnil(L);
    return 1;
}

/************************************************************************
*                                                                       *
*  Увеличиваем/уменьшаем значение временной переменной                  *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addVar(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isstring(L, -2));

    const char* varname = lua_tostring(L, -2);
    std::int32_t value = (std::int32_t)lua_tointeger(L, -1);

    const char* Query = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = value + %i;";

    Sql_Query(SqlHandle, Query,
        m_PBaseEntity->id,
        varname,
        value,
        value);

    return 0;
}

inline std::int32_t CLuaBaseEntity::setPetName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::int32_t n = lua_gettop(L);

    std::uint8_t petType = (std::uint8_t)lua_tointeger(L, 1);

    if (n == 2)
    {
        std::uint16_t value = (std::uint16_t)lua_tointeger(L, 2);

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
            std::uint32_t chocoboname1 = lua_tointeger(L, 2) & 0x0000FFFF;
            std::uint32_t chocoboname2 = (std::uint32_t)(lua_tointeger(L, 3) << 16);

            std::uint32_t value = chocoboname1 + chocoboname2;

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

inline std::int32_t CLuaBaseEntity::clearGearSetMods(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (std::uint8_t i = 0; i < PChar->m_GearSetMods.size(); ++i)
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

inline std::int32_t CLuaBaseEntity::addGearSetMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));

    GearSetMod_t gearSetMod;
    gearSetMod.modNameId = (std::uint8_t)lua_tonumber(L, 1);
    gearSetMod.modId = static_cast<Mod>(lua_tointeger(L, 2));
    gearSetMod.modValue = (std::uint16_t)lua_tonumber(L, 3);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (std::uint8_t i = 0; i < PChar->m_GearSetMods.size(); ++i)
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

inline std::int32_t CLuaBaseEntity::hasGearSetMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    auto modNameId = (std::uint8_t)lua_tonumber(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (std::uint8_t i = 0; i < PChar->m_GearSetMods.size(); ++i)
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


inline std::int32_t CLuaBaseEntity::getAutomatonName(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    const char* Query =
        "SELECT name FROM "
        "char_pet LEFT JOIN pet_name ON automatonid = id "
        "WHERE charid = %u;";

    std::int32_t ret = Sql_Query(SqlHandle, Query, m_PBaseEntity->id);

    if (ret != SQL_ERROR &&
        Sql_NumRows(SqlHandle) != 0 &&
        Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        lua_pushstring(L, (const char*)Sql_GetData(SqlHandle, 0));
        return 1;
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Set a single bit as part of a bitmask in a database variable         *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setMaskBit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isboolean(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isnumber(L, -2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -3) || !lua_isstring(L, -3));

    const char* varname = lua_tostring(L, -3);
    std::int32_t bit = (std::int32_t)lua_tointeger(L, -2);
    bool state = (lua_toboolean(L, -1) == 0 ? false : true);

    std::int32_t value = (std::int32_t)lua_tointeger(L, -4);

    if (state == true)
    {
        value |= (1 << bit); // добавляем
    }
    else
    {
        value &= ~(1 << bit); // удаляем
    }

    const char* fmtQuery = "INSERT INTO char_vars SET charid = %u, varname = '%s', value = %i ON DUPLICATE KEY UPDATE value = %i;";

    Sql_Query(SqlHandle, fmtQuery, m_PBaseEntity->id, varname, value, value);

    lua_pushinteger(L, value);
    return 1;
}

/************************************************************************
*                                                                       *
*  Get a single bit from a bitmask in a database variable               *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getMaskBit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isnumber(L, -2));

    std::uint8_t bit = (std::uint8_t)lua_tointeger(L, -1);

    DSP_DEBUG_BREAK_IF(bit >= 32);

    lua_pushboolean(L, (std::uint32_t)lua_tointeger(L, -2) & (1 << bit));
    return 1;
}

/************************************************************************
*                                                                       *
*  Counts the number of "true" bits in a bitmask from a variable        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::countMaskBits(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t  count = 0;
    std::uint32_t value = (std::uint32_t)lua_tointeger(L, 1);

    for (std::uint8_t bit = 0; bit < 32; bit++)
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

inline std::int32_t CLuaBaseEntity::isMaskFull(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isnumber(L, -2));

    bool condition = false;

    std::int32_t value = (std::int32_t)lua_tointeger(L, -2);
    std::int16_t size = (std::int16_t)lua_tointeger(L, -1);

    condition = (value == intpow32(2, size) - 1);

    lua_pushboolean(L, condition);
    return 1;
}


//==========================================================//

inline std::int32_t CLuaBaseEntity::setHomePoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->profile.home_point.p = PChar->loc.p;
    PChar->profile.home_point.destination = PChar->getZone();

    const char *fmtQuery = "UPDATE chars \
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

inline std::int32_t CLuaBaseEntity::tradeComplete(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (std::uint8_t slotID = 0; slotID < TRADE_CONTAINER_SIZE; ++slotID)
    {
        if (PChar->TradeContainer->getInvSlotID(slotID) != 0xFF)
        {
            std::uint8_t invSlotID = PChar->TradeContainer->getInvSlotID(slotID);
            std::int32_t quantity = PChar->TradeContainer->getQuantity(slotID);

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

inline std::int32_t CLuaBaseEntity::confirmTrade(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (std::uint8_t slotID = 0; slotID < TRADE_CONTAINER_SIZE; ++slotID)
    {
        if (PChar->TradeContainer->getInvSlotID(slotID) != 0xFF && PChar->TradeContainer->getConfirmedStatus(slotID))
        {
            std::uint8_t invSlotID = PChar->TradeContainer->getInvSlotID(slotID);
            auto quantity = (std::int32_t)std::max<std::uint32_t>(PChar->TradeContainer->getQuantity(slotID), PChar->TradeContainer->getConfirmedStatus(slotID));

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

inline std::int32_t CLuaBaseEntity::hasTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t TitleID = (std::uint16_t)lua_tointeger(L, 1);

    lua_pushboolean(L, (charutils::hasTitle((CCharEntity*)m_PBaseEntity, TitleID) != 0));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushinteger(L, ((CCharEntity*)m_PBaseEntity)->profile.title);
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t TitleID = (std::uint16_t)lua_tointeger(L, 1);

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

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t TitleID = (std::uint16_t)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::delTitle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t TitleID = (std::uint16_t)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::getGil(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

        if (item == nullptr) //Player has no money
        {
            lua_pushinteger(L, 0);
            return 1;
        }
        else if (!item->isType(ITEM_CURRENCY))
        {
            ShowFatalError(CL_RED"lua::getGil : Item in currency slot is not gil!\n" CL_RESET);
            return 0;
        }

        lua_pushinteger(L, item->getQuantity());
        return 1;
    }
    if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        CMobEntity * PMob = (CMobEntity*)m_PBaseEntity;
        if (PMob->CanStealGil())
        {
            lua_pushinteger(L, PMob->GetRandomGil());
            return 1;
        }
    }
    lua_pushinteger(L, 0);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addGil(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

    if (item == nullptr || !item->isType(ITEM_CURRENCY))
    {
        ShowFatalError(CL_RED"lua::addGil : No Gil in currency slot\n" CL_RESET);
        return 0;
    }

    std::int32_t gil = (std::int32_t)lua_tointeger(L, 1);

    charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
    return 0;
}

/************************************************************************
*                                                                       *
*  Отнимаем указанное количество gil у персонажа                        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::delGil(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool result = false;

    CItem* PItem = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

    if (PItem != nullptr && PItem->isType(ITEM_CURRENCY))
    {
        std::int32_t gil = (std::int32_t)lua_tointeger(L, 1);
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

inline std::int32_t CLuaBaseEntity::setGil(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CItem * item = ((CCharEntity*)m_PBaseEntity)->getStorage(LOC_INVENTORY)->GetItem(0);

    if (item == nullptr || !item->isType(ITEM_CURRENCY))
    {
        ShowFatalError(CL_RED"lua::setGil : No Gil in currency slot\n" CL_RESET);
        return 0;
    }

    std::int32_t gil = (std::int32_t)lua_tointeger(L, 1) - item->getQuantity();

    charutils::UpdateItem((CCharEntity*)m_PBaseEntity, LOC_INVENTORY, 0, gil);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::messageSpecial(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t messageID = (std::uint16_t)lua_tointeger(L, 1);

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;
    std::uint32_t param2 = 0;
    std::uint32_t param3 = 0;

    bool showName = 0;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        param0 = (std::uint32_t)lua_tointeger(L, 2);
    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        param1 = (std::uint32_t)lua_tointeger(L, 3);
    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
        param2 = (std::uint32_t)lua_tointeger(L, 4);
    if (!lua_isnil(L, 5) && lua_isnumber(L, 5))
        param3 = (std::uint32_t)lua_tointeger(L, 5);

    if (!lua_isnil(L, 6) && lua_isboolean(L, 6))
        showName = (lua_toboolean(L, 6) == 0 ? false : true);

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

inline std::int32_t CLuaBaseEntity::messageBasic(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t messageID = (std::uint16_t)lua_tointeger(L, 1);

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;
    auto PTarget = m_PBaseEntity;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        param0 = (std::uint32_t)lua_tointeger(L, 2);
    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        param1 = (std::uint32_t)lua_tointeger(L, 3);
    if (!lua_isnil(L, 4) && lua_isuserdata(L, 4))
        PTarget = Lunar<CLuaBaseEntity>::check(L, 4)->m_PBaseEntity;

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageBasicPacket(m_PBaseEntity, PTarget, param0, param1, messageID));
    }
    else
    {//broadcast in range
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CMessageBasicPacket(m_PBaseEntity, PTarget, param0, param1, messageID));
    }
    return 0;
}

/*
    Prodcast a message to public.
    Example:
        player:messagePublic(125, mob, 41, stolen);
*/
inline std::int32_t CLuaBaseEntity::messagePublic(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t messageID = (std::uint16_t)lua_tointeger(L, 1);

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 2);

    if (PEntity != nullptr)
    {
        if (!lua_isnil(L, 2) && lua_isnumber(L, 3))
            param0 = (std::uint32_t)lua_tointeger(L, 3);
        if (!lua_isnil(L, 3) && lua_isnumber(L, 4))
            param1 = (std::uint32_t)lua_tointeger(L, 4);

        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE_SELF, new CMessageBasicPacket(m_PBaseEntity, PEntity->GetBaseEntity(), param0, param1, messageID));
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::clearTargID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    m_PBaseEntity->m_TargID = 0;
    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_POS));
    return 0;
}

//========================================================//

inline std::int32_t CLuaBaseEntity::capSkill(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto skill = (std::uint8_t)lua_tointeger(L, 1);
    if (skill < MAX_SKILLTYPE)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        // CItemWeapon* PItem = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];
        /* let's just ignore this part for the moment
        //remove modifiers if valid
        if(skill>=1 && skill<=12 && PItem!=nullptr && PItem->getSkillType()==skill){
            PChar->delModifier(Mod::ATT, PChar->GetSkill(skill));
            PChar->delModifier(Mod::ACC, PChar->GetSkill(skill));
        }
        */
        std::uint16_t maxSkill = 10 * battleutils::GetMaxSkill((SKILLTYPE)skill, PChar->GetMJob(), PChar->GetMLevel());
        PChar->RealSkills.skill[skill] = maxSkill; //set to capped
        PChar->WorkingSkills.skill[skill] = maxSkill / 10;
        PChar->WorkingSkills.skill[skill] |= 0x8000; //set blue capped flag
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        charutils::CheckWeaponSkill(PChar, skill);
        /* and ignore this part
        //reapply modifiers if valid
        if(skill>=1 && skill<=12 && PItem!=nullptr && PItem->getSkillType()==skill){
            PChar->addModifier(Mod::ATT, PChar->GetSkill(skill));
            PChar->addModifier(Mod::ACC, PChar->GetSkill(skill));
        }
        */
        charutils::SaveCharSkills(PChar, skill); //save to db
    }
    return 0;
}


//========================================================//

inline std::int32_t CLuaBaseEntity::capAllSkills(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    for (std::uint8_t i = 1; i < 45; ++i)
    {
        const char* Query = "INSERT INTO char_skills "
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

        std::uint16_t maxSkill = 10 * battleutils::GetMaxSkill((SKILLTYPE)i, PChar->GetMJob(), PChar->GetMLevel());
        PChar->RealSkills.skill[i] = maxSkill; //set to capped
        PChar->WorkingSkills.skill[i] = maxSkill / 10;
        PChar->WorkingSkills.skill[i] |= 0x8000; //set blue capped flag
    }
    charutils::CheckWeaponSkill(PChar, SKILL_NON);
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    return 0;
}


//==========================================================//

inline std::int32_t CLuaBaseEntity::messageSystem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t messageID = (std::uint16_t)lua_tointeger(L, 1);

    std::uint32_t param0 = 0;
    std::uint32_t param1 = 0;

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        param0 = (std::uint32_t)lua_tointeger(L, 2);
    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        param1 = (std::uint32_t)lua_tointeger(L, 3);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageSystemPacket(param0, param1, messageID));
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::createShop(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->Container->Clean();
    ((CCharEntity*)m_PBaseEntity)->Container->setSize((std::uint8_t)lua_tointeger(L, 1) + 1);


    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        ((CCharEntity*)m_PBaseEntity)->Container->setType((std::uint8_t)lua_tointeger(L, 2));
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addShopItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -2) || !lua_isnumber(L, -2));

    std::uint16_t itemID = (std::uint16_t)lua_tonumber(L, -2);
    std::uint32_t price = (std::uint32_t)lua_tonumber(L, -1);

    std::uint8_t slotID = ((CCharEntity*)m_PBaseEntity)->Container->getItemsCount();

    ((CCharEntity*)m_PBaseEntity)->Container->setItem(slotID, itemID, 0, price);

    return 0;
}

/************************************************************************
*                                                                       *
*  Узнаем текущее значение известности персонажа                        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "fame_area");
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    std::uint8_t fameArea = (std::uint8_t)lua_tointeger(L, -1);

    if (fameArea <= 15)
    {
        std::uint16_t fame = 0;
        float fameMultiplier = map_config.fame_multiplier;
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        switch (fameArea)
        {
            case 0: // San d'Oria
            case 1: // Bastok
            case 2: // Windurst
                fame = (std::uint16_t)(PChar->profile.fame[fameArea] * fameMultiplier);
                break;
            case 3: // Jeuno
                fame = (std::uint16_t)(PChar->profile.fame[4] + ((PChar->profile.fame[0] + PChar->profile.fame[1] + PChar->profile.fame[2]) * fameMultiplier / 3));
                break;
            case 4: // Selbina / Rabao
                fame = (std::uint16_t)((PChar->profile.fame[0] + PChar->profile.fame[1]) * fameMultiplier / 2);
                break;
            case 5: // Norg
                fame = (std::uint16_t)(PChar->profile.fame[3] * fameMultiplier);
                break;
            // Abyssea
            case 6: // Konschtat
            case 7: // Tahrongi
            case 8: // La Theine
            case 9: // Misareaux
            case 10: // Vunkerl
            case 11: // Attohwa
            case 12: // Altepa
            case 13: // Grauberg
            case 14: // Uleguerand
                fame = (std::uint16_t)(PChar->profile.fame[fameArea-1] * fameMultiplier);
                break;
            case 15: // Adoulin
                fame = (std::uint16_t)(PChar->profile.fame[14] * fameMultiplier);
                break;
        }
        lua_pushinteger(L, fame);
    }
    else
    {
        ShowError(CL_RED"Lua::getFame: fameArea %i is invalid\n" CL_RESET, fameArea);
        lua_pushinteger(L, 0);
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Узнаем текущий уровень известности персонажа                         *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getFameLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "fame_area");
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    std::uint8_t fameArea = (std::uint8_t)lua_tointeger(L, -1);

    if (fameArea <= 15)
    {
        this->getFame(L);
        std::uint16_t fame = (std::uint16_t)lua_tointeger(L, -1);
        std::uint8_t  fameLevel = 1;

        if (fame >= 613)
            fameLevel = 9;
        else if (fame >= 550)
            fameLevel = 8;
        else if (fame >= 488)
            fameLevel = 7;
        else if (fame >= 425)
            fameLevel = 6;
        else if (fame >= 325)
            fameLevel = 5;
        else if (fame >= 225)
            fameLevel = 4;
        else if (fame >= 125)
            fameLevel = 3;
        else if (fame >= 50)
            fameLevel = 2;

        if ((fameArea >= 6) && (fameArea <= 14) && (fameLevel >= 6))
            fameLevel = 6; // Abyssea areas cap out at level 6 fame.

        lua_pushinteger(L, fameLevel);
    }
    else
    {
        ShowError(CL_RED"Lua::getFameLevel: fameArea %i is invalid\n" CL_RESET, fameArea);
        lua_pushinteger(L, 1);
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Устанавливаем известность персонажу                                  *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "fame_area");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t fameArea = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint16_t fame = (std::uint16_t)lua_tointeger(L, 2);

    if (fameArea <= 15)
    {
        switch (fameArea)
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
            // Abyssea
            case 6: // Konschtat
            case 7: // Tahrongi
            case 8: // La Theine
            case 9: // Misareaux
            case 10: // Vunkerl
            case 11: // Attohwa
            case 12: // Altepa
            case 13: // Grauberg
            case 14: // Uleguerand
                ((CCharEntity*)m_PBaseEntity)->profile.fame[fameArea-1] = fame;
                break;
            case 15: // Adoulin
                ((CCharEntity*)m_PBaseEntity)->profile.fame[14] = fame;
                break;
        }
        charutils::SaveFame((CCharEntity*)m_PBaseEntity);
    }
    else
    {
        ShowError(CL_RED"Lua::setFame: fameArea %i is invalid\n" CL_RESET, fameArea);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем известность персонажу                                      *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addFame(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || (!lua_isnumber(L, 1) && !lua_istable(L, 1)));
    if (lua_istable(L, 1))
    {
        lua_getfield(L, 1, "fame_area");
        DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));
    }
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t fameArea = (std::uint8_t)lua_tointeger(L, lua_isnumber(L, 1) ? 1 : -1);
    std::uint16_t fame = (std::uint16_t)lua_tointeger(L, 2);

    if (fameArea <= 15)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        switch (fameArea)
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
            // Abyssea
            case 6: // Konschtat
            case 7: // Tahrongi
            case 8: // La Theine
            case 9: // Misareaux
            case 10: // Vunkerl
            case 11: // Attohwa
            case 12: // Altepa
            case 13: // Grauberg
            case 14: // Uleguerand
                PChar->profile.fame[fameArea-1] += fame;
                break;
            case 15: // Adoulin
                PChar->profile.fame[14] += fame;
                break;
        }
        charutils::SaveFame(PChar);
    }
    else
    {
        ShowError(CL_RED"Lua::addFame: fameArea %i is invalid\n" CL_RESET, fameArea);
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->animation);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setAnimation(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t animation = (std::uint8_t)lua_tointeger(L, 1);

    if (m_PBaseEntity->animation != animation)
    {
        m_PBaseEntity->animation = animation;
        m_PBaseEntity->updatemask |= UPDATE_HP;
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Получаем/устанавливаем скорость передвижения сущности                *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::speed(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        auto speed = std::min<std::uint8_t>((std::uint8_t)lua_tointeger(L, 1), 255);

        if (m_PBaseEntity->speed != speed)
        {
            m_PBaseEntity->speed = speed;

            if (m_PBaseEntity->objtype == TYPE_PC)
            {
                ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
            }
            else
            {
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

inline std::int32_t CLuaBaseEntity::AnimationSub(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        std::uint8_t animationsub = (std::uint8_t)lua_tointeger(L, 1);

        if (m_PBaseEntity->animationsub != animationsub)
        {
            m_PBaseEntity->animationsub = animationsub;

            if (m_PBaseEntity->objtype == TYPE_PC)
            {
                ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharUpdatePacket((CCharEntity*)m_PBaseEntity));
            }
            else
            {
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

inline std::int32_t CLuaBaseEntity::costume(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        std::uint16_t costum = (std::uint16_t)lua_tointeger(L, 1);

        if (PChar->m_Costum != costum &&
            PChar->status != STATUS_SHUTDOWN &&
            PChar->status != STATUS_DISAPPEAR)
        {
            PChar->m_Costum = costum;
            PChar->updatemask |= UPDATE_HP;
        }
        return 0;
    }
    lua_pushinteger(L, PChar->m_Costum);
    return 1;
}

/************************************************************************
*                                                                       *
*  Set monstrosity costume                                              *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::costume2(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        std::uint16_t model = (std::uint16_t)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::canUseCostume(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::canUseChocobo(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::canUsePet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        auto PChar = static_cast<CCharEntity*>(m_PBaseEntity);

        lua_pushboolean(L, (PChar->loc.zone->CanUseMisc(MISC_PET) && !PChar->m_moghouseID));
    }
    else
    {
        lua_pushboolean(L, true);
    }
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setStatus(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PBaseEntity->status = (STATUSTYPE)lua_tointeger(L, 1);
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getStatus(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->status);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::sendTractor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->m_hasTractor == 0 && PChar->m_hasRaise == 0)
    {
        PChar->m_hasTractor = 1;

        PChar->m_StartActionPos.x = (float)lua_tonumber(L, 1);
        PChar->m_StartActionPos.y = (float)lua_tonumber(L, 2);
        PChar->m_StartActionPos.z = (float)lua_tonumber(L, 3);
        PChar->m_StartActionPos.rotation = (std::uint8_t)lua_tointeger(L, 4);

        PChar->pushPacket(new CRaiseTractorMenuPacket(PChar, TYPE_TRACTOR));
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Отправляем персонажу Raise меню                                      *
*                                                                       *
************************************************************************/
inline std::int32_t CLuaBaseEntity::sendReraise(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint8_t RaiseLevel = (std::uint8_t)lua_tonumber(L, 1);

    if (RaiseLevel == 0 || RaiseLevel > 3)
    {
        ShowDebug(CL_CYAN"lua::sendRaise raise value is not valide!\n" CL_RESET);
    }
    else if (PChar->m_hasRaise == 0)
    {
        PChar->m_hasRaise = RaiseLevel;
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::sendRaise(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint8_t RaiseLevel = (std::uint8_t)lua_tonumber(L, 1);

    if (RaiseLevel == 0 || RaiseLevel > 3)
    {
        ShowDebug(CL_CYAN"lua::sendRaise raise value is not valide!\n" CL_RESET);
    }
    else if (PChar->m_hasTractor == 0 && PChar->m_hasRaise == 0)
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

inline std::int32_t CLuaBaseEntity::addStatusEffect(lua_State *L)
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

        std::int32_t n = lua_gettop(L);

        CStatusEffect * PEffect = new CStatusEffect(
            (EFFECT)lua_tointeger(L, 1),
            (std::uint16_t)lua_tointeger(L, 1),
            (std::uint16_t)lua_tointeger(L, 2),
            (std::uint16_t)lua_tointeger(L, 3),
            (std::uint16_t)lua_tointeger(L, 4),
            (n >= 5 ? (std::uint16_t)lua_tointeger(L, 5) : 0),
            (n >= 6 ? (std::uint16_t)lua_tointeger(L, 6) : 0),
            (n >= 7 ? (std::uint16_t)lua_tointeger(L, 7) : 0));

        lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect));
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  Добавляем боевой сущности StatusEffect                               *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addStatusEffectEx(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 5) || !lua_isnumber(L, 5));

    std::int32_t n = lua_gettop(L);
    bool silent = false;
    if (lua_isboolean(L, -1))
    {
        silent = lua_toboolean(L, -1);
        n--;
    }

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L, 1),
        (std::uint16_t)lua_tointeger(L, 2),
        (std::uint16_t)lua_tointeger(L, 3),
        (std::uint16_t)lua_tointeger(L, 4),
        (std::uint16_t)lua_tointeger(L, 5),
        (n >= 6 ? (std::uint16_t)lua_tointeger(L, 6) : 0),
        (n >= 7 ? (std::uint16_t)lua_tointeger(L, 7) : 0),
        (n >= 8 ? (std::uint16_t)lua_tointeger(L, 8) : 0));

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->AddStatusEffect(PEffect, silent));
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets a party or alliance member relative to the player.              *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getPartyMember(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, -1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, -2));

    std::uint8_t member = (std::uint8_t)lua_tonumber(L, -1);
    std::uint8_t allianceparty = (std::uint8_t)lua_tonumber(L, -2);

    CBattleEntity* PTargetChar = nullptr;

    if (allianceparty == 0 && member == 0)
        PTargetChar = ((CBattleEntity*)m_PBaseEntity);
    else if (((CBattleEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        if (allianceparty == 0 && member <= ((CBattleEntity*)m_PBaseEntity)->PParty->members.size())
            PTargetChar = ((CBattleEntity*)m_PBaseEntity)->PParty->members[member];
        else if (((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance != nullptr && member <= ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.at(allianceparty)->members.size())
            PTargetChar = ((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.at(allianceparty)->members[member];
    }

    if (PTargetChar != nullptr)
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PTargetChar);
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    ShowError(CL_RED"Lua::getPartyMember :: Member or Alliance Number is not valid.\n" CL_RESET);
    lua_pushnil(L);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getPartySize(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t allianceparty = (std::uint8_t)lua_tonumber(L, 1);
    std::uint8_t partysize = 1;

    if (((CBattleEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        if (allianceparty == 0)
            partysize = (std::uint8_t)((CBattleEntity*)m_PBaseEntity)->PParty->members.size();
        else if (((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance != nullptr)
            partysize = (std::uint8_t)((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.at(allianceparty)->members.size();
    }

    lua_pushnumber(L, partysize);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getAllianceSize(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    std::uint8_t alliancesize = 1;

    if (((CBattleEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        if (((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance != nullptr)
            alliancesize = (std::uint8_t)((CBattleEntity*)m_PBaseEntity)->PParty->m_PAlliance->partyList.size();
    }
    lua_pushnumber(L, alliancesize);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addPartyEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));

    std::int32_t n = lua_gettop(L);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L, 1),
        (std::uint16_t)lua_tointeger(L, 2),
        (std::uint16_t)lua_tointeger(L, 3),
        (std::uint16_t)lua_tointeger(L, 4),
        (n >= 5 ? (std::uint16_t)lua_tointeger(L, 5) : 0),
        (n >= 6 ? (std::uint16_t)lua_tointeger(L, 6) : 0),
        (n >= 7 ? (std::uint16_t)lua_tointeger(L, 7) : 0));

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

inline std::int32_t CLuaBaseEntity::getStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CStatusEffect* PStatusEffect;

    if (lua_gettop(L) >= 2)
        PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetStatusEffect((EFFECT)lua_tointeger(L, 1), (std::uint16_t)lua_tointeger(L, 2));
    else
        PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetStatusEffect((EFFECT)lua_tointeger(L, 1));

    if (PStatusEffect == nullptr)
    {
        lua_pushnil(L);
    }
    else
    {
        lua_pop(L, 1);
        lua_getglobal(L, CLuaStatusEffect::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PStatusEffect);

        if (lua_pcall(L, 2, 1, 0))
        {
            return 0;
        }
    }
    return 1;
}

inline std::int32_t CLuaBaseEntity::getStatusEffects(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    int count = 0;
    lua_newtable(L);
    static_cast<CBattleEntity*>(m_PBaseEntity)->StatusEffectContainer->ForEachEffect([&](CStatusEffect* PEffect){
        lua_getglobal(L, CLuaStatusEffect::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PEffect);

        if (lua_pcall(L, 2, 1, 0))
        {
            return;
        }
        lua_rawseti(L, -2, ++count);
    });
    return 1;
}

/************************************************************************
*                                                                       *
*  Проверяем наличие статус-эффекта в контейнере                        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::hasStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool hasEffect = false;

    if (lua_gettop(L) >= 2)
    {
        hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffect(
            (EFFECT)lua_tointeger(L, 1),
            (std::uint16_t)lua_tointeger(L, 2));
    }
    else
    {
        hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffect(
            (EFFECT)lua_tointeger(L, 1));
    }
    lua_pushboolean(L, hasEffect);
    return 1;
}

/************************************************************************
*                                                                       *
*  Checks to see if a character has an effect with the specified flag   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::hasStatusEffectByFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasStatusEffectByFlag(
        (EFFECT)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::countEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t numEffects = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetEffectsCount((EFFECT)lua_tointeger(L, 1));

    lua_pushinteger(L, numEffects);
    return 1;
}

inline std::int32_t CLuaBaseEntity::hasBustEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool hasEffect = false;

    hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HasBustEffect(
        (EFFECT)lua_tointeger(L, 1));

    lua_pushboolean(L, hasEffect);
    return 1;
}

inline std::int32_t CLuaBaseEntity::numBustEffects(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint8_t numEffects = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetEffectsCount(EFFECT_BUST);

    lua_pushinteger(L, numEffects);
    return 1;
}

inline std::int32_t CLuaBaseEntity::canGainStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool hasEffect = false;

    hasEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->CanGainStatusEffect(
        (EFFECT)lua_tointeger(L, 1),
        (std::uint16_t)lua_tointeger(L, 2));

    lua_pushboolean(L, hasEffect);
    return 1;
}

/************************************************************************
*                                                                       *
*  Удаляем статус-эффект по его основному и дополнительному типам.      *
*  Возвращаем результат выполнения операции.                            *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::delStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    bool result = false;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        if (lua_gettop(L) >= 2)
        {
            /* Delete matching status effect with matching power */
            result = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect(
                (EFFECT)lua_tointeger(L, 1),
                (std::uint16_t)lua_tointeger(L, 2));
        }
        else
        {
            /* Delete matching status effect any power */
            result = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffect((EFFECT)lua_tointeger(L, 1));
        }
    }

    lua_pushboolean(L, result);
    return 1;
}

inline std::int32_t CLuaBaseEntity::delStatusEffectsByFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffectsByFlag((EFFECTFLAG)lua_tointeger(L, 1));

    return 1;
}

inline std::int32_t CLuaBaseEntity::delStatusEffectSilent(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    bool result = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DelStatusEffectSilent((EFFECT)lua_tointeger(L, 1));

    lua_pushboolean(L, result);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::removePartyEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);

    for (const auto& member : PChar->PParty->members)
    {
        if (member->loc.zone == PChar->loc.zone)
        {
            member->StatusEffectContainer->DelStatusEffect((EFFECT)lua_tointeger(L, 1));
        }
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::hasPartyEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);

    if (PChar->PParty != nullptr)
    {
        for (const auto& member : PChar->PParty->members)
        {
            if (member->loc.zone == PChar->loc.zone)
            {
                if (member->StatusEffectContainer->HasStatusEffect((EFFECT)lua_tointeger(L, 1)))
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

inline std::int32_t CLuaBaseEntity::addBardSong(lua_State *L)
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

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L, 2),
        (std::uint16_t)lua_tointeger(L, 2),
        (std::uint16_t)lua_tointeger(L, 3),
        (std::uint16_t)lua_tointeger(L, 4),
        (std::uint16_t)lua_tointeger(L, 5),
        (std::uint16_t)lua_tointeger(L, 6),
        (std::uint16_t)lua_tointeger(L, 7),
        (std::uint16_t)lua_tointeger(L, 8));
    std::uint8_t maxSongs = 2;
    if (PEntity && PEntity->m_PBaseEntity && PEntity->m_PBaseEntity->objtype == TYPE_PC)
    {
        CCharEntity* PCaster = (CCharEntity*)PEntity->m_PBaseEntity;
        CItemWeapon* PItem = (CItemWeapon*)PCaster->getEquip(SLOT_RANGED);
        if (PItem == nullptr || PItem->getID() == 65535 || !(PItem->getSkillType() == SKILL_STR || PItem->getSkillType() == SKILL_WND))
        {
            maxSongs = 1;
        }
        maxSongs += PCaster->getMod(Mod::MAXIMUM_SONGS_BONUS);
    }
    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->ApplyBardEffect(PEffect, maxSongs));
    return 1;
}

/************************************************************************
*                                                                       *
*  Adds corsair roll effect                                             *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addCorsairRoll(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 5) || !lua_isnumber(L, 5));

    std::int32_t n = lua_gettop(L);

    auto casterJob = lua_tointeger(L, 1);
    auto bustDuration = (std::uint8_t)lua_tointeger(L, 2);

    CStatusEffect * PEffect = new CStatusEffect(
        (EFFECT)lua_tointeger(L, 3),
        (std::uint16_t)lua_tointeger(L, 3),
        (std::uint16_t)lua_tointeger(L, 4),
        (std::uint16_t)lua_tointeger(L, 5),
        (std::uint16_t)lua_tointeger(L, 6),
        (n >= 7 ? (std::uint16_t)lua_tointeger(L, 7) : 0),
        (n >= 8 ? (std::uint16_t)lua_tointeger(L, 8) : 0),
        (n >= 9 ? (std::uint16_t)lua_tointeger(L, 9) : 0));
    std::uint8_t maxRolls = 2;
    if (casterJob != JOB_COR)
    {
        maxRolls = 1;
    }
    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->ApplyCorsairEffect(PEffect, maxRolls, bustDuration));
    return 1;
}

inline std::int32_t CLuaBaseEntity::doWildCard(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    battleutils::DoWildCardToEntity(static_cast<CCharEntity*>(m_PBaseEntity), static_cast<CCharEntity*>(PEntity->m_PBaseEntity), (std::uint8_t)lua_tointeger(L, 2));

    return 0;
}

inline std::int32_t CLuaBaseEntity::hasPartyJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto job = lua_tointeger(L, 1);

    if (((CCharEntity*)m_PBaseEntity)->PParty != nullptr)
    {
        for (std::uint32_t i = 0; i < ((CCharEntity*)m_PBaseEntity)->PParty->members.size(); i++)
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

inline std::int32_t CLuaBaseEntity::eraseStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->EraseStatusEffect());
    return 1;
}

inline std::int32_t CLuaBaseEntity::healingWaltz(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->HealingWaltz());
    return 1;
}
/************************************************************************
*                                                                       *
*                             *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::dispelAllStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint32_t flag;
    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        flag = (std::uint32_t)lua_tonumber(L, 1);
    }
    else
    {
        flag = EFFECTFLAG_DISPELABLE;
    }

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DispelAllStatusEffect((EFFECTFLAG)flag));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::eraseAllStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->EraseAllStatusEffect());
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getStatusEffectElement(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto statusId = (std::uint16_t)lua_tointeger(L, 1);

    lua_pushinteger(L, effects::GetEffectElement(statusId));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::stealStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CStatusEffect* PStatusEffect = ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->StealStatusEffect();

    if (PStatusEffect == nullptr)
        lua_pushnil(L);
    else
    {
        lua_getglobal(L, CLuaStatusEffect::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PStatusEffect);
        lua_pcall(L, 2, 1, 0);

        delete PStatusEffect;
    }
    return 1;
}

/************************************************************************
*                                                                       *
*  Удаляем первый положительный эффект                                  *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::dispelStatusEffect(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint32_t flag;
    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        flag = (std::uint32_t)lua_tonumber(L, 1);
    }
    else
    {
        flag = EFFECTFLAG_DISPELABLE;
    }

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->DispelStatusEffect((EFFECTFLAG)flag));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->addModifier(
        static_cast<Mod>(lua_tointeger(L, 1)),
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->getMod(static_cast<Mod>(lua_tointeger(L, 1))));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->delModifier(
        static_cast<Mod>(lua_tointeger(L, 1)),
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->setModifier(
        static_cast<Mod>(lua_tointeger(L, 1)),
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

inline std::int32_t CLuaBaseEntity::addPetMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->addPetModifier(
        static_cast<Mod>(lua_tointeger(L, 1)),
        PetModType::All,
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

inline std::int32_t CLuaBaseEntity::delPetMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->delPetModifier(
        static_cast<Mod>(lua_tointeger(L, 1)),
        PetModType::All,
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

inline std::int32_t CLuaBaseEntity::setPetMod(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CBattleEntity*)m_PBaseEntity)->setPetModifier(
        static_cast<Mod>(lua_tointeger(L, 1)),
        PetModType::All,
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

inline std::int32_t CLuaBaseEntity::getMobMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(!(m_PBaseEntity->objtype & TYPE_MOB));

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushinteger(L, ((CMobEntity*)m_PBaseEntity)->getMobMod((std::uint16_t)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::setMobMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    // putting this in here to find elusive bug
    if (!(m_PBaseEntity->objtype & TYPE_MOB))
    {
        // this once broke on an entity (17532673) but it could not be found
        ShowError("CLuaBaseEntity::setMobMod Expected type mob (%d) but its a (%d)\n", m_PBaseEntity->id, m_PBaseEntity->objtype);
        return 0;
    }

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CMobEntity*)m_PBaseEntity)->setMobMod(
        (std::uint16_t)lua_tointeger(L, 1),
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

inline std::int32_t CLuaBaseEntity::addMobMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    // putting this in here to find elusive bug
    if (!(m_PBaseEntity->objtype & TYPE_MOB))
    {
        // this once broke on an entity (17532673) but it could not be found
        ShowError("CLuaBaseEntity::addMobMod Expected type mob (%d) but its a (%d)\n", m_PBaseEntity->id, m_PBaseEntity->objtype);
        return 0;
    }

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CMobEntity*)m_PBaseEntity)->addMobMod(
        (std::uint16_t)lua_tointeger(L, 1),
        (std::int16_t)lua_tointeger(L, 2));
    return 0;
}

inline std::int32_t CLuaBaseEntity::delMobMod(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    // putting this in here to find elusive bug
    if (!(m_PBaseEntity->objtype & TYPE_MOB))
    {
        // this once broke on an entity (17532673) but it could not be found
        ShowError("CLuaBaseEntity::addMobMod Expected type mob (%d) but its a (%d)\n", m_PBaseEntity->id, m_PBaseEntity->objtype);
        return 0;
    }

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    ((CMobEntity*)m_PBaseEntity)->addMobMod(
        (std::uint16_t)lua_tointeger(L, 1),
        (std::int16_t)(-lua_tointeger(L, 2)));
    return 0;
}

/************************************************************************
*                                                                       *
*  Добавляем очки опыта персонажу                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addExp(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    charutils::AddExperiencePoints(false, (CCharEntity*)m_PBaseEntity, m_PBaseEntity, (std::uint32_t)lua_tointeger(L, 1), 0, false);
    return 0;
}

/************************************************************************
*                                                                       *
*  Remove character experience points                                   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::delExp(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::DelExperiencePoints(PChar, 0, std::clamp<std::uint16_t>((std::uint16_t)lua_tointeger(L, 1), 0, 65535));
    return 0;
}

/************************************************************************
*                                                                       *
*  Exposes the isJailed property to lua                                 *
*                                                                       *
************************************************************************/
inline std::int32_t CLuaBaseEntity::isJailed(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushboolean(L, (jailutils::InPrison((CCharEntity*)m_PBaseEntity)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::jail(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    jailutils::Add(static_cast<CCharEntity*>(m_PBaseEntity));
    return 0;
}

/************************************************************************
*                                                                       *
*  GM command @changeJOB !!! FOR DEBUG ONLY !!!                         *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::changeJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    JOBTYPE prevjob = PChar->GetMJob();

    PChar->resetPetZoningInfo();

    PChar->jobs.unlocked |= (1 << (std::uint8_t)lua_tointeger(L, 1));
    PChar->SetMJob((std::uint8_t)lua_tointeger(L, 1));

    if (lua_tointeger(L, 1) == JOB_BLU)
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
    PChar->PRecastContainer->ChangeJob();
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
    PChar->updatemask |= UPDATE_HP;

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

inline std::int32_t CLuaBaseEntity::changesJob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->jobs.unlocked |= (1 << (std::uint8_t)lua_tointeger(L, 1));
    PChar->SetSJob((std::uint8_t)lua_tointeger(L, 1));
    charutils::UpdateSubJob(PChar);

    if (lua_tointeger(L, 1) == JOB_BLU)
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

inline std::int32_t CLuaBaseEntity::setsLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 1) > 99);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->jobs.job[PChar->GetSJob()] = (std::uint8_t)lua_tointeger(L, 1);
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

inline std::int32_t CLuaBaseEntity::setLevel(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 1) > 99);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->SetMLevel((std::uint8_t)lua_tointeger(L, 1));
    PChar->jobs.job[PChar->GetMJob()] = (std::uint8_t)lua_tointeger(L, 1);
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
    PChar->updatemask |= UPDATE_HP;

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

inline std::int32_t CLuaBaseEntity::setMerits(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->PMeritPoints->SetMeritPoints((std::uint8_t)lua_tointeger(L, 1));

    PChar->pushPacket(new CMenuMeritPacket(PChar));

    charutils::SaveCharExp(PChar, PChar->GetMJob());
    return 0;
}

/************************************************************************
*                                                                       *
*  gets Merit levels for merit type                                     *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getMerit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->objtype != TYPE_PC)
    {
        // not PC just give em no merits
        lua_pushinteger(L, 0);
    }
    else
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        lua_pushinteger(L, PChar->PMeritPoints->GetMeritValue((MERIT_TYPE)lua_tointeger(L, 1), PChar));
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  gets a players total merits                                          *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getMeritCount(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::getPlaytime(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    bool update = true;
    if (!lua_isnil(L, 1) && lua_isboolean(L, 1))
        update = lua_toboolean(L, 1);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, PChar->GetPlayTime(update));

    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::showPosition(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageStandardPacket(
        (std::uint32_t)m_PBaseEntity->loc.p.x,
        (std::uint32_t)m_PBaseEntity->loc.p.y,
        (std::uint32_t)m_PBaseEntity->loc.p.z,
        m_PBaseEntity->loc.p.rotation,
        239));
    return 0;
}

/************************************************************************
*                                                                       *
*  Устанавливаем персонажу указанный флаг                               *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CCharEntity*)m_PBaseEntity)->nameflags.flags ^= (std::uint32_t)lua_tointeger(L, 1);
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

/************************************************************************
*                                                                       *
*  Устанавливаем/запрашиваем флаг выхода из MogHouse                    *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::moghouseFlag(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        PChar->profile.mhflag |= (std::uint8_t)lua_tointeger(L, 1);
        charutils::SaveCharStats(PChar);
        return 0;
    }
    lua_pushinteger(L, PChar->profile.mhflag);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::injectPacket(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1));

    std::uint8_t size = 0;
    FILE* File = fopen(lua_tostring(L, 1), "rb");

    if (File)
    {
        CBasicPacket * PPacket = new CBasicPacket();

        fseek(File, 1, SEEK_SET);
        if (fread(&size, 1, 1, File) != 1)
        {
            ShowError(CL_RED"CLuaBaseEntity::injectPacket : Did not read size\n" CL_RESET);
            return 0;
        }

        if (size <= 256)
        {
            fseek(File, 0, SEEK_SET);
            if (fread(*PPacket, 1, size * 2, File) != size * 2)
            {
                ShowError(CL_RED"CLuaBaseEntity::injectPacket : Did not read entire packet\n" CL_RESET);
                return 0;
            }

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

inline std::int32_t CLuaBaseEntity::getEquipID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC && m_PBaseEntity->objtype != TYPE_PET && m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        std::uint8_t SLOT = (std::uint8_t)lua_tointeger(L, 1);

        DSP_DEBUG_BREAK_IF(SLOT > 15);

        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        CItem* PItem = PChar->getEquip((SLOTTYPE)SLOT);

        if ((PItem != nullptr) && PItem->isType(ITEM_ARMOR))
        {
            lua_pushinteger(L, PItem->getID());
            return 1;
        }
    }
    lua_pushinteger(L, 0);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getShieldSize(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC && m_PBaseEntity->objtype != TYPE_PET);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        lua_pushinteger(L, ((CCharEntity*)m_PBaseEntity)->getShieldSize());
        return 1;
    }
    lua_pushinteger(L, 0);
    return 1;
}

/*
Pass in an item id and it will search and equip it.

Example:
    player:equipItem(itemId)
*/
inline std::int32_t CLuaBaseEntity::equipItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t itemID = (std::uint16_t)lua_tointeger(L, 1);
    std::uint8_t containerID;
    if (lua_isnil(L, 2) || !lua_isnumber(L, 2))
        containerID = LOC_INVENTORY;
    else
        containerID = (std::uint8_t)lua_tointeger(L, 2);
    std::uint8_t SLOT = PChar->getStorage(containerID)->SearchItem(itemID);
    CItemArmor* PItem;

    if (SLOT != ERROR_SLOTID)
    {
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

inline std::int32_t CLuaBaseEntity::lockEquipSlot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t SLOT = (std::uint8_t)lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::unlockEquipSlot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint8_t SLOT = (std::uint8_t)lua_tointeger(L, 1);

    DSP_DEBUG_BREAK_IF(SLOT > 15);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->m_EquipBlock &= ~(1 << SLOT);
    PChar->pushPacket(new CCharJobsPacket(PChar));

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::canEquipItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::uint16_t itemID = (std::uint16_t)lua_tointeger(L, 1);
    DSP_DEBUG_BREAK_IF(itemID > MAX_ITEMID);

    bool checkLevel = false;
    if (!lua_isnil(L, 2) && lua_isboolean(L, 2))
        checkLevel = lua_toboolean(L, 2);

    CItemArmor* PItem = (CItemArmor*)itemutils::GetItem(itemID);
    CBattleEntity* PChar = (CBattleEntity*)m_PBaseEntity;

    if (!(PItem->getJobs() & (1 << (PChar->GetMJob() - 1))))
    {
        lua_pushboolean(L, false);
        return 1;
    }
    if (checkLevel && (PItem->getReqLvl() > PChar->GetMLevel()))
    {
        lua_pushboolean(L, false);
        return 1;
    }
    //ShowDebug("Item ID: %u Item Jobs: %u Player Job: %u\n",itemID,PItem->getJobs(),PChar->GetMJob());
    lua_pushboolean(L, true);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getPetElement(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (((CBattleEntity*)m_PBaseEntity)->PPet)
    {
        lua_pushinteger(L, ((CPetEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->m_Element);
    }
    else
    {
        lua_pushinteger(L, 0);
    }
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getPetName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (((CBattleEntity*)m_PBaseEntity)->PPet)
    {
        lua_pushstring(L, (((CBattleEntity*)m_PBaseEntity)->PPet)->name.c_str());
    }
    else
    {
        lua_pushstring(L, "");
    }
    return 1;
}

/*
Checks if the current entity has an alive pet.
*/
inline std::int32_t CLuaBaseEntity::hasPet(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::spawnPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        if (!lua_isnil(L, 1) && lua_isstring(L, 1))
        {
            auto petId = lua_tointeger(L, 1);
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
            petutils::SpawnPet((CBattleEntity*)m_PBaseEntity, (std::uint32_t)lua_tointeger(L, 1), false);
        }
        else
        {
            ShowError(CL_RED"CLuaBaseEntity::spawnPet : PetID is NULL\n" CL_RESET);
        }
    }
    else if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

        if (PMob->PPet == nullptr)
        {
            ShowError("lua_baseentity::spawnPet PMob (%d) trying to spawn pet but its nullptr\n", PMob->id);
            return 0;
        }

        CMobEntity* PPet = (CMobEntity*)PMob->PPet;

        // if a number is given its an avatar or elemental spawn
        if (!lua_isnil(L, 1) && lua_isstring(L, 1))
        {
            petutils::SpawnMobPet(PMob, (std::uint32_t)lua_tointeger(L, 1));
        }

        // always spawn on master
        PPet->m_SpawnPoint = nearPosition(PMob->loc.p, 2.2f, (float)M_PI);

        // setup AI
        PPet->Spawn();

    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::petAttack(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    if (((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        petutils::AttackTarget((CBattleEntity*)m_PBaseEntity, (CBattleEntity*)PEntity->GetBaseEntity());
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::petRetreat(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        petutils::RetreatToMaster((CBattleEntity*)m_PBaseEntity);
    }
    return 0;
}


//==========================================================//

inline std::int32_t CLuaBaseEntity::petAbility(lua_State *L)
{
    return 0;
}

/************************************************************************
*                                                                       *
*  Сущность освобождает питомца                                         *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::despawnPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (((CBattleEntity*)m_PBaseEntity)->PPet != nullptr)
    {
        petutils::DespawnPet((CBattleEntity*)m_PBaseEntity);
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Обновляем ненависть монстров к указанной цели                        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::updateEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    //DSP_DEBUG_BREAK_IF(lua_gettop(L) > 1);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    if (PEntity != nullptr &&
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
    {
        ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->AddBaseEnmity((CBattleEntity*)PEntity->GetBaseEntity());
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  updates enmity and claims monster                                    *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::updateClaim(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::resetEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    //DSP_DEBUG_BREAK_IF(lua_gettop(L) > 1);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

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

inline std::int32_t CLuaBaseEntity::lowerEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    if (PEntity != nullptr &&
        PEntity->GetBaseEntity()->objtype != TYPE_NPC)
    {
        ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->LowerEnmityByPercent((CBattleEntity*)PEntity->GetBaseEntity(), (std::uint8_t)lua_tonumber(L, 2), nullptr);
    }
    return 0;
}


std::int32_t CLuaBaseEntity::transferEnmity(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 2) < 0);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    auto PEntity = Lunar<CLuaBaseEntity>::check(L, 1)->m_PBaseEntity;
    auto percent = (std::uint8_t)lua_tointeger(L, 2);
    auto range = lua_tonumber(L, 3);

    auto PIterEntity = [&]() -> CCharEntity*
    {
        if (m_PBaseEntity->objtype == TYPE_PC)
        {
            return static_cast<CCharEntity*>(m_PBaseEntity);
        }
        else if (m_PBaseEntity->objtype == TYPE_PET)
        {
            auto PMaster = static_cast<CPetEntity*>(m_PBaseEntity)->PMaster;
            if (PMaster->objtype == TYPE_PC)
            {
                return static_cast<CCharEntity*>(PMaster);
            }
        }
        else if (PEntity->objtype == TYPE_PC)
        {
            return static_cast<CCharEntity*>(PEntity);
        }
        else if (PEntity->objtype == TYPE_PET)
        {
            auto PMaster = static_cast<CPetEntity*>(PEntity)->PMaster;
            if (PMaster->objtype == TYPE_PC)
            {
                return static_cast<CCharEntity*>(PMaster);
            }
        }
        return nullptr;
    }();

    if (PIterEntity)
    {
        for (auto&& mob_pair : PIterEntity->SpawnMOBList)
        {
            if (distance(mob_pair.second->loc.p, PEntity->loc.p) < range)
            {
                battleutils::TransferEnmity(static_cast<CBattleEntity*>(PEntity),
                    static_cast<CBattleEntity*>(m_PBaseEntity),static_cast<CMobEntity*>(mob_pair.second), percent);
            }
        }
    }
    return 0;
}

/************************************************************************
    Check if the mob has immunity for this type of spell
    list at mobentity.h
    return true if he has immunity, else false
************************************************************************/

inline std::int32_t CLuaBaseEntity::hasImmunity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->hasImmunity((std::uint32_t)lua_tointeger(L, 1)));
    return 1;
}

/************************************************************************
*                                                                       *
*  Get the time in second of the battle                                 *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getBattleTime(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, (lua_Integer)std::chrono::duration_cast<std::chrono::seconds>(((CBattleEntity*)m_PBaseEntity)->GetBattleTime()).count());
    return 1;
}

/************************************************************************
*                                                                       *
*  Add the rage mode for a mob (stat x10)                               *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::rageMode(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::isUndead(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->m_EcoSystem == SYSTEM_UNDEAD);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getSystem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint8_t system = ((CBattleEntity*)m_PBaseEntity)->m_EcoSystem;

    lua_pushinteger(L, system);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getFamily(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    std::uint16_t family = ((CMobEntity*)m_PBaseEntity)->m_Family;

    lua_pushinteger(L, family);
    return 1;
}

/************************************************************************
*                                                                       *
*  Returns true if mob is of passed in type                             *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::isMobType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype != TYPE_MOB)
    {
        lua_pushboolean(L, false);
        return 1;
    }

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    lua_pushboolean(L, PMob->m_Type & lua_tointeger(L, 1));
    return 1;
}

/************************************************************************
            Calculates the enmity produced by the input cure and
            applies it to all on the base entity's enemies hate list
            FORMAT: phealer:(ptarget,amount)
************************************************************************/

inline std::int32_t CLuaBaseEntity::updateEnmityFromCure(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_tointeger(L, 2) < 0);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    auto amount = (std::uint16_t)lua_tointeger(L, 2);

    auto PCurer = [&]() -> CCharEntity*
    {
        if (m_PBaseEntity->objtype == TYPE_PC)
        {
            return static_cast<CCharEntity*>(m_PBaseEntity);
        }
        else if (m_PBaseEntity->objtype == TYPE_PET && static_cast<CPetEntity*>(m_PBaseEntity)->getPetType() != PETTYPE_AUTOMATON)
        {
            auto PMaster = static_cast<CPetEntity*>(m_PBaseEntity)->PMaster;
            if (PMaster->objtype == TYPE_PC)
            {
                return static_cast<CCharEntity*>(PMaster);
            }
        }
        return nullptr;
    }();

    if (PEntity != nullptr && PCurer)
    {
        battleutils::GenerateCureEnmity(PCurer, (CBattleEntity*)PEntity->GetBaseEntity(), amount);
    }

    return 0;
}

/************************************************************************
*                                                                       *
*  Calculates the enmity produced by the input damage                   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::updateEnmityFromDamage(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    auto damage = (std::uint16_t)lua_tointeger(L, 2);

    if (m_PBaseEntity->objtype == TYPE_PC || (m_PBaseEntity->objtype == TYPE_MOB && ((CMobEntity*)m_PBaseEntity)->isCharmed) ||
        m_PBaseEntity->objtype == TYPE_PET)
    {
        if (PEntity->GetBaseEntity() && PEntity->GetBaseEntity()->objtype == TYPE_MOB)
        {
            ((CMobEntity*)PEntity->GetBaseEntity())->PEnmityContainer->UpdateEnmityFromAttack((CBattleEntity*)m_PBaseEntity, damage);
        }
    }
    else if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        if (PEntity->GetBaseEntity() && damage > 0 &&
            PEntity->GetBaseEntity()->objtype != TYPE_NPC)
        {
            ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->UpdateEnmityFromDamage((CBattleEntity*)PEntity->GetBaseEntity(), damage);
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Returns the CE and VE the mob has towards the player                 *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getCE(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    lua_pushinteger(L, ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->GetCE((CBattleEntity*)PEntity->GetBaseEntity()));
    return 1;
}

inline std::int32_t CLuaBaseEntity::getVE(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    lua_pushinteger(L, ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->GetVE((CBattleEntity*)PEntity->GetBaseEntity()));
    return 1;
}

/************************************************************************
*                                                                       *
*  Adds a specified amount of enmity towards the target if the base     *
*  entity is a mob, or towards the base entity if the base entity is a  *
*  player.                                                              *
*  paremters: (CLuaBaseEntity target,int CE,int VE)                     *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::addEnmity(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    auto CE = (std::int16_t)lua_tointeger(L, 2);
    auto VE = (std::int16_t)lua_tointeger(L, 3);

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
        if (PEntity != nullptr && (CE > 0 || VE > 0) &&
            PEntity->GetBaseEntity()->objtype != TYPE_NPC)
        {
            ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->UpdateEnmity((CBattleEntity*)PEntity->GetBaseEntity(), CE, VE);
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Sets the CE and VE the mob has towards the player                    *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setCE(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    auto amount = (std::uint16_t)lua_tointeger(L, 2);

    ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->SetCE((CBattleEntity*)PEntity->GetBaseEntity(), amount);
    return 0;
}

inline std::int32_t CLuaBaseEntity::setVE(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    auto amount = (std::uint16_t)lua_tointeger(L, 2);

    ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->SetVE((CBattleEntity*)PEntity->GetBaseEntity(), amount);
    return 0;
}

/************************************************************************
*                                                                       *
*  Проверяем, покидал ли персонаж зону после поднятия флага             *
*  необходимости ее покинуть. С параметром устанавливаем флаг, без      *
*  параметра узнаем результат.                                          *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::needToZone(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (!lua_isnil(L, 1) && lua_isboolean(L, 1))
    {
        m_PBaseEntity->loc.zoning = lua_toboolean(L, 1);
        return 0;
    }
    lua_pushboolean(L, m_PBaseEntity->loc.zoning);
    return 1;
}

/************************************************************************
*                                                                       *
*   Get Container Size                                                  *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getContainerSize(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);
    lua_pushinteger(L, PChar->getStorage((std::uint8_t)lua_tointeger(L, 1))->GetSize());
    return 1;
}

/************************************************************************
*                                                                       *
*  Increase/Decrease Container Size                                     *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::changeContainerSize(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1) &&
        !lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        std::uint8_t LocationID = (std::uint8_t)lua_tointeger(L, 1);

        if (LocationID < MAX_CONTAINER_ID)
        {
            CCharEntity* PChar = ((CCharEntity*)m_PBaseEntity);

            PChar->getStorage(LocationID)->AddBuff((std::int8_t)lua_tointeger(L, 2));
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

inline std::int32_t CLuaBaseEntity::getID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->id);
    return 1;
}

// TODO: should be renamed to targid
inline std::int32_t CLuaBaseEntity::getShortID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->targid);
    return 1;
}

// For use in GM command @getid to get the ID of MOBs, NPCs, and even Players.
inline std::int32_t CLuaBaseEntity::getCursorTarget(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto PTarget = PChar->GetEntity(PChar->m_TargID);

    if (PTarget == NULL)
    {
        lua_pushnil(L);
    }
    else
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, PTarget);
        lua_pcall(L, 2, 1, 0);
    }

    return 1;
}

// Gets a mobs poolID
inline std::int32_t CLuaBaseEntity::getPool(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype != TYPE_MOB)
    {
        lua_pushnil(L);
    }
    else
    {
        CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;
        lua_pushinteger(L, PMob->m_Pool);
    }

    return 1;
}

/************************************************************************
*                                                                       *
*  Get Entity's name                                                    *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getName(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushstring(L, (const char*)m_PBaseEntity->GetName());
    return 1;
}

inline std::int32_t CLuaBaseEntity::getModelSize(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushinteger(L, PEntity->m_ModelSize);
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current weapon's base DMG; used for WS calcs                *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getWeaponDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint16_t weapondam = ((CBattleEntity*)m_PBaseEntity)->GetMainWeaponDmg();

    lua_pushinteger(L, weapondam);
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current offhand weapon's base DMG; used for WS calcs        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getOffhandDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint16_t weapondam = ((CBattleEntity*)m_PBaseEntity)->GetSubWeaponDmg();

    lua_pushinteger(L, weapondam);
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current weapon's base DMG; used for WS calcs                *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getWeaponDmgRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint16_t weapondam = ((CBattleEntity*)m_PBaseEntity)->GetMainWeaponRank() * 9;

    lua_pushinteger(L, weapondam);
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the current offhand weapon's base DMG; used for WS calcs        *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getOffhandDmgRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint16_t weapondam = ((CBattleEntity*)m_PBaseEntity)->GetSubWeaponRank() * 9;

    lua_pushinteger(L, weapondam);
    return 1;
}

/************************************************************************
*                                                                       *
*  Gets the skill type of weapon in slot                                *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getWeaponSkillType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        std::uint8_t SLOT = (std::uint8_t)lua_tointeger(L, 1);
        if (SLOT > 3)
        {
            lua_pushinteger(L, 0);
            return 1;
        }
        CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT];
        if (weapon == nullptr)
        {
            lua_pushinteger(L, 0);
            return 1;
        }
        lua_pushinteger(L, weapon->getSkillType());
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

inline std::int32_t CLuaBaseEntity::getWeaponSubSkillType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (!lua_isnil(L, 1) && lua_isstring(L, 1))
    {
        std::uint8_t SLOT = (std::uint8_t)lua_tointeger(L, 1);
        if (SLOT > 3)
        {
            ShowDebug(CL_CYAN"lua::getWeaponSubskillType slot not a weapon\n" CL_RESET);
            lua_pushinteger(L, 0);
            return 1;
        }
        CItemWeapon* weapon = (CItemWeapon*)((CCharEntity*)m_PBaseEntity)->getEquip((SLOTTYPE)SLOT);

        if (weapon == nullptr)
        {
            ShowDebug(CL_CYAN"lua::getWeaponSubskillType weapon in specified slot is NULL!\n" CL_RESET);
            return 0;
        }

        lua_pushinteger(L, weapon->getSubSkillType());
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
inline std::int32_t CLuaBaseEntity::getWSSkillchainProp(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    auto state = dynamic_cast<CWeaponSkillState*>(m_PBaseEntity->PAI->GetCurrentState());

    if (state)
    {
        lua_pushinteger(L, state->GetSkill()->getPrimarySkillchain());
        lua_pushinteger(L, state->GetSkill()->getSecondarySkillchain());
        lua_pushinteger(L, state->GetSkill()->getTertiarySkillchain());

        return 3;
    }

    lua_pushnil(L);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getRangedDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint16_t weapondam = ((CBattleEntity*)m_PBaseEntity)->GetRangedWeaponDmg();

    lua_pushinteger(L, weapondam);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getRangedDmgForRank(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    std::uint16_t weaponrank = ((CBattleEntity*)m_PBaseEntity)->GetRangedWeaponRank() * 9;

    lua_pushinteger(L, weaponrank);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getAmmoDmg(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_AMMO];

    if (weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getAmmoDmg weapon in ammo slot is NULL!\n" CL_RESET);
        return 0;
    }
    lua_pushinteger(L, weapon->getDamage());
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getRATT(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];

    if (weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getRATT weapon in ranged slot is NULL!\n" CL_RESET);
        return 0;
    }

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->RATT(weapon->getSkillType(), weapon->getILvlSkill()));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getRACC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_RANGED];

    if (weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getRACC weapon in ranged slot is NULL!\n" CL_RESET);
        return 0;
    }
    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    int skill = PEntity->GetSkill(weapon->getSkillType());
    int acc = skill;
    if (skill > 200) {
        acc = (int)(200 + (skill - 200) * 0.9);
    }
    acc += PEntity->getMod(Mod::RACC);
    acc += PEntity->AGI() / 2;
    acc = acc + std::min<std::int16_t>(((100 + PEntity->getMod(Mod::FOOD_RACCP)) * acc / 100), PEntity->getMod(Mod::FOOD_RACC_CAP));

    lua_pushinteger(L, acc);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getACC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    std::uint16_t ACC = PEntity->ACC(0, 0);

    lua_pushinteger(L, ACC);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getEVA(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    std::uint16_t EVA = PEntity->EVA();

    lua_pushinteger(L, EVA);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::isWeaponTwoHanded(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CItemWeapon* weapon = ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN];

    if (weapon == nullptr)
    {
        ShowDebug(CL_CYAN"lua::getWeaponDmg weapon in main slot is NULL!\n" CL_RESET);
        return 0;
    }
    lua_pushboolean(L, weapon->isTwoHanded());
    return 1;
}

/************************************************************************
    Returns the value of a single hit against the target monster
    (can return -1 if it misses). Useful for calculating physical
    BP damage, but it isn't limited to just pets. Usage:
    damage = attacker:getMeleeHitDamage(target,acc);
    the acc value is OPTIONAL and it should be an int (e.g. 95 = 95% acc)
************************************************************************/

inline std::int32_t CLuaBaseEntity::getMeleeHitDamage(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    CBattleEntity* PAttacker = (CBattleEntity*)m_PBaseEntity;
    CBattleEntity* PDefender = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();
    auto hitrate = battleutils::GetHitRate(PAttacker, PDefender);
    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        hitrate = (std::uint8_t)lua_tointeger(L, 2);
    }

    if (dsprand::GetRandomNumber(100) < hitrate)
    {
        float DamageRatio = battleutils::GetDamageRatio(PAttacker, PDefender, false, 0);
        int damage = (std::uint16_t)((PAttacker->GetMainWeaponDmg() + battleutils::GetFSTR(PAttacker, PDefender, SLOT_MAIN)) * DamageRatio);
        lua_pushinteger(L, damage);
        return 1;
    }
    lua_pushinteger(L, -1);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::resetRecasts(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    // only reset for players
    if (m_PBaseEntity->objtype == TYPE_PC)
    {
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

inline std::int32_t CLuaBaseEntity::resetRecast(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    // only reset for players
    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

        RECASTTYPE recastContainer = (RECASTTYPE)lua_tointeger(L, 1);
        auto recastID = (std::uint16_t)lua_tointeger(L, 2);

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

inline std::int32_t CLuaBaseEntity::addRecast(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CBattleEntity* PBattleEntity = dynamic_cast<CBattleEntity*>(m_PBaseEntity);
    if(PBattleEntity)
    {
        RECASTTYPE recastContainer = (RECASTTYPE)lua_tointeger(L, 1);
        auto recastID = (std::uint16_t)lua_tointeger(L, 2);
        auto duration = (std::uint32_t)lua_tointeger(L, 3);

        PBattleEntity->PRecastContainer->Add(recastContainer, recastID, duration);
        if(PBattleEntity->objtype == TYPE_PC)
        {
            CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
            PChar->pushPacket(new CCharSkillsPacket(PChar));
            PChar->pushPacket(new CCharRecastPacket(PChar));
        }
    }
    return 0;
}


/***************************************************************
  Attempts to register a BCNM or Dynamis battlefield.
  INPUT: The BCNM ID to register.
  OUTPUT: The battlefield number assigned, or -1 if it's all full.
  Call on: The Orb trader
****************************************************************/

inline std::int32_t CLuaBaseEntity::bcnmRegister(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    int bcnm = 0;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int ZoneID = PZone->GetID();

    if (ZoneID == 37 || ZoneID == 38)
    {
        if (PZone->m_BattlefieldHandler->hasFreeSpecialBattlefield((std::uint16_t)lua_tointeger(L, 1)))
        {
            ShowDebug("Free Special Battlefield found for BCNMID %i \n", lua_tointeger(L, 1));
            bcnm = PZone->m_BattlefieldHandler->registerBcnm((std::uint16_t)lua_tointeger(L, 1), PChar);

            if (bcnm != -1)
            {
                ShowDebug("Registration successful!\n");
                lua_pushinteger(L, bcnm);
            }
            else
            {
                ShowDebug("Unable to register BCNM Special Battlefield.\n");
                lua_pushinteger(L, bcnm);
            }
        }
        else
        {
            ShowDebug("BCNM Registration Failed : No free Special battlefields for BCNMID %i \n", lua_tointeger(L, 1));
            lua_pushinteger(L, -1);
        }
    }
    else
        if (PZone->m_BattlefieldHandler->hasFreeBattlefield())
        {

            if ((ZoneID > 184 && ZoneID < 189) || (ZoneID > 133 && ZoneID < 136) || (ZoneID > 38 && ZoneID < 43))
            {
                ShowDebug("Free Dynamis Battlefield found for BCNMID %i \n", lua_tointeger(L, 1));
                bcnm = PZone->m_BattlefieldHandler->registerDynamis((std::uint16_t)lua_tointeger(L, 1), PChar);
            }
            else
            {
                ShowDebug("Free BCNM Battlefield found for BCNMID %i \n", lua_tointeger(L, 1));
                bcnm = PZone->m_BattlefieldHandler->registerBcnm((std::uint16_t)lua_tointeger(L, 1), PChar);
            }

            if (bcnm != -1)
            {
                ShowDebug("Registration successful!\n");
                lua_pushinteger(L, bcnm);
            }
            else
            {
                ShowDebug("Unable to register BCNM Battlefield.\n");
                lua_pushinteger(L, bcnm);
            }
        }
        else
        {
            ShowDebug("BCNM Registration Failed : No free battlefields for BCNMID %i \n", lua_tointeger(L, 1));
            lua_pushinteger(L, -1);
        }

    return 1;
}

/***************************************************************
  Attempts to enter a BCNM or Dynamis battlefield.
  OUTPUT: 1 if successful, 0 if not.
  Call on: Any player. (e.g. non-orb trader in same pt)
****************************************************************/

inline std::int32_t CLuaBaseEntity::bcnmEnter(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int ZoneID = PZone->GetID();

    if ((ZoneID > 184 && ZoneID < 189) || (ZoneID > 133 && ZoneID < 136) || (ZoneID > 38 && ZoneID < 43))
    {
        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DYNAMIS))
        {
            std::uint16_t effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DYNAMIS)->GetPower();
            if (PZone->m_BattlefieldHandler->enterBcnm(effect_bcnmid, PChar))
            {
                lua_pushinteger(L, 1);
                return 1;
            }
        }
    }
    else
    {
        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD))
        {
            std::uint16_t effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD)->GetPower();
            if (PZone->m_BattlefieldHandler->enterBcnm(effect_bcnmid, PChar))
            {
                lua_pushinteger(L, 1);
                return 1;
            }
        }
    }
    ShowDebug("%s is unable to enter.\n", PChar->GetName());
    lua_pushinteger(L, 0);
    return 1;
}

/***************************************************************
  Attempts to leave a BCNM battlefield.
  INPUT: The type of leave (1=RUN AWAY, 2=TREASURE CHEST)
  OUTPUT: 1 if successful, 0 if not.
  Call on: Anyone who selects "Leave" or "Run Away"
****************************************************************/

inline std::int32_t CLuaBaseEntity::bcnmLeave(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD))
    {
        std::uint16_t effect_bcnmid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD)->GetPower();
        auto typeOfExit = lua_tointeger(L, 1);
        if (typeOfExit == 1 && PChar->loc.zone->m_BattlefieldHandler->leaveBcnm(effect_bcnmid, PChar))
        {
            ShowDebug("BCNM Leave :: %s left BCNMID %i \n", PChar->GetName(), effect_bcnmid);
        }
        else if (typeOfExit == 2 && PChar->loc.zone->m_BattlefieldHandler->winBcnm(effect_bcnmid, PChar))
        {
            ShowDebug("BCNM Leave :: Won BCNMID %i \n", effect_bcnmid);
        }
    }
    else
    {
        ShowDebug("BCNM Leave :: %s does not have EFFECT_BATTLEFIELD. \n", PChar->GetName());
    }

    lua_pushinteger(L, 0);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::isInBcnm(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->PBCNM)
    {
        lua_pushinteger(L, 1);
        return 1;
    }
    lua_pushinteger(L, 0);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getBattlefieldID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    std::uint8_t inst = 255;

    if (PChar->loc.zone != nullptr && PChar->loc.zone->m_BattlefieldHandler != nullptr)
    {
        inst = PChar->loc.zone->m_BattlefieldHandler->findBattlefieldIDFor(PChar);
    }

    lua_pushinteger(L, inst);
    return 1;
}


//==========================================================//

inline std::int32_t CLuaBaseEntity::getBCNMloot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    std::uint8_t inst = 255;

    if (PChar->loc.zone != nullptr && PChar->loc.zone->m_BattlefieldHandler != nullptr)
    {
        inst = PChar->loc.zone->m_BattlefieldHandler->findBattlefieldIDFor(PChar);
        PChar->loc.zone->m_BattlefieldHandler->openTreasureChest(PChar);
    }

    lua_pushinteger(L, inst);
    return 1;
}


//==========================================================//

//returns 1 if all 3 battlefields are full. Temp measure until event param struct is found out.
inline std::int32_t CLuaBaseEntity::isBcnmsFull(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    std::uint8_t full = 1;

    if (PZone != nullptr && PZone->m_BattlefieldHandler != nullptr &&
        PZone->m_BattlefieldHandler->hasFreeBattlefield())
    {

        full = 0;
    }
    lua_pushinteger(L, full);
    return 1;
}

inline std::int32_t CLuaBaseEntity::isSpecialBattlefieldEmpty(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    std::uint8_t full = 1;


    if (PZone != nullptr && PZone->m_BattlefieldHandler != nullptr &&
        PZone->m_BattlefieldHandler->hasSpecialBattlefieldEmpty((std::uint16_t)lua_tointeger(L, 1)))
    {

        full = 0;
    }
    lua_pushinteger(L, full);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getSpecialBattlefieldLeftTime(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    duration Leftime;


    if (PZone != nullptr && PZone->m_BattlefieldHandler != nullptr)
    {
        Leftime = PZone->m_BattlefieldHandler->SpecialBattlefieldLeftTime((std::uint16_t)lua_tointeger(L, 1), server_clock::now());
    }

    lua_pushinteger(L, (lua_Integer)std::chrono::duration_cast<std::chrono::seconds>(Leftime).count());
    return 1;
}
// Add time on your Special battlefield
inline std::int32_t CLuaBaseEntity::addTimeToSpecialBattlefield(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    PZone->m_BattlefieldHandler->GiveTimeToBattlefield((std::uint16_t)lua_tointeger(L, 1), std::chrono::minutes(lua_tointeger(L, 2)));

    return 1;
}
inline std::int32_t CLuaBaseEntity::BCNMSetLoot(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);
    if (PChar->loc.zone != nullptr && PChar->loc.zone->m_BattlefieldHandler != nullptr)
    {
        PChar->loc.zone->m_BattlefieldHandler->SetLootToBCNM((std::uint16_t)lua_tointeger(L, 1), (std::uint16_t)lua_tointeger(L, 2), (std::uint32_t)lua_tointeger(L, 3));
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::RestoreAndHealOnBattlefield(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    // only reset for players
    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        PChar->loc.zone->m_BattlefieldHandler->RestoreOnBattlefield((std::uint16_t)lua_tointeger(L, 1));
        return 0;
    }
    return 0;
}
inline std::int32_t CLuaBaseEntity::setSpawn(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
        PMob->m_SpawnPoint.x = (float)lua_tonumber(L, 1);
    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
        PMob->m_SpawnPoint.y = (float)lua_tonumber(L, 2);
    if (!lua_isnil(L, 3) && lua_isnumber(L, 3))
        PMob->m_SpawnPoint.z = (float)lua_tonumber(L, 3);
    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
        PMob->m_SpawnPoint.rotation = (std::uint8_t)lua_tointeger(L, 4);

    return 0;
}

inline std::int32_t CLuaBaseEntity::setRespawnTime(lua_State* L)
{

    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        PMob->m_RespawnTime = (std::uint32_t)(lua_tointeger(L, 1) * 1000);
        if (PMob->PAI->IsCurrentState<CRespawnState>())
        {
            PMob->PAI->GetCurrentState()->ResetEntryTime();
        }

        if (!lua_isnil(L, 2) && lua_isboolean(L, 2) && lua_toboolean(L, 2)) //set optional parameter to true to only modify the timer
            return 0;
    }
    else
    {
        ShowWarning("CLuaBaseEntity::setRespawnTime (%d) Tried to set respawn without a time\n", PMob->id);
    }

    PMob->m_AllowRespawn = true;

    return 0;
}

std::int32_t CLuaBaseEntity::getRespawnTime(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = static_cast<CMobEntity*>(m_PBaseEntity);

    if (PMob->m_AllowRespawn)
    {
        lua_pushinteger(L, PMob->m_RespawnTime);
        return 1;
    }
    else
    {
        lua_pushinteger(L, 0);
        return 1;
    }
}

inline std::int32_t CLuaBaseEntity::addPlayerToSpecialBattlefield(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int bcnm = PZone->m_BattlefieldHandler->SpecialBattlefieldAddPlayer((std::uint16_t)lua_tointeger(L, 1), PChar);

    if (bcnm != -1)
    {
        ShowDebug("Registration successful!\n");
        lua_pushinteger(L, bcnm);
    }
    else
    {
        ShowDebug("Unable to register BCNM.\n");
        lua_pushinteger(L, -1);
    }

    return 1;
}

// Return unique ID for Dynamis
inline std::int32_t CLuaBaseEntity::getDynamisUniqueID(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    lua_pushinteger(L, PZone->m_BattlefieldHandler->getUniqueDynaID((std::uint16_t)lua_tointeger(L, 1)));

    return 1;
}

// Add time on your dynamis battlefield
inline std::int32_t CLuaBaseEntity::addTimeToDynamis(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    PZone->m_BattlefieldHandler->dynamisMessage(448, (std::uint16_t)lua_tointeger(L, 1));

    return 1;
}

//Launch dynamis mob part 2 (when mega boss is defeated)
inline std::int32_t CLuaBaseEntity::launchDynamisSecondPart(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    DSP_DEBUG_BREAK_IF(PChar->loc.zone->m_BattlefieldHandler == nullptr);

    PChar->loc.zone->m_BattlefieldHandler->launchDynamisSecondPart();

    return 1;
}

inline std::int32_t CLuaBaseEntity::addPlayerToDynamis(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;

    DSP_DEBUG_BREAK_IF(PZone->m_BattlefieldHandler == nullptr);

    int bcnm = PZone->m_BattlefieldHandler->dynamisAddPlayer((std::uint16_t)lua_tointeger(L, 1), PChar);

    if (bcnm != -1)
    {
        ShowDebug("Registration successful!\n");
        lua_pushinteger(L, bcnm);
    }
    else
    {
        ShowDebug("Unable to register BCNM Battlefield.\n");
        lua_pushinteger(L, -1);
    }

    return 1;
}

inline std::int32_t CLuaBaseEntity::isInDynamis(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushboolean(L, ((CBattleEntity*)m_PBaseEntity)->isInDynamis());
    return 1;
}

inline std::int32_t CLuaBaseEntity::setStatPoppedMobs(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    if (!lua_isnil(L, 1) && lua_isboolean(L, 1))
        ((CMobEntity*)m_PBaseEntity)->m_StatPoppedMobs = true;
    else
        ((CMobEntity*)m_PBaseEntity)->m_StatPoppedMobs = false;
    return 0;
}

inline std::int32_t CLuaBaseEntity::getStatPoppedMobs(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::isInBattlefieldList(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if (PMob->loc.zone->m_BattlefieldHandler->checkMonsterInList(PMob))
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

inline std::int32_t CLuaBaseEntity::addInBattlefieldList(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::openDoor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->animation == ANIMATION_CLOSE_DOOR)
    {
        std::uint32_t OpenTime = (!lua_isnil(L, 1) && lua_isnumber(L, 1)) ? (std::uint32_t)lua_tointeger(L, 1) * 1000 : 7000;

        m_PBaseEntity->animation = ANIMATION_OPEN_DOOR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));

        m_PBaseEntity->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(OpenTime), false, [](CBaseEntity* PNpc)
        {
            PNpc->animation = ANIMATION_CLOSE_DOOR;
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
        }));
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::closeDoor(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->animation == ANIMATION_OPEN_DOOR)
    {
        std::uint32_t CloseTime = (!lua_isnil(L, 1) && lua_isnumber(L, 1)) ? (std::uint32_t)lua_tointeger(L, 1) * 1000 : 7000;
        m_PBaseEntity->animation = ANIMATION_CLOSE_DOOR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));

        m_PBaseEntity->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(CloseTime), false, [](CBaseEntity* PNpc)
        {
            PNpc->animation = ANIMATION_OPEN_DOOR;
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
        }));
    }
    return 0;
}

/************************************************
 * Just for debugging. Similar to @animatoin.   *
 * Injects an action packet with the specified  *
 * parameters. Used for quickly finding anims.  *
 ************************************************/
inline std::int32_t CLuaBaseEntity::injectActionPacket(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint16_t action = (std::uint16_t)lua_tointeger(L, 1);
    std::uint16_t anim = (std::uint16_t)lua_tointeger(L, 2);
    SPECEFFECT speceffect = (SPECEFFECT)lua_tointeger(L, 3);
    REACTION reaction = (REACTION)lua_tointeger(L, 4);
    std::uint16_t message = (std::uint16_t)lua_tointeger(L, 5);

    ACTIONTYPE actiontype = ACTION_MAGIC_FINISH;
    switch (action)
    {
        case 3: actiontype = ACTION_WEAPONSKILL_FINISH; break;
        case 4: actiontype = ACTION_MAGIC_FINISH; break;
        case 5: actiontype = ACTION_ITEM_FINISH; break;
        case 6: actiontype = ACTION_JOBABILITY_FINISH; break;
        case 11: actiontype = ACTION_MOBABILITY_FINISH; break;
        case 13: actiontype = ACTION_PET_MOBABILITY_FINISH; break;
        case 14: actiontype = ACTION_DANCE; break;
    }

    action_t Action;

    Action.id = PChar->id;
    Action.actionid = 1;

    // If you use ACTION_MOBABILITY_FINISH, the first param = anim, the second param = skill id.
    if (actiontype == ACTION_MOBABILITY_FINISH || actiontype == ACTION_PET_MOBABILITY_FINISH)
    {
        CBattleEntity* PTarget = (CBattleEntity*)PChar->GetEntity(PChar->m_TargID);
        if (PTarget == nullptr)
        {
            ShowError("Cannot use MOBABILITY_FINISH on a nullptr battle target! Target a mob! \n");
            return 0;
        }
        Action.id = PTarget->id;
        Action.actiontype = actiontype;
        actionList_t& list = Action.getNewActionList();
        list.ActionTargetID = PChar->id;
        actionTarget_t& target = list.getNewActionTarget();
        target.animation = anim;
        target.param = 10;
        target.messageID = message;
        PTarget->loc.zone->PushPacket(PTarget, CHAR_INRANGE, new CActionPacket(Action));
        return 0;
    }

    Action.actiontype = actiontype;
    actionList_t& list = Action.getNewActionList();
    list.ActionTargetID = PChar->id;
    actionTarget_t& target = list.getNewActionTarget();
    target.animation = anim;
    target.param = 10;
    target.messageID = message;
    target.speceffect = speceffect;
    target.reaction = reaction;

    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CActionPacket(Action));

    return 0;
}

/************************************************************************
*                                                                       *
* Used to manipulate a MOB's entityFlags for testing. TODO: NPC's too   *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setMobFlags(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        std::uint32_t mobid = (std::uint32_t)lua_tointeger(L, 2);
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
            if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
            {
                ((CMobEntity*)PMob)->setEntityFlags((std::uint32_t)(lua_tointeger(L, 1)));
                PMob->updatemask |= UPDATE_HP;
            }
        }
    }
    else
    {
        CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
        CBattleEntity* PTarget = (CBattleEntity*)PChar->GetEntity(PChar->m_TargID);

        if (PTarget == nullptr)
        {
            ShowError("Must target a monster to use for setMobFlags \n");
            return 0;
        }
        else if (PTarget->objtype != TYPE_MOB)
        {
            ShowError("Battle target must be a monster to use setMobFlags \n");
            return 0;
        }
        if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
        {
            ((CMobEntity*)PTarget)->setEntityFlags((std::uint32_t)(lua_tointeger(L, 1)));
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

inline std::int32_t CLuaBaseEntity::showNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    std::uint32_t OpenTime = (!lua_isnil(L, 1) && lua_isnumber(L, 1)) ? (std::uint32_t)lua_tointeger(L, 1) * 1000 : 15000;

    m_PBaseEntity->status = STATUS_NORMAL;
    m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_UPDATE, UPDATE_COMBAT));

    m_PBaseEntity->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(OpenTime), false, [](CBaseEntity* PNpc)
    {
        PNpc->status = STATUS_DISAPPEAR;
        PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_DESPAWN, UPDATE_NONE));
    }));

    return 0;
}

/************************************************************************
* can be used by all npc for disappear a certain time                   *
* npc:hideNPC() : disappear for 15sec                                   *
* you can add time in second : hideNPC(30) : disappear for 30sec        *
************************************************************************/

inline std::int32_t CLuaBaseEntity::hideNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->status == STATUS_NORMAL)
    {
        std::uint32_t OpenTime = (!lua_isnil(L, 1) && lua_isnumber(L, 1)) ? (std::uint32_t)lua_tointeger(L, 1) * 1000 : 15000;

        m_PBaseEntity->status = STATUS_DISAPPEAR;
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PBaseEntity, ENTITY_DESPAWN, UPDATE_NONE));

        m_PBaseEntity->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(OpenTime), false, [](CBaseEntity* PNpc)
        {
            PNpc->status = STATUS_NORMAL;
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
        }));
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::updateNPCHideTime(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->status == STATUS_DISAPPEAR)
    {
        std::uint32_t OpenTime = (!lua_isnil(L, 1) && lua_isnumber(L, 1)) ? (std::uint32_t)lua_tointeger(L, 1) * 1000 : 15000;

        m_PBaseEntity->PAI->QueueAction(queueAction_t(std::chrono::milliseconds(OpenTime), false, [](CBaseEntity* PNpc)
        {
            PNpc->status = STATUS_NORMAL;
            PNpc->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc, ENTITY_UPDATE, UPDATE_COMBAT));
        }));
    }
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    const char* type = lua_tostring(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, charutils::GetPoints(PChar, type));

    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::setCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* type = lua_tostring(L, 1);
    std::int32_t amount = (std::int32_t)lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::SetPoints(PChar, type, amount);

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* type = lua_tostring(L, 1);
    std::int32_t amount = (std::int32_t)lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, type, amount);

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delCurrency(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* type = lua_tostring(L, 1);
    std::int32_t amount = (std::int32_t)lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, type, -amount);

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getCP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushinteger(L, charutils::GetPoints(PChar, charutils::GetConquestPointsName(PChar).c_str()));
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::addCP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::int32_t cp = (std::int32_t)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, charutils::GetConquestPointsName(PChar).c_str(), cp);
    PChar->pushPacket(new CConquestPacket(PChar));

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::delCP(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::int32_t cp = (std::int32_t)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    charutils::AddPoints(PChar, charutils::GetConquestPointsName(PChar).c_str(), -cp);
    PChar->pushPacket(new CConquestPacket(PChar));

    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::getSeals(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto type = lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::addSeals(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    auto points = (std::int32_t)lua_tointeger(L, 1);
    auto type = lua_tointeger(L, 2);
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

inline std::int32_t CLuaBaseEntity::delSeals(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    auto points = (std::int32_t)lua_tointeger(L, 1);
    auto type = lua_tointeger(L, 2);
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

inline std::int32_t CLuaBaseEntity::getAssaultPoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto region = lua_tointeger(L, 1);

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

inline std::int32_t CLuaBaseEntity::addAssaultPoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    auto region = lua_tointeger(L, 1);
    auto points = (std::int32_t)lua_tointeger(L, 2);
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

inline std::int32_t CLuaBaseEntity::delAssaultPoint(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    auto points = (std::int32_t)lua_tointeger(L, 1);
    auto region = lua_tointeger(L, 2);
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

inline std::int32_t CLuaBaseEntity::getNationTeleport(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    std::int32_t nation = (std::int32_t)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (nation)
    {
        case 0: lua_pushinteger(L, PChar->nationtp.sandoria); return 1; break;
        case 1: lua_pushinteger(L, PChar->nationtp.bastok); return 1; break;
        case 2: lua_pushinteger(L, PChar->nationtp.windurst); return 1; break;
        case 3: lua_pushinteger(L, PChar->nationtp.ahturhgan); return 1; break;
        case 4: lua_pushinteger(L, PChar->nationtp.maw); return 1; break;
        case 5: lua_pushinteger(L, PChar->nationtp.pastsandoria); return 1; break;
        case 6: lua_pushinteger(L, PChar->nationtp.pastbastok); return 1; break;
        case 7: lua_pushinteger(L, PChar->nationtp.pastwindurst); return 1; break;
        default:
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

inline std::int32_t CLuaBaseEntity::addNationTeleport(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint16_t nation = (std::uint16_t)lua_tointeger(L, 1);
    std::uint32_t newTP = (std::uint32_t)lua_tointeger(L, 2);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    switch (nation)
    {
        case 0: PChar->nationtp.sandoria |= newTP; break;
        case 1: PChar->nationtp.bastok |= newTP; break;
        case 2: PChar->nationtp.windurst |= newTP; break;
        case 3: PChar->nationtp.ahturhgan |= newTP; break;
        case 4: PChar->nationtp.maw |= newTP; break;
        case 5: PChar->nationtp.pastsandoria |= newTP; break;
        case 6: PChar->nationtp.pastbastok |= newTP; break;
        case 7: PChar->nationtp.pastwindurst |= newTP; break;
        default:
            ShowDebug(CL_CYAN"lua::addNationTeleport no region with this number!\n" CL_RESET);
            return 0;
    }

    charutils::SaveCharPoints(PChar);
    return 0;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::isBehind(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    auto angle = lua_gettop(L) > 1 ? lua_tointeger(L, 2) : 42;

    std::uint8_t turn = PLuaBaseEntity->GetBaseEntity()->loc.p.rotation - getangle(PLuaBaseEntity->GetBaseEntity()->loc.p, m_PBaseEntity->loc.p);

    lua_pushboolean(L, (turn > 128 - angle && turn < 128 + angle));

    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::isFacing(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    auto angle = (std::uint8_t)(lua_gettop(L) > 1 ? lua_tointeger(L, 2) : 45);

    DSP_DEBUG_BREAK_IF(PLuaBaseEntity == nullptr);

    lua_pushboolean(L, isFaceing(m_PBaseEntity->loc.p, PLuaBaseEntity->GetBaseEntity()->loc.p, angle));
    return 1;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getAngle(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::getStealItem(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DropList_t* DropList = itemutils::GetDropList(((CMobEntity*)m_PBaseEntity)->m_DropID);

    if (!(((CMobEntity*)m_PBaseEntity)->m_ItemStolen) && (DropList != nullptr && DropList->size()))
    {
        for (std::uint8_t i = 0; i < DropList->size(); ++i)
        {
            if (DropList->at(i).DropType == DROP_STEAL)
            {
                lua_pushinteger(L, DropList->at(i).ItemID);
                return 1;
            }
        }
    }
    lua_pushinteger(L, 0);
    return 1;
}

inline std::int32_t CLuaBaseEntity::itemStolen(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    ((CMobEntity*)m_PBaseEntity)->m_ItemStolen = true;
    lua_pushboolean(L, 1);
    return 1;
}

//==========================================================//

inline std::int32_t CLuaBaseEntity::checkDistance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;
    CBattleEntity* PMob = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();

    float calcdistance = distance(PBattle->loc.p, PMob->loc.p);

    lua_pushnumber(L, calcdistance);
    return 1;
}

inline std::int32_t CLuaBaseEntity::checkValorCredit(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);

    DSP_DEBUG_BREAK_IF(PLuaBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(PLuaBaseEntity->GetBaseEntity()->objtype != TYPE_MOB);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    CMobEntity* PMob = (CMobEntity*)PLuaBaseEntity->GetBaseEntity();

    bool credit = false;
    int lvlDiff = (int)(PMob->GetMLevel()) - (int)(PChar->GetMLevel());

    if (charutils::GetRealExp(PMob->m_HiPCLvl, PMob->GetMLevel()) && distance(PMob->loc.p, PChar->loc.p) < 100 && lvlDiff < 15)
    {
        if (PChar->PParty && PChar->PParty->GetSyncTarget())
        {
            if (distance(PMob->loc.p, PChar->PParty->GetSyncTarget()->loc.p) < 100 && PChar->PParty->GetSyncTarget()->health.hp)
            {
                credit = true;
            }
        }
        else
            credit = true;
    }

    lua_pushboolean(L, credit);
    return 1;
}

inline std::int32_t CLuaBaseEntity::checkSoloPartyAlliance(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    std::uint8_t SoloPartyAlliance = 0;
    if (PChar->PParty != nullptr)
    {
        SoloPartyAlliance = 1;
        if (PChar->PParty->m_PAlliance != nullptr) SoloPartyAlliance = 2;
    }

    lua_pushinteger(L, SoloPartyAlliance);
    return 1;
}

/************************************************************************
*                                                                       *
*   Checks whether alliances can do FoV pages                           *
*                                                                       *
************************************************************************/
inline std::int32_t CLuaBaseEntity::checkFovAllianceAllowed(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    std::uint8_t FovAlliance = map_config.fov_allow_alliance;

    lua_pushinteger(L, FovAlliance);
    return 1;
}

/************************************************************************
*                                                                       *
*   Charm a monster                                                     *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::charmPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity != nullptr)
    {
        if (m_PBaseEntity->objtype != TYPE_MOB)
        {
            CLuaBaseEntity* PEntity = Lunar<CLuaBaseEntity>::check(L, 1);
            battleutils::tryToCharm((CBattleEntity*)m_PBaseEntity, (CBattleEntity*)PEntity->GetBaseEntity());
        }
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::charm(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PTarget = Lunar<CLuaBaseEntity>::check(L, 1);
    battleutils::applyCharm((CBattleEntity*)m_PBaseEntity, (CBattleEntity*)PTarget->GetBaseEntity());

    return 0;
}

inline std::int32_t CLuaBaseEntity::uncharm(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    battleutils::unCharm((CBattleEntity*)m_PBaseEntity);

    return 0;
}

inline std::int32_t CLuaBaseEntity::getObjType(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->objtype);
    return 1;
}

inline std::int32_t CLuaBaseEntity::isPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->objtype == TYPE_PC);
    return 1;
}

inline std::int32_t CLuaBaseEntity::isNPC(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->objtype == TYPE_NPC);
    return 1;
}

inline std::int32_t CLuaBaseEntity::isMob(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->objtype == TYPE_MOB);
    return 1;
}

inline std::int32_t CLuaBaseEntity::isPet(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->objtype == TYPE_PET);
    return 1;
}

inline std::int32_t CLuaBaseEntity::isAlly(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->objtype == TYPE_MOB && m_PBaseEntity->allegiance == ALLEGIANCE_PLAYER);
    return 1;
}

inline std::int32_t CLuaBaseEntity::hasTrait(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (m_PBaseEntity->objtype != TYPE_PC)
    {
        lua_pushboolean(L, false);
        return 1;
    }

    lua_pushboolean(L, charutils::hasTrait((CCharEntity*)m_PBaseEntity, (std::uint8_t)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::getTrickAttackChar(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    CBattleEntity* PMob = (CBattleEntity*)PLuaBaseEntity->GetBaseEntity();
    if (PMob != nullptr)
    {
        CBattleEntity* taTarget = battleutils::getAvailableTrickAttackChar((CBattleEntity*)m_PBaseEntity, PMob);
        if (taTarget)
        {
            lua_getglobal(L, CLuaBaseEntity::className);
            lua_pushstring(L, "new");
            lua_gettable(L, -2);
            lua_insert(L, -2);
            lua_pushlightuserdata(L, taTarget);
            lua_pcall(L, 2, 1, 0);
            return 1;
        }
    }
    lua_pushnil(L);
    return 1;
}

inline std::int32_t CLuaBaseEntity::setDelay(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN]->setDelay((std::uint16_t)lua_tonumber(L, 1));
    return 0;
}

inline std::int32_t CLuaBaseEntity::setDamage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN]->setDamage((std::uint16_t)lua_tonumber(L, 1));
    return 0;
}

// cast spell in first parameter - if no parameter, cast any spell in the spell list
// optional target in second parameter
inline std::int32_t CLuaBaseEntity::castSpell(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (lua_isnumber(L, 1))
    {
        SpellID spellid = static_cast<SpellID>(lua_tointeger(L, 1));
        CBattleEntity* PTarget {nullptr};

        if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
        {
            CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
            PTarget = (CBattleEntity*)PLuaBaseEntity->m_PBaseEntity;
        }

        m_PBaseEntity->PAI->QueueAction(queueAction_t(0ms, true, [PTarget, spellid](auto PEntity) {
            if (PTarget)
                PEntity->PAI->Cast(PTarget->targid, spellid);
            else if (dynamic_cast<CMobEntity*>(PEntity))
                PEntity->PAI->Cast(static_cast<CMobEntity*>(PEntity)->GetBattleTargetID(), spellid);
        }));
    }
    else
    {
        m_PBaseEntity->PAI->QueueAction(queueAction_t(0ms, true, [](auto PEntity) {
            if (dynamic_cast<CMobEntity*>(PEntity))
                static_cast<CMobController*>(PEntity->PAI->GetController())->TryCastSpell();
        }));
    }
    return 0;
}
inline std::int32_t CLuaBaseEntity::useMobAbility(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB && m_PBaseEntity->objtype != TYPE_PET);

    if (lua_isnumber(L, 1))
    {
        auto skillid {(std::uint16_t)lua_tointeger(L, 1)};
        CBattleEntity* PTarget {nullptr};
        auto PMobSkill {battleutils::GetMobSkill(skillid)};

        if (!PMobSkill)
        {
            return 0;
        }

        if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
        {
            CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
            PTarget = (CBattleEntity*)PLuaBaseEntity->m_PBaseEntity;
        }

        m_PBaseEntity->PAI->QueueAction(queueAction_t(0ms, true, [PTarget, skillid, PMobSkill](auto PEntity) {
            if (PTarget)
                PEntity->PAI->MobSkill(PTarget->targid, skillid);
            else if (dynamic_cast<CMobEntity*>(PEntity))
            {
                if (PMobSkill->getValidTargets() & TARGET_ENEMY)
                    PEntity->PAI->MobSkill(static_cast<CMobEntity*>(PEntity)->GetBattleTargetID(), skillid);
                else if (PMobSkill->getValidTargets() & TARGET_SELF)
                    PEntity->PAI->MobSkill(PEntity->targid, skillid);
            }
        }));
    }
    else
    {
        m_PBaseEntity->PAI->QueueAction(queueAction_t(0ms, true, [](auto PEntity) {
            if (dynamic_cast<CMobEntity*>(PEntity))
                static_cast<CMobController*>(PEntity->PAI->GetController())->MobSkill();
        }));
    };

    return 0;
}

inline std::int32_t CLuaBaseEntity::useJobAbility(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (lua_isnumber(L, 1))
    {
        auto skillid {(std::uint16_t)lua_tointeger(L, 1)};
        CBattleEntity* PTarget {nullptr};

        if (!lua_isnil(L, 2) && lua_isuserdata(L, 2))
        {
            CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 2);
            PTarget = (CBattleEntity*)PLuaBaseEntity->m_PBaseEntity;
        }

        m_PBaseEntity->PAI->QueueAction(queueAction_t(0ms, true, [PTarget, skillid](auto PEntity) {
            if (PTarget)
                PEntity->PAI->Ability(PTarget->targid, skillid);
            else if (dynamic_cast<CMobEntity*>(PEntity))
                PEntity->PAI->Ability(static_cast<CMobEntity*>(PEntity)->GetBattleTargetID(), skillid);
        }));
    }

    return 0;
}

inline std::int32_t CLuaBaseEntity::actionQueueEmpty(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->PAI->QueueEmpty());

    return 1;
}

inline std::int32_t CLuaBaseEntity::actionQueueAbility(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    lua_pushboolean(L, m_PBaseEntity->GetLocalVar("actionQueueAction"));

    return 1;
}

inline std::int32_t CLuaBaseEntity::SetAutoAttackEnabled(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));

    m_PBaseEntity->PAI->GetController()->SetAutoAttackEnabled(lua_toboolean(L, 1));

    return 0;
}

inline std::int32_t CLuaBaseEntity::SetMagicCastingEnabled(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));

    m_PBaseEntity->PAI->GetController()->SetMagicCastingEnabled(lua_toboolean(L, 1));

    return 0;
}

inline std::int32_t CLuaBaseEntity::SetMobAbilityEnabled(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));

    m_PBaseEntity->PAI->GetController()->SetWeaponSkillEnabled(lua_toboolean(L, 1));

    return 0;
}

inline std::int32_t CLuaBaseEntity::SetMobSkillAttack(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    static_cast<CMobEntity*>(m_PBaseEntity)->setMobMod(MOBMOD_ATTACK_SKILL_LIST, (std::int16_t)lua_tointeger(L, 1));

    return 0;
}

inline std::int32_t CLuaBaseEntity::updateTarget(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    auto PTarget {((CMobEntity*)m_PBaseEntity)->PEnmityContainer->GetHighestEnmity()};

    if (PTarget)
    {
        ((CMobEntity*)m_PBaseEntity)->PAI->ChangeTarget(PTarget->targid);
    }

    return 0;
}

/************************************************************************
*                                                                       *
*   Gets a local var stored in the entity.                              *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::getLocalVar(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    const char* var = lua_tostring(L, 1);

    lua_pushinteger(L, m_PBaseEntity->GetLocalVar(var));

    return 1;
}

/************************************************************************
*                                                                       *
*  Sets a local var stored in the entity.                               *
*                                                                       *
************************************************************************/

inline std::int32_t CLuaBaseEntity::setLocalVar(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    const char* var = lua_tostring(L, 1);
    auto val = (std::uint32_t)lua_tointeger(L, 2);

    m_PBaseEntity->SetLocalVar(var, val);

    return 0;
}

inline std::int32_t CLuaBaseEntity::resetLocalVars(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    m_PBaseEntity->ResetLocalVars();

    return 0;
}

inline std::int32_t CLuaBaseEntity::setSpellList(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB && m_PBaseEntity->objtype != TYPE_PET);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    mobutils::SetSpellList(static_cast<CMobEntity *>(m_PBaseEntity), (std::uint16_t)lua_tonumber(L, 1));

    return 0;
}

inline std::int32_t CLuaBaseEntity::hasSpellList(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB && m_PBaseEntity->objtype != TYPE_PET);

    lua_pushboolean(L, (static_cast<CMobEntity *>(m_PBaseEntity))->SpellContainer->HasSpells());

    return 1;
}

inline std::int32_t CLuaBaseEntity::hasPreventActionEffect(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushboolean(L, (static_cast<CBattleEntity *>(m_PBaseEntity))->StatusEffectContainer->HasPreventActionEffect());

    return 1;
}

inline std::int32_t CLuaBaseEntity::hasValidJugPetItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CItemWeapon* PItem = static_cast<CItemWeapon *>(static_cast<CCharEntity *>(m_PBaseEntity)->getEquip(SLOT_AMMO));

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

inline std::int32_t CLuaBaseEntity::getTarget(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);


    auto PBattleTarget {m_PBaseEntity->GetEntity(static_cast<CBattleEntity*>(m_PBaseEntity)->GetBattleTargetID())};
    if (PBattleTarget)
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, PBattleTarget);
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    else
    {
        lua_pushnil(L);
        return 1;
    }
}

inline std::int32_t CLuaBaseEntity::hasTPMoves(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF((m_PBaseEntity->objtype == TYPE_NPC) || (m_PBaseEntity->objtype == TYPE_PC));

    std::uint16_t familyID = 0;

    if (m_PBaseEntity->objtype & TYPE_PET)
    {
        familyID = ((CPetEntity*)m_PBaseEntity)->m_Family;
    }
    else if (m_PBaseEntity->objtype & TYPE_MOB)
    {
        familyID = ((CMobEntity*)m_PBaseEntity)->m_Family;
    }
    const std::vector<std::uint16_t>& MobSkills = battleutils::GetMobSkillList(familyID);
    lua_pushboolean(L, MobSkills.size() != 0);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getMaster(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC)

        if (((CBattleEntity*)m_PBaseEntity)->PMaster != nullptr)
        {
            //std::uint32_t petid = (std::uint32_t);

            CBaseEntity* PMaster = ((CBattleEntity*)m_PBaseEntity)->PMaster;

            lua_getglobal(L, CLuaBaseEntity::className);
            lua_pushstring(L, "new");
            lua_gettable(L, -2);
            lua_insert(L, -2);
            lua_pushlightuserdata(L, (void*)PMaster);
            lua_pcall(L, 2, 1, 0);
            return 1;
        }
    lua_pushnil(L);
    return 1;
}

inline std::int32_t CLuaBaseEntity::recalculateAbilitiesTable(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::recalculateSkillsTable(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::isSpellAoE(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    CSpell* PSpell = spell::GetSpell(static_cast<SpellID>(lua_tointeger(L, 1)));

    if (PSpell != nullptr)
    {
        lua_pushboolean(L, battleutils::GetSpellAoEType(PEntity, PSpell) > 0);
    }
    else
    {
        lua_pushboolean(L, false);
    }

    return 1;
}

inline std::int32_t CLuaBaseEntity::getGender(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushnumber(L, PChar->GetGender());
    return 1;
}

inline std::int32_t CLuaBaseEntity::getBaseHP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushnumber(L, PEntity->health.maxhp);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getBaseMP(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushnumber(L, PEntity->health.maxmp);
    return 1;
}

inline std::int32_t CLuaBaseEntity::checkNameFlags(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    if (PChar->nameflags.flags & (std::uint32_t)lua_tonumber(L, 1))
        lua_pushboolean(L, true);
    else
        lua_pushboolean(L, false);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getGMLevel(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    lua_pushnumber(L, PChar->m_GMlevel);
    return 1;
}

inline std::int32_t CLuaBaseEntity::setGMLevel(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    PChar->m_GMlevel = (std::uint8_t)lua_tonumber(L, 1);
    charutils::SaveCharGMLevel(PChar);
    return 0;
}

inline std::int32_t CLuaBaseEntity::getGMHidden(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    lua_pushboolean(L, PChar->m_isGMHidden);
    return 1;
}

inline std::int32_t CLuaBaseEntity::setGMHidden(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::PrintToPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    CHAT_MESSAGE_TYPE messageType = (lua_isnil(L, 2) || !lua_isnumber(L, 2)) ? MESSAGE_SYSTEM_1 : (CHAT_MESSAGE_TYPE)lua_tointeger(L, 2);
    std::string name = (lua_isnil(L, 3) || !lua_isstring(L, 3)) ? std::string() : lua_tostring(L, 3);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CChatMessagePacket((CCharEntity*)m_PBaseEntity, messageType, (char*)lua_tostring(L, 1), name));
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
inline std::int32_t CLuaBaseEntity::pathThrough(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    std::uint8_t length = (std::uint8_t)lua_objlen(L, 1);

    std::vector<position_t> points;

    // Grab points from array and store in points array
    for (std::uint8_t i = 1; i < length; i += 3)
    {
        lua_rawgeti(L, 1, i);
        lua_rawgeti(L, 1, i + 1);
        lua_rawgeti(L, 1, i + 2);

        points.push_back({0, (float)lua_tointeger(L, -3), (float)lua_tointeger(L, -2), (float)lua_tointeger(L, -1), 0});

        lua_pop(L, 3);
    }

    std::uint8_t flags = 0;

    if (lua_isnumber(L, 2))
    {
        flags = (std::uint8_t)lua_tointeger(L, 2);
    }

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    if (PBattle->PAI->PathFind->PathThrough(std::move(points), flags))
    {
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
inline std::int32_t CLuaBaseEntity::atPoint(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    float posX = 0;
    float posY = 0;
    float posZ = 0;

    if (lua_isnumber(L, 1))
    {
        posX = (float)lua_tonumber(L, 1);
        posY = (float)lua_tonumber(L, 2);
        posZ = (float)lua_tonumber(L, 3);
    }
    else
    {
        // It's a table
        lua_rawgeti(L, 1, 1);
        posX = (float)lua_tonumber(L, -1);
        lua_pop(L, 1);

        lua_rawgeti(L, 1, 2);
        posY = (float)lua_tonumber(L, -1);
        lua_pop(L, 1);

        lua_rawgeti(L, 1, 3);
        posZ = (float)lua_tonumber(L, -1);
        lua_pop(L, 1);
    }

    lua_pushboolean(L, m_PBaseEntity->loc.p.x == posX && m_PBaseEntity->loc.p.y == posY && m_PBaseEntity->loc.p.z == posZ);

    return 1;
}

/*
Usage:

    npc:lookAt(-200, 10, -300);
    npc:lookAt({-200, 10, -300});
*/
inline std::int32_t CLuaBaseEntity::lookAt(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    float posX = 0;
    float posY = 0;
    float posZ = 0;

    if (lua_isnumber(L, 1))
    {
        posX = (float)lua_tonumber(L, 1);
        posY = (float)lua_tonumber(L, 2);
        posZ = (float)lua_tonumber(L, 3);
    }
    else
    {
        lua_getfield(L, 1, "x");
        posX = (float)lua_tonumber(L, -1);
        lua_getfield(L, 1, "y");
        posY = (float)lua_tonumber(L, -1);
        lua_getfield(L, 1, "z");
        posZ = (float)lua_tonumber(L, -1);
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
inline std::int32_t CLuaBaseEntity::isFollowingPath(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    lua_pushboolean(L, PBattle->PAI->PathFind != nullptr &&
        PBattle->PAI->PathFind->IsFollowingPath());

    return 1;
}

/*
Clears the current path and stops moving.
*/
inline std::int32_t CLuaBaseEntity::clearPath(lua_State* L)
{
    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    if (PBattle->PAI->PathFind != nullptr)
    {
        PBattle->PAI->PathFind->Clear();
    }

    return 0;
}

/*
Wait for a given number of milliseconds.

Usage:

    npc:wait(1000); -- wait one second
*/
inline std::int32_t CLuaBaseEntity::wait(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_PC);

    CBattleEntity* PBattle = (CBattleEntity*)m_PBaseEntity;

    std::int32_t waitTime = 4000;

    if (lua_isnumber(L, 1))
    {
        waitTime = (std::int32_t)lua_tonumber(L, 1);
    }
    PBattle->PAI->Inactive(std::chrono::milliseconds(waitTime), true);

    return 0;
}

inline std::int32_t CLuaBaseEntity::pathTo(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));

    position_t point;

    point.x = (float)lua_tonumber(L, 1);
    point.y = (float)lua_tonumber(L, 2);
    point.z = (float)lua_tonumber(L, 3);

    if (m_PBaseEntity->PAI->PathFind)
    {
        m_PBaseEntity->PAI->PathFind->PathTo(point, PATHFLAG_RUN | PATHFLAG_WALLHACK | PATHFLAG_SCRIPT);
    }

    return 0;
}

inline std::int32_t CLuaBaseEntity::unlockAttachment(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    auto itemID = (std::uint16_t)lua_tointeger(L, -1);

    CItem* PItem = itemutils::GetItem(itemID);
    lua_pushboolean(L, puppetutils::UnlockAttachment((CCharEntity*)m_PBaseEntity, PItem));
    return 1;
}

inline std::int32_t CLuaBaseEntity::hasAttachment(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, -1) || !lua_isnumber(L, -1));

    auto itemID = (std::uint16_t)lua_tointeger(L, -1);

    CItem* PItem = itemutils::GetItem(itemID);
    lua_pushboolean(L, puppetutils::HasAttachment((CCharEntity*)m_PBaseEntity, PItem));
    return 1;
}

inline std::int32_t CLuaBaseEntity::disableLevelSync(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    if (PChar->PParty)
    {
        if (PChar->PParty->GetSyncTarget() == PChar)
            PChar->PParty->SetSyncTarget(nullptr, 553);
        else
            PChar->PParty->DisableSync();
    }

    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CCharSyncPacket(PChar));
    return 0;
}

inline std::int32_t CLuaBaseEntity::updateHealth(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    ((CBattleEntity*)m_PBaseEntity)->UpdateHealth();
    return 0;
}

inline std::int32_t CLuaBaseEntity::fold(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;
    PEntity->StatusEffectContainer->Fold(PEntity->id);

    return 0;
}

inline std::int32_t CLuaBaseEntity::hasCorsairEffect(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushboolean(L, PEntity->StatusEffectContainer->HasCorsairEffect(PEntity->id));

    return 1;
}

inline std::int32_t CLuaBaseEntity::initNpcAi(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    m_PBaseEntity->PAI = std::make_unique<CAIContainer>(m_PBaseEntity, std::make_unique<CPathFind>(m_PBaseEntity), nullptr, nullptr);
    return 0;
}

inline std::int32_t CLuaBaseEntity::isNM(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::setUnkillable(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    ((CBattleEntity*)m_PBaseEntity)->m_unkillable = lua_toboolean(L, 1);

    return 0;

}

inline std::int32_t CLuaBaseEntity::getBattlefield(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattlefield* PBattlefield = m_PBaseEntity->PBCNM;
    if (m_PBaseEntity->loc.zone && m_PBaseEntity->loc.zone->m_BattlefieldHandler)
    {
        auto PChar = dynamic_cast<CCharEntity*>(m_PBaseEntity);
        CStatusEffect* PStatusEffect = nullptr;

        if (PChar && (PStatusEffect = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD)))
            PBattlefield = m_PBaseEntity->loc.zone->m_BattlefieldHandler->getBattlefield(PChar->loc.zone->GetCharByID(PStatusEffect->GetSubID()));
    }

    if (PBattlefield)
    {
        lua_getglobal(L, CLuaBattlefield::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PBattlefield);
        lua_pcall(L, 2, 1, 0);
        return 1;
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

inline std::int32_t CLuaBaseEntity::SendRevision(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    char version[100];
    strcpy(version, "Revision is: ");
    strcat(version, get_git_revision());
    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CChatMessagePacket((CCharEntity*)m_PBaseEntity, MESSAGE_SYSTEM_1, version));

    return 0;
}


inline std::int32_t CLuaBaseEntity::getNewPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    lua_pushboolean(L, ((CCharEntity*)m_PBaseEntity)->m_isNewPlayer);
    return 1;
}

inline std::int32_t CLuaBaseEntity::setNewPlayer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    PChar->m_isNewPlayer = lua_toboolean(L, 1);
    PChar->updatemask |= UPDATE_HP;
    charutils::SaveCharJob(PChar, PChar->GetMJob());
    return 0;
}

inline std::int32_t CLuaBaseEntity::getMentor(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    lua_pushnumber(L, PChar->m_mentor);
    return 1;
}

inline std::int32_t CLuaBaseEntity::setMentor(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    PChar->m_mentor = (std::uint8_t)lua_tonumber(L, 1);
    charutils::mentorMode(PChar);
    PChar->updatemask |= UPDATE_HP;
    return 0;
}

inline std::int32_t CLuaBaseEntity::hideName(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));

    m_PBaseEntity->HideName(lua_toboolean(L, 1));
    return 0;
}

inline std::int32_t CLuaBaseEntity::untargetable(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::hideHP(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::hideModel(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isboolean(L, 1));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB && m_PBaseEntity->objtype != TYPE_NPC);

    if (m_PBaseEntity->objtype == TYPE_MOB)
    {
        ((CMobEntity*)m_PBaseEntity)->HideModel(lua_toboolean(L, 1));
    }
    else if (m_PBaseEntity->objtype == TYPE_NPC)
    {
        ((CNpcEntity*)m_PBaseEntity)->HideModel(lua_toboolean(L, 1));
    }
    m_PBaseEntity->updatemask |= UPDATE_HP;
    return 0;
}

inline std::int32_t CLuaBaseEntity::entityVisualPacket(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    std::int32_t n = lua_gettop(L);
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

inline std::int32_t CLuaBaseEntity::entityAnimationPacket(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::getPartyLeader(lua_State* L) // Todo: also add ability for find Alliance Leader via lua?
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    if (PChar->PParty)
    {
        CBattleEntity* PLeader = PChar->PParty->GetLeader();
        if (PLeader != nullptr)
        {
            lua_getglobal(L, CLuaBaseEntity::className);
            lua_pushstring(L, "new");
            lua_gettable(L, -2);
            lua_insert(L, -2);
            lua_pushlightuserdata(L, (void*)PLeader);
            lua_pcall(L, 2, 1, 0);
            return 1;
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

inline std::int32_t CLuaBaseEntity::getParty(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::getAlliance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;

    int size = 1;

    if (PChar->PParty && PChar->PParty->m_PAlliance)
    {
        size = 0;
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
    int i = 1;

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

inline std::int32_t CLuaBaseEntity::messageText(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    CBaseEntity* PTarget = PLuaBaseEntity->m_PBaseEntity;

    std::uint16_t messageID = (std::uint16_t)lua_tointeger(L, 2);

    bool showName = true;
    std::uint8_t mode = 0;

    if (!lua_isnil(L, 3))
    {
        if (lua_isboolean(L, 3))
            showName = lua_toboolean(L, 3);
        else if (lua_isnumber(L, 3))
            mode = (std::uint8_t)lua_tointeger(L, 3);
    }

    if (!lua_isnil(L, 4) && lua_isnumber(L, 4))
    {
        mode = (std::uint8_t)lua_tointeger(L, 4);
    }

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CMessageTextPacket(PTarget, messageID, showName, mode));
    }
    else
    {//broadcast in range
        m_PBaseEntity->loc.zone->PushPacket(m_PBaseEntity, CHAR_INRANGE, new CMessageTextPacket(PTarget, messageID, showName, mode));
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::instanceEntry(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    CLuaBaseEntity* PLuaBaseEntity = Lunar<CLuaBaseEntity>::check(L, 1);
    CBaseEntity* PTarget = PLuaBaseEntity->m_PBaseEntity;

    auto response = (std::uint32_t)lua_tointeger(L, 2);

    ((CCharEntity*)m_PBaseEntity)->pushPacket(new CInstanceEntryPacket(PTarget, response));

    return 0;
}

inline std::int32_t CLuaBaseEntity::getInstance(lua_State* L)
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

inline std::int32_t CLuaBaseEntity::breathDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushinteger(L, battleutils::BreathDmgTaken((CBattleEntity*)m_PBaseEntity, (std::int32_t)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::magicDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2) && lua_tointeger(L, 2) > 0 && lua_tointeger(L, 2) < 9)
        lua_pushinteger(L, battleutils::MagicDmgTaken((CBattleEntity*)m_PBaseEntity, (std::int32_t)lua_tointeger(L, 1), (ELEMENT)lua_tointeger(L, 2)));
    else
        lua_pushinteger(L, battleutils::MagicDmgTaken((CBattleEntity*)m_PBaseEntity, (std::int32_t)lua_tointeger(L, 1), ELEMENT_NONE));

    return 1;
}

inline std::int32_t CLuaBaseEntity::physicalDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushinteger(L, battleutils::PhysicalDmgTaken((CBattleEntity*)m_PBaseEntity, (std::int32_t)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::rangedDmgTaken(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    lua_pushinteger(L, battleutils::RangedDmgTaken((CBattleEntity*)m_PBaseEntity, (std::int32_t)lua_tointeger(L, 1)));
    return 1;
}

inline std::int32_t CLuaBaseEntity::setInstance(lua_State *L)
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

inline std::int32_t CLuaBaseEntity::createInstance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    std::uint8_t instanceid = (std::uint8_t)lua_tonumber(L, 1);
    std::uint16_t zoneid = (std::uint16_t)lua_tonumber(L, 2);

    instanceutils::LoadInstance(instanceid, zoneid, (CCharEntity*)m_PBaseEntity);

    return 0;
}

inline std::int32_t CLuaBaseEntity::getEnmityList(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    EnmityList_t* enmityList = ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->GetEnmityList();

    if (enmityList)
    {
        lua_createtable(L, (int)enmityList->size(), 0);
        int i = 1;
        for (auto member : *enmityList)
        {
            if (member.second.PEnmityOwner)
            {
                lua_createtable(L, 0, 4);
                //push entity
                lua_getglobal(L, CLuaBaseEntity::className);
                lua_pushstring(L, "new");
                lua_gettable(L, -2);
                lua_insert(L, -2);
                lua_pushlightuserdata(L, (void*)member.second.PEnmityOwner);
                lua_pcall(L, 2, 1, 0);
                lua_setfield(L, -2, "entity");
                //push ce
                lua_pushinteger(L, member.second.CE);
                lua_setfield(L, -2, "ce");
                //push ve
                lua_pushinteger(L, member.second.VE);
                lua_setfield(L, -2, "ve");
                //push active
                lua_pushboolean(L, member.second.active);
                lua_setfield(L, -2, "active");

                //push tameable
                lua_pushboolean(L, ((CMobEntity*)m_PBaseEntity)->PEnmityContainer->IsTameable());
                lua_setfield(L, -2, "tameable");

                //assign table to key's value
                lua_rawseti(L, -2, i++);
            }
        }
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

inline std::int32_t CLuaBaseEntity::isSpawned(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    lua_pushboolean(L, static_cast<CMobEntity*>(m_PBaseEntity)->PAI->IsSpawned());

    return 1;
}

inline std::int32_t CLuaBaseEntity::spawn(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    CMobEntity* PMob = (CMobEntity*)m_PBaseEntity;

    if (!lua_isnil(L, 1) && lua_isnumber(L, 1))
    {
        PMob->SetDespawnTime(std::chrono::seconds(lua_tointeger(L, 2)));
    }

    if (!lua_isnil(L, 2) && lua_isnumber(L, 2))
    {
        PMob->m_RespawnTime = (std::uint32_t)lua_tointeger(L, 3) * 1000;
        PMob->m_AllowRespawn = true;
    }
    else
    {
        if (!PMob->PAI->IsSpawned())
        {
            PMob->Spawn();
        }
        else
        {
            ShowDebug(CL_CYAN"SpawnMob: <%s> is already spawned\n" CL_RESET, PMob->GetName());
        }
    }
    return 0;
}

inline std::int32_t CLuaBaseEntity::getCurrentAction(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    if (m_PBaseEntity->PAI->IsStateStackEmpty())
    {
        lua_pushinteger(L, 16);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CRespawnState>())
    {
        lua_pushinteger(L, 0);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CAttackState>())
    {
        lua_pushinteger(L, 1);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CRangeState>())
    {
        lua_pushinteger(L, 12);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CWeaponSkillState>())
    {
        lua_pushinteger(L, 3);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CMagicState>())
    {
        lua_pushinteger(L, 30);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CItemState>())
    {
        lua_pushinteger(L, 28);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CAbilityState>())
    {
        lua_pushinteger(L, 6);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CInactiveState>())
    {
        lua_pushinteger(L, 27);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CDeathState>())
    {
        lua_pushinteger(L, 22);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CRaiseState>())
    {
        lua_pushinteger(L, 37);
    }
    else if (m_PBaseEntity->PAI->IsCurrentState<CMobSkillState>())
    {
        lua_pushinteger(L, 34);
    }
    else
    {
        lua_pushnil(L);
    }

    return 1;
}

inline std::int32_t CLuaBaseEntity::getAllegiance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->allegiance);

    return 1;
}

inline std::int32_t CLuaBaseEntity::setAllegiance(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ALLEGIANCETYPE allegiance = (ALLEGIANCETYPE)lua_tointeger(L, 1);

    m_PBaseEntity->allegiance = allegiance;
    return 0;
}

inline std::int32_t CLuaBaseEntity::stun(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    m_PBaseEntity->PAI->Inactive(std::chrono::milliseconds(lua_tointeger(L, 1)), false);

    return 0;
}

inline std::int32_t CLuaBaseEntity::weaknessTrigger(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    mobutils::WeaknessTrigger(m_PBaseEntity, (WeaknessType)lua_tointeger(L, 1));

    return 0;
}

inline std::int32_t CLuaBaseEntity::setBehaviour(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Behaviour = (std::uint16_t)lua_tointeger(L, 1);

    return 0;
}

inline std::int32_t CLuaBaseEntity::getBehaviour(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    lua_pushinteger(L, ((CMobEntity*)m_PBaseEntity)->m_Behaviour);

    return 1;
}

inline std::int32_t CLuaBaseEntity::reloadParty(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    ((CCharEntity*)m_PBaseEntity)->ReloadPartyInc();

    return 0;
}

inline std::int32_t CLuaBaseEntity::setModelId(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

        switch ((SLOTTYPE)lua_tointeger(L, 2))
        {
            case SLOT_MAIN:
                m_PBaseEntity->look.main = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_SUB:
                m_PBaseEntity->look.sub = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_RANGED:
                m_PBaseEntity->look.ranged = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_HEAD:
                m_PBaseEntity->look.head = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_BODY:
                m_PBaseEntity->look.body = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_HANDS:
                m_PBaseEntity->look.hands = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_LEGS:
                m_PBaseEntity->look.legs = (std::uint16_t)lua_tointeger(L, 1);
                break;
            case SLOT_FEET:
                m_PBaseEntity->look.feet = (std::uint16_t)lua_tointeger(L, 1);
                break;
            default:
                break;
        }
        ((CCharEntity*)m_PBaseEntity)->pushPacket(new CCharAppearancePacket((CCharEntity*)m_PBaseEntity));
    }
    else
    {
        DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

        m_PBaseEntity->SetModelId((std::uint16_t)lua_tointeger(L, 1));
    }
    m_PBaseEntity->updatemask |= UPDATE_LOOK;

    return 0;
}

inline std::int32_t CLuaBaseEntity::getModelId(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, m_PBaseEntity->GetModelId());

    return 1;
}

inline std::int32_t CLuaBaseEntity::setTrueDetection(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_TrueDetection = lua_tointeger(L, -1);

    return 0;
}

inline std::int32_t CLuaBaseEntity::setAggressive(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    ((CMobEntity*)m_PBaseEntity)->m_Aggro = lua_tointeger(L, -1);

    return 0;
}

inline std::int32_t CLuaBaseEntity::instantiateMob(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CMobEntity* newMob = mobutils::InstantiateAlly((std::uint32_t)lua_tointeger(L, 1), m_PBaseEntity->getZone());

    newMob->loc.p = m_PBaseEntity->loc.p;
    newMob->m_SpawnPoint = newMob->loc.p;
    newMob->Spawn();

    return 0;
}

inline std::int32_t CLuaBaseEntity::getActiveManeuvers(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    lua_pushinteger(L, PEntity->StatusEffectContainer->GetActiveManeuvers());

    return 1;
}

inline std::int32_t CLuaBaseEntity::removeOldestManeuver(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    PEntity->StatusEffectContainer->RemoveOldestManeuver();

    return 0;
}

inline std::int32_t CLuaBaseEntity::addBurden(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));

    if (((CBattleEntity*)m_PBaseEntity)->PPet && ((CPetEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->getPetType() == PETTYPE_AUTOMATON)
    {
        lua_pushinteger(L, ((CAutomatonEntity*)((CBattleEntity*)m_PBaseEntity)->PPet)->addBurden((std::uint8_t)lua_tointeger(L, 1), (std::int8_t)lua_tointeger(L, 2)));
    }
    else
    {
        lua_pushinteger(L, 0);
    }
    return 1;
}

inline std::int32_t CLuaBaseEntity::removeAllManeuvers(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity;

    PEntity->StatusEffectContainer->RemoveAllManeuvers();

    return 0;
}

inline std::int32_t CLuaBaseEntity::setElevator(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 3));

    Elevator_t elevator;

    // id should be 0 for most elevators, except special ones such as port bastok drawbridge
    elevator.id = (std::uint8_t)lua_tointeger(L, 1);
    elevator.LowerDoor = (CNpcEntity*)zoneutils::GetEntity((std::uint32_t)lua_tointeger(L, 2), TYPE_NPC);
    elevator.UpperDoor = (CNpcEntity*)zoneutils::GetEntity((std::uint32_t)lua_tointeger(L, 3), TYPE_NPC);
    elevator.Elevator = (CNpcEntity*)zoneutils::GetEntity((std::uint32_t)lua_tointeger(L, 4), TYPE_NPC);

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

inline std::int32_t CLuaBaseEntity::storeWithPorterMoogle(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    lua_settop(L, 3);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_istable(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_istable(L, 3));

    auto slipId = (std::uint16_t)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto slipSlotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(slipId);
    if (slipSlotId == 255) { return 0; }
    auto slip = PChar->getStorage(LOC_INVENTORY)->GetItem(slipSlotId);

    auto extraSize = lua_objlen(L, 2);
    lua_pushnil(L);
    for (size_t i = 0; i < extraSize && lua_next(L, 2) != 0; i++)
    {
        auto extra = (std::uint8_t)lua_tonumber(L, -1);
        if ((slip->m_extra[i] & extra) != 0)
        {
            lua_pushinteger(L, 1);
            return 1;
        }
        slip->m_extra[i] |= extra;
        lua_pop(L, 1);
    }

    auto storableSize = lua_objlen(L, 3);
    std::uint16_t storedItemIds[7];

    lua_pushnil(L);
    for (size_t i = 0; i < storableSize && lua_next(L, 3) != 0; i++)
    {
        auto itemId = (std::uint16_t)lua_tonumber(L, -1);
        if (itemId != 0)
        {
            storedItemIds[i] = itemId;
        }
        else
        {
            storedItemIds[i] = 0;
        }
        lua_pop(L, 1);
    }

    for (auto itemId : storedItemIds)
    {
        if (itemId != 0)
        {
            auto slotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(itemId);
            if (slotId != 255)
            {
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

    char extra[sizeof(slip->m_extra) * 2 + 1];
    Sql_EscapeStringLen(SqlHandle, extra, (const char*)slip->m_extra, sizeof(slip->m_extra));

    const char* Query =
        "UPDATE char_inventory "
        "SET extra = '%s' "
        "WHERE charid = %u AND location = %u AND slot = %u;";

    Sql_Query(SqlHandle, Query, extra, PChar->id, slip->getLocationID(), slip->getSlotID());

    lua_pushinteger(L, 0);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getRetrievableItemsForSlip(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    lua_settop(L, 1);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto slipId = (std::uint16_t)lua_tointeger(L, 1);
    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto slipSlotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(slipId);
    if (slipSlotId == 255) { return 0; }
    auto slip = PChar->getStorage(LOC_INVENTORY)->GetItem(slipSlotId);

    lua_newtable(L);
    // TODO Is extra sized defined anywhere?
    for (int i = 0; i < 24; i++)
    {
        lua_pushnumber(L, slip->m_extra[i]);
        lua_rawseti(L, -2, i + 1);
    }

    return 1;
}

inline std::int32_t CLuaBaseEntity::retrieveItemFromSlip(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);
    lua_settop(L, 4);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isnumber(L, 4));

    auto slipId = (std::uint16_t)lua_tointeger(L, 1);
    auto itemId = (std::uint16_t)lua_tointeger(L, 2);
    auto extraId = (std::uint16_t)lua_tointeger(L, 3);
    auto extraData = (std::uint8_t)lua_tointeger(L, 4);

    CCharEntity* PChar = (CCharEntity*)m_PBaseEntity;
    auto slipSlotId = PChar->getStorage(LOC_INVENTORY)->SearchItem(slipId);
    if (slipSlotId == 255) { return 0; }
    auto slip = PChar->getStorage(LOC_INVENTORY)->GetItem(slipSlotId);

    slip->m_extra[extraId] &= extraData;

    char extra[sizeof(slip->m_extra) * 2 + 1];
    Sql_EscapeStringLen(SqlHandle, extra, (const char*)slip->m_extra, sizeof(slip->m_extra));

    const char* Query =
        "UPDATE char_inventory "
        "SET extra = '%s' "
        "WHERE charid = %u AND location = %u AND slot = %u;";

    Sql_Query(SqlHandle, Query, extra, PChar->id, slip->getLocationID(), slip->getSlotID());

    auto item = itemutils::GetItem(itemId);
    item->setQuantity(1);
    charutils::AddItem(PChar, LOC_INVENTORY, item);

    return 0;
}

inline std::int32_t CLuaBaseEntity::getILvlMacc(lua_State *L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->m_Weapons[SLOT_MAIN]->getILvlMacc());

    return 1;
}

inline std::int32_t CLuaBaseEntity::getConfrontationEffect(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    lua_pushinteger(L, ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->GetConfrontationEffect());
    return 1;
}

inline std::int32_t CLuaBaseEntity::copyConfrontationEffect(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);

    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CBattleEntity* PEntity = (CBattleEntity*)m_PBaseEntity->GetEntity((std::uint16_t)lua_tointeger(L, 1), TYPE_PC | TYPE_MOB);

    std::uint16_t power = 0;

    if (PEntity && PEntity->StatusEffectContainer->GetConfrontationEffect())
    {
        ((CBattleEntity*)m_PBaseEntity)->StatusEffectContainer->CopyConfrontationEffect(PEntity);
        power = PEntity->StatusEffectContainer->GetConfrontationEffect();
    }

    lua_pushinteger(L, power);
    return 1;
}

std::int32_t CLuaBaseEntity::queue(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isfunction(L, 2));

    auto ms = (int)lua_tointeger(L, 1);

    m_PBaseEntity->PAI->QueueAction(queueAction_t(ms, true, luautils::register_fp(2)));

    return 0;
}

std::int32_t CLuaBaseEntity::timer(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isfunction(L, 2));

    auto ms = (int)lua_tointeger(L, 1);

    m_PBaseEntity->PAI->QueueAction(queueAction_t(ms, false, luautils::register_fp(2)));

    return 0;
}

std::int32_t CLuaBaseEntity::addListener(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isstring(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isfunction(L, 3));

    auto eventName = lua_tostring(L, 1);
    auto identifier = lua_tostring(L, 2);

    m_PBaseEntity->PAI->EventHandler.addListener(eventName, luautils::register_fp(3), identifier);

    return 0;
}

std::int32_t CLuaBaseEntity::removeListener(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    auto identifier = lua_tostring(L, 1);

    m_PBaseEntity->PAI->EventHandler.removeListener(identifier);

    return 0;
}

std::int32_t CLuaBaseEntity::triggerListener(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isstring(L, 1));

    auto eventName = lua_tostring(L, 1);
    auto top = lua_gettop(L);

    m_PBaseEntity->PAI->EventHandler.triggerListener(eventName, top - 1);

    return 0;
}

std::int32_t CLuaBaseEntity::removeAmmo(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    battleutils::RemoveAmmo(static_cast<CCharEntity*>(m_PBaseEntity));
    return 0;
}

std::int32_t CLuaBaseEntity::takeWeaponskillDamage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isuserdata(L, 1));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 2) || !lua_isnumber(L, 2));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 3) || !lua_isnumber(L, 3));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 4) || !lua_isboolean(L, 4));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 5) || !lua_isnumber(L, 5));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 6) || !lua_isnumber(L, 6));
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 7) || !lua_isnumber(L, 7));

    auto PChar = static_cast<CCharEntity*>(Lunar<CLuaBaseEntity>::check(L, 1)->m_PBaseEntity);
    auto damage = (std::int32_t)lua_tointeger(L, 2);
    auto slot = (std::uint8_t)lua_tointeger(L, 3);
    auto primary = lua_toboolean(L, 4);
    auto tpMultiplier = (float)lua_tonumber(L, 5);
    auto bonusTP = (std::uint16_t)lua_tointeger(L, 6);
    auto targetTPMultiplier = (float)lua_tonumber(L, 7);

    lua_pushinteger(L, (lua_Integer)battleutils::TakeWeaponskillDamage(PChar, static_cast<CBattleEntity*>(m_PBaseEntity), damage, slot, primary, tpMultiplier, bonusTP, targetTPMultiplier));
    return 1;
}

std::int32_t CLuaBaseEntity::handleAfflatusMiseryDamage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype == TYPE_NPC);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto damage = (std::int32_t)lua_tointeger(L, 1);

    battleutils::HandleAfflatusMiseryDamage(static_cast<CBattleEntity*>(m_PBaseEntity), damage);

    return 0;
}


std::int32_t CLuaBaseEntity::setEquipBlock(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        auto PChar {static_cast<CCharEntity*>(m_PBaseEntity)};
        PChar->m_EquipBlock = (std::uint16_t)lua_tointeger(L, 1);
        PChar->pushPacket(new CCharJobsPacket(PChar));
    }
    return 0;
}

std::int32_t CLuaBaseEntity::setStatDebilitation(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        auto PChar {static_cast<CCharEntity*>(m_PBaseEntity)};
        PChar->m_StatsDebilitation = (std::uint16_t)lua_tointeger(L, 1);
        PChar->pushPacket(new CCharJobsPacket(PChar));
    }
    return 0;
}

std::int32_t CLuaBaseEntity::unequipItem(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        auto PChar {static_cast<CCharEntity*>(m_PBaseEntity)};
        charutils::UnequipItem(PChar, (std::uint8_t)lua_tointeger(L, 1));
    }
    return 0;
}

std::int32_t CLuaBaseEntity::recalculateStats(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    if (m_PBaseEntity->objtype == TYPE_PC)
    {
        auto PChar {static_cast<CCharEntity*>(m_PBaseEntity)};
        charutils::BuildingCharSkillsTable(PChar);
        charutils::CalculateStats(PChar);
        charutils::CheckValidEquipment(PChar);
        charutils::BuildingCharAbilityTable(PChar);
        charutils::BuildingCharTraitsTable(PChar);

        PChar->UpdateHealth();

        PChar->pushPacket(new CCharJobsPacket(PChar));
        PChar->pushPacket(new CCharStatsPacket(PChar));
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharRecastPacket(PChar));
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CMenuMeritPacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }
    return 0;
}

std::int32_t CLuaBaseEntity::checkImbuedItems(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PC);

    auto PChar {static_cast<CCharEntity*>(m_PBaseEntity)};

    for (std::uint8_t LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
    {
        bool found = false;
        PChar->getStorage(LocID)->ForEachItem([&found](CItem* PItem)
        {
            if (PItem->getID() >= 5365 && PItem->getID() <= 5384)
            {
                found = true;
            }
        });
        if (found)
        {
            lua_pushboolean(L, true);
            return 1;
        }
    }
    lua_pushboolean(L, false);
    return 1;
}

inline std::int32_t CLuaBaseEntity::getNearbyEntities(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CCharEntity* iterTarget = (CCharEntity*)(m_PBaseEntity->objtype == TYPE_PC ? m_PBaseEntity : nullptr);

    if (!iterTarget)
    {
        if (m_PBaseEntity->objtype == TYPE_MOB && ((CBattleEntity*)m_PBaseEntity)->GetBattleTarget()->objtype == TYPE_PC)
        {
            iterTarget = (CCharEntity*)((CBattleEntity*)m_PBaseEntity)->GetBattleTarget();
        }
        else if (((CBattleEntity*)m_PBaseEntity)->PMaster && ((CBattleEntity*)m_PBaseEntity)->PMaster->objtype == TYPE_PC)
        {
            iterTarget = (CCharEntity*)((CBattleEntity*)m_PBaseEntity)->PMaster;
        }
    }

    lua_newtable(L);
    int newTable = lua_gettop(L);

    for (auto&& list : {iterTarget->SpawnMOBList, iterTarget->SpawnPCList, iterTarget->SpawnPETList})
    {
        for (auto&& entity : list)
        {
            lua_getglobal(L, CLuaBaseEntity::className);
            lua_pushstring(L, "new");
            lua_gettable(L, -2);
            lua_insert(L, -2);
            lua_pushlightuserdata(L, (void*)entity.second);
            lua_pcall(L, 2, 1, 0);
            lua_rawseti(L, newTable, entity.first);
        }
    }

    return 1;
}

std::int32_t CLuaBaseEntity::getAutomatonFrame(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PET || static_cast<CPetEntity*>(m_PBaseEntity)->getPetType() != PETTYPE_AUTOMATON);

    lua_pushinteger(L, static_cast<CAutomatonEntity*>(m_PBaseEntity)->getFrame());

    return 1;
}

std::int32_t CLuaBaseEntity::getAutomatonHead(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_PET || static_cast<CPetEntity*>(m_PBaseEntity)->getPetType() != PETTYPE_AUTOMATON);

    lua_pushinteger(L, static_cast<CAutomatonEntity*>(m_PBaseEntity)->getHead());

    return 1;
}

std::int32_t CLuaBaseEntity::getDropID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);

    lua_pushinteger(L, static_cast<CMobEntity*>(m_PBaseEntity)->m_DropID);
    return 1;
}

std::int32_t CLuaBaseEntity::setDropID(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(m_PBaseEntity->objtype != TYPE_MOB);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    static_cast<CMobEntity*>(m_PBaseEntity)->m_DropID = (std::uint32_t)lua_tointeger(L, 1);
    return 0;
}

std::int32_t CLuaBaseEntity::resetAI(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    m_PBaseEntity->PAI->Reset();
    return 0;
}

//get another entity by targid (using instance and zone of this entity)
std::int32_t CLuaBaseEntity::getEntity(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    auto PEntity {m_PBaseEntity->GetEntity((std::uint16_t)lua_tointeger(L,1))};
    if (PEntity)
    {
        lua_getglobal(L, CLuaBaseEntity::className);
        lua_pushstring(L, "new");
        lua_gettable(L, -2);
        lua_insert(L, -2);
        lua_pushlightuserdata(L, (void*)PEntity);
        lua_pcall(L, 2, 1, 0);
    }
    else
    {
        lua_pushnil(L);
    }
    return 1;
}

std::int32_t CLuaBaseEntity::canChangeState(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    lua_pushboolean(L, m_PBaseEntity->PAI->CanChangeState());
    return 1;
}

std::int32_t CLuaBaseEntity::isAlive(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    lua_pushboolean(L, static_cast<CBattleEntity*>(m_PBaseEntity)->isAlive());
    return 1;
}

std::int32_t CLuaBaseEntity::isDead(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    lua_pushboolean(L, static_cast<CBattleEntity*>(m_PBaseEntity)->isDead());
    return 1;
}

std::int32_t CLuaBaseEntity::engage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);
    DSP_DEBUG_BREAK_IF(lua_isnil(L, 1) || !lua_isnumber(L, 1));

    CBattleEntity* battleEntity = static_cast<CBattleEntity*>(m_PBaseEntity);
    auto requestedTarget = (std::uint16_t)lua_tointeger(L,1);

    if (requestedTarget > 0)
    {
        battleEntity->PAI->Engage(requestedTarget);
    }

    return 0;
}

std::int32_t CLuaBaseEntity::disengage(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    CBattleEntity* battleEntity = static_cast<CBattleEntity*>(m_PBaseEntity);
    battleEntity->PAI->Disengage();

    return 0;
}

std::int32_t CLuaBaseEntity::isEngaged(lua_State* L)
{
    DSP_DEBUG_BREAK_IF(m_PBaseEntity == nullptr);

    lua_pushboolean(L, m_PBaseEntity->PAI->IsEngaged());
    return 1;
}

//==========================================================//

const char CLuaBaseEntity::className[] = "CBaseEntity";

Lunar<CLuaBaseEntity>::Register_t CLuaBaseEntity::methods[] =
{
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,ChangeMusic),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,warp),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,leavegame),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,gotoPlayer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,bringPlayer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getShortID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCursorTarget),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPool),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getName),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getModelSize),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getHP),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getGender),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTreasure),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addUsedItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addTempItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delItem),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCharSkillLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getWeaponSkillLevel),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canLearnSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addLearnedAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasLearnedAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canLearnAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delLearnedAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addLearnedWeaponskill),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasLearnedWeaponskill),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delLearnedWeaponskill),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAutomatonFrame),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getAutomatonHead),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMaskBit),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMaskBit),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,countMaskBits),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isMaskFull),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,release),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,startEvent),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,startEventString),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEvent),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEventString),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getStatusEffects),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canGainStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasStatusEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasStatusEffectByFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,countEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasBustEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,numBustEffects),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,doWildCard),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasPartyJob),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,fold),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasCorsairEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMobMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMobMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addMobMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delMobMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,moghouseFlag),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,injectPacket),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,showPosition),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateClaim),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,lowerEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,transferEnmity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateEnmityFromDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCE),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getVE),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setCE),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setVE),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,petAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,familiar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getPetID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isJugPet),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getCharmChance),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,jail),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getMeleeHitDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetRecasts),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetRecast),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addRecast),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setCurrency),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,updateNPCHideTime),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkValorCredit),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkSoloPartyAlliance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkFovAllianceAllowed),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isAlly),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,injectActionPacket),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setMobFlags),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasTrait),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTrickAttackChar),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setDelay),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,castSpell),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,useMobAbility),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,useJobAbility),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasSpellList),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasPreventActionEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hasValidJugPetItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getTarget),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isSpawned),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setSpawn),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setRespawnTime),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getRespawnTime),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,hideModel),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setAllegiance),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,stun),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,weaknessTrigger),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getBehaviour),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setBehaviour),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,reloadParty),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getModelId),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setModelId),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setTrueDetection),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setAggressive),
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
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getConfrontationEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,copyConfrontationEffect),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addPetMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,delPetMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setPetMod),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,queue),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,timer),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,addListener),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,removeListener),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,triggerListener),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,removeAmmo),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,takeWeaponskillDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,handleAfflatusMiseryDamage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setEquipBlock),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setStatDebilitation),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,unequipItem),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,recalculateStats),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,checkImbuedItems),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getNearbyEntities),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getDropID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,setDropID),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,resetAI),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,getEntity),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,canChangeState),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isAlive),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isDead),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,engage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,disengage),
    LUNAR_DECLARE_METHOD(CLuaBaseEntity,isEngaged),
    {nullptr,nullptr}
};
