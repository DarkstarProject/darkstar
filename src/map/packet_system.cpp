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

#include "../common/blowfish.h"
#include "../common/md52.h"
#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/strlib.h"
#include "../common/taskmgr.h"
#include "../common/timer.h"
#include "../common/utils.h"

#include <string.h>
#include "alliance.h"
#include "utils/blueutils.h"
#include "party.h"
#include "packet_system.h"
#include "conquest_system.h"
#include "utils/battleutils.h"
#include "utils/blacklistutils.h"
#include "utils/charutils.h"
#include "utils/petutils.h"
#include "utils/puppetutils.h"
#include "utils/fishingutils.h"
#include "utils/itemutils.h"
#include "utils/jailutils.h"
#include "linkshell.h"
#include "map.h"
#include "entities/mobentity.h"
#include "entities/npcentity.h"
#include "entities/charentity.h"
#include "spell.h"
#include "utils/synthutils.h"
#include "trade_container.h"
#include "zone.h"
#include "utils/zoneutils.h"
#include "message.h"
#include "status_effect_container.h"
#include "latent_effect_container.h"
#include "treasure_pool.h"
#include "item_container.h"
#include "universal_container.h"
#include "recast_container.h"

#include "ai/ai_container.h"
#include "ai/states/death_state.h"

#include "items/item_shop.h"

#include "lua/luautils.h"

#include "packets/auction_house.h"
#include "packets/bazaar_check.h"
#include "packets/bazaar_close.h"
#include "packets/bazaar_confirmation.h"
#include "packets/bazaar_item.h"
#include "packets/bazaar_message.h"
#include "packets/bazaar_purchase.h"
#include "packets/blacklist.h"
#include "packets/campaing_map.h"
#include "packets/char.h"
#include "packets/char_abilities.h"
#include "packets/char_appearance.h"
#include "packets/char_check.h"
#include "packets/char_equip.h"
#include "packets/char_emotion.h"
#include "packets/char_jobs.h"
#include "packets/char_job_extra.h"
#include "packets/char_health.h"
#include "packets/char_recast.h"
#include "packets/char_skills.h"
#include "packets/char_spells.h"
#include "packets/char_stats.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/chat_message.h"
#include "packets/chocobo_digging.h"
#include "packets/change_music.h"
#include "packets/conquest_map.h"
#include "packets/cs_position.h"
#include "packets/currency1.h"
#include "packets/currency2.h"
#include "packets/delivery_box.h"
#include "packets/downloading_data.h"
#include "packets/entity_update.h"
#include "packets/guild_menu_buy.h"
#include "packets/guild_menu_sell.h"
#include "packets/guild_menu_buy_update.h"
#include "packets/guild_menu_sell_update.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_item.h"
#include "packets/inventory_modify.h"
#include "packets/inventory_size.h"
#include "packets/lock_on.h"
#include "packets/linkshell_equip.h"
#include "packets/linkshell_message.h"
#include "packets/macroequipset.h"
#include "packets/menu_config.h"
#include "packets/menu_merit.h"
#include "packets/merit_points_categories.h"
#include "packets/message_basic.h"
#include "packets/message_debug.h"
#include "packets/message_standard.h"
#include "packets/message_system.h"
#include "packets/party_define.h"
#include "packets/party_invite.h"
#include "packets/party_map.h"
#include "packets/party_search.h"
#include "packets/position.h"
#include "packets/release.h"
#include "packets/server_ip.h"
#include "packets/server_message.h"
#include "packets/shop_appraise.h"
#include "packets/shop_buy.h"
#include "packets/status_effects.h"
#include "packets/stop_downloading.h"
#include "packets/synth_suggestion.h"
#include "packets/trade_action.h"
#include "packets/trade_request.h"
#include "packets/trade_item.h"
#include "packets/trade_update.h"
#include "packets/wide_scan_track.h"
#include "packets/world_pass.h"
#include "packets/zone_in.h"
#include "packets/zone_visited.h"
#include "packets/menu_raisetractor.h"

uint8 PacketSize[512];
void(*PacketParser[512])(map_session_data_t*, CCharEntity*, CBasicPacket);

/************************************************************************
*                                                                       *
*  Display the contents of the incoming packet to the console.          *
*                                                                       *
************************************************************************/

void PrintPacket(CBasicPacket data)
{
    int8 message[50];
    memset(&message, 0, 50);

    for (int y = 0; y < data.length(); y++)
    {
        sprintf(message, "%s %02hx", message, *((uint8*)data[y]));
        if (((y + 1) % 16) == 0)
        {
            message[48] = '\n';
            ShowDebug(message);
            memset(&message, 0, 50);
        }
    }
    if (strlen(message) > 0)
    {
        message[strlen(message)] = '\n';
        ShowDebug(message);
    }
}

/************************************************************************
*                                                                       *
*  Unknown Packet                                                       *
*                                                                       *
************************************************************************/

void SmallPacket0x000(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    ShowWarning(CL_YELLOW"parse: Unhandled game packet %03hX from user: %s\n" CL_RESET, (RBUFW(data, 0) & 0x1FF), PChar->GetName());
    return;
}

/************************************************************************
*                                                                       *
*  Non-Implemented Packet                                               *
*                                                                       *
************************************************************************/

void SmallPacket0xFFF(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    ShowDebug(CL_CYAN"parse: SmallPacket is not implemented Type<%03hX>\n" CL_RESET, (RBUFW(data, 0) & 0x1FF));
    return;
}

/************************************************************************
*                                                                       *
*  Log Into Zone                                                        *
*                                                                       *
*  Update session key and client port between zone transitions.         *
*                                                                       *
************************************************************************/

void SmallPacket0x00A(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    WBUFL(data, (0x5C)) = 0;

    PChar->clearPacketList();

    if (PChar->status == STATUS_DISAPPEAR)
    {
        if (PChar->loc.zone != nullptr)
        {
            //remove the char from previous zone, and unset shuttingDown (already in next zone)
            PacketParser[0x00D](session, PChar, nullptr);
        }

        session->shuttingDown = 0;
        session->blowfish.key[4] += 2;
        session->blowfish.status = BLOWFISH_SENT;

        md5((uint8*)(session->blowfish.key), session->blowfish.hash, 20);

        for (uint32 i = 0; i < 16; ++i)
        {
            if (session->blowfish.hash[i] == 0)
            {
                memset(session->blowfish.hash + i, 0, 16 - i);
                break;
            }
        }
        blowfish_init((int8*)session->blowfish.hash, 16, session->blowfish.P, session->blowfish.S[0]);

        int8 session_key[20 * 2 + 1];
        bin2hex(session_key, (uint8*)session->blowfish.key, 20);

        uint16 destination = PChar->loc.destination;

        if (destination >= MAX_ZONEID){
            ShowWarning("packet_system::SmallPacket0x00A player tried to enter zone out of range: %d\n", destination);
            PChar->loc.destination = destination = ZONE_RESIDENTIAL_AREA;
        }

        if (destination == ZONE_RESIDENTIAL_AREA ||
            destination == ZONE_214 && PChar->m_moghouseID == 0)
        {
            PChar->m_moghouseID = PChar->id;
            destination = PChar->loc.prevzone;
        }
        else
        {
            PChar->m_moghouseID = 0;
        }

        zoneutils::GetZone(destination)->IncreaseZoneCounter(PChar);

        PChar->m_ZonesList[PChar->getZone() >> 3] |= (1 << (PChar->getZone() % 8));

        const int8* fmtQuery = "UPDATE accounts_sessions SET targid = %u, session_key = x'%s', server_addr = %u, client_port = %u WHERE charid = %u";

        // Current zone could either be current zone or destination
        CZone* currentZone = zoneutils::GetZone(PChar->getZone());

        Sql_Query(SqlHandle, fmtQuery,
            PChar->targid,
            session_key,
            currentZone->GetIP(),
            session->client_port,
            PChar->id);

        fmtQuery = "SELECT death FROM char_stats WHERE charid = %u;";
        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);
        if (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            PChar->m_DeathCounter = (uint32)Sql_GetUIntData(SqlHandle, 0);
            PChar->m_DeathTimestamp = (uint32)time(nullptr);
            if (PChar->health.hp == 0)
                PChar->Die(std::chrono::seconds(PChar->m_DeathCounter));
        }

        fmtQuery = "SELECT pos_prevzone FROM chars WHERE charid = %u";
        ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);
        if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            if (PChar->getZone() == Sql_GetUIntData(SqlHandle, 0))
                PChar->loc.zoning = true;
        }

        PChar->status = STATUS_NORMAL;
    }
    else
    {
        if (PChar->loc.zone != nullptr)
        {
            ShowWarning(CL_YELLOW"Client cannot receive packet or key is invalid: %s\n" CL_RESET, PChar->GetName());
        }
    }

    charutils::SaveCharPosition(PChar);
    charutils::SaveZonesVisited(PChar);
    charutils::SavePlayTime(PChar);

    PChar->pushPacket(new CDownloadingDataPacket());
    PChar->pushPacket(new CZoneInPacket(PChar, PChar->m_event.EventID));
    PChar->pushPacket(new CZoneVisitedPacket(PChar));

    if (!PChar->loc.zoning)
        PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_ON_ZONE, true);

    CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("afterZoneIn", server_clock::now() + 500ms, (void*)PChar->id, CTaskMgr::TASK_ONCE, luautils::AfterZoneIn));
    return;
}

/************************************************************************
*                                                                       *
*  Character Information Request                                        *
*  Occurs while player is zoning or entering the game.                  *
*                                                                       *
************************************************************************/

void SmallPacket0x00C(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->pushPacket(new CInventorySizePacket(PChar));
    PChar->pushPacket(new CMenuConfigPacket(PChar));
    PChar->pushPacket(new CCharJobsPacket(PChar));

    // TODO: While in mog house; treasure pool is not created.
    if (PChar->PTreasurePool != nullptr)
    {
        PChar->PTreasurePool->UpdatePool(PChar);
    }
    PChar->loc.zone->SpawnTransport(PChar);

    // respawn any pets from last zone
    if (PChar->petZoningInfo.respawnPet == true)
    {
        // only repawn pet in valid zones and al zahbi (for beseiged)
        if (PChar->loc.zone->CanUseMisc(MISC_PET) == true || PChar->loc.zone->GetID() == 48)
        {
            switch (PChar->petZoningInfo.petType)
            {
            case PETTYPE_AUTOMATON:
            case PETTYPE_JUG_PET:
            case PETTYPE_WYVERN:
                petutils::SpawnPet(PChar, PChar->petZoningInfo.petID, true);
                break;

            default:
                break;
            }
            // reset the petZoning info
            PChar->resetPetZoningInfo();
        }
    }

    return;
}

/************************************************************************
*                                                                       *
*  Player Leaving Zone (Dezone)                                         *
*                                                                       *
************************************************************************/

void SmallPacket0x00D(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{

    session->blowfish.status = BLOWFISH_WAITING;

    PChar->TradePending.clean();
    PChar->InvitePending.clean();
    PChar->PWideScanTarget = nullptr;

    if (PChar->animation == ANIMATION_ATTACK)
    {
        PChar->animation = ANIMATION_NONE;
        PChar->updatemask |= UPDATE_HP;
    }

    if (PChar->status == STATUS_SHUTDOWN)
    {
        if (PChar->PParty != nullptr)
        {
            if (PChar->PParty->m_PAlliance != nullptr)
            {
                if (PChar->PParty->GetLeader() == PChar)
                {
                    if (PChar->PParty->members.size() == 1)
                    {
                        if (PChar->PParty->m_PAlliance->partyList.size() == 1)
                        {
                            PChar->PParty->m_PAlliance->dissolveAlliance();
                        }
                        else
                        {
                            PChar->PParty->m_PAlliance->removeParty(PChar->PParty);
                        }
                    }
                    else
                    {    //party leader logged off - will pass party lead
                        PChar->PParty->RemoveMember(PChar);
                    }
                }
                else
                {    //not party leader - just drop from party
                    PChar->PParty->RemoveMember(PChar);
                }
            }
            else
            {
                //normal party - just drop group
                PChar->PParty->RemoveMember(PChar);
            }
        }
        session->shuttingDown = 1;
        Sql_Query(SqlHandle, "UPDATE char_stats SET zoning = 0 WHERE charid = %u", PChar->id);
    }
    else
    {
        session->shuttingDown = 2;
        Sql_Query(SqlHandle, "UPDATE char_stats SET zoning = 1 WHERE charid = %u", PChar->id);
        charutils::CheckEquipLogic(PChar, SCRIPT_CHANGEZONE, PChar->getZone());
    }

    if (PChar->loc.zone != nullptr)
    {
        PChar->loc.zone->DecreaseZoneCounter(PChar);
    }

    charutils::SaveCharStats(PChar);
    charutils::SaveCharExp(PChar, PChar->GetMJob());
    charutils::SaveCharPoints(PChar);

    PChar->status = STATUS_DISAPPEAR;
    return;
}

/************************************************************************
*                                                                       *
*  Player Information Request                                           *
*                                                                       *
************************************************************************/

void SmallPacket0x00F(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    charutils::SendKeyItems(PChar);
    charutils::SendQuestMissionLog(PChar);

    PChar->pushPacket(new CCharSpellsPacket(PChar));
    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
    PChar->pushPacket(new CCharSyncPacket(PChar));
    PChar->pushPacket(new CBazaarMessagePacket(PChar));
    PChar->pushPacket(new CMeritPointsCategoriesPacket(PChar));

    charutils::SendInventory(PChar);

    // Note: This sends the stop downloading packet!
    blacklistutils::SendBlacklist(PChar);

    return;
}

/************************************************************************
*                                                                       *
*  Player Zone Transition Confirmation                                  *
*  First packet sent after transitioning zones or entering the game.    *
*  Client confirming the zoning was successful, equips gear.            *
*                                                                       *
************************************************************************/

void SmallPacket0x011(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    session->blowfish.status = BLOWFISH_ACCEPTED;

    PChar->health.tp = 0;

    for (uint8 i = 0; i < 16; ++i)
    {
        if (PChar->equip[i] != 0)
        {
            PChar->pushPacket(new CEquipPacket(PChar->equip[i], i, PChar->equipLoc[i]));
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Player Sync                                                          *
*  Updates the players position and other important information.        *
*                                                                       *
************************************************************************/

void SmallPacket0x015(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->status != STATUS_SHUTDOWN &&
        PChar->status != STATUS_DISAPPEAR)
    {
        bool moved = ((PChar->loc.p.x != RBUFF(data, (0x04))) ||
            (PChar->loc.p.z != RBUFF(data, (0x0C))) ||
            (PChar->m_TargID != RBUFW(data, (0x16))));

        bool isUpdate = moved || PChar->updatemask & UPDATE_POS;

        if (!PChar->isCharmed)
        {
            PChar->loc.p.x = RBUFF(data, (0x04));
            PChar->loc.p.y = RBUFF(data, (0x08));
            PChar->loc.p.z = RBUFF(data, (0x0C));

            PChar->loc.p.moving = RBUFW(data, (0x12));
            PChar->loc.p.rotation = RBUFB(data, (0x14));

            PChar->m_TargID = RBUFW(data, (0x16));
        }

        if (moved)
        {
            PChar->updatemask |= UPDATE_POS;
        }

        if (isUpdate)
        {
            PChar->loc.zone->SpawnPCs(PChar);
            PChar->loc.zone->SpawnNPCs(PChar);
        }

        PChar->loc.zone->SpawnMOBs(PChar);
        PChar->loc.zone->SpawnPETs(PChar);

        if (PChar->PWideScanTarget != nullptr)
        {
            PChar->pushPacket(new CWideScanTrackPacket(PChar->PWideScanTarget));

            if (PChar->PWideScanTarget->status == STATUS_DISAPPEAR)
            {
                PChar->PWideScanTarget = nullptr;
            }
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Entity Information Request (Event NPC Information Request)           *
*                                                                       *
************************************************************************/

void SmallPacket0x016(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 targid = RBUFW(data, (0x04));

    if (targid == PChar->targid)
    {
        PChar->pushPacket(new CCharPacket(PChar, ENTITY_SPAWN, UPDATE_ALL_CHAR));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
    }
    else
    {
        CBaseEntity* PEntity = PChar->GetEntity(targid, TYPE_NPC | TYPE_PC);

        if (PEntity && PEntity->objtype == TYPE_PC)
        {
            PChar->pushPacket(new CCharPacket((CCharEntity*)PEntity, ENTITY_SPAWN, UPDATE_ALL_CHAR));
        }
        else
        {
            if (!PEntity)
            {
                PEntity = zoneutils::GetTrigger(targid, PChar->getZone());
            }
            PChar->pushPacket(new CEntityUpdatePacket(PEntity, ENTITY_SPAWN, UPDATE_ALL_MOB));
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Invalid NPC Information Response                                     *
*                                                                       *
************************************************************************/

void SmallPacket0x017(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 targid = RBUFW(data, (0x04));
    uint32 npcid = RBUFL(data, (0x08));
    uint8  type = RBUFB(data, (0x12));

    ShowError(CL_RED"SmallPacket0x17: Incorrect NPC(%u,%u) type(%u)\n" CL_RESET, targid, npcid, type);
    return;
}

/************************************************************************
*                                                                       *
*  Player Action                                                        *
*                                                                       *
************************************************************************/

void SmallPacket0x01A(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 ID = RBUFL(data, (0x04));
    uint16 TargID = RBUFW(data, (0x08));
    uint8  action = RBUFB(data, (0x0A));

    switch (action)
    {
    case 0x00: // trigger
    {
        if(PChar->StatusEffectContainer->HasPreventActionEffect())
            return;

        if (PChar->m_Costum != 0 || PChar->animation == ANIMATION_SYNTH)
        {
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_STANDARD));
            return;
        }
        CBaseEntity* PNpc = nullptr;

        PNpc = PChar->GetEntity(TargID, TYPE_NPC);

        if (PNpc != nullptr && distance(PNpc->loc.p, PChar->loc.p) <= 10)
        {
            PNpc->PAI->Trigger(PChar->targid);
        }
        if (PChar->m_event.EventID == -1)
        {
            PChar->m_event.reset();
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_STANDARD));
        }
    }
    break;
    case 0x02: // attack
    {
        PChar->PAI->Engage(TargID);
    }
    break;
    case 0x03: // spellcast
    {
        uint16 SpellID = RBUFW(data, (0x0C));
        PChar->PAI->Cast(TargID, SpellID);
    }
    break;
    case 0x04: // disengage
    {
        PChar->PAI->Disengage();
    }
    break;
    case 0x05: // call for help
    {
        if(PChar->StatusEffectContainer->HasPreventActionEffect())
            return;

        for (SpawnIDList_t::iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
        {
            CMobEntity* MOB = (CMobEntity*)it->second;

            if (MOB->animation == ANIMATION_ATTACK &&
                MOB->GetBattleTargetID() == PChar->id)
            {
                MOB->CallForHelp(true);
                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar, PChar, 0, 0, 19));

                return;
            }
        }
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 22));
    }
    break;
    case 0x07: // weaponskill
    {
        uint16 WSkillID = RBUFW(data, (0x0C));
        PChar->PAI->WeaponSkill(TargID, WSkillID);
    }
    break;
    case 0x09: // jobability
    {
        uint16 JobAbilityID = RBUFW(data, (0x0C));
        //if ((JobAbilityID < 496 && !charutils::hasAbility(PChar, JobAbilityID - 16)) || JobAbilityID >= 496 && !charutils::hasPetAbility(PChar, JobAbilityID - 512))
        //    return;
        PChar->PAI->Ability(TargID, JobAbilityID - 16);
    }
    break;
    case 0x0B: // homepoint
    {
        if (!PChar->isDead())
            return;
        // remove weakness on homepoint
        PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_WEAKNESS);
        PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_LEVEL_SYNC);

        PChar->health.hp = PChar->GetMaxHP();
        PChar->health.mp = PChar->GetMaxMP();

        PChar->loc.boundary = 0;
        PChar->loc.p = PChar->profile.home_point.p;
        PChar->loc.destination = PChar->profile.home_point.destination;

        PChar->status = STATUS_DISAPPEAR;
        PChar->animation = ANIMATION_NONE;
        PChar->updatemask |= UPDATE_HP;

        PChar->clearPacketList();
        charutils::SendToZone(PChar, 2, zoneutils::GetZoneIPP(PChar->loc.destination));
    }
    break;
    case 0x0C: // assist
    {
        battleutils::assistTarget(PChar, TargID);
    }
    break;
    case 0x0D: // raise menu
    {
        if (!PChar->m_hasRaise)
            return;
        if (RBUFB(data, (0x0C)) == 0) //ACCEPTED RAISE
        {
            PChar->Raise();
        }
    }
    break;
    case 0x0E: // Fishing
    {
        if(PChar->StatusEffectContainer->HasPreventActionEffect())
            return;

        fishingutils::StartFishing(PChar);
    }
    break;
    case 0x0F: // change target
    {
        PChar->PAI->ChangeTarget(TargID);
    }
    break;
    case 0x10: // rangedattack
    {
        PChar->PAI->RangedAttack(TargID);
    }
    break;
    case 0x11: // chocobo digging
    {
        // bunch of gysahl greens
        uint8 slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem(4545);

        if (slotID != ERROR_SLOTID)
        {
            // attempt to dig
            if (luautils::OnChocoboDig(PChar, true))
            {
                charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -1);

                PChar->pushPacket(new CInventoryFinishPacket());
                PChar->pushPacket(new CChocoboDiggingPacket(PChar));

                // dig is possible
                luautils::OnChocoboDig(PChar, false);
            }
            else {
                // unable to dig yet
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_WAIT_LONGER));
            }
        }
        else{
            // You don't have any gysahl greens
            PChar->pushPacket(new CMessageSystemPacket(4545, 0, 39));
        }
    }
    break;
    case 0x12: // dismount
    {
        PChar->animation = ANIMATION_NONE;
        PChar->updatemask |= UPDATE_HP;
        PChar->StatusEffectContainer->DelStatusEffectSilent(EFFECT_CHOCOBO);
    }
    break;
    case 0x13: // tractor menu
    {
        if (RBUFB(data, (0x0C)) == 0) //ACCEPTED TRACTOR
        {
            //PChar->PBattleAI->SetCurrentAction(ACTION_RAISE_MENU_SELECTION);
            PChar->loc.p = PChar->m_StartActionPos;
            PChar->loc.destination = PChar->getZone();
            PChar->status = STATUS_DISAPPEAR;
            PChar->loc.boundary = 0;
            PChar->clearPacketList();
            charutils::SendToZone(PChar, 2, zoneutils::GetZoneIPP(PChar->loc.destination));
        }

        PChar->m_hasTractor = 0;
    }
    break;
    case 0x14: // complete character update
    {
        if (PChar->m_moghouseID != 0)
        {
            PChar->loc.zone->SpawnMoogle(PChar);
        }
        else{
            PChar->loc.zone->SpawnPCs(PChar);
            PChar->loc.zone->SpawnNPCs(PChar);
            PChar->loc.zone->SpawnMOBs(PChar);
        }
    }
    break;
    case 0x15: break; // ballista - quarry
    case 0x16: break; // ballista - sprint
    case 0x18: // /blockaid
    {
        // Blockaid is currently inactive
        PChar->pushPacket(new CMessageSystemPacket(0, 0, 224));
    }
    break;
    default:
    {
        ShowWarning(CL_YELLOW"CLIENT PERFORMING UNHANDLED ACTION %02hX\n" CL_RESET, action);
        return;
    }
    break;
    }
    ShowDebug(CL_CYAN"CLIENT %s PERFORMING ACTION %02hX\n" CL_RESET, PChar->GetName(), action);
    return;
}

/************************************************************************
*                                                                       *
*  World Pass                                                           *
*                                                                       *
************************************************************************/

void SmallPacket0x01B(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    // 0 - world pass, 2 - gold world pass; +1 - purchase

    PChar->pushPacket(new CWorldPassPacket(RBUFB(data, (0x04)) & 1 ? dsprand::GetRandomNumber(9999999999) : 0));
    return;
}

/************************************************************************
*                                                                       *
*  Unknown Packet                                                       *
*  Assumed to be when a client is requesting missing information.       *
*                                                                       *
************************************************************************/

void SmallPacket0x01C(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PrintPacket(data);
    return;
}

/************************************************************************
*                                                                       *
*  Item Movement (Disposal)                                             *
*                                                                       *
************************************************************************/

void SmallPacket0x028(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    int32  quantity = RBUFB(data, (0x04));
    uint8 container = RBUFB(data, (0x08));
    uint8    slotID = RBUFB(data, (0x09));

    CItem* PItem = PChar->getStorage(container)->GetItem(slotID);

    if (PItem != nullptr && !PItem->isSubType(ITEM_LOCKED))
    {
        uint16 ItemID = PItem->getID();

        if (charutils::UpdateItem(PChar, container, slotID, -quantity) != 0)
        {
            // TODO: Break linkshell if the main shell was disposed of.

            PChar->pushPacket(new CMessageStandardPacket(nullptr, ItemID, quantity, 180));
            PChar->pushPacket(new CInventoryFinishPacket());
        }
        return;
    }
    ShowWarning(CL_YELLOW"SmallPacket0x028: Attempt of removal nullptr or LOCKED item from slot %u\n" CL_RESET, slotID);
    return;
}

/************************************************************************
*                                                                       *
*  Item Movement (Between Containers)                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x029(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 quantity = RBUFB(data, (0x04));
    uint8  FromLocationID = RBUFB(data, (0x08));
    uint8  ToLocationID = RBUFB(data, (0x09));
    uint8  FromSlotID = RBUFB(data, (0x0A));
    uint8  ToSlotID = RBUFB(data, (0x0B));

    if (ToLocationID >= MAX_CONTAINER_ID ||
        FromLocationID >= MAX_CONTAINER_ID)
        return;

    CItem* PItem = PChar->getStorage(FromLocationID)->GetItem(FromSlotID);

    if (PItem == nullptr || PItem->isSubType(ITEM_LOCKED))
    {
        if (PItem == nullptr){
            ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move nullptr item from location %u slot %u to location %u slot %u of quan %u \n" CL_RESET, FromLocationID, FromSlotID, ToLocationID, ToSlotID, quantity);
        }
        else{
            ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move LOCKED item %i from location %u slot %u to location %u slot %u of quan %u \n" CL_RESET, PItem->getID(), FromLocationID, FromSlotID, ToLocationID, ToSlotID, quantity);
        }

        uint8 size = PChar->getStorage(FromLocationID)->GetSize();
        for (uint8 slotID = 0; slotID <= size; ++slotID)
        {
            CItem* PItem = PChar->getStorage(FromLocationID)->GetItem(slotID);
            if (PItem != nullptr)
            {
                PChar->pushPacket(new CInventoryItemPacket(PItem, FromLocationID, slotID));
            }
        }
        PChar->pushPacket(new CInventoryFinishPacket());

        return;
    }
    if (PItem->getQuantity() - PItem->getReserve() < quantity)
    {
        ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move too much quantity from location %u slot %u\n" CL_RESET, FromLocationID, FromSlotID);
        return;
    }

    uint32 NewQuantity = PItem->getQuantity() - quantity;

    if (NewQuantity != 0) // split item stack
    {
        if (charutils::AddItem(PChar, ToLocationID, PItem->getID(), quantity) != ERROR_SLOTID)
        {
            charutils::UpdateItem(PChar, FromLocationID, FromSlotID, -(int32)quantity);
        }
    }
    else // move stack / combine items into stack
    {
        if (ToSlotID < 82) // 80 + 1
        {
            ShowDebug("SmallPacket0x29: Trying to unite items\n", FromLocationID, FromSlotID);
            return;
        }

        uint8 NewSlotID = PChar->getStorage(ToLocationID)->InsertItem(PItem);

        if (NewSlotID != ERROR_SLOTID)
        {
            const int8* Query = "UPDATE char_inventory SET location = %u, slot = %u WHERE charid = %u AND location = %u AND slot = %u;";

            if (Sql_Query(SqlHandle, Query, ToLocationID, NewSlotID, PChar->id, FromLocationID, FromSlotID) != SQL_ERROR &&
                Sql_AffectedRows(SqlHandle) != 0)
            {
                PChar->getStorage(FromLocationID)->InsertItem(nullptr, FromSlotID);

                PChar->pushPacket(new CInventoryItemPacket(nullptr, FromLocationID, FromSlotID));
                PChar->pushPacket(new CInventoryItemPacket(PItem, ToLocationID, NewSlotID));
            }
            else
            {
                PChar->getStorage(ToLocationID)->InsertItem(nullptr, NewSlotID);
                PChar->getStorage(FromLocationID)->InsertItem(PItem, FromSlotID);
            }
        }
        else
        {
            // Client assumed the location was not full when it is..
            // Resend the packets to inform the client of the storage sizes..
            uint8 size = PChar->getStorage(ToLocationID)->GetSize();
            for (uint8 slotID = 0; slotID <= size; ++slotID)
            {
                CItem* PItem = PChar->getStorage(ToLocationID)->GetItem(slotID);
                if (PItem != nullptr)
                {
                    PChar->pushPacket(new CInventoryItemPacket(PItem, ToLocationID, slotID));
                }
            }
            PChar->pushPacket(new CInventoryFinishPacket());

            ShowError(CL_RED"SmallPacket0x29: Location %u Slot %u is full\n" CL_RESET, ToLocationID, ToSlotID);
            return;
        }
    }
    PChar->pushPacket(new CInventoryFinishPacket());
    return;
}

/************************************************************************
*                                                                       *
*  Trade Request                                                        *
*                                                                       *
************************************************************************/

void SmallPacket0x032(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 charid = RBUFL(data, (0x04));
    uint16 targid = RBUFW(data, (0x08));

    CCharEntity* PTarget = (CCharEntity*)PChar->GetEntity(targid, TYPE_PC);
	ShowDebug(CL_CYAN"%s initiated trade request with %s\n" CL_RESET, PChar->GetName(), PTarget->GetName());
    if ((PTarget != nullptr) && (PTarget->id == charid))
    {
        if (jailutils::InPrison(PChar) || jailutils::InPrison(PTarget))
        {
            // If either player is in prison don't allow the trade.
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
            return;
        }

        if (PTarget->TradePending.id == PChar->id)
        {
            ShowDebug(CL_CYAN"%s already sent a trade request to %s\n" CL_RESET, PChar->GetName(), PTarget->GetName());
            return;
        }
        if (!PTarget->UContainer->IsContainerEmpty())
        {
            ShowDebug(CL_CYAN"%s UContainer is not empty. %s cannot trade with them at this time\n" CL_RESET, PTarget->GetName(), PChar->GetName());
            return;
        }
        PChar->TradePending.id = charid;
        PChar->TradePending.targid = targid;

        PTarget->TradePending.id = PChar->id;
        PTarget->TradePending.targid = PChar->targid;
        PTarget->pushPacket(new CTradeRequestPacket(PChar));
    }
    return;
}

/************************************************************************
*                                                                       *
*  Trade Request Action                                                 *
*  Trade Accept / Request Accept / Cancel                               *
*                                                                       *
************************************************************************/

void SmallPacket0x033(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    CCharEntity* PTarget = (CCharEntity*)PChar->GetEntity(PChar->TradePending.targid, TYPE_PC);

    if (PTarget != nullptr && PChar->TradePending.id == PTarget->id)
    {
        uint16 action = RBUFB(data, (0x04));

        switch (action)
        {
        case 0x00: // request accepted
        {
			ShowDebug(CL_CYAN"%s accepted trade request from %s\n" CL_RESET, PTarget->GetName(), PChar->GetName());
            if (PChar->TradePending.id == PTarget->id && PTarget->TradePending.id == PChar->id)
            {
                if (PChar->UContainer->IsContainerEmpty() && PTarget->UContainer->IsContainerEmpty())
                {
                    if (distance(PChar->loc.p, PTarget->loc.p) < 6)
                    {
                        PChar->UContainer->SetType(UCONTAINER_TRADE);
                        PChar->pushPacket(new CTradeActionPacket(PTarget, action));

                        PTarget->UContainer->SetType(UCONTAINER_TRADE);
                        PTarget->pushPacket(new CTradeActionPacket(PChar, action));
                        return;
                    }
                }
                PChar->TradePending.clean();
                PTarget->TradePending.clean();

                ShowDebug(CL_CYAN"Trade: UContainer is not empty\n" CL_RESET);
            }
        }
        break;
        case 0x01: // trade cancelled
        {
			ShowDebug(CL_CYAN"%s cancelled trade with %s\n" CL_RESET, PTarget->GetName(), PChar->GetName());
            if (PChar->TradePending.id == PTarget->id && PTarget->TradePending.id == PChar->id)
            {
                if (PTarget->UContainer->GetType() == UCONTAINER_TRADE)
                {
                    PTarget->UContainer->Clean();

                }
            }
            if (PChar->UContainer->GetType() == UCONTAINER_TRADE)
            {
                PChar->UContainer->Clean();
            }

            PTarget->TradePending.clean();
            PTarget->pushPacket(new CTradeActionPacket(PChar, action));

            PChar->TradePending.clean();
        }
        break;
        case 0x02: // trade accepted
        {
			ShowDebug(CL_CYAN"%s accepted trade with %s\n" CL_RESET, PTarget->GetName(), PChar->GetName());
            if (PChar->TradePending.id == PTarget->id && PTarget->TradePending.id == PChar->id)
            {
                PChar->UContainer->SetLock();
                PTarget->pushPacket(new CTradeActionPacket(PChar, action));

                if (PTarget->UContainer->IsLocked())
                {
                    if (charutils::CanTrade(PChar, PTarget) && charutils::CanTrade(PTarget, PChar))
                    {
                        charutils::DoTrade(PChar, PTarget);
                        PTarget->pushPacket(new CTradeActionPacket(PTarget, 9));

                        charutils::DoTrade(PTarget, PChar);
                        PChar->pushPacket(new CTradeActionPacket(PChar, 9));
                    }
                    else
                    {
                        // Failed to trade..
                        // Either players containers are full or illegal item trade attempted..
						ShowDebug(CL_CYAN"%s->%s trade failed (full inventory or illegal items)\n" CL_RESET, PChar->GetName(), PTarget->GetName());
                        PChar->pushPacket(new CTradeActionPacket(PTarget, 1));
                        PTarget->pushPacket(new CTradeActionPacket(PChar, 1));
                    }
                    PChar->TradePending.clean();
                    PChar->UContainer->Clean();

                    PTarget->TradePending.clean();
                    PTarget->UContainer->Clean();
                }
            }
        }
        break;
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Update Trade Item Slot                                               *
*                                                                       *
************************************************************************/

void SmallPacket0x034(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 quantity = RBUFL(data, (0x04));
    uint16 itemID = RBUFW(data, (0x08));
    uint8  invSlotID = RBUFB(data, (0x0A));
    uint8  tradeSlotID = RBUFB(data, (0x0B));

    CCharEntity* PTarget = (CCharEntity*)PChar->GetEntity(PChar->TradePending.targid, TYPE_PC);

    if (PTarget != nullptr && PTarget->id == PChar->TradePending.id)
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID);
        // We used to disable Rare/Ex items being added to the container, but that is handled properly else where now
        if (PItem != nullptr && PItem->getID() == itemID && quantity + PItem->getReserve() <= PItem->getQuantity())
        {

            PItem->setReserve(quantity);
            // If item count is zero.. remove from container..
			if (quantity > 0)
			{
				ShowDebug(CL_CYAN"%s->%s trade updating trade slot id %d with item %s, quantity %d\n" CL_RESET, PChar->GetName(), PTarget->GetName(), tradeSlotID, PItem->getName(), quantity);
				PChar->UContainer->SetItem(tradeSlotID, PItem);
			}
			else
			{
				ShowDebug(CL_CYAN"%s->%s trade updating trade slot id %d with item %d, quantity 0\n" CL_RESET, PChar->GetName(), PTarget->GetName(), tradeSlotID, PItem->getName());
				PChar->UContainer->SetItem(tradeSlotID, nullptr);
			}
			ShowDebug(CL_CYAN"%s->%s trade pushing packet to %s\n" CL_RESET, PChar->GetName(), PTarget->GetName(), PChar->GetName());
            PChar->pushPacket(new CTradeItemPacket(PItem, tradeSlotID));
			ShowDebug(CL_CYAN"%s->%s trade pushing packet to %s\n" CL_RESET, PChar->GetName(), PTarget->GetName(), PTarget->GetName());
            PTarget->pushPacket(new CTradeUpdatePacket(PItem, tradeSlotID));

            PChar->UContainer->UnLock();
            PTarget->UContainer->UnLock();
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Trade Complete                                                       *
*  Sent to complete the trade.                                          *
*                                                                       *
************************************************************************/

void SmallPacket0x036(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 npcid = RBUFL(data, (0x04));
    uint16 targid = RBUFW(data, (0x3A));

    CBaseEntity* PNpc = PChar->GetEntity(targid, TYPE_NPC);

    if ((PNpc != nullptr) && (PNpc->id == npcid) && distance(PNpc->loc.p, PChar->loc.p) <= 10)
    {
        uint8 numItems = RBUFB(data, (0x3C));

        PChar->TradeContainer->Clean();

        for (int32 slotID = 0; slotID < numItems; ++slotID)
        {
            uint8  invSlotID = RBUFB(data, (0x30 + slotID));
            uint32 Quantity = RBUFL(data, (0x08 + slotID * 4));

            CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID);

            if (PItem != nullptr && PItem->getQuantity() >= Quantity)
            {
                PChar->TradeContainer->setItem(slotID, PItem->getID(), invSlotID, Quantity, PItem);
            }
        }

        PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DETECTABLE);
        luautils::OnTrade(PChar, PNpc);
    }
    return;
}

/************************************************************************
*                                                                       *
*  Item Usage                                                           *
*                                                                       *
************************************************************************/

void SmallPacket0x037(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 EntityID = RBUFL(data, (0x04));
    uint16 TargetID = RBUFW(data, (0x0C));
    uint8  SlotID = RBUFB(data, (0x0E));
    uint8  StorageID = RBUFB(data, (0x10));

    if (PChar->UContainer->GetType() != UCONTAINER_USEITEM)
        PChar->PAI->UseItem(TargetID, StorageID, SlotID);
    else
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 56));

    return;
}

/************************************************************************
*                                                                       *
*  Sort Inventory                                                       *
*                                                                       *
************************************************************************/

void SmallPacket0x03A(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    CItemContainer* PItemContainer = PChar->getStorage(RBUFB(data, (0x04)));

    uint8 size = PItemContainer->GetSize();

    if (gettick() - PItemContainer->LastSortingTime < 1000)
    {
        if (map_config.lightluggage_block == ++PItemContainer->SortingPacket)
        {
            ShowWarning(CL_YELLOW"lightluggage detected: <%s> will be removed from server\n" CL_RESET, PChar->GetName());

            PChar->status = STATUS_SHUTDOWN;
            charutils::SendToZone(PChar, 1, 0);
        }
        return;
    }
    else
    {
        PItemContainer->SortingPacket = 0;
        PItemContainer->LastSortingTime = gettick();
    }
    for (uint8 slotID = 1; slotID <= size; ++slotID)
    {
        CItem* PItem = PItemContainer->GetItem(slotID);

        if ((PItem != nullptr) &&
            (PItem->getQuantity() < PItem->getStackSize()) &&
            !PItem->isSubType(ITEM_LOCKED))
        {
            for (uint8 slotID2 = slotID + 1; slotID2 <= size; ++slotID2)
            {
                CItem* PItem2 = PItemContainer->GetItem(slotID2);

                if ((PItem2 != nullptr) &&
                    (PItem2->getID() == PItem->getID()) &&
                    (PItem2->getQuantity() < PItem2->getStackSize()) &&
                    !PItem2->isSubType(ITEM_LOCKED))
                {
                    uint32 totalQty = PItem->getQuantity() + PItem2->getQuantity();
                    uint32 moveQty = 0;

                    if (totalQty >= PItem->getStackSize()) {
                        moveQty = PItem->getStackSize() - PItem->getQuantity();
                    }
                    else {
                        moveQty = PItem2->getQuantity();
                    }
                    if (moveQty > 0)
                    {
                        charutils::UpdateItem(PChar, PItemContainer->GetID(), slotID, moveQty);
                        charutils::UpdateItem(PChar, PItemContainer->GetID(), slotID2, -(int32)moveQty);
                    }
                }
            }
        }
    }
    PChar->pushPacket(new CInventoryFinishPacket());
    return;
}

/************************************************************************
*                                                                       *
*  Unknown Packet                                                       *
*  Assumed packet empty response for npcs/monsters/players.             *
*                                                                       *
************************************************************************/

void SmallPacket0x03C(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    ShowWarning(CL_YELLOW"SmallPacket0x03C\n" CL_RESET);
    return;
}

/************************************************************************
*                                                                       *
*  Incoming Blacklist Command                                           *
*                                                                       *
************************************************************************/

void SmallPacket0x03D(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    const int8* name = (const int8*)(data[0x08]);
    uint8 cmd = RBUFB(data, 0x18);

    // Attempt to locate the character by their name..
    const int8* sql = "SELECT charid, accid FROM chars WHERE charname = '%s' LIMIT 1";
    int32 ret = Sql_Query(SqlHandle, sql, name);
    if (ret == SQL_ERROR || Sql_NumRows(SqlHandle) != 1 || Sql_NextRow(SqlHandle) != SQL_SUCCESS)
    {
        // Send failed..
        PChar->pushPacket(new CBlacklistPacket(0, "", 0x02));
        return;
    }

    // Retrieve the data from Sql..
    int32 charid = Sql_GetIntData(SqlHandle, 0);
    int32 accid = Sql_GetIntData(SqlHandle, 1);

    // User is trying to add someone to their blacklist..
    if (cmd == 0x00)
    {
        if (blacklistutils::IsBlacklisted(PChar->id, charid))
        {
            // We cannot readd this person, fail to add..
            PChar->pushPacket(new CBlacklistPacket(0, "", 0x02));
            return;
        }

        // Attempt to add this person..
        if (blacklistutils::AddBlacklisted(PChar->id, charid))
            PChar->pushPacket(new CBlacklistPacket(accid, name, cmd));
        else
            PChar->pushPacket(new CBlacklistPacket(0, "", 0x02));
    }

    // User is trying to remove someone from their blacklist..
    else if (cmd == 0x01)
    {
        if (!blacklistutils::IsBlacklisted(PChar->id, charid))
        {
            // We cannot remove this person, fail to remove..
            PChar->pushPacket(new CBlacklistPacket(0, "", 0x02));
            return;
        }

        // Attempt to remove this person..
        if (blacklistutils::DeleteBlacklisted(PChar->id, charid))
            PChar->pushPacket(new CBlacklistPacket(accid, name, cmd));
        else
            PChar->pushPacket(new CBlacklistPacket(0, "", 0x02));
    }
    else
    {
        // Send failed..
        PChar->pushPacket(new CBlacklistPacket(0, "", 0x02));
    }
}

/************************************************************************
*                                                                       *
*  Treasure Pool (Lot On Item)                                          *
*                                                                       *
************************************************************************/

void SmallPacket0x041(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PrintPacket(data);

    if (PChar->PTreasurePool != nullptr)
    {
        uint8 SlotID = RBUFB(data, (0x04));

        if (!PChar->PTreasurePool->HasLottedItem(PChar, SlotID))
        {
            PChar->PTreasurePool->LotItem(PChar, SlotID,dsprand::GetRandomNumber(1,1000)); //1 ~ 998+1
        }
    }
}

/************************************************************************
*                                                                       *
*  Treasure Pool (Pass Item)                                            *
*                                                                       *
************************************************************************/

void SmallPacket0x042(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PrintPacket(data);

    if (PChar->PTreasurePool != nullptr)
    {
        uint8 SlotID = RBUFB(data, (0x04));

        if (!PChar->PTreasurePool->HasPassedItem(PChar, SlotID))
        {
            PChar->PTreasurePool->PassItem(PChar, SlotID);
        }
    }
}

/************************************************************************
*                                                                       *
*  Server Message Request                                               *
*                                                                       *
************************************************************************/

void SmallPacket0x04B(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8   msg_chunk = RBUFB(data, (0x04)); // The current chunk of the message to send.. (1 = start, 2 = rest of message)
    uint8   msg_unknown1 = RBUFB(data, (0x05)); // Unknown.. always 0
    uint8   msg_unknown2 = RBUFB(data, (0x06)); // Unknown.. always 1
    uint8   msg_language = RBUFB(data, (0x07)); // Language request id (2 = English, 4 = French)
    uint32  msg_timestamp = RBUFL(data, (0x08)); // The message timestamp being requested..
    uint32  msg_size_total = RBUFL(data, (0x0C)); // The total length of the requested server message..
    uint32  msg_offset = RBUFL(data, (0x10)); // The offset to start obtaining the server message..
    uint32  msg_request_len = RBUFL(data, (0x14)); // The total requested size of send to the client..

    if (msg_language == 0x02)
        PChar->pushPacket(new CServerMessagePacket(map_config.server_message, msg_language, msg_timestamp, msg_offset));
    else
        PChar->pushPacket(new CServerMessagePacket(map_config.server_message_fr, msg_language, msg_timestamp, msg_offset));

    PChar->pushPacket(new CCharSyncPacket(PChar));

    return;
}

/************************************************************************
*                                                                       *
*  Delivery Box                                                         *
*                                                                       *
************************************************************************/

void SmallPacket0x04D(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 action = RBUFB(data, (0x04));
    uint8 boxtype = RBUFB(data, (0x05));
    uint8 slotID = RBUFB(data, (0x06));

    ShowDebug(CL_CYAN"DeliveryBox Action (%02hx)\n" CL_RESET, RBUFB(data, (0x04)));
    PrintPacket(data);

    // 0x01 - Send old items..
    // 0x02 - Add items to be sent..
    // 0x03 - Send confirmation..
    // 0x04 - Cancel sending item..
    // 0x05 - Send client new item count..
    // 0x06 - Send new items..
    // 0x07 - Removes a delivered item from sending box
    // 0x08 - Update delivery cell before removing..
    // 0x09 - Return to sender..
    // 0x0a - Take item from cell..
    // 0x0b - Remove item from cell..
    // 0x0c - Confirm name before sending..
    // 0x0d - Opening to send mail..
    // 0x0e - Opening to receive mail..
    // 0x0f - Closing mail window..

    switch (action)
    {
    case 0x01:
    {
        int8* fmtQuery;

        fmtQuery = "SELECT itemid, itemsubid, slot, quantity, sent, extra, sender, charname FROM delivery_box WHERE charid = %u AND box = %d AND slot < 8 ORDER BY slot;";

        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id, boxtype);

        if (ret != SQL_ERROR)
        {
            int items = 0;
            if (Sql_NumRows(SqlHandle) != 0)
            {
                while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                {
                    CItem* PItem = itemutils::GetItem(Sql_GetIntData(SqlHandle, 0));

                    if (PItem != nullptr) // Prevent an access violation in the event that an item doesn't exist for an ID
                    {
                        PItem->setSubID(Sql_GetIntData(SqlHandle, 1));
                        PItem->setSlotID(Sql_GetIntData(SqlHandle, 2));
                        PItem->setQuantity(Sql_GetUIntData(SqlHandle, 3));

                        int what = Sql_GetUIntData(SqlHandle, 4);
                        if (Sql_GetUIntData(SqlHandle, 4) > 0)
                        {
                            PItem->setSent(true);
                        }

                        size_t length = 0;
                        int8* extra = nullptr;
                        Sql_GetData(SqlHandle, 5, &extra, &length);
                        memcpy(PItem->m_extra, extra, (length > sizeof(PItem->m_extra) ? sizeof(PItem->m_extra) : length));

                        PItem->setSender(Sql_GetData(SqlHandle, 6));
                        PItem->setReceiver(Sql_GetData(SqlHandle, 7));

                        PChar->UContainer->SetItem(PItem->getSlotID(), PItem);
                        ++items;
                    }
                }
            }
            for (uint8 i = 0; i < 8; ++i)
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PChar->UContainer->GetItem(i),i, items, 1));
            }
        }
        return;
    }
    case 0x02: //add items to send box
    {
        uint8 invslot = RBUFB(data, (0x07));
        uint32 quantity = RBUFL(data, (0x08));
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(invslot);

        if (quantity > 0 && PItem && PItem->getQuantity() >= quantity && PChar->UContainer->IsSlotEmpty(slotID))
        {
            int32 ret = Sql_Query(SqlHandle, "SELECT charid, accid FROM chars WHERE charname = '%s' LIMIT 1;", data[0x10]);
            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                uint32 charid = Sql_GetUIntData(SqlHandle, 0);

                if (PItem->getFlag() & ITEM_FLAG_NODELIVERY)
                {
                    if (!(PItem->getFlag() & ITEM_FLAG_DELIVERYINNER))
                        return;

                    uint32 accid = Sql_GetUIntData(SqlHandle, 1);
                    int32 ret = Sql_Query(SqlHandle, "SELECT COUNT(*) FROM chars WHERE charid = '%u' AND accid = '%u' LIMIT 1;", PChar->id, accid);
                    if (ret == SQL_ERROR || Sql_NextRow(SqlHandle) != SQL_SUCCESS || Sql_GetUIntData(SqlHandle, 0) == 0)
                        return;
                }

                CItem* PUBoxItem = itemutils::GetItem(PItem->getID());
                PUBoxItem->setReceiver(data[0x10]);
                PUBoxItem->setSender((int8*)PChar->GetName());
                PUBoxItem->setQuantity(quantity);
                PUBoxItem->setSlotID(PItem->getSlotID());
                memcpy(PUBoxItem->m_extra, PItem->m_extra, sizeof(PUBoxItem->m_extra));

                int8 extra[sizeof(PItem->m_extra) * 2 + 1];
                Sql_EscapeStringLen(SqlHandle, extra, (const int8*)PItem->m_extra, sizeof(PItem->m_extra));

                ret = Sql_Query(SqlHandle,
                    "INSERT INTO delivery_box(charid, charname, box, slot, itemid, itemsubid, quantity, extra, senderid, sender) VALUES(%u, '%s', 2, %u, %u, %u, %u, '%s', %u, '%s'); ",
                    PChar->id,
                    PChar->GetName(),
                    slotID,
                    PItem->getID(),
                    PItem->getSubID(),
                    quantity,
                    extra,
                    charid,
                    data[0x10]);

                if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1 && charutils::UpdateItem(PChar, LOC_INVENTORY, invslot, -(int32)quantity))
                {
                    PChar->UContainer->SetItem(slotID, PUBoxItem);
                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PUBoxItem, slotID, PChar->UContainer->GetItemsCount(), 1));
                    PChar->pushPacket(new CInventoryFinishPacket());
                }
                else
                {
                    delete PUBoxItem;
                }
            }
        }
        return;
    }
    case 0x03: //send items
    {
        uint8 send_items = 0;
        for (int i = 0; i < 8; i++)
        {
            if (!PChar->UContainer->IsSlotEmpty(i) &&
                !PChar->UContainer->GetItem(i)->isSent())
            {
                send_items++;
            }
        }
        if (!PChar->UContainer->IsSlotEmpty(slotID))
        {
            CItem* PItem = PChar->UContainer->GetItem(slotID);

            if (PItem && !PItem->isSent())
            {
                bool isAutoCommitOn = Sql_GetAutoCommit(SqlHandle);
                bool commit = false;

                if (Sql_SetAutoCommit(SqlHandle, false) && Sql_TransactionStart(SqlHandle))
                {
                    int32 ret = Sql_Query(SqlHandle, "SELECT charid FROM chars WHERE charname = '%s' LIMIT 1", PItem->getReceiver());

                    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                    {
                        uint32 charid = Sql_GetUIntData(SqlHandle, 0);

                        ret = Sql_Query(SqlHandle, "UPDATE delivery_box SET sent = 1 WHERE charid = %u AND senderid = %u AND slot = %u AND box = 2;", PChar->id, charid, slotID);

                        if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1)
                        {
                            int8 extra[sizeof(PItem->m_extra) * 2 + 1];
                            Sql_EscapeStringLen(SqlHandle, extra, (const int8*)PItem->m_extra, sizeof(PItem->m_extra));

                            ret = Sql_Query(SqlHandle,
                                "INSERT INTO delivery_box(charid, charname, box, itemid, itemsubid, quantity, extra, senderid, sender) VALUES(%u, '%s', 1, %u, %u, %u, '%s', %u, '%s'); ",
                                charid,
                                PItem->getReceiver(),
                                PItem->getID(),
                                PItem->getSubID(),
                                PItem->getQuantity(),
                                extra,
                                PChar->id,
                                PChar->GetName());
                            if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1)
                            {
                                PItem->setSent(true);
                                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, send_items, 0x02));
                                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, send_items, 0x01));
                                commit = true;
                            }
                        }
                    }
                    if (!commit || !Sql_TransactionCommit(SqlHandle))
                    {
                        Sql_TransactionRollback(SqlHandle);
                        ShowError("Could not finalize send transaction. PlayerID: %d Target: %s slotID: %d", PChar->id, PItem->getReceiver(), slotID);
                    }

                    Sql_SetAutoCommit(SqlHandle, isAutoCommitOn);
                }
            }
        }
        return;
    }
    case 0x04: //cancel send
    {
        if (PChar->UContainer->GetType() != UCONTAINER_DELIVERYBOX) return;

        if (!PChar->UContainer->IsSlotEmpty(slotID))
        {
            bool isAutoCommitOn = Sql_GetAutoCommit(SqlHandle);
            bool commit = false;

            if (Sql_SetAutoCommit(SqlHandle, false) && Sql_TransactionStart(SqlHandle))
            {
                int32 ret = Sql_Query(SqlHandle, "SELECT charid FROM chars WHERE charname = '%s' LIMIT 1", PChar->UContainer->GetItem(slotID)->getReceiver());

                if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                {
                    uint32 charid = Sql_GetUIntData(SqlHandle, 0);
                    ret = Sql_Query(SqlHandle, "UPDATE delivery_box SET sent = 0 WHERE charid = %u AND box = 2 AND slot = %u AND sent = 1 AND received = 0 LIMIT 1;", PChar->id, slotID);

                    if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1)
                    {
                        CItem* PItem = PChar->UContainer->GetItem(slotID);
                        int32 ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE senderid = %u AND box = 1 AND charid = %u AND itemid = %u AND quantity = %u AND slot >= 8 LIMIT 1;",
                            PChar->id, charid, PItem->getID(), PItem->getQuantity());

                        if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1)
                        {
                            PChar->UContainer->GetItem(slotID)->setSent(false);
                            commit = true;
                            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PChar->UContainer->GetItem(slotID), slotID, PChar->UContainer->GetItemsCount(), 0x02));
                            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PChar->UContainer->GetItem(slotID), slotID, PChar->UContainer->GetItemsCount(), 0x01));
                        }
                    }
                }
                if (!commit || !Sql_TransactionCommit(SqlHandle))
                {
                    Sql_TransactionRollback(SqlHandle);
                    ShowError("Could not finalize cancel send transaction. PlayerID: %d slotID: %d", PChar->id, slotID);
                    //error message: "Delivery orders are currently backlogged."
                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0, -1));
                }

                Sql_SetAutoCommit(SqlHandle, isAutoCommitOn);
            }
        }
        return;
    }
    case 0x05:
    {
        // Send the player the new items count not seen..
        if (PChar->UContainer->GetType() != UCONTAINER_DELIVERYBOX)
            return;

        uint8 received_items = 0;
        int32 ret = SQL_ERROR;

        if (boxtype == 0x01)
        {
            int limit = 0;
            for (int i = 0; i < 8; ++i)
            {
                if (PChar->UContainer->IsSlotEmpty(i))
                {
                    limit++;
                }
            }
            std::string Query = "SELECT charid FROM delivery_box WHERE charid = %u AND box = 1 AND slot >= 8 ORDER BY slot ASC LIMIT %u;";
            ret = Sql_Query(SqlHandle, Query.c_str(), PChar->id, limit);
        }
        else if (boxtype == 0x02)
        {
            std::string Query = "SELECT charid FROM delivery_box WHERE charid = %u AND received = 1 AND box = 2;";
            ret = Sql_Query(SqlHandle, Query.c_str(), PChar->id);
        }

        if (ret != SQL_ERROR)
        {
            received_items = Sql_NumRows(SqlHandle);
        }
        PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0xFF, 0x02));
        PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, received_items, 0x01));

        return;
    }
    case 0x06: // Move item to received
    {
        if (boxtype == 1)
        {
            bool isAutoCommitOn = Sql_GetAutoCommit(SqlHandle);
            bool commit = false;

            if (Sql_SetAutoCommit(SqlHandle, false) && Sql_TransactionStart(SqlHandle))
            {
                std::string Query = "SELECT itemid, itemsubid, quantity, extra, sender, senderid FROM delivery_box WHERE charid = %u AND box = 1 AND slot >= 8 ORDER BY slot ASC LIMIT 1;";

                int32 ret = Sql_Query(SqlHandle, Query.c_str(), PChar->id);

                CItem* PItem = nullptr;

                if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                {
                    PItem = itemutils::GetItem(Sql_GetUIntData(SqlHandle, 0));

                    if (PItem)
                    {
                        PItem->setSubID(Sql_GetIntData(SqlHandle, 1));
                        PItem->setQuantity(Sql_GetUIntData(SqlHandle, 2));

                        size_t length = 0;
                        int8* extra = nullptr;
                        Sql_GetData(SqlHandle, 3, &extra, &length);
                        memcpy(PItem->m_extra, extra, (length > sizeof(PItem->m_extra) ? sizeof(PItem->m_extra) : length));

                        PItem->setSender(Sql_GetData(SqlHandle, 4));
                        if (PChar->UContainer->IsSlotEmpty(slotID))
                        {
                            int senderID = Sql_GetUIntData(SqlHandle, 5);
                            PItem->setSlotID(slotID);

                            //the result of this query doesn't really matter, it can be sent from the auction house which has no sender record
                            Sql_Query(SqlHandle, "UPDATE delivery_box SET received = 1 WHERE senderid = %u AND charid = %u AND box = 2 AND received = 0 AND quantity = %u LIMIT 1;",
                                PChar->id, senderID, PItem->getQuantity());

                            Query = "UPDATE delivery_box SET slot = %u WHERE charid = %u AND box = 1 AND slot = 8;";
                            ret = Sql_Query(SqlHandle, Query.c_str(), slotID, PChar->id);
                            if (ret != SQL_ERROR)
                            {
                                Query = "UPDATE delivery_box SET slot = slot - 1 WHERE charid = %u AND box = 1 AND slot > 8;";
                                ret = Sql_Query(SqlHandle, Query.c_str(), PChar->id);
                                if (ret != SQL_ERROR)
                                {
                                    PChar->UContainer->SetItem(slotID, PItem);
                                    //TODO: increment "count" for every new item, if needed
                                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, nullptr, slotID, 1, 2));
                                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, 1, 1));
                                    commit = true;
                                }
                            }
                        }
                    }
                }
                if (!commit || !Sql_TransactionCommit(SqlHandle))
                {
                    if (PItem)
                    {
                        delete PItem;
                    }
                    Sql_TransactionRollback(SqlHandle);
                    ShowError("Could not find new item to add to delivery box. PlayerID: %d Box :%d Slot: %d\n", PChar->id, boxtype, slotID);
                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0, 0xEB));
                }
            }
            Sql_SetAutoCommit(SqlHandle, isAutoCommitOn);
        }
        return;
    }
    case 0x07: //remove received items from send box
    {
        uint8 received_items = 0;
        uint8 first_received = 0xFF;
        for (int i = 0; i < 8; ++i)
        {
            if (!PChar->UContainer->IsSlotEmpty(i))
            {
                CItem* PItem = PChar->UContainer->GetItem(i);
                if (PItem->isSent())
                {
                    if (first_received == 0xFF)
                    {
                        first_received = i;
                    }
                    received_items++;
                }
            }
        }
        CItem* PItem = PChar->UContainer->GetItem(first_received);

        int32 ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND box = 2 AND slot = %u LIMIT 1;", PChar->id, first_received);

        if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1)
        {
            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0, 0x02));
            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, first_received, received_items, 0x01));
            PChar->UContainer->SetItem(first_received, nullptr);
            delete PItem;
        }
        return;
    }
    case 0x08:
    {
        if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
            !PChar->UContainer->IsSlotEmpty(slotID))
        {
            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PChar->UContainer->GetItem(slotID), slotID, 1, 1));
        }
        return;
    }
    case 0x09: // Option: Return
    {
        if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
            !PChar->UContainer->IsSlotEmpty(slotID))
        {
            bool isAutoCommitOn = Sql_GetAutoCommit(SqlHandle);
            bool commit = false; // When in doubt back it out.

            CItem* PItem = PChar->UContainer->GetItem(slotID);
            auto item_id = PItem->getID();
            auto quantity = PItem->getQuantity();
            uint32 senderID = 0;
            string_t senderName;

            if (Sql_SetAutoCommit(SqlHandle, false) && Sql_TransactionStart(SqlHandle))
            {
                // Get sender of delivery record
                int32 ret = Sql_Query(SqlHandle, "SELECT senderid, sender FROM delivery_box WHERE charid = %u AND slot = %u AND box = 1 LIMIT 1;", PChar->id, slotID);

                if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                {
                    senderID = Sql_GetUIntData(SqlHandle, 0);
                    senderName.insert(0, Sql_GetData(SqlHandle, 1));

                    if (senderID != 0)
                    {
                        int8 extra[sizeof(PItem->m_extra) * 2 + 1];
                        Sql_EscapeStringLen(SqlHandle, extra, (const int8*)PItem->m_extra, sizeof(PItem->m_extra));

                        // Insert a return record into delivery_box
                        ret = Sql_Query(SqlHandle,
                            "INSERT INTO delivery_box(charid, charname, box, itemid, itemsubid, quantity, extra, senderid, sender) VALUES(%u, '%s', 1, %u, %u, %u, '%s', %u, '%s'); ",
                            senderID,
                            senderName.c_str(),
                            PItem->getID(),
                            PItem->getSubID(),
                            PItem->getQuantity(),
                            extra,
                            PChar->id,
                            PChar->GetName());

                        if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) > 0)
                        {
                            // Remove original delivery record
                            ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND slot = %u AND box = 1 LIMIT 1;", PChar->id, slotID);

                            if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) > 0)
                            {
                                ret = Sql_Query(SqlHandle, "UPDATE delivery_box SET received = 1 WHERE senderid = %u AND charid = %u AND box = 2 LIMIT 1;", PChar->id, senderID);

                                if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) == 1)
                                {
                                    PChar->UContainer->SetItem(slotID, nullptr);
                                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, PChar->UContainer->GetItemsCount(), 1));
                                    delete PItem;
                                    commit = true;
                                }
                            }
                        }
                    }
                }

                if (!commit || !Sql_TransactionCommit(SqlHandle))
                {
                    Sql_TransactionRollback(SqlHandle);
                    ShowError("Could not finalize delivery return transaction. PlayerID: %d SenderID :%d ItemID: %d Quantity: %d", PChar->id, senderID, item_id, quantity);
                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, PChar->UContainer->GetItemsCount(), 0xEB));
                }

                Sql_SetAutoCommit(SqlHandle, isAutoCommitOn);
            }
        }
        return;
    }
    case 0x0A: // Option: Take
    {
        if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
            !PChar->UContainer->IsSlotEmpty(slotID))
        {
            bool isAutoCommitOn = Sql_GetAutoCommit(SqlHandle);
            bool commit = false;

            CItem* PItem = PChar->UContainer->GetItem(slotID);

            //ShowMessage("FreeSlots %u\n", PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount());
            //ShowMessage("ItemId %u", PItem->getID());

            if (!PItem->isType(ITEM_CURRENCY) &&
                PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() == 0)
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, PChar->UContainer->GetItemsCount(), 0xB9));
                return;
            }

            if (Sql_SetAutoCommit(SqlHandle, false) && Sql_TransactionStart(SqlHandle))
            {
                int32 ret;
                if (boxtype == 0x01)
                {
                    ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND slot = %u AND box = %u LIMIT 1", PChar->id, slotID, boxtype);
                }
                else if (boxtype == 0x02)
                {
                    ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND sent = 0 AND slot = %u AND box = %u LIMIT 1", PChar->id, slotID, boxtype);
                }

                if (ret != SQL_ERROR &&  Sql_AffectedRows(SqlHandle) != 0)
                {
                    if (charutils::AddItem(PChar, LOC_INVENTORY, itemutils::GetItem(PItem), true) != ERROR_SLOTID)
                    {
                        commit = true;
                    }
                }

                if (!commit || !Sql_TransactionCommit(SqlHandle))
                {
                    Sql_TransactionRollback(SqlHandle);
                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, PChar->UContainer->GetItemsCount(), 0xBA));
                    ShowError("Could not finalize receive transaction. PlayerID: %d Action: 0x0A", PChar->id);
                }
                else
                {
                    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, PChar->UContainer->GetItemsCount(), 1));
                    PChar->pushPacket(new CInventoryFinishPacket());
                    PChar->UContainer->SetItem(slotID, nullptr);
                    delete PItem;
                }
            }

            Sql_SetAutoCommit(SqlHandle, isAutoCommitOn);
        }
        return;
    }
    case 0x0B: // Option: Drop
    {
        if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
            !PChar->UContainer->IsSlotEmpty(slotID))
        {
            int32 ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND slot = %u AND box = 1 LIMIT 1", PChar->id, slotID);

            if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) != 0)
            {
                CItem* PItem = PChar->UContainer->GetItem(slotID);
                PChar->UContainer->SetItem(slotID, nullptr);

                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, PItem, slotID, PChar->UContainer->GetItemsCount(), 1));
                delete PItem;
            }
        }
        return;
    }
    case 0x0C: // Confirm name (send box)
    {
        int32 ret = Sql_Query(SqlHandle, "SELECT accid FROM chars WHERE charname = '%s' LIMIT 1", data[0x10]);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) > 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            uint32 accid = Sql_GetUIntData(SqlHandle, 0);
            ret = Sql_Query(SqlHandle, "SELECT COUNT(*) FROM chars WHERE charid = '%u' AND accid = '%u' LIMIT 1;", PChar->id, accid);
            if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS && Sql_GetUIntData(SqlHandle, 0))
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0xFF, 0x02));
                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0x01, 0x01));
            }
            else
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0xFF, 0x02));
                PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0x00, 0x01));
            }
        }
        else
        {
            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0xFF, 0x02));
            PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0x00, 0xFB));
        }
        return;
    }
    case 0x0D: //open send box
    case 0x0E: //open delivery box
    {
        PChar->UContainer->Clean();
        PChar->UContainer->SetType(UCONTAINER_DELIVERYBOX);
        PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0, 1));
        return;
    }
    case 0x0F:
    {
        if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX)
        {
            PChar->UContainer->Clean();
        }
    }
    break;
    }

    // Open mail, close mail..

    PChar->pushPacket(new CDeliveryBoxPacket(action, boxtype, 0, 1));
    return;
}

/************************************************************************
*                                                                       *
*  Auction House                                                        *
*                                                                       *
************************************************************************/

void SmallPacket0x04E(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8  action = RBUFB(data, (0x04));
    uint8  slotid = RBUFB(data, (0x05));
    uint32 price = RBUFL(data, (0x08));
    uint8  slot = RBUFB(data, (0x0C));
    uint16 itemid = RBUFW(data, (0x0E));
    uint8  quantity = RBUFB(data, (0x10));

    ShowDebug(CL_CYAN"AH Action (%02hx)\n" CL_RESET, RBUFB(data, (0x04)));

    // 0x04 - Selling Items
    // 0x05 - Open List Of Sales / Wait
    // 0x0A - Retrieve List of Items Sold By Player
    // 0x0B - Proof Of Purchase
    // 0x0E - Purchasing Items
    // 0x0С - Cancel Sale
    // 0x0D - Update Sale List By Player

    switch (action)
    {
    case 0x04:
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

        if ((PItem != nullptr) &&
            (PItem->getID() == itemid) &&
            !(PItem->isSubType(ITEM_LOCKED)) &&
            !(PItem->getFlag() & ITEM_FLAG_NOAUCTION))
        {
            PItem->setCharPrice(price);
            PChar->pushPacket(new CAuctionHousePacket(action, PItem, quantity));
        }
    }
    break;
    case 0x05:
    {
        uint32 curTick = gettick();

        if (curTick - PChar->m_AHHistoryTimestamp > 5000)
        {
            PChar->m_ah_history.clear();
            PChar->m_AHHistoryTimestamp = curTick;
            PChar->pushPacket(new CAuctionHousePacket(action));

            // A single SQL query for the player's AH history which is stored in a Char Entity struct + vector.
            const int8* Query = "SELECT itemid, price, stack FROM auction_house WHERE seller = %u and sale=0 LIMIT 7;";

            int32 ret = Sql_Query(SqlHandle, Query, PChar->id);

            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
            {
                while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                {
                    AuctionHistory_t ah;
                    ah.itemid = (uint16)Sql_GetIntData(SqlHandle, 0);
                    ah.price = (uint32)Sql_GetUIntData(SqlHandle, 1);
                    ah.stack = (uint8)Sql_GetIntData(SqlHandle, 2);
                    ah.status = 0;
                    PChar->m_ah_history.push_back(ah);
                }
            }
            ShowDebug("%s has %i items up on the AH. \n", PChar->GetName(), PChar->m_ah_history.size());
        }
        else
        {
            PChar->pushPacket(new CAuctionHousePacket(action, 246, 0, 0)); // try again in a little while msg
            break;
        }
    }
    case 0x0A:
    {
        uint8 totalItemsOnAh = PChar->m_ah_history.size();

        for (int8 slot = 0; slot < totalItemsOnAh; slot++)
        {
            PChar->pushPacket(new CAuctionHousePacket(0x0C, slot, PChar));
        }
    }
    break;
    case 0x0B:
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

        if ((PItem != nullptr) &&
            !(PItem->isSubType(ITEM_LOCKED)) &&
            !(PItem->getFlag() & ITEM_FLAG_NOAUCTION))
        {
            if (quantity == 0 &&
                (PItem->getStackSize() == 1 ||
                PItem->getStackSize() != PItem->getQuantity()))
            {
                ShowError(CL_RED"SmallPacket0x04E::AuctionHouse: Incorrect quantity of item %s\n" CL_RESET, PItem->getName());
                PChar->pushPacket(new CAuctionHousePacket(action, 197, 0, 0)); //failed to place up
                return;
            }
            if (PChar->m_ah_history.size() >= 7)
            {
				ShowDebug(CL_CYAN"%s already has 7 items on the AH\n" CL_RESET,PChar->GetName());
                PChar->pushPacket(new CAuctionHousePacket(action, 197, 0, 0)); //failed to place up
                return;
            }

            const int8* fmtQuery = "INSERT INTO auction_house(itemid, stack, seller, seller_name, date, price) VALUES(%u,%u,%u,'%s',%u,%u)";

            if (Sql_Query(SqlHandle,
                fmtQuery,
                PItem->getID(),
                quantity == 0,
                PChar->id,
                PChar->GetName(),
                (uint32)time(nullptr),
                price) == SQL_ERROR)
            {
				ShowError(CL_RED"SmallPacket0x04E::AuctionHouse: Cannot insert item %s to database\n" CL_RESET, PItem->getName());
                PChar->pushPacket(new CAuctionHousePacket(action, 197, 0, 0)); //failed to place up
                return;
            }
            charutils::UpdateItem(PChar, LOC_INVENTORY, slot, -(int32)(quantity != 0 ? 1 : PItem->getStackSize()));

            PChar->pushPacket(new CAuctionHousePacket(action, 1, 0, 0)); //merchandise put up on auction msg
            PChar->pushPacket(new CAuctionHousePacket(0x0C, PChar->m_ah_history.size(), PChar)); //inform history of slot
        }
    }
    break;
    case 0x0E:
    {
        itemid = RBUFW(data, (0x0C));

        if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() == 0)
        {
            PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, 0, 0));
        }
        else
        {
            CItem* PItem = itemutils::GetItemPointer(itemid);

            if (PItem != nullptr)
            {
                if (PItem->getFlag() & ITEM_FLAG_RARE)
                {
                    for (uint8 LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
                    {
                        if (PChar->getStorage(LocID)->SearchItem(itemid) != ERROR_SLOTID)
                        {
                            PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, 0, 0));
                            return;
                        }
                    }
                }
                CItem* gil = PChar->getStorage(LOC_INVENTORY)->GetItem(0);

                if (gil != nullptr &&
                    gil->isType(ITEM_CURRENCY) &&
                    gil->getQuantity() >= price)
                {
                    const int8* fmtQuery = "UPDATE auction_house SET buyer_name = '%s', sale = %u, sell_date = %u WHERE itemid = %u AND buyer_name IS NULL AND stack = %u AND price <= %u ORDER BY price LIMIT 1";

                    if (Sql_Query(SqlHandle,
                        fmtQuery,
                        PChar->GetName(),
                        price,
                        (uint32)time(nullptr),
                        itemid,
                        quantity == 0,
                        price) != SQL_ERROR &&
                        Sql_AffectedRows(SqlHandle) != 0)
                    {
                        uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemid, (quantity == 0 ? PItem->getStackSize() : 1));

                        if (SlotID != ERROR_SLOTID)
                        {
                            charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(price));

                            PChar->pushPacket(new CAuctionHousePacket(action, 0x01, itemid, price));
                            PChar->pushPacket(new CInventoryFinishPacket());
                        }
                        return;
                    }
                }
            }
            PChar->pushPacket(new CAuctionHousePacket(action, 0xC5, itemid, price));
        }
    }
    break;
    case 0x0C: //removing item from ah
    {
        //check user has invent space
        if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() == 0)
        {
            PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, PChar, slotid, true)); //invent full, unable to remove msg
            return;
        }
        else
        {
            const int8* delQuery = "DELETE FROM auction_house WHERE seller = %u AND id = %u AND sale = 0 LIMIT 1;";

            const int8* fmtQuery = "SELECT itemid, stack, id FROM auction_house WHERE seller = %u and sale=0;";
            int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);
            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
            {
                uint8 count = 0;
                while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                {
                    if (count == slotid){
                        uint16 delitemid = (uint16)Sql_GetUIntData(SqlHandle, 0);
                        uint16 delitemstack = (uint16)Sql_GetUIntData(SqlHandle, 1);
                        uint32 ahid = (uint32)Sql_GetUIntData(SqlHandle, 2);
                        int32 delret = Sql_Query(SqlHandle, delQuery, PChar->id, ahid);
                        if (delret != SQL_ERROR){
                            //add the item back to the users invent
                            CItem* PDelItem = itemutils::GetItemPointer(delitemid);
                            if (PDelItem != nullptr){
                                uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, delitemid,
                                    (delitemstack != 0 ? PDelItem->getStackSize() : 1));

                                if (SlotID != ERROR_SLOTID)
                                {
                                    PChar->pushPacket(new CAuctionHousePacket(action, 0, PChar, slotid, false));
                                    PChar->pushPacket(new CInventoryFinishPacket());
                                }
                                else {
                                    ShowError("Failed to return item id %u stack %u to char... \n", delitemid, delitemstack);
                                }
                                return;
                            }
                        }
                        break;
                    }
                    count++;
                }
            }
            //let client know something went wrong
            PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, PChar, slotid, true)); //invent full, unable to remove msg
        }
    }
    break;
    case 0x0D:
    {
        PChar->pushPacket(new CAuctionHousePacket(action, slotid, PChar));
    }
    break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Equipment Change                                                     *
*                                                                       *
************************************************************************/

void SmallPacket0x050(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->status != STATUS_NORMAL)
        return;

    uint8 slotID = RBUFB(data, (0x04));        // inventory slot
    uint8 equipSlotID = RBUFB(data, (0x05));        // charequip slot
    uint8 containerID = RBUFB(data, (0x06));     // container id

    if (containerID != 0 && containerID != 8)
    {
        return;
    }

    charutils::EquipItem(PChar, slotID, equipSlotID, containerID); //current
    charutils::SaveCharEquip(PChar);
    charutils::SaveCharLook(PChar);
    luautils::CheckForGearSet(PChar); // check for gear set on gear change
    PChar->UpdateHealth();
    return;
}
/************************************************************************
*                                                                       *
*  Equip Macro Set                                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x051(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->status != STATUS_NORMAL)
        return;

    for (uint8 i = 0; i < RBUFB(data, (0x04)); i++)
    {
        uint8 slotID = RBUFB(data, (0x08 + (0x04 * i)));        // inventory slot
        uint8 equipSlotID = RBUFB(data, (0x09 + (0x04 * i)));        // charequip slot
        uint8 containerID = RBUFB(data, (0x0A + (0x04 * i)));     // container id
        if (containerID == 0 || containerID == 8)
        {
            charutils::EquipItem(PChar, slotID, equipSlotID, containerID);
        }

    }
    charutils::SaveCharEquip(PChar);
    charutils::SaveCharLook(PChar);
    luautils::CheckForGearSet(PChar); // check for gear set on gear change
    PChar->UpdateHealth();
    return;
}
/************************************************************************
*                                                                        *
*  Add Equipment to set                                                 *
*                                                                        *
************************************************************************/

void SmallPacket0x052(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    //Im guessing this is here to check if you can use A Item, as it seems useless to have this sent to server
    //as It will check requirements when it goes to equip the items anyway
    //0x05 is slot of updated item
    //0x08 is info for updated item
    //0x0C is first slot every 4 bytes is another set, in (01-equip 0-2 remve),(container),(ID),(ID)
    //in this list the slot of whats being updated is old value, replace with new in 116
    //Should Push 0x116 (size 68) in responce
    //0x04 is start, contains 16 4 byte parts repersently each slot in order
    PChar->pushPacket(new CAddtoEquipSet(data));
    return;
}

/************************************************************************
*                                                                        *
*  LockStyleSet                                                          *
*                                                                        *
************************************************************************/
void SmallPacket0x053(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 count = RBUFB(data, (0x04));
    uint8 type = RBUFB(data, (0x05));

    if (type == 0 && PChar->getStyleLocked())
    {
        charutils::SetStyleLock(PChar, false);
        charutils::SaveCharLook(PChar);
    }
    else if (type == 1)
    {
        // The client sends this when logging in and zoning.
        PChar->setStyleLocked(true);
    }
    else if (type == 2)
    {
        PChar->pushPacket(new CMessageStandardPacket(PChar->getStyleLocked() ? 0x10D : 0x10E));
    }
    else if (type == 3)
    {
        charutils::SetStyleLock(PChar, true);

        for (int i = 0x08; i < 0x08 + (0x08 * count); i += 0x08) {
            uint8 slotId = RBUFB(data, i);
            uint8 equipSlotId = RBUFB(data, i + 0x01);
            uint8 locationId = RBUFB(data, i + 0x02);
            uint16 itemId = RBUFW(data, i + 0x04);

            auto PItem = itemutils::GetItem(itemId);
            if (PItem == nullptr || !(PItem->isType(ITEM_WEAPON) || PItem->isType(ITEM_ARMOR)))
                itemId = 0;
            else if (!(((CItemArmor*)PItem)->getEquipSlotId() & (1 << equipSlotId)))
                itemId = 0;

            PChar->styleItems[equipSlotId] = itemId;

            switch (equipSlotId)
            {
            case SLOT_MAIN:
            case SLOT_SUB:
            case SLOT_RANGED:
            case SLOT_AMMO:
                charutils::UpdateWeaponStyle(PChar, equipSlotId, (CItemWeapon*)PChar->getEquip((SLOTTYPE)equipSlotId));
            case SLOT_HEAD:
            case SLOT_BODY:
            case SLOT_HANDS:
            case SLOT_LEGS:
            case SLOT_FEET:
                charutils::UpdateArmorStyle(PChar, equipSlotId);
                break;
            }
        }
        charutils::SaveCharLook(PChar);
    }
    else if (type == 4)
    {
        charutils::SetStyleLock(PChar, true);
        charutils::SaveCharLook(PChar);
    }

    if (type != 1 && type != 2)
    {
        PChar->pushPacket(new CCharAppearancePacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }

    return;
}

/************************************************************************
*                                                                        *
*  Request synthesis suggestion                                            *
*                                                                        *
************************************************************************/

void SmallPacket0x058(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 skillID = RBUFW(data, (0x04));
    uint16 skillLevel = RBUFW(data, (0x06));
    //PChar->pushPacket(new CSynthSuggestionPacket(recipeID));
}

/************************************************************************
*                                                                       *
*  Synthesis Complete                                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x059(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->animation == ANIMATION_SYNTH)
    {
        synthutils::sendSynthDone(PChar);
    }
    return;
}

/************************************************************************
*                                                                       *
*  Map Update (Conquest, Besieged, Campaing)                            *
*                                                                       *
************************************************************************/

void SmallPacket0x05A(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->pushPacket(new CConquestPacket(PChar));
    PChar->pushPacket(new CCampaingPacket(PChar, 0));
    PChar->pushPacket(new CCampaingPacket(PChar, 1));

    // May Require Sending of 0x0F
    //    PChar->pushPacket(new CStopDownloadingPacket(PChar));
    //    luautils::CheckForGearSet(PChar); // also check for gear set
    return;
}

/************************************************************************
*                                                                       *
*  Event Update (Completion or Update)                                  *
*                                                                       *
************************************************************************/

void SmallPacket0x05B(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 EventID = RBUFW(data, (0x12));
    uint32 Result = RBUFL(data, (0x08));

    if (PChar->m_event.EventID == EventID)
    {
        if (PChar->m_event.Option != 0) Result = PChar->m_event.Option;

        if (RBUFB(data, (0x0E)) != 0)
        {
            luautils::OnEventUpdate(PChar, EventID, Result);
        }
        else
        {
            luautils::OnEventFinish(PChar, EventID, Result);
            //reset if this event did not initiate another event
            if (PChar->m_event.EventID == EventID)
            {
                PChar->m_event.reset();
            }
        }
    }

    PChar->pushPacket(new CReleasePacket(PChar, RELEASE_EVENT));
    return;
}

/************************************************************************
*                                                                       *
*  Event Update (Update Player Position)                                *
*                                                                       *
************************************************************************/

void SmallPacket0x05C(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 EventID = RBUFW(data, (0x1A));

    if (PChar->m_event.EventID == EventID)
    {
        PChar->loc.p.x = RBUFF(data, (0x04));
        PChar->loc.p.y = RBUFF(data, (0x08));
        PChar->loc.p.z = RBUFF(data, (0x0C));
        PChar->loc.p.rotation = RBUFB(data, (0x1F));

        if (RBUFB(data, (0x1E)) != 0)
        {
            luautils::OnEventUpdate(PChar, EventID, 0);
        }
        else
        {
            luautils::OnEventFinish(PChar, EventID, 0);
            if (PChar->m_event.EventID == EventID)
            {
                PChar->m_event.reset();
            }
        }

        PChar->pushPacket(new CCSPositionPacket(PChar));
        PChar->pushPacket(new CPositionPacket(PChar));
    }
    PChar->pushPacket(new CReleasePacket(PChar, RELEASE_EVENT));
    return;
}

/************************************************************************
*                                                                       *
*  Emote (/jobemote [job])                                              *
*                                                                       *
************************************************************************/

void SmallPacket0x05D(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (jailutils::InPrison(PChar))
    {
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
        return;
    }

    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCharEmotionPacket(PChar, data));
    return;
}

/************************************************************************
*                                                                       *
*  Zone Line Request (Movement Between Zones)                           *
*                                                                       *
************************************************************************/

void SmallPacket0x05E(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    // handle pets on zone
    if (PChar->PPet != nullptr)
    {
        CPetEntity* PPet = (CPetEntity*)PChar->PPet;

        if (PPet->objtype == TYPE_MOB)
        {
            // uncharm a charmed mob
            petutils::DespawnPet(PChar);
        }
        else if (PPet->objtype == TYPE_PET)
        {
            switch (PPet->getPetType())
            {
            case PETTYPE_JUG_PET:
            case PETTYPE_AUTOMATON:
            case PETTYPE_WYVERN:
                PChar->petZoningInfo.petHP = PPet->health.hp;
                PChar->petZoningInfo.petTP = PPet->health.tp;
                PChar->petZoningInfo.respawnPet = true;
                PChar->petZoningInfo.petType = PPet->getPetType();
                petutils::DespawnPet(PChar);
                break;

            case PETTYPE_AVATAR:
                petutils::DespawnPet(PChar);

            default:
                break;
            }
        }
    }

    uint32 zoneLineID = RBUFL(data, (0x04));
    //TODO: verify packet in adoulin expansion
    uint8  town = RBUFB(data, (0x16));
    uint8  zone = RBUFB(data, (0x17));

    if (PChar->status == STATUS_NORMAL)
    {
        PChar->status = STATUS_DISAPPEAR;
        PChar->loc.boundary = 0;

        // Exiting Mog House..
        if (zoneLineID == 1903324538)
        {
            uint16 prevzone = PChar->loc.prevzone;

            // If zero, return to previous zone.. otherwise, determine the zone..
            if (zone != 0)
            {
                switch (town)
                {
                case 1: prevzone = zone + 0xE5; break;
                case 2: prevzone = zone + 0xE9; break;
                case 3: prevzone = zone + 0xED; break;
                case 4: prevzone = zone + 0xF2; break;
                case 5: prevzone = zone + (zone == 1 ? 0x2F : 0x30); break;
                }

                // Handle case for mog garden.. (Above addition does not work for this zone.)
                if (zone == 127)
                {
                    prevzone = 280;
                }
                else if (zone == 125)
                {
                    prevzone = PChar->loc.prevzone;
                }
            }
            PChar->m_moghouseID = 0;
            PChar->loc.destination = prevzone;
            memset(&PChar->loc.p, 0, sizeof(PChar->loc.p));
        }
        else
        {
            zoneLine_t* PZoneLine = PChar->loc.zone->GetZoneLine(zoneLineID);

            // Ensure the zone line exists..
            if (PZoneLine == nullptr)
            {
                ShowError(CL_RED"SmallPacket0x5E: Zone line %u not found\n" CL_RESET, zoneLineID);

                PChar->loc.p.rotation += 128;

                PChar->pushPacket(new CMessageSystemPacket(0, 0, 2));
                PChar->pushPacket(new CCSPositionPacket(PChar));

                PChar->status = STATUS_NORMAL;
                return;
            }
            else
            {
                // Ensure the destination exists..
                CZone* PDestination = zoneutils::GetZone(PZoneLine->m_toZone);
                if (PDestination && PDestination->GetIP() == 0)
                {
                    ShowDebug(CL_CYAN"SmallPacket0x5E: Zone %u closed to chars\n" CL_RESET, PZoneLine->m_toZone);

                    PChar->loc.p.rotation += 128;

                    PChar->pushPacket(new CMessageSystemPacket(0, 0, 2));
                    PChar->pushPacket(new CCSPositionPacket(PChar));

                    PChar->status = STATUS_NORMAL;
                    return;
                }
                else
                {
                    PChar->loc.destination = PZoneLine->m_toZone;
                    PChar->loc.p = PZoneLine->m_toPos;
                }
            }
        }
        ShowInfo(CL_WHITE"Zoning from zone %u to zone %u: %s\n" CL_RESET, PChar->getZone(), PChar->loc.destination, PChar->GetName());
    }
    PChar->clearPacketList();

    uint64 ipp = zoneutils::GetZoneIPP(PChar->loc.destination == 0 ? PChar->getZone() : PChar->loc.destination);

    charutils::SendToZone(PChar, 2, ipp);
    return;
}

/************************************************************************
*                                                                       *
*  Event Update (String Update)                                         *
*  Player sends string for event update.                                *
*                                                                       *
************************************************************************/

// zone 245 cs 0x00C7 Password

void SmallPacket0x060(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 charid = RBUFL(data, 0x04);
    int8* string = data[12];
    luautils::OnEventUpdate(PChar, string);

	PChar->pushPacket(new CReleasePacket(PChar, RELEASE_EVENT));
	PChar->pushPacket(new CReleasePacket(PChar, RELEASE_UNKNOWN));

	return;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void SmallPacket0x061(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->pushPacket(new CCharUpdatePacket(PChar));
    PChar->pushPacket(new CCharHealthPacket(PChar));
    PChar->pushPacket(new CCharStatsPacket(PChar));
    PChar->pushPacket(new CCharSkillsPacket(PChar));
    PChar->pushPacket(new CCharRecastPacket(PChar));
    PChar->pushPacket(new CMenuMeritPacket(PChar));
    PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
    PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
    PChar->pushPacket(new CStatusEffectPacket(PChar));

    return;
}

/************************************************************************
*                                                                       *
*  Chocobo Digging                                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x063(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    return;
}

/************************************************************************
*                                                                       *
*  Key Items (Mark As Seen)                                             *
*                                                                       *
************************************************************************/

void SmallPacket0x064(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 KeyTable = RBUFB(data, (0x4A));
    memcpy(PChar->keys.seenList + (0x40 * KeyTable), data[0x08], 0x40);

    charutils::SaveKeyItems(PChar);
    return;
}

/************************************************************************
*                                                                       *
*  Fishing (Action) [Old fishing method packet!]                        *
*                                                                       *
************************************************************************/

void SmallPacket0x066(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PrintPacket(data);

    uint16 stamina = RBUFW(data, (0x08));
    uint8  action = RBUFB(data, (0x0E));

    fishingutils::FishingAction(PChar, (FISHACTION)action, stamina);
    return;
}

/************************************************************************
*                                                                       *
*  Party Invite                                                         *
*                                                                       *
************************************************************************/

void SmallPacket0x06E(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 charid = RBUFL(data, 0x04);
    uint16 targid = RBUFW(data, 0x08);
    // cannot invite yourself
    if (PChar->id == charid)
        return;

    if (jailutils::InPrison(PChar))
    {
        // Initiator is in prison.  Send error message.
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
        return;
    }

    switch (RBUFB(data, (0x0A)))
    {
    case 0: // party - must by party leader or solo
        if (PChar->PParty == nullptr || PChar->PParty->GetLeader() == PChar)
        {
            if (PChar->PParty && PChar->PParty->members.size() > 5)
            {
                PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 23));
                break;
            }
            CCharEntity* PInvitee = nullptr;
            if (targid != 0)
            {
                PInvitee = zoneutils::GetCharFromWorld(charid, targid);
            }
            if (PInvitee)
            {
				ShowDebug(CL_CYAN"%s sent party invite to %s\n" CL_RESET, PChar->GetName(), PInvitee->GetName());
                //make sure invitee isn't dead or in jail, they aren't a party member and don't already have an invite pending, and your party is not full
                if (PInvitee->isDead() || jailutils::InPrison(PInvitee) || PInvitee->InvitePending.id != 0 || PInvitee->PParty != nullptr)
                {
					ShowDebug(CL_CYAN"%s is dead, in jail, has a pending invite, or is already in a party\n" CL_RESET, PInvitee->GetName());
                    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 23));
                    break;
                }
                if (PInvitee->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC))
                {
					ShowDebug(CL_CYAN"%s has level sync, unable to send invite\n" CL_RESET, PInvitee->GetName());
                    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 236));
                    break;
                }

                PInvitee->InvitePending.id = PChar->id;
                PInvitee->InvitePending.targid = PChar->targid;
                PInvitee->pushPacket(new CPartyInvitePacket(charid, targid, PChar, INVITE_PARTY));
				ShowDebug(CL_CYAN"Sent party invite packet to %s\n" CL_RESET, PInvitee->GetName());
                if (PChar->PParty && PChar->PParty->GetSyncTarget())
                    PInvitee->pushPacket(new CMessageStandardPacket(PInvitee, 0, 0, 235));
            }
            else
            {
                ShowDebug(CL_CYAN"Building invite packet to send to lobby server from %s to (%d)\n" CL_RESET, PChar->GetName(), charid);
                //on another server (hopefully)
                uint8 packetData[12] {};
                WBUFL(packetData, 0) = charid;
                WBUFW(packetData, 4) = targid;
                WBUFL(packetData, 6) = PChar->id;
                WBUFW(packetData, 10) = PChar->targid;
                message::send(MSG_PT_INVITE, packetData, sizeof packetData, new CPartyInvitePacket(charid, targid, PChar, INVITE_PARTY));

                ShowDebug(CL_CYAN"Sent invite packet to lobby server from %s to (%d)\n" CL_RESET, PChar->GetName(), charid);
            }
        }
		else //in party but not leader, cannot invite
		{
			ShowDebug(CL_CYAN"%s is not party leader, cannot send invite\n" CL_RESET, PChar->GetName());
			PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 21));
		}
        break;

    case 5: // alliance - must be unallied party leader or alliance leader of a non-full alliance
        if (PChar->PParty && PChar->PParty->GetLeader() == PChar &&
            (PChar->PParty->m_PAlliance == nullptr ||
            (PChar->PParty->m_PAlliance->getMainParty() == PChar->PParty && PChar->PParty->m_PAlliance->partyCount() < 3)))
        {
            CCharEntity* PInvitee = nullptr;
            if (targid != 0)
            {
                PInvitee = zoneutils::GetCharFromWorld(charid, targid);
            }
            if (PInvitee)
            {
				ShowDebug(CL_CYAN"%s sent party invite to %s\n" CL_RESET, PChar->GetName(), PInvitee->GetName());
                //make sure intvitee isn't dead or in jail, they are an unallied party leader and don't already have an invite pending
                if (PInvitee->isDead() || jailutils::InPrison(PInvitee) || PInvitee->InvitePending.id != 0 ||
                    PInvitee->PParty == nullptr || PInvitee->PParty->GetLeader() != PInvitee || PInvitee->PParty->m_PAlliance)
                {
					ShowDebug(CL_CYAN"%s is dead, in jail, has a pending invite, or is already in a party/alliance\n" CL_RESET, PInvitee->GetName());
                    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 23));
                    break;
                }
                if (PInvitee->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC))
                {
					ShowDebug(CL_CYAN"%s has level sync, unable to send invite\n" CL_RESET, PInvitee->GetName());
                    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 236));
                    break;
                }

                PInvitee->InvitePending.id = PChar->id;
                PInvitee->InvitePending.targid = PChar->targid;
                PInvitee->pushPacket(new CPartyInvitePacket(charid, targid, PChar, INVITE_ALLIANCE));
				ShowDebug(CL_CYAN"Sent party invite packet to %s\n" CL_RESET, PInvitee->GetName());
            }
            else
            {
                ShowDebug(CL_CYAN"(Alliance)Building invite packet to send to lobby server from %s to (%d)\n" CL_RESET, PChar->GetName(), charid);
                //on another server (hopefully)
                uint8 packetData[12] {};
                WBUFL(packetData, 0) = charid;
                WBUFW(packetData, 4) = targid;
                WBUFL(packetData, 6) = PChar->id;
                WBUFW(packetData, 10) = PChar->targid;
                message::send(MSG_PT_INVITE, packetData, sizeof packetData, new CPartyInvitePacket(charid, targid, PChar, INVITE_ALLIANCE));

                ShowDebug(CL_CYAN"(Alliance)Sent invite packet to lobby server from %s to (%d)\n" CL_RESET, PChar->GetName(), charid);
            }
        }
        break;

    default:
        ShowError(CL_RED"SmallPacket0x06E : unknown byte <%.2X>\n" CL_RESET, RBUFB(data, (0x0A)));
        break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Party / Alliance Command 'Leave'                                     *
*                                                                       *
************************************************************************/

void SmallPacket0x06F(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->PParty)
        switch (RBUFB(data, (0x04)))
    {
        case 0: // party - anyone may remove themself from party regardless of leadership or alliance
            if (PChar->PParty->m_PAlliance && PChar->PParty->members.size() == 1) // single member alliance parties must be removed from alliance before disband
            {
				ShowDebug(CL_CYAN"%s party size is one\n" CL_RESET, PChar->GetName());
				if (PChar->PParty->m_PAlliance->partyCount() == 1) // if there is only 1 party then dissolve alliance
				{
					ShowDebug(CL_CYAN"%s alliance size is one party\n" CL_RESET, PChar->GetName());
					PChar->PParty->m_PAlliance->dissolveAlliance();
					ShowDebug(CL_CYAN"%s alliance is dissolved\n" CL_RESET, PChar->GetName());
				}
				else
				{
					ShowDebug(CL_CYAN"Removing %s party from alliance\n" CL_RESET, PChar->GetName());
					PChar->PParty->m_PAlliance->removeParty(PChar->PParty);
					ShowDebug(CL_CYAN"%s party is removed from alliance\n" CL_RESET, PChar->GetName());
				}
            }
			ShowDebug(CL_CYAN"Removing %s from party\n" CL_RESET, PChar->GetName());
            PChar->PParty->RemoveMember(PChar);
			ShowDebug(CL_CYAN"%s is removed from party\n" CL_RESET, PChar->GetName());
            break;

        case 5: // alliance - any party leader in alliance may remove their party
            if (PChar->PParty->m_PAlliance && PChar->PParty->GetLeader() == PChar)
            {
				ShowDebug(CL_CYAN"%s is leader of a party in an alliance\n" CL_RESET, PChar->GetName());
				if (PChar->PParty->m_PAlliance->partyCount() == 1) // if there is only 1 party then dissolve alliance
				{
					ShowDebug(CL_CYAN"One party in alliance, %s wants to dissolve the alliance\n" CL_RESET, PChar->GetName());
					PChar->PParty->m_PAlliance->dissolveAlliance();
					ShowDebug(CL_CYAN"%s has dissolved the alliance\n" CL_RESET, PChar->GetName());
				}
				else
				{
					ShowDebug(CL_CYAN"%s wants to remove their party from the alliance\n" CL_RESET, PChar->GetName());
					PChar->PParty->m_PAlliance->removeParty(PChar->PParty);
					ShowDebug(CL_CYAN"%s party is removed from the alliance\n" CL_RESET, PChar->GetName());
				}
            }
            break;

        default:
            ShowError(CL_RED"SmallPacket0x06F : unknown byte <%.2X>\n" CL_RESET, RBUFB(data, (0x04)));
            break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Party / Alliance Command 'Breakup'                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x070(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->PParty && PChar->PParty->GetLeader() == PChar)
        switch (RBUFB(data, (0x04)))
    {
        case 0: // party - party leader may disband party if not an alliance member
			if (PChar->PParty->m_PAlliance == nullptr)
			{
				ShowDebug(CL_CYAN"%s is disbanding the party (pcmd breakup)\n" CL_RESET, PChar->GetName());
				PChar->PParty->DisbandParty();
				ShowDebug(CL_CYAN"%s party has been disbanded (pcmd breakup)\n" CL_RESET, PChar->GetName());
			}
            break;

        case 5: // alliance - only alliance leader may dissolve the entire alliance
			if (PChar->PParty->m_PAlliance && PChar->PParty->m_PAlliance->getMainParty() == PChar->PParty)
			{
				ShowDebug(CL_CYAN"%s is disbanding the alliance (acmd breakup)\n" CL_RESET, PChar->GetName());
				PChar->PParty->m_PAlliance->dissolveAlliance();
				ShowDebug(CL_CYAN"%s alliance has been disbanded (acmd breakup)\n" CL_RESET, PChar->GetName());
			}
            break;

        default:
            ShowError(CL_RED"SmallPacket0x070 : unknown byte <%.2X>\n" CL_RESET, RBUFB(data, (0x04)));
            break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Party / Linkshell / Alliance Command 'Kick'                          *
*                                                                       *
************************************************************************/

void SmallPacket0x071(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    switch (RBUFB(data, (0x0A)))
    {
    case 0: // party - party leader may remove member of his own party
        if (PChar->PParty)
        {
            CCharEntity* PVictim = (CCharEntity*)(PChar->PParty->GetMemberByName(data[0x0C]));
            if (PVictim)
            {
				ShowDebug(CL_CYAN"%s is trying to kick %s from party\n" CL_RESET, PChar->GetName(), PVictim->GetName());
                if (PVictim == PChar) // using kick on yourself, let's borrow the logic from /pcmd leave to prevent alliance crash
                {
                    if (PChar->PParty->m_PAlliance && PChar->PParty->members.size() == 1) // single member alliance parties must be removed from alliance before disband
                    {
						if (PChar->PParty->m_PAlliance->partyCount() == 1) // if there is only 1 party then dissolve alliance
						{
							ShowDebug(CL_CYAN"One party in alliance, %s wants to dissolve the alliance\n" CL_RESET, PChar->GetName());
							PChar->PParty->m_PAlliance->dissolveAlliance();
							ShowDebug(CL_CYAN"%s has dissolved the alliance\n" CL_RESET, PChar->GetName());
						}
						else
						{
							ShowDebug(CL_CYAN"%s wants to remove their party from the alliance\n" CL_RESET, PChar->GetName());
							PChar->PParty->m_PAlliance->removeParty(PChar->PParty);
							ShowDebug(CL_CYAN"%s party is removed from the alliance\n" CL_RESET, PChar->GetName());
						}
                    }
                }
                else if (PChar->PParty->GetLeader() != PChar) // not leader, cannot kick others
                    break;

                PChar->PParty->RemoveMember(PVictim);
				ShowDebug(CL_CYAN"%s has removed %s from party\n" CL_RESET, PChar->GetName(), PVictim->GetName());
            }
        }
        break;
    case 1: // linkshell
    {
        // Ensure the player has a linkshell equipped..
        CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK1);
        if (PChar->PLinkshell1 && PItemLinkshell)
        {
            int8 packetData[29] {};
            WBUFL(packetData, 0) = PChar->id;
            memcpy(packetData + 0x04, data[0x0C], 20);
            WBUFL(packetData, 24) = PChar->PLinkshell1->getID();
            WBUFB(packetData, 28) = PItemLinkshell->GetLSType();
            message::send(MSG_LINKSHELL_REMOVE, packetData, sizeof packetData, nullptr);
        }
    }
        break;
    case 2: // linkshell2
    {
        // Ensure the player has a linkshell equipped..
        CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK2);
        if (PChar->PLinkshell2 && PItemLinkshell)
        {
            int8 packetData[29] {};
            WBUFL(packetData, 0) = PChar->id;
            memcpy(packetData + 0x04, data[0x0C], 20);
            WBUFL(packetData, 24) = PChar->PLinkshell2->getID();
            WBUFB(packetData, 28) = PItemLinkshell->GetLSType();
            message::send(MSG_LINKSHELL_REMOVE, packetData, sizeof packetData, nullptr);
        }
    }
    break;

    case 5: // alliance - alliance leader may kick a party by using that party's leader as kick parameter
        if (PChar->PParty && PChar->PParty->GetLeader() == PChar && PChar->PParty->m_PAlliance)
        {
            CCharEntity* PVictim = nullptr;
            for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.size(); ++i)
            {
                PVictim = (CCharEntity*)(PChar->PParty->m_PAlliance->partyList[i]->GetMemberByName(data[0x0C]));
				ShowDebug(CL_CYAN"%s is trying to kick %s party from alliance\n" CL_RESET, PChar->GetName(), PVictim->GetName());
                if (PVictim && PVictim->PParty && PVictim->PParty->m_PAlliance) // victim is in this party
                {
                    //if using kick on yourself, or alliance leader using kick on another party leader - remove the party
                    if (PVictim == PChar || (PChar->PParty->m_PAlliance->getMainParty() == PChar->PParty && PVictim->PParty->GetLeader() == PVictim))
                    {
						if (PVictim->PParty->m_PAlliance->partyCount() == 1) // if there is only 1 party then dissolve alliance
						{
							ShowDebug(CL_CYAN"One party in alliance, %s wants to dissolve the alliance\n" CL_RESET, PChar->GetName());
							PVictim->PParty->m_PAlliance->dissolveAlliance();
							ShowDebug(CL_CYAN"%s has dissolved the alliance\n" CL_RESET, PChar->GetName());
						}
						else
						{
							PVictim->PParty->m_PAlliance->removeParty(PVictim->PParty);
							ShowDebug(CL_CYAN"%s has removed %s party from alliance\n" CL_RESET, PChar->GetName(), PVictim->GetName());
						}
                    }
                    break; // we're done, break the for
                }
            }
        }
        break;

    default:
        ShowError(CL_RED"SmallPacket0x071 : unknown byte <%.2X>\n" CL_RESET, RBUFB(data, (0x0A)));
        break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Party Invite Response (Accept, Decline, Leave)                       *
*                                                                       *
************************************************************************/

void SmallPacket0x074(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    CCharEntity* PInviter = zoneutils::GetCharFromWorld(PChar->InvitePending.id, PChar->InvitePending.targid);

    uint8 InviteAnswer = RBUFB(data, (0x04));

    if (PInviter != nullptr)
    {
        if (InviteAnswer == 0)
        {
			ShowDebug(CL_CYAN"%s declined party invite from %s\n" CL_RESET, PChar->GetName(), PInviter->GetName());
            //invitee declined invite
            PInviter->pushPacket(new CMessageStandardPacket(PInviter, 0, 0, 11));
            PChar->InvitePending.clean();
            return;
        }

        //check for alliance invite
        if (PChar->PParty != nullptr && PInviter->PParty != nullptr)
        {
            //both invitee and and inviter are party leaders
            if (PInviter->PParty->GetLeader() == PInviter && PChar->PParty->GetLeader() == PChar)
            {
				ShowDebug(CL_CYAN"%s invited %s to an alliance\n" CL_RESET, PInviter->GetName(), PChar->GetName());
                //the inviter already has an alliance and wants to add another party - only add if they have room for another party
                if (PInviter->PParty->m_PAlliance && PInviter->PParty->m_PAlliance->getMainParty() == PInviter->PParty)
                {
                    //break if alliance is full
                    if (PInviter->PParty->m_PAlliance->partyCount() == 3)
                    {
						ShowDebug(CL_CYAN"Alliance is full, invite to %s cancelled\n" CL_RESET, PChar->GetName());
                        PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 14));
                        PChar->InvitePending.clean();
                        return;
                    }

                    //alliance is not full, add the new party
                    PInviter->PParty->m_PAlliance->addParty(PChar->PParty);
                    PChar->InvitePending.clean();
					ShowDebug(CL_CYAN"%s party added to %s alliance\n" CL_RESET, PChar->GetName(), PInviter->GetName());
                    return;
                }
                else
                {
                    //party leaders have no alliance - create a new one!
					ShowDebug(CL_CYAN"Creating new alliance\n" CL_RESET);
                    CAlliance* PAlliance = new CAlliance(PInviter);
                    PInviter->PParty->m_PAlliance->addParty(PChar->PParty);
                    PChar->InvitePending.clean();
					ShowDebug(CL_CYAN"%s party added to %s alliance\n" CL_RESET, PChar->GetName(), PInviter->GetName());
                    return;
                }
            }
        }

        //the rest is for a standard party invitation
        if (PChar->PParty == nullptr)
        {
            if (!(PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_SYNC) && PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEVEL_RESTRICTION)))
            {
				ShowDebug(CL_CYAN"%s is not under lvl sync or restriction\n" CL_RESET, PChar->GetName());
                if (PInviter->PParty == nullptr)
                {
					ShowDebug(CL_CYAN"Creating new party\n" CL_RESET);
                    CParty* PParty = new CParty(PInviter);
                }
                if (PInviter->PParty->GetLeader() == PInviter)
                {
                    if (PInviter->PParty->members.size() > 5){//someone else accepted invitation
                        //PInviter->pushPacket(new CMessageStandardPacket(PInviter, 0, 0, 14)); Don't think retail sends error packet to inviter on full pt
						ShowDebug(CL_CYAN"Someone else accepted party invite, %s cannot be added to party\n" CL_RESET, PChar->GetName());
                        PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 14));
                    }
                    else
					{
						ShowDebug(CL_CYAN"Added %s to %s's party\n" CL_RESET, PChar->GetName(), PInviter->GetName());
                        PInviter->PParty->AddMember(PChar);
                    }
                }
            }
            else
            {
                PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 237));
            }
        }
    }
    else
    {
		ShowDebug(CL_CYAN"(Party)Building invite packet to send to lobby server for %s\n" CL_RESET, PChar->GetName());
        uint8 packetData[13] {};
        WBUFL(packetData, 0) = PChar->InvitePending.id;
        WBUFW(packetData, 4) = PChar->InvitePending.targid;
        WBUFL(packetData, 6) = PChar->id;
        WBUFW(packetData, 10) = PChar->targid;
        WBUFB(packetData, 12) = InviteAnswer;
        PChar->InvitePending.clean();
        message::send(MSG_PT_INV_RES, packetData, sizeof packetData, nullptr);
		ShowDebug(CL_CYAN"(Party)Sent invite packet to send to lobby server for %s\n" CL_RESET, PChar->GetName());
    }
    PChar->InvitePending.clean();
    return;
}

/************************************************************************
*                                                                       *
*  Party List Request                                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x076(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->PParty)
    {
        PChar->PParty->ReloadPartyMembers(PChar);
    }
    else
    {
        //previous CPartyDefine was dropped or otherwise didn't work?
        PChar->pushPacket(new CPartyDefinePacket(nullptr));
    }
    return;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/

void SmallPacket0x077(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    switch (RBUFB(data, (0x14)))
    {
    case 0: // party
    {
        if (PChar->PParty != nullptr &&
            PChar->PParty->GetLeader() == PChar)
        {
			ShowDebug(CL_CYAN"(Party)Changing leader to %s\n" CL_RESET, data[0x04]);
            PChar->PParty->AssignPartyRole(data[0x04], RBUFB(data, (0x15)));
        }
    }
    break;
    case 1: // linkshell
    {
        if (PChar->PLinkshell1 != nullptr)
        {
            int8 packetData[29] {};
            WBUFL(packetData, 0) = PChar->id;
            memcpy(packetData + 0x04, data[0x04], 20);
            WBUFL(packetData, 24) = PChar->PLinkshell1->getID();
            WBUFB(packetData, 28) = RBUFB(data, 0x15);
            message::send(MSG_LINKSHELL_RANK_CHANGE, packetData, sizeof packetData, nullptr);
        }
    }
    break;
    case 2: // linkshell2
    {
        if (PChar->PLinkshell2 != nullptr)
        {
            int8 packetData[29] {};
            WBUFL(packetData, 0) = PChar->id;
            memcpy(packetData + 0x04, data[0x04], 20);
            WBUFL(packetData, 24) = PChar->PLinkshell2->getID();
            WBUFB(packetData, 28) = RBUFB(data, 0x15);
            message::send(MSG_LINKSHELL_RANK_CHANGE, packetData, sizeof packetData, nullptr);
        }
    }
    break;
    case 5: //alliance
    {
        if (PChar->PParty && PChar->PParty->m_PAlliance &&
            PChar->PParty->GetLeader() == PChar &&
            PChar->PParty->m_PAlliance->getMainParty() == PChar->PParty)
        {
			ShowDebug(CL_CYAN"(Alliance)Changing leader to %s\n" CL_RESET, data[0x04]);
            PChar->PParty->m_PAlliance->assignAllianceLeader(data[0x04]);
            uint8 data[4] {};
            WBUFL(data, 0) = PChar->PParty->m_PAlliance->m_AllianceID;
            message::send(MSG_PT_RELOAD, data, sizeof data, nullptr);
        }
    }
    break;
    default:
    {
        ShowError(CL_RED"SmallPacket0x077 : changing role packet with unknown byte <%.2X>\n" CL_RESET, RBUFB(data, (0x14)));
    }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Party Search                                                         *
*                                                                       *
************************************************************************/

void SmallPacket0x078(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->pushPacket(new CPartySearchPacket(PChar));
    return;
}

/************************************************************************
*                                                                       *
*  Vender Item Purchase                                                 *
*                                                                       *
************************************************************************/

void SmallPacket0x083(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8  quantity = RBUFB(data, (0x04));
    uint8  shopSlotID = RBUFB(data, (0x0A));

    // Prevent users from buying from slots higher than 15.. (Prevents appraise duping..)
    if (shopSlotID > PChar->Container->getSize() - 1)
    {
        ShowWarning(CL_YELLOW"User '%s' attempting to buy vendor item from an invalid slot!" CL_RESET, PChar->GetName());
        return;
    }

    uint16 itemID = PChar->Container->getItemID(shopSlotID);
    uint32 price = PChar->Container->getQuantity(shopSlotID); // здесь мы сохранили стоимость предмета

    CItem* PItem = itemutils::GetItemPointer(itemID);

    // Prevent purchasing larger stacks than the actual stack size in database.
    if (quantity > PItem->getStackSize())
    {
        quantity = PItem->getStackSize();
    }

    CItem* gil = PChar->getStorage(LOC_INVENTORY)->GetItem(0);

    if ((gil != nullptr) && gil->isType(ITEM_CURRENCY))
    {
        if (gil->getQuantity() > (price * quantity))
        {
            uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemID, quantity);

            if (SlotID != ERROR_SLOTID)
            {
                charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(price * quantity));

                PChar->pushPacket(new CShopBuyPacket(shopSlotID, quantity));
                PChar->pushPacket(new CInventoryFinishPacket());
            }
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Vendor Item Appraise                                                 *
*                                                                       *
************************************************************************/

void SmallPacket0x084(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->animation != ANIMATION_SYNTH)
    {
        uint32 quantity = RBUFL(data, (0x04));
        uint16 itemID = RBUFW(data, (0x08));
        uint8  slotID = RBUFB(data, (0x0A));

        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);
        if ((PItem != nullptr) &&
            (PItem->getID() == itemID) &&
            !(PItem->getFlag() & ITEM_FLAG_NOSALE))
        {
            quantity = dsp_min(quantity, PItem->getQuantity());
            PChar->Container->setItem(PChar->Container->getSize() - 1, itemID, slotID, quantity);
            PChar->pushPacket(new CShopAppraisePacket(slotID, PItem->getBasePrice()));
        }
        return;
    }
}

/************************************************************************
*                                                                       *
*  Vender Item Sell                                                     *
*  Player selling an item to a vendor.                                  *
*                                                                       *
************************************************************************/

void SmallPacket0x085(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 quantity = PChar->Container->getQuantity(PChar->Container->getSize() - 1);
    uint16 itemID = PChar->Container->getItemID(PChar->Container->getSize() - 1);
    uint8  slotID = PChar->Container->getInvSlotID(PChar->Container->getSize() - 1);

    CItem* gil = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
    CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

    if ((PItem != nullptr) && ((gil != nullptr) && gil->isType(ITEM_CURRENCY)))
    {
        charutils::UpdateItem(PChar, LOC_INVENTORY, 0, quantity * PItem->getBasePrice());
        charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -(int32)quantity);

        PChar->pushPacket(new CMessageStandardPacket(0, itemID, quantity, 232));
        PChar->pushPacket(new CInventoryFinishPacket());
    }

    PChar->Container->setItem(PChar->Container->getSize() - 1, 0, -1, 0);
    return;
}

/************************************************************************
*                                                                       *
*  Begin Synthesis                                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x096(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (jailutils::InPrison(PChar))
    {
        // Prevent crafting in prison
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
        return;
    }

    // Prevent crafting exploit if we are already crafting..
    if (PChar->animation == ANIMATION_SYNTH)
    {
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 94));
        return;
    }

    PChar->CraftContainer->Clean();

    uint16 ItemID = RBUFL(data, (0x06));
    uint8  invSlotID = RBUFB(data, (0x08));

    uint8  numItems = RBUFB(data, (0x09));

    std::vector<uint8> slotQty(MAX_CONTAINER_SIZE);

    if (numItems > 8)
    {
        // Prevent crafting exploit to crash on container size > 8
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
        return;
    }

    PChar->CraftContainer->setItem(0, ItemID, invSlotID, 0);

    for (int32 SlotID = 0; SlotID < numItems; ++SlotID)
    {
        ItemID = RBUFW(data, (0x0A + SlotID * 2));
        invSlotID = RBUFB(data, (0x1A + SlotID));

        slotQty[invSlotID]++;

        if ((PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID)) && (PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID)->getID() == ItemID) &&
            (slotQty[invSlotID] <= PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID)->getQuantity()))
        {
            PChar->CraftContainer->setItem(SlotID + 1, ItemID, invSlotID, 1);
            PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID)->setReserve(PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID)->getReserve() + 1);
        }
    }

    synthutils::startSynth(PChar);
    return;
}

/************************************************************************
*                                                                        *
*  Guild Purchase                                                        *
*                                                                        *
************************************************************************/

void SmallPacket0x0AA(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 itemID = RBUFW(data, (0x04));
    uint8  quantity = RBUFB(data, (0x07));
    uint8  shopSlotID = PChar->PGuildShop->SearchItem(itemID);
    CItemShop* item = (CItemShop*)PChar->PGuildShop->GetItem(shopSlotID);
    CItem* gil = PChar->getStorage(LOC_INVENTORY)->GetItem(0);

    CItem* PItem = itemutils::GetItemPointer(itemID);

    // Prevent purchasing larger stacks than the actual stack size in database.
    if (quantity > PItem->getStackSize())
    {
        quantity = PItem->getStackSize();
    }

    if (((gil != nullptr) && gil->isType(ITEM_CURRENCY)) && item != nullptr && item->getQuantity() >= quantity)
    {
        if (gil->getQuantity() > (item->getBasePrice() * quantity))
        {
            uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemID, quantity);

            if (SlotID != ERROR_SLOTID)
            {
                charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(item->getBasePrice() * quantity));

                PChar->PGuildShop->GetItem(shopSlotID)->setQuantity(PChar->PGuildShop->GetItem(shopSlotID)->getQuantity() - quantity);
                PChar->pushPacket(new CGuildMenuBuyUpdatePacket(PChar, PChar->PGuildShop->GetItem(PChar->PGuildShop->SearchItem(itemID))->getQuantity(), itemID, quantity));
                PChar->pushPacket(new CInventoryFinishPacket());
            }
        }
    }
    //TODO: error messages!
    return;
}

/************************************************************************
*                                                                       *
*  Dice Roll                                                            *
*                                                                       *
************************************************************************/

void SmallPacket0x0A2(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 diceroll = dsprand::GetRandomNumber(1000);

    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageStandardPacket(PChar, diceroll, 88));
    return;
}

/************************************************************************
*                                                                       *
*  Guild Item Vendor Stock Request                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x0AB(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->PGuildShop != nullptr)
    {
        PChar->pushPacket(new CGuildMenuBuyPacket(PChar, PChar->PGuildShop));
    }
    return;
}

/************************************************************************
*                                                                        *
*  Sell items to guild                                                  *
*                                                                        *
************************************************************************/

void SmallPacket0x0AC(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->animation != ANIMATION_SYNTH)
    {
        if (PChar->PGuildShop != nullptr)
        {
            uint16 itemID = RBUFW(data, (0x04));
            uint8  slot = RBUFB(data, (0x06));
            uint8  quantity = RBUFB(data, (0x07));
            uint8  shopSlotID = PChar->PGuildShop->SearchItem(itemID);
            CItemShop* shopItem = (CItemShop*)PChar->PGuildShop->GetItem(shopSlotID);
            CItem*     charItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

            if (PChar->PGuildShop->GetItem(shopSlotID)->getQuantity() + quantity > PChar->PGuildShop->GetItem(shopSlotID)->getStackSize())
            {
                quantity = PChar->PGuildShop->GetItem(shopSlotID)->getStackSize() - PChar->PGuildShop->GetItem(shopSlotID)->getQuantity();
            }

            //TODO: add all sellable items to guild table
            if (quantity != 0 && shopItem && charItem && charItem->getQuantity() >= quantity)
            {
                if (charutils::UpdateItem(PChar, LOC_INVENTORY, slot, -quantity) == itemID)
                {
                    charutils::UpdateItem(PChar, LOC_INVENTORY, 0, shopItem->getSellPrice() * quantity);

                    PChar->PGuildShop->GetItem(shopSlotID)->setQuantity(PChar->PGuildShop->GetItem(shopSlotID)->getQuantity() + quantity);
                    PChar->pushPacket(new CGuildMenuSellUpdatePacket(PChar, PChar->PGuildShop->GetItem(PChar->PGuildShop->SearchItem(itemID))->getQuantity(), itemID, quantity));
                    PChar->pushPacket(new CInventoryFinishPacket());
                }
            }
            //TODO: error messages!
        }
        return;
    }
}

/************************************************************************
*                                                                       *
*  Guild Item Vendor Stock Request                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x0AD(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->PGuildShop != nullptr)
    {
        PChar->pushPacket(new CGuildMenuSellPacket(PChar, PChar->PGuildShop));
    }
    return;
}

/************************************************************************
*                                                                       *
*  Chat Message                                                         *
*                                                                       *
************************************************************************/

void SmallPacket0x0B5(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (RBUFB(data, (0x06)) == '@' && CmdHandler.call(PChar, (const int8*)data[7]) == 0)
    {
        //this makes sure a command isn't sent to chat
    }
    else if (RBUFB(data, (0x06)) == '#' && PChar->nameflags.flags & FLAG_GM)
    {
        message::send(MSG_CHAT_SERVMES, 0, 0, new CChatMessagePacket(PChar, MESSAGE_SYSTEM_1, data[7]));
    }
    else
    {
        if (jailutils::InPrison(PChar))
        {
            if (RBUFB(data, (0x04)) == MESSAGE_SAY)
            {
                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_SAY, data[6]));
            }
            else
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
            }
        }
        else
        {
            switch (RBUFB(data, (0x04)))
            {
            case MESSAGE_SAY:
            {
                if (map_config.audit_chat == 1 && map_config.audit_say == 1)
                {
                    std::string qStr = ("INSERT into audit_chat (speaker,type,message,datetime) VALUES('");
                    qStr += PChar->GetName();
                    qStr += "','SAY','";
                    qStr += escape(data[6]);
                    qStr += "',current_timestamp());";
                    const char * cC = qStr.c_str();
                    Sql_QueryStr(SqlHandle, cC);
                }
                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_SAY, data[6]));
            }
            break;
            case MESSAGE_EMOTION:    PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_EMOTION, data[6])); break;
            case MESSAGE_SHOUT:
            {
                if (map_config.audit_chat == 1 && map_config.audit_shout == 1)
                {
                    std::string qStr = ("INSERT into audit_chat (speaker,type,message,datetime) VALUES('");
                    qStr += PChar->GetName();
                    qStr += "','SHOUT','";
                    qStr += escape(data[6]);
                    qStr += "',current_timestamp());";
                    const char * cC = qStr.c_str();
                    Sql_QueryStr(SqlHandle, cC);
                }
                PChar->loc.zone->PushPacket(PChar, CHAR_INSHOUT, new CChatMessagePacket(PChar, MESSAGE_SHOUT, data[6]));
            }
            break;
            case MESSAGE_LINKSHELL:
            {
                if (PChar->PLinkshell1 != nullptr)
                {
                    int8 packetData[8] {};
                    WBUFL(packetData, 0) = PChar->PLinkshell1->getID();
                    WBUFL(packetData, 4) = PChar->id;
                    message::send(MSG_CHAT_LINKSHELL, packetData, sizeof packetData, new CChatMessagePacket(PChar, MESSAGE_LINKSHELL, data[6]));

                    if (map_config.audit_chat == 1 && map_config.audit_linkshell == 1)
                    {
                        std::string qStr = ("INSERT into audit_chat (speaker,type,message,datetime) VALUES('");
                        qStr += PChar->GetName();
                        qStr += "','LINKSHELL','";
                        qStr += escape(data[6]);
                        qStr += "',current_timestamp());";
                        const char * cC = qStr.c_str();
                        Sql_QueryStr(SqlHandle, cC);
                    }
                }
            }
            break;
            case MESSAGE_LINKSHELL2:
            {
                if (PChar->PLinkshell2 != nullptr)
                {
                    int8 packetData[8] {};
                    WBUFL(packetData, 0) = PChar->PLinkshell2->getID();
                    WBUFL(packetData, 4) = PChar->id;
                    message::send(MSG_CHAT_LINKSHELL, packetData, sizeof packetData, new CChatMessagePacket(PChar, MESSAGE_LINKSHELL, data[6]));

                    if (map_config.audit_chat == 1 && map_config.audit_linkshell == 1)
                    {
                        std::string qStr = ("INSERT into audit_chat (speaker,type,message,datetime) VALUES('");
                        qStr += PChar->GetName();
                        qStr += "','LINKSHELL','";
                        qStr += escape(data[6]);
                        qStr += "',current_timestamp());";
                        const char * cC = qStr.c_str();
                        Sql_QueryStr(SqlHandle, cC);
                    }
                }
            }
            break;
            case MESSAGE_PARTY:
            {
                if (PChar->PParty != nullptr)
                {
                    int8 packetData[8] {};
                    WBUFL(packetData, 0) = PChar->PParty->GetPartyID();
                    WBUFL(packetData, 4) = PChar->id;
                    message::send(MSG_CHAT_PARTY, packetData, sizeof packetData, new CChatMessagePacket(PChar, MESSAGE_PARTY, data[6]));

                    if (map_config.audit_chat == 1 && map_config.audit_party == 1)
                    {
                        std::string qStr = ("INSERT into audit_chat (speaker,type,message,datetime) VALUES('");
                        qStr += PChar->GetName();
                        qStr += "','PARTY','";
                        qStr += escape(data[6]);
                        qStr += "',current_timestamp());";
                        const char * cC = qStr.c_str();
                        Sql_QueryStr(SqlHandle, cC);
                    }
                }
            }
            break;
            case MESSAGE_YELL:
            {
                if (PChar->loc.zone->CanUseMisc(MISC_YELL))
                {
                    if (gettick() >= PChar->m_LastYell)
                    {
                        PChar->m_LastYell = gettick() + (map_config.yell_cooldown * 1000);
                        // ShowDebug(CL_CYAN" LastYell: %u \n" CL_RESET, PChar->m_LastYell);
                        int8 packetData[4] {};
                        WBUFL(packetData, 0) = PChar->id;

                        message::send(MSG_CHAT_YELL, packetData, sizeof packetData, new CChatMessagePacket(PChar, MESSAGE_YELL, data[6]));
                    }
                    else // You must wait longer to perform that action.
                    {
                        PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 38));
                    }

                    if (map_config.audit_chat == 1 && map_config.audit_yell == 1)
                    {
                        std::string qStr = ("INSERT into audit_chat (speaker,type,message,datetime) VALUES('");
                        qStr += PChar->GetName();
                        qStr += "','YELL','";
                        qStr += escape(data[6]);
                        qStr += "',current_timestamp());";
                        const char * cC = qStr.c_str();
                        Sql_QueryStr(SqlHandle, cC);
                    }
                }
                else // You cannot use that command in this area.
                {
                    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 256));
                }
            }
            break;
            }
        }
    }

    return;
}

/************************************************************************
*                                                                       *
*  Whisper / Tell                                                       *
*                                                                       *
************************************************************************/

void SmallPacket0x0B6(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (jailutils::InPrison(PChar))
    {
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
        return;
    }

    string_t RecipientName = data[5];
    int8 packetData[64];
    strncpy(packetData + 4, RecipientName.c_str(), RecipientName.length() + 1);
    WBUFL(packetData, 0) = PChar->id;
    message::send(MSG_CHAT_TELL, packetData, RecipientName.length() + 5, new CChatMessagePacket(PChar, MESSAGE_TELL, data[20]));

    if (map_config.audit_chat == 1 && map_config.audit_tell == 1)
    {
        std::string qStr = ("INSERT into audit_chat (speaker,type,recipient,message,datetime) VALUES('");
        qStr += PChar->GetName();
        qStr += "','TELL','";
        qStr += RecipientName;
        qStr += "','";
        qStr += escape(data[20]);
        qStr += "',current_timestamp());";
        const char * cC = qStr.c_str();
        Sql_QueryStr(SqlHandle, cC);
    }
}

/************************************************************************
*                                                                       *
*  Merit Mode (Setting of exp or limit points mode.)                    *
*                                                                       *
************************************************************************/

void SmallPacket0x0BE(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{

    uint8 operation = RBUFB(data, 0x05);

    switch (RBUFB(data, (0x04)))
    {
    case 2: // change mode
    {
        // TODO: you can switch mode anywhere except in besieged & under level restriction
        if (Sql_Query(SqlHandle, "UPDATE char_exp SET mode = %u WHERE charid = %u", operation, PChar->id) != SQL_ERROR)
        {
            PChar->MeritMode = operation;
            PChar->pushPacket(new CMenuMeritPacket(PChar));
        }
    }
    break;
    case 3: // change merit
    {
        if (PChar->m_moghouseID)
        {
            MERIT_TYPE merit = (MERIT_TYPE)(RBUFW(data, (0x06)) << 1);

            if (PChar->PMeritPoints->IsMeritExist(merit))
            {
                switch (operation)
                {
                case 0: PChar->PMeritPoints->LowerMerit(merit); break;
                case 1: PChar->PMeritPoints->RaiseMerit(merit); break;
                }
                PChar->pushPacket(new CMenuMeritPacket(PChar));
                PChar->pushPacket(new CMeritPointsCategoriesPacket(PChar, merit));

                charutils::SaveCharExp(PChar, PChar->GetMJob());
                PChar->PMeritPoints->SaveMeritPoints(PChar->id);

                charutils::BuildingCharSkillsTable(PChar);
                charutils::CalculateStats(PChar);
                charutils::CheckValidEquipment(PChar);
                charutils::BuildingCharAbilityTable(PChar);
                charutils::BuildingCharTraitsTable(PChar);

                PChar->UpdateHealth();
                PChar->addHP(PChar->GetMaxHP());
                PChar->addMP(PChar->GetMaxMP());
                PChar->pushPacket(new CCharUpdatePacket(PChar));
                PChar->pushPacket(new CCharStatsPacket(PChar));
                PChar->pushPacket(new CCharSkillsPacket(PChar));
                PChar->pushPacket(new CCharRecastPacket(PChar));
                PChar->pushPacket(new CCharAbilitiesPacket(PChar));
                PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
                PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
                PChar->pushPacket(new CCharSyncPacket(PChar));
            }
        }
    }
    break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Create Linkpearl                                                     *
*                                                                       *
************************************************************************/

void SmallPacket0x0C3(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 lsNum = RBUFB(data, 0x05);
    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK1);
    if (lsNum == 2)
    {
        PItemLinkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK2);
    }

    if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL))
    {
        CItemLinkshell* PItemLinkPearl = new CItemLinkshell(*PItemLinkshell);

        if (PItemLinkPearl->GetLSType() == LSTYPE_PEARLSACK ||
            PItemLinkPearl->GetLSType() == LSTYPE_LINKSHELL)
        {
            PItemLinkPearl->setID(515);
            PItemLinkPearl->setSubType(ITEM_UNLOCKED);

            charutils::AddItem(PChar, LOC_INVENTORY, PItemLinkPearl);
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Create Linkshell (Also equips the linkshell.)                        *
*                                                                       *
************************************************************************/

void SmallPacket0x0C4(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 SlotID = RBUFB(data, (0x06));
    uint8 action = RBUFB(data, (0x08));
    uint8 lsNum = RBUFB(data, (0x1B));

    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

    if (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL))
    {
        // Create new linkshell..
        if (PItemLinkshell->getID() == 512)
        {
            uint32   LinkshellID = 0;
            uint16   LinkshellColor = RBUFW(data, (0x04));
            string_t LinkshellName = data[12];
            int8     DecodedName[21];
            int8     EncodedName[16];

            DecodeStringLinkshell(data[12], DecodedName);
            EncodeStringLinkshell(DecodedName, EncodedName);
            // TODO: Check if a linebreak is needed..

            if (LinkshellID = linkshell::RegisterNewLinkshell(DecodedName, LinkshellColor))
            {
                PItemLinkshell->setID(513);
                PItemLinkshell->SetLSID(LinkshellID);
                PItemLinkshell->setSignature(EncodedName); //because apparently the format from the packet isn't right, and is missing terminators
                PItemLinkshell->SetLSColor(LinkshellColor);

                int8 extra[sizeof(PItemLinkshell->m_extra) * 2 + 1];
                Sql_EscapeStringLen(SqlHandle, extra, (const char*)PItemLinkshell->m_extra, sizeof(PItemLinkshell->m_extra));

                const int8* Query = "UPDATE char_inventory SET signature = '%s', extra = '%s', itemId = 513 WHERE charid = %u AND location = 0 AND slot = %u LIMIT 1";

                if (Sql_Query(SqlHandle, Query, DecodedName, extra, PChar->id, SlotID) != SQL_ERROR &&
                    Sql_AffectedRows(SqlHandle) != 0)
                {
                    PChar->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
                }
            }
            else
            {
                PChar->pushPacket(new CMessageStandardPacket(112));
                //DE
                //20
                //1D
                return;
            }
        }
        else
        {
            SLOTTYPE slot = SLOT_LINK1;
            CLinkshell* OldLinkshell = PChar->PLinkshell1;
            if (lsNum == 2)
            {
                slot = SLOT_LINK2;
                OldLinkshell = PChar->PLinkshell2;
            }
            switch (action)
            {
            case 0: // unequip linkshell
            {
                linkshell::DelOnlineMember(PChar, PItemLinkshell);

                PItemLinkshell->setSubType(ITEM_UNLOCKED);

                PChar->equip[slot] = 0;
                PChar->equipLoc[slot] = 0;
                if (lsNum == 1)
                {
                    PChar->nameflags.flags &= ~FLAG_LINKSHELL;
                    PChar->updatemask |= UPDATE_HP;
                }

                PChar->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_NORMAL));
            }
            break;
            case 1: // equip linkshell
            {
                if (PItemLinkshell->GetLSID() == 0) // linkshell no exists, item is unusable
                {
                    PChar->pushPacket(new CMessageSystemPacket(0, 0, 110));
                    return;
                }
                if (OldLinkshell != nullptr) // switching linkshell group
                {
                    CItemLinkshell* POldItemLinkshell = (CItemLinkshell*)PChar->getEquip(slot);

                    if (POldItemLinkshell != nullptr && POldItemLinkshell->isType(ITEM_LINKSHELL))
                    {
                        linkshell::DelOnlineMember(PChar, POldItemLinkshell);

                        POldItemLinkshell->setSubType(ITEM_UNLOCKED);
                        PChar->pushPacket(new CInventoryAssignPacket(POldItemLinkshell, INV_NORMAL));
                    }
                }
                linkshell::AddOnlineMember(PChar, PItemLinkshell, lsNum);

                PItemLinkshell->setSubType(ITEM_LOCKED);

                PChar->equip[slot] = SlotID;
                PChar->equipLoc[slot] = LOC_INVENTORY;
                if (lsNum == 1)
                {
                    PChar->nameflags.flags |= FLAG_LINKSHELL;
                    PChar->updatemask |= UPDATE_HP;
                }

                PChar->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_LINKSHELL));
            }
            break;
            }
            charutils::SaveCharStats(PChar);
            charutils::SaveCharEquip(PChar);

            PChar->pushPacket(new CLinkshellEquipPacket(PChar, lsNum));
            PChar->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
        }
        PChar->pushPacket(new CInventoryFinishPacket());
        PChar->pushPacket(new CCharUpdatePacket(PChar));
    }
    return;
}

/************************************************************************
*                                                                       *
*  Open/Close Mog House                                                 *
*                                                                       *
************************************************************************/

void SmallPacket0x0CB(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (RBUFB(data, 0x04) == 1)
    {
        //open
    }
    else if (RBUFB(data, 0x04) == 2)
    {
        //close
    }
    else
    {
        ShowWarning(CL_RED"SmallPacket0x0CB : unknown byte <%.2X>\n" CL_RESET, RBUFB(data, (0x04)));
    }
}

/************************************************************************
*                                                                       *
*  Request Party Map Positions                                          *
*                                                                       *
************************************************************************/

void SmallPacket0x0D2(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->ForAlliance([PChar](CBattleEntity* PPartyMember)
    {
        if (PPartyMember->getZone() == PChar->getZone() && ((CCharEntity*)PPartyMember)->m_moghouseID == PChar->m_moghouseID)
        {
            PChar->pushPacket(new CPartyMapPacket((CCharEntity*)PPartyMember));
        }
    });

    return;
}

/************************************************************************
*                                                                       *
*  Help Desk Report                                                     *
*  help desk -> i want to report -> yes -> yes -> execute               *
*                                                                       *
************************************************************************/

void SmallPacket0x0D3(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    return;
}

/************************************************************************
*                                                                       *
*  Set Preferred Language                                               *
*                                                                       *
************************************************************************/

void SmallPacket0x0DB(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->search.language = RBUFB(data, (0x24));
    return;
}

/************************************************************************
*                                                                       *
*  Set Name Flags (Party, Away, Autogroup, etc.)                        *
*                                                                       *
************************************************************************/

void SmallPacket0x0DC(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    switch (RBUFL(data, (0x04)))
    {
    case 0x0001:
        PChar->nameflags.flags ^= FLAG_INVITE;
        break;
    case 0x0002:
        if (RBUFB(data, (0x10)) == 1)
            PChar->nameflags.flags |= FLAG_AWAY;
        if (RBUFB(data, (0x10)) == 2)
            PChar->nameflags.flags &= ~FLAG_AWAY;
        break;
    case 0x0004:
        PChar->nameflags.flags ^= FLAG_ANON;
        break;
    case 0x4000:
        if (RBUFB(data, (0x10)) == 1)
            PChar->m_hasAutoTarget = false;
        if (RBUFB(data, (0x10)) == 2)
            PChar->m_hasAutoTarget = true;
        break;
    case 0x8000:
        //if(RBUFB(data,(0x10)) == 1)    // autogroup on
        //if(RBUFB(data,(0x10)) == 2)    // autogroup off
        break;
    case 0x200000:
        //if(RBUFB(data,(0x10)) == 1)    // party request on
        //if(RBUFB(data,(0x10)) == 2)    // party request off
        break;
    }
    charutils::SaveCharStats(PChar);

    PChar->updatemask |= UPDATE_HP;
    PChar->pushPacket(new CMenuConfigPacket(PChar));
    return;
}

/************************************************************************
*                                                                       *
*  Check Target                                                         *
*                                                                       *
*  170 - <target> seems It seems to have high evasion and defense.      *
*  171 - <target> seems It seems to have high evasion.                  *
*  172 - <target> seems It seems to have high evasion but low defense.  *
*  173 - <target> seems It seems to have high defense.                  *
*  174 - <target> seems                                                 *
*  175 - <target> seems It seems to have low defense.                   *
*  176 - <target> seems It seems to have low evasion but high defense.  *
*  177 - <target> seems It seems to have low evasion.                   *
*  178 - <target> seems It seems to have low evasion and defense.       *
*                                                                       *
************************************************************************/

void SmallPacket0x0DD(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint32 id = RBUFL(data, (0x04));
    uint16 targid = RBUFW(data, (0x08));
    uint8 type = RBUFB(data, (0x0C));

    //checkparam
    if (type == 0x02)
    {
        if (PChar->id == id)
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_CHECKPARAM_NAME));
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_CHECKPARAM_ILVL));
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PChar->ACC(0, 0), PChar->ATT(), MSGBASIC_CHECKPARAM_PRIMARY));
            if (PChar->getEquip(SLOT_SUB) && PChar->getEquip(SLOT_SUB)->isType(ITEM_WEAPON))
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PChar->ACC(1, 0), PChar->ATT(), MSGBASIC_CHECKPARAM_AUXILIARY));
            }
            else
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_CHECKPARAM_AUXILIARY));
            }
            if (PChar->getEquip(SLOT_RANGED) && PChar->getEquip(SLOT_RANGED)->isType(ITEM_WEAPON))
            {
                int skill = ((CItemWeapon*)PChar->getEquip(SLOT_RANGED))->getSkillType();
                int bonusSkill = ((CItemWeapon*)PChar->getEquip(SLOT_RANGED))->getILvlSkill();
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PChar->RACC(skill, bonusSkill), PChar->RATT(skill, bonusSkill), MSGBASIC_CHECKPARAM_RANGE));
            }
            else if (PChar->getEquip(SLOT_AMMO) && PChar->getEquip(SLOT_AMMO)->isType(ITEM_WEAPON))
            {
                int skill = ((CItemWeapon*)PChar->getEquip(SLOT_AMMO))->getSkillType();
                int bonusSkill = ((CItemWeapon*)PChar->getEquip(SLOT_AMMO))->getILvlSkill();
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PChar->RACC(skill, bonusSkill), PChar->RATT(skill, bonusSkill), MSGBASIC_CHECKPARAM_RANGE));
            }
            else
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, MSGBASIC_CHECKPARAM_RANGE));
            }
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, PChar->EVA(), PChar->DEF(), MSGBASIC_CHECKPARAM_DEFENSE));
        }
        else if (PChar->PPet && PChar->PPet->id == id)
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, 0, 0, MSGBASIC_CHECKPARAM_NAME));
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, PChar->PPet->ACC(0, 0), PChar->PPet->ATT(), MSGBASIC_CHECKPARAM_PRIMARY));
            if (PChar->getEquip(SLOT_SUB) && PChar->getEquip(SLOT_SUB)->isType(ITEM_WEAPON))
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, PChar->PPet->ACC(1, 0), PChar->PPet->ATT(), MSGBASIC_CHECKPARAM_AUXILIARY));
            }
            else
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, 0, 0, MSGBASIC_CHECKPARAM_AUXILIARY));
            }
            if (PChar->getEquip(SLOT_RANGED) && PChar->getEquip(SLOT_RANGED)->isType(ITEM_WEAPON))
            {
                int skill = ((CItemWeapon*)PChar->getEquip(SLOT_RANGED))->getSkillType();
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, PChar->PPet->RACC(skill), PChar->PPet->RATT(skill), MSGBASIC_CHECKPARAM_RANGE));
            }
            else if (PChar->getEquip(SLOT_AMMO) && PChar->getEquip(SLOT_AMMO)->isType(ITEM_WEAPON))
            {
                int skill = ((CItemWeapon*)PChar->getEquip(SLOT_AMMO))->getSkillType();
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, PChar->PPet->RACC(skill), PChar->PPet->RATT(skill), MSGBASIC_CHECKPARAM_RANGE));
            }
            else
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, 0, 0, MSGBASIC_CHECKPARAM_RANGE));
            }
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar->PPet, PChar->PPet->EVA(), PChar->PPet->DEF(), MSGBASIC_CHECKPARAM_DEFENSE));
        }
    }
    else
    {
        if (jailutils::InPrison(PChar))
        {
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 316));
            return;
        }

        CBaseEntity* PEntity = PChar->GetEntity(targid, TYPE_MOB | TYPE_PC);

        if (PEntity == nullptr || PEntity->id != id)
            return;

        switch (PEntity->objtype)
        {
        case TYPE_MOB:
        {
            CMobEntity* PTarget = (CMobEntity*)PEntity;

            if (PTarget->m_Type & MOBTYPE_NOTORIOUS)
            {
                PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, 249));
            }
            else
            {
                uint32 baseExp = charutils::GetRealExp(PChar->GetMLevel(), PTarget->GetMLevel());
                uint16 charAcc = PChar->ACC(SLOT_MAIN, (uint8)0);
                uint16 charAtt = PChar->ATT();
                uint16 mobEva = PTarget->EVA();
                uint16 mobDef = PTarget->DEF();

                uint8 MessageValue = 0;

                // NOTE: message 0x41: Incredibly Easy Prey
                if (baseExp >= 400) MessageValue = 0x47;
                else if (baseExp >= 240) MessageValue = 0x46;
                else if (baseExp >= 120) MessageValue = 0x45;
                else if (baseExp == 100) MessageValue = 0x44;
                else if (baseExp >= 75) MessageValue = 0x43;
                else if (baseExp >= 15) MessageValue = 0x42;
                else if (baseExp == 0) MessageValue = 0x40;
                if (mobDef > charAtt && (mobEva - 30) > charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 170));//high eva high def
                else if ((mobDef * 1.25) > charAtt && mobDef <= charAtt && (mobEva - 30) > charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 171));//high eva
                else if ((mobDef * 1.25) <= charAtt && (mobEva - 30) > charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 172));//high eva low def
                else if (mobDef > charAtt && (mobEva - 30) <= charAcc && (mobEva + 10) > charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 173));//high def
                else if ((mobDef * 1.25) <= charAtt && (mobEva - 30) <= charAcc && (mobEva + 10) > charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 175));//low def
                else if (mobDef > charAtt && (mobEva + 10) <= charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 176));//low eva high def
                else if ((mobDef * 1.25) > charAtt && mobDef <= charAtt && (mobEva + 10) <= charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 177));//low eva
                else if ((mobDef * 1.25) <= charAtt && (mobEva + 10) <= charAcc)
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 178));//low eva low def
                else
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, MessageValue, 174));//broke even
            }
        }
        break;
        case TYPE_PC:
        {
            CCharEntity* PTarget = (CCharEntity*)PEntity;

            if (PChar->m_isGMHidden == false || PChar->m_isGMHidden == true && PTarget->m_GMlevel >= PChar->m_GMlevel)
                PTarget->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 89));

            PChar->pushPacket(new CBazaarMessagePacket(PTarget));
            PChar->pushPacket(new CCheckPacket(PChar, PTarget));
        }
        break;
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Set Bazaar Message                                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x0DE(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->bazaar.message.clear();
    PChar->bazaar.message.insert(0, data[4]);

    int8 message[256];
    Sql_EscapeString(SqlHandle, message, data[4]);

    Sql_Query(SqlHandle, "UPDATE char_stats SET bazaar_message = '%s' WHERE charid = %u;", message, PChar->id);
    return;
}

/************************************************************************
*                                                                       *
*  Set Search Message                                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x0E0(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->search.message.clear();
    PChar->search.message.insert(0, data[4]);

    PChar->search.messagetype = RBUFB(data, (0xA4));

    // No response is needed to be sent from this packet.
    // This is only used when searching for a character.
    //                 s   a   l   u   t
    // e0  4c  c2  00  73  61  6c  75  74  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20
    // 20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  00
    // 00  00  00  00  2f  15  4c  4b  57  49  4e  08  3f  00  00  00
    // ff  00  00  00  11  00  00  00

    // Message Max of 120, 3 lines of 40 characters, starting from 5th byte.
    // Message Type - 4th from the end.

    // EXP party
    //  0x11 - seek party
    //  0x12 - find member
    //  0x13 - other
    // Mission
    //  0x21 - seek party
    //  0x22 - find member
    //  0x23 - other
    // Quest
    //  0x31 - seek party
    //  0x32 - find member
    //  0x33 - other
    // Battlefield
    //  0x41 - seek party
    //  0x42 - find member
    //  0x43 - other
    // Item
    //  0x51 - Want to Sell
    //  0x52 - Want to Buy
    //  0x53 - Other
    // Synthesis
    //  0x61 - Need Made
    //  0x62 - Can Make
    //  0x63 - Other
    // Others
    //  0x73 - others
    return;
}

/************************************************************************
*                                                                       *
*  Request Linkshell Message (/lsmes)                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x0E1(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 slot = data.ref<uint8>(0x07);
    if (slot == PChar->equip[SLOT_LINK1] && PChar->PLinkshell1)
    {
        PChar->PLinkshell1->PushLinkshellMessage(PChar, true);
    }
    else if (slot == PChar->equip[SLOT_LINK2] && PChar->PLinkshell2)
    {
        PChar->PLinkshell2->PushLinkshellMessage(PChar, false);
    }
    return;
}

/************************************************************************
*                                                                       *
*  Update Linkshell Message                                             *
*                                                                       *
************************************************************************/

void SmallPacket0x0E2(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getEquip(SLOT_LINK1);

    if (PChar->PLinkshell1 != nullptr && (PItemLinkshell != nullptr && PItemLinkshell->isType(ITEM_LINKSHELL)))
    {
        switch (RBUFB(data, (0x04)) & 0xF0)
        {
        case 0x20: // Establish right to change the message..
        {
            // TODO: ....
        }
        break;
        case 0x40: // Change Message
        {
            if (PItemLinkshell->GetLSType() == LSTYPE_LINKSHELL ||
                PItemLinkshell->GetLSType() == LSTYPE_PEARLSACK)
            {
                PChar->PLinkshell1->setMessage(data[16], PChar->GetName());
                return;
            }
        }
        break;
        }
    }
    PChar->pushPacket(new CLinkshellMessagePacket(nullptr, nullptr, nullptr, 0, 1)); // you are not authorized to this action
    return;
}

/************************************************************************
*                                                                       *
*  Exit Game Request                                                    *
*    1 = /logout                                                        *
*    3 = /shutdown                                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x0E7(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->status != STATUS_NORMAL)
        return;

    if(PChar->StatusEffectContainer->HasPreventActionEffect())
        return;

    if (PChar->m_moghouseID ||
        PChar->nameflags.flags & FLAG_GM ||
        PChar->m_GMlevel > 0)
    {
        PChar->status = STATUS_SHUTDOWN;
        charutils::SendToZone(PChar, 1, 0);
    }
    else if (PChar->animation == ANIMATION_NONE)
    {
        uint8 ExitType = (RBUFB(data, (0x06)) == 1 ? 7 : 35);

        if (PChar->PPet == nullptr ||
            (PChar->PPet->m_EcoSystem != SYSTEM_AVATAR &&
            PChar->PPet->m_EcoSystem != SYSTEM_ELEMENTAL))
        {
            PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, 10, 0));
        }
        PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEAVEGAME, 0, ExitType, 5, 0));
    }
    else if (PChar->animation == ANIMATION_HEALING)
    {
        if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEAVEGAME))
        {
            PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
        }
        else {
            uint8 ExitType = (RBUFB(data, (0x06)) == 1 ? 7 : 35);

            PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEAVEGAME, 0, ExitType, 5, 0));
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Heal Packet (/heal)                                                  *
*                                                                       *
************************************************************************/

void SmallPacket0x0E8(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->status != STATUS_NORMAL)
        return;

    if(PChar->StatusEffectContainer->HasPreventActionEffect())
        return;

    switch (PChar->animation)
    {
    case ANIMATION_NONE:
    {
        if (PChar->PPet == nullptr ||
            (PChar->PPet->m_EcoSystem != SYSTEM_AVATAR &&
            PChar->PPet->m_EcoSystem != SYSTEM_ELEMENTAL ) &&
            !PChar->PAI->IsEngaged())
        {
            PChar->PAI->ClearStateStack();
            if (PChar->PPet && PChar->PPet->objtype == TYPE_PET &&
                ((CPetEntity*)PChar->PPet)->getPetType() == PETTYPE_AUTOMATON)
            {
                PChar->PPet->PAI->Disengage();
            }
            PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, 10, 0));
            return;
        }
        PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, 0, 0, 345));
    }
    break;
    case ANIMATION_HEALING:
    {
        PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }
    break;
    }
    return;
}

/************************************************************************
*                                                                       *
*  Sit Packet (/sit)                                                    *
*                                                                       *
************************************************************************/

void SmallPacket0x0EA(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->status != STATUS_NORMAL)
        return;

    if(PChar->StatusEffectContainer->HasPreventActionEffect())
        return;

    PChar->animation = (PChar->animation == ANIMATION_SIT ? ANIMATION_NONE : ANIMATION_SIT);
    PChar->updatemask |= UPDATE_HP;
    return;
}

/************************************************************************
*                                                                       *
*  Cancel Status Effect                                                 *
*                                                                       *
************************************************************************/

void SmallPacket0x0F1(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 IconID = RBUFW(data, (0x04));

    if (IconID != 0)
    {
        PChar->StatusEffectContainer->DelStatusEffectsByIcon(IconID);
    }
    return;
}

/************************************************************************
*                                                                       *
*  Update Player Zone Boundary                                          *
*                                                                       *
************************************************************************/

void SmallPacket0x0F2(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->loc.boundary = RBUFW(data, (0x06));

    charutils::SaveCharPosition(PChar);
    return;
}

/************************************************************************
*                                                                       *
*  Wide Scan                                                            *
*                                                                       *
************************************************************************/

void SmallPacket0x0F4(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    // Set Widescan range
    // Distances need verified, based current values off what we had in traits.sql and data at http://wiki.ffxiclopedia.org/wiki/Wide_Scan
    // NOTE: Widescan was formerly piggy backed onto traits (resist slow) but is not a real trait, any attempt to give it a trait will place a dot on characters trait menu.
    if (map_config.all_jobs_widescan == 0)
    {
        // Limit to BST and RNG, and try to use old distance values for tiers
        if (PChar->GetMJob() == JOB_RNG)
        {
            if (PChar->GetMLevel() >= 60)
            {
                PChar->loc.zone->WideScan(PChar, 300);
            }
            else if (PChar->GetMLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 250);
            }
            else if (PChar->GetMLevel() >= 20)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
        }
        else if (PChar->GetMJob() == JOB_BST)
        {
            if (PChar->GetMLevel() >= 60)
            {
                PChar->loc.zone->WideScan(PChar, 250);
            }
            else if (PChar->GetMLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else if (PChar->GetMLevel() >= 20)
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 50);
            }
        }
        else if (PChar->GetSJob() == JOB_RNG)
        {
            if (PChar->GetSLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 250);
            }
            else if (PChar->GetSLevel() >= 20)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
        }
        else if (PChar->GetSJob() == JOB_BST)
        {
            if (PChar->GetSLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else if (PChar->GetSLevel() >= 20)
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 50);
            }
        }
        else
        {
            // Not BST or RNG, get nothing!
            PChar->loc.zone->WideScan(PChar, 0);
            // The zero needs set or client will lag on map screen saying downloading data.
        }
    }
    else if (map_config.all_jobs_widescan == 1)
    {
        // All jobs have 1st tier, and use current retail distance values for tiers
        if (PChar->GetMJob() == JOB_RNG)
        {
            // Need verification
            // if (PChar->GetMLevel() >= 80)
            // {
            //     PChar->loc.zone->WideScan(PChar,350);
            // }
            // else if (PChar->GetMLevel() >= 60)
            if (PChar->GetMLevel() >= 60)
            {
                PChar->loc.zone->WideScan(PChar, 300);
            }
            else if (PChar->GetMLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 250);
            }
            else if (PChar->GetMLevel() >= 20)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
        }
        else if (PChar->GetMJob() == JOB_BST)
        {
            if (PChar->GetMLevel() >= 80)
            {
                PChar->loc.zone->WideScan(PChar, 300);
            }
            else if (PChar->GetMLevel() >= 60)
            {
                PChar->loc.zone->WideScan(PChar, 250);
            }
            else if (PChar->GetMLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
        }
        else if (PChar->GetSJob() == JOB_RNG)
        {
            if (PChar->GetSLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 250);
            }
            else if (PChar->GetSLevel() >= 20)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
        }
        else if (PChar->GetSJob() == JOB_BST)
        {
            if (PChar->GetSLevel() >= 40)
            {
                PChar->loc.zone->WideScan(PChar, 200);
            }
            else
            {
                PChar->loc.zone->WideScan(PChar, 150);
            }
        }
        else
        {
            // Not BST or RNG, get base scan radius only!
            PChar->loc.zone->WideScan(PChar, 150);
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Wide Scan Track                                                      *
*                                                                       *
************************************************************************/

void SmallPacket0x0F5(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 TargID = RBUFW(data, (0x04));

    PChar->PWideScanTarget = PChar->GetEntity(TargID, TYPE_MOB | TYPE_NPC);
    return;
}

/************************************************************************
*                                                                       *
*  Wide Scan Cancel Tracking                                            *
*                                                                       *
************************************************************************/

void SmallPacket0x0F6(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->PWideScanTarget = nullptr;
    return;
}

/************************************************************************
*                                                                       *
*  Mog House Place Furniture                                            *
*                                                                       *
************************************************************************/

void SmallPacket0x0FA(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 ItemID = RBUFW(data, (0x04));

    if (ItemID == 0)
        return;

    uint8  slotID = RBUFB(data, (0x06));
    uint8  containerID = RBUFB(data, (0x07));
    uint8  col = RBUFB(data, (0x09));
    uint8  level = RBUFB(data, (0x0A));
    uint8  row = RBUFB(data, (0x0B));
    uint8  rotation = RBUFB(data, (0x0C));

    CItemFurnishing* PItem = (CItemFurnishing*)PChar->getStorage(containerID)->GetItem(slotID);

    if (PItem != nullptr &&
        PItem->getID() == ItemID &&
        PItem->isType(ITEM_FURNISHING))
    {
        if (PItem->getFlag() & ITEM_FLAG_WALLHANDING)
        {
            rotation = (col >= 2 ? 3 : 1);
        }

        PItem->setInstalled(true);
        PItem->setCol(col);
        PItem->setRow(row);
        PItem->setLevel(level);
        PItem->setRotation(rotation);

        PItem->setSubType(ITEM_LOCKED);

        int8 extra[sizeof(PItem->m_extra) * 2 + 1];
        Sql_EscapeStringLen(SqlHandle, extra, (const int8*)PItem->m_extra, sizeof(PItem->m_extra));

        const int8* Query =
            "UPDATE char_inventory "
            "SET "
            "extra = '%s' "
            "WHERE location = 1 AND slot = %u AND charid = %u";

        if (Sql_Query(SqlHandle, Query, extra, slotID, PChar->id) != SQL_ERROR && Sql_AffectedRows(SqlHandle) != 0)
        {
            PChar->getStorage(LOC_STORAGE)->AddBuff(PItem->getStorage());

            PChar->pushPacket(new CInventorySizePacket(PChar));
        }
        PChar->pushPacket(new CInventoryItemPacket(PItem, containerID, slotID));
        PChar->pushPacket(new CInventoryFinishPacket());
    }
    return;
}

/************************************************************************
*                                                                       *
*  Mog House Remove Furniture                                           *
*                                                                       *
************************************************************************/

void SmallPacket0x0FB(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint16 ItemID = RBUFW(data, (0x04));

    if (ItemID == 0)
    {
        return;
    }

    uint8  slotID = RBUFB(data, (0x06));
    uint8 containerID = RBUFB(data, (0x07));

    CItemContainer* PItemContainer = PChar->getStorage(containerID);

    CItemFurnishing* PItem = (CItemFurnishing*)PItemContainer->GetItem(slotID);

    if (PItem != nullptr &&
        PItem->getID() == ItemID &&
        PItem->isType(ITEM_FURNISHING))
    {
        PItemContainer = PChar->getStorage(LOC_STORAGE);

        uint8 RemovedSize = PItemContainer->GetSize() - dsp_min(PItemContainer->GetSize(), PItemContainer->GetBuff() - PItem->getStorage());

        if (PItemContainer->GetFreeSlotsCount() >= RemovedSize)
        {
            PItem->setInstalled(false);
            PItem->setCol(0);
            PItem->setRow(0);
            PItem->setLevel(0);
            PItem->setRotation(0);

            PItem->setSubType(ITEM_UNLOCKED);

            int8 extra[sizeof(PItem->m_extra) * 2 + 1];
            Sql_EscapeStringLen(SqlHandle, extra, (const int8*)PItem->m_extra, sizeof(PItem->m_extra));

            const int8* Query =
                "UPDATE char_inventory "
                "SET "
                "extra = '%s' "
                "WHERE location = 1 AND slot = %u AND charid = %u";

            if (Sql_Query(SqlHandle, Query, extra, slotID, PChar->id) != SQL_ERROR && Sql_AffectedRows(SqlHandle) != 0)
            {
                uint8 NewSize = PItemContainer->GetSize() - RemovedSize;
                for (uint8 SlotID = PItemContainer->GetSize(); SlotID > NewSize; --SlotID)
                {
                    if (PItemContainer->GetItem(SlotID) != nullptr)
                    {
                        charutils::MoveItem(PChar, LOC_STORAGE, SlotID, ERROR_SLOTID);
                    }
                }
                PChar->getStorage(LOC_STORAGE)->AddBuff(-(int8)PItem->getStorage());

                PChar->pushPacket(new CInventorySizePacket(PChar));
            }
            PChar->pushPacket(new CInventoryItemPacket(PItem, containerID, PItem->getSlotID()));
            PChar->pushPacket(new CInventoryFinishPacket());
        }
        else
        {
            ShowError(CL_RED"SmallPacket0x0FB: furnishing can't be removed\n" CL_RESET);
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Job Change                                                           *
*                                                                       *
************************************************************************/

void SmallPacket0x100(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    if (PChar->loc.zone->CanUseMisc(MISC_MOGMENU) || PChar->m_moghouseID)
    {
        uint8 mjob = RBUFB(data, (0x04));
        uint8 sjob = RBUFB(data, (0x05));

        if ((mjob > 0x00) && (mjob < MAX_JOBTYPE) && (PChar->jobs.unlocked & (1 << mjob)))
        {
            JOBTYPE prevjob = PChar->GetMJob();
            PChar->resetPetZoningInfo();

            charutils::RemoveAllEquipment(PChar);
            PChar->SetMJob(mjob);
            PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
            PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

            // If removing RemoveAllEquipment, please add a charutils::CheckUnarmedItem(PChar) if main hand is empty.
            puppetutils::LoadAutomaton(PChar);
            if (mjob == JOB_BLU)
            {
                blueutils::LoadSetSpells(PChar);
            }
            else if (prevjob == JOB_BLU)
            {
                blueutils::UnequipAllBlueSpells(PChar);
            }
        }

        if ((sjob > 0x00) && (sjob < MAX_JOBTYPE) && (PChar->jobs.unlocked & (1 << sjob)))
        {
            JOBTYPE prevsjob = PChar->GetSJob();
            PChar->resetPetZoningInfo();

            PChar->SetSJob(sjob);
            PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

            charutils::CheckEquipLogic(PChar, SCRIPT_CHANGESJOB, prevsjob);
            puppetutils::LoadAutomaton(PChar);
            if (sjob == JOB_BLU)
                blueutils::LoadSetSpells(PChar);
            else if (prevsjob == JOB_BLU)
                blueutils::UnequipAllBlueSpells(PChar);

            uint16 subType = PChar->m_Weapons[SLOT_SUB]->getDmgType();

            if (subType > 0 && subType < 4)
            {
                charutils::UnequipItem(PChar, SLOT_SUB);
            }

        }

        charutils::SetStyleLock(PChar, false);
        luautils::CheckForGearSet(PChar); // check for gear set on gear change

        charutils::BuildingCharSkillsTable(PChar);
        charutils::CalculateStats(PChar);
        charutils::BuildingCharTraitsTable(PChar);
        PChar->PRecastContainer->ChangeJob();
        charutils::BuildingCharAbilityTable(PChar);
        charutils::BuildingCharWeaponSkills(PChar);

        PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DISPELABLE);

        PChar->ForParty([](CBattleEntity* PMember)
        {
            ((CCharEntity*)PMember)->PLatentEffectContainer->CheckLatentsPartyJobs();
        });


        PChar->UpdateHealth();

        PChar->health.hp = PChar->GetMaxHP();
        PChar->health.mp = PChar->GetMaxMP();
        PChar->updatemask |= UPDATE_HP;

        charutils::SaveCharStats(PChar);

        PChar->pushPacket(new CCharJobsPacket(PChar));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharStatsPacket(PChar));
        PChar->pushPacket(new CCharSkillsPacket(PChar));
        PChar->pushPacket(new CCharRecastPacket(PChar));
        PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
        PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
        PChar->pushPacket(new CMenuMeritPacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }
    return;
}

/************************************************************************
*                                                                       *
*  Set Blue Magic Spells                                                *
*                                                                       *
************************************************************************/

void SmallPacket0x102(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 job = RBUFB(data, (0x08));
    if ((PChar->GetMJob() == JOB_BLU || PChar->GetSJob() == JOB_BLU) && job == JOB_BLU) {
        // This may be a request to add or remove set spells, so lets check.

        uint8 spellToAdd = RBUFB(data, (0x04)); // this is non-zero if client wants to add.
        uint8 spellInQuestion = 0;
        uint8 spellIndex = -1;

        if (spellToAdd == 0x00) {
            for (uint8 i = 0x0C; i <= 0x1F; i++) {
                if (RBUFB(data, i) > 0) {
                    spellInQuestion = RBUFB(data, i);
                    spellIndex = i - 0x0C;
                    CBlueSpell* spell = (CBlueSpell*)spell::GetSpell(spellInQuestion + 0x200); // the spells in this packet are offsetted by 0x200 from their spell IDs.

                    if (spell != nullptr) {
                        blueutils::SetBlueSpell(PChar, spell, spellIndex, (spellToAdd > 0));
                    }
                    else {
                        ShowDebug("Cannot resolve spell id \n");
                    }
                }
            }
            charutils::BuildingCharTraitsTable(PChar);
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
            PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
            PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
            PChar->pushPacket(new CCharStatsPacket(PChar));
            PChar->UpdateHealth();
        }
        else {
            // loop all 20 slots and find which index they are playing with
            for (uint8 i = 0x0C; i <= 0x1F; i++) {
                if (RBUFB(data, i) > 0) {
                    spellInQuestion = RBUFB(data, i);
                    spellIndex = i - 0x0C;
                    break;
                }
            }

            if (spellIndex != -1 && spellInQuestion != 0) {
                CBlueSpell* spell = (CBlueSpell*)spell::GetSpell(spellInQuestion + 0x200); // the spells in this packet are offsetted by 0x200 from their spell IDs.

                if (spell != nullptr) {
                    blueutils::SetBlueSpell(PChar, spell, spellIndex, (spellToAdd > 0));
                    charutils::BuildingCharTraitsTable(PChar);
                    PChar->pushPacket(new CCharAbilitiesPacket(PChar));
                    PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
                    PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
                    PChar->pushPacket(new CCharStatsPacket(PChar));
                    PChar->UpdateHealth();
                }
                else {
                    ShowDebug("Cannot resolve spell id \n");
                }
            }
            else {
                ShowDebug("No match found. \n");
            }
        }
    }
    else if ((PChar->GetMJob() == JOB_PUP || PChar->GetSJob() == JOB_PUP) && job == JOB_PUP && PChar->PAutomaton != nullptr)
    {
        uint8 attachment = RBUFB(data, 0x04);

        if (attachment == 0x00)
        {
            //remove all attachments specified
            for (uint8 i = 0x0E; i < 0x1A; i++)
            {
                if (RBUFB(data, i) != 0)
                {
                    puppetutils::setAttachment(PChar, i - 0x0E, 0x00);
                }
            }
        }
        else
        {
            if (RBUFB(data, 0x0C) != 0)
            {
                puppetutils::setHead(PChar, RBUFB(data, 0x0C));
            }
            else if (RBUFB(data, 0x0D) != 0)
            {
                puppetutils::setFrame(PChar, RBUFB(data, 0x0D));
            }
            else
            {
                for (uint8 i = 0x0E; i < 0x1A; i++)
                {
                    if (RBUFB(data, i) != 0)
                    {
                        puppetutils::setAttachment(PChar, i - 0x0E, RBUFB(data, i));
                    }
                }
            }
        }
        PChar->pushPacket(new CCharJobExtraPacket(PChar, true));
        PChar->pushPacket(new CCharJobExtraPacket(PChar, false));
        puppetutils::SaveAutomaton(PChar);
    }

    return;
}

/************************************************************************
*                                                                        *
*  Closing the "View wares", sending a message to the bazaar            *
*  that you have left the shop                                            *
*                                                                        *
************************************************************************/

void SmallPacket0x104(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    CCharEntity* PTarget = (CCharEntity*)PChar->GetEntity(PChar->BazaarID.targid, TYPE_PC);

    if (PTarget != nullptr && PTarget->id == PChar->BazaarID.id)
    {
        for (uint16 i = 0; i < PTarget->BazaarCustomers.size(); ++i)
        {
            if (PTarget->BazaarCustomers[i].id == PChar->targid)
            {
                PTarget->BazaarCustomers.erase(PTarget->BazaarCustomers.begin() + i--);
            }
        }
        PTarget->pushPacket(new CBazaarCheckPacket(PChar, BAZAAR_LEAVE));
    }
    PChar->BazaarID.clean();
    return;
}

/************************************************************************
*                                                                       *
*  Clicking "View wares", opening the bazaar for browsing               *
*                                                                       *
************************************************************************/

void SmallPacket0x105(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    DSP_DEBUG_BREAK_IF(PChar->BazaarID.id != 0);
    DSP_DEBUG_BREAK_IF(PChar->BazaarID.targid != 0);

    uint32 charid = RBUFL(data, (0x04));

    CCharEntity* PTarget = charid != 0 ? (CCharEntity*)PChar->loc.zone->GetCharByID(charid) : (CCharEntity*)PChar->GetEntity(PChar->m_TargID, TYPE_PC);

    if (PTarget != nullptr && PTarget->id == charid && (PTarget->nameflags.flags & FLAG_BAZAAR))
    {
        PChar->BazaarID.id = PTarget->id;
        PChar->BazaarID.targid = PTarget->targid;

        EntityID_t EntityID = { PChar->id, PChar->targid };

        PTarget->pushPacket(new CBazaarCheckPacket(PChar, BAZAAR_ENTER));
        PTarget->BazaarCustomers.push_back(EntityID);

        CItemContainer* PBazaar = PTarget->getStorage(LOC_INVENTORY);

        for (uint8 SlotID = 1; SlotID <= PBazaar->GetSize(); ++SlotID)
        {
            CItem* PItem = PBazaar->GetItem(SlotID);

            if ((PItem != nullptr) && (PItem->getCharPrice() != 0))
            {
                PChar->pushPacket(new CBazaarItemPacket(PItem, SlotID, PChar->loc.zone->GetTax()));
            }
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Purchasing an item from a bazaar                                     *
*                                                                       *
************************************************************************/

void SmallPacket0x106(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8 Quantity = RBUFB(data, 0x08);
    uint8 SlotID = RBUFB(data, 0x04);

    CCharEntity* PTarget = (CCharEntity*)PChar->GetEntity(PChar->BazaarID.targid, TYPE_PC);

    if (PTarget == nullptr || PTarget->id != PChar->BazaarID.id)
        return;

    CItemContainer* PBazaar = PTarget->getStorage(LOC_INVENTORY);
    CItemContainer* PBuyerInventory = PChar->getStorage(LOC_INVENTORY);

    if (PChar->id == PTarget->id || PBuyerInventory->GetFreeSlotsCount() == 0)
    {
        PChar->pushPacket(new CBazaarPurchasePacket(PTarget, false));
        return;
    }

    CItem* PBazaarItem = PBazaar->GetItem(SlotID);
    if (PBazaarItem == nullptr)
        return;

    // Obtain the players gil..
    CItem* PCharGil = PBuyerInventory->GetItem(0);
    if (PCharGil == nullptr || !PCharGil->isType(ITEM_CURRENCY))
    {
        // Player has no gil..
        PChar->pushPacket(new CBazaarPurchasePacket(PTarget, false));
        return;
    }

    // Validate this player can afford said item..
    if (PCharGil->getQuantity() < PBazaarItem->getCharPrice())
    {
        // Exploit attempt..
        ShowError(CL_RED"Bazaar purchase exploit attempt by: %s\n" CL_RESET, PChar->GetName());
        PChar->pushPacket(new CBazaarPurchasePacket(PTarget, false));
        return;
    }

    if ((PBazaarItem != nullptr) && (PBazaarItem->getCharPrice() != 0) && (PBazaarItem->getQuantity() >= Quantity))
    {
        CItem* PItem = itemutils::GetItem(PBazaarItem);

        PItem->setCharPrice(0);
        PItem->setQuantity(Quantity);
        PItem->setSubType(ITEM_UNLOCKED);

        if (charutils::AddItem(PChar, LOC_INVENTORY, PItem) == ERROR_SLOTID)
            return;

        uint32 Price1 = (PBazaarItem->getCharPrice() * Quantity);
        uint32 Price2 = (PChar->loc.zone->GetTax() * Price1) / 10000 + Price1;

        charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -Price2);
        charutils::UpdateItem(PTarget, LOC_INVENTORY, 0, Price1);

        PChar->pushPacket(new CBazaarPurchasePacket(PTarget, true));

        PTarget->pushPacket(new CBazaarConfirmationPacket(PChar, SlotID, Quantity));

        charutils::UpdateItem(PTarget, LOC_INVENTORY, SlotID, -Quantity);

        PTarget->pushPacket(new CInventoryItemPacket(PBazaar->GetItem(SlotID), LOC_INVENTORY, SlotID));
        PTarget->pushPacket(new CInventoryFinishPacket());

        bool BazaarIsEmpty = true;

        for (uint8 BazaarSlotID = 1; BazaarSlotID <= PBazaar->GetSize(); ++BazaarSlotID)
        {
            PItem = PBazaar->GetItem(BazaarSlotID);

            if ((PItem != nullptr) && (PItem->getCharPrice() != 0))
            {
                BazaarIsEmpty = false;
                break;
            }
        }
        for (uint16 i = 0; i < PTarget->BazaarCustomers.size(); ++i)
        {
            CCharEntity* PCustomer = (CCharEntity*)PTarget->GetEntity(PTarget->BazaarCustomers[i].targid, TYPE_PC);

            if (PCustomer != nullptr && PCustomer->id == PTarget->BazaarCustomers[i].id)
            {
                if (PCustomer->id != PChar->id)
                {
                    PCustomer->pushPacket(new CBazaarConfirmationPacket(PChar, SlotID, Quantity));
                }
                PCustomer->pushPacket(new CBazaarItemPacket(PBazaar->GetItem(SlotID), SlotID, PChar->loc.zone->GetTax()));

                if (BazaarIsEmpty)
                {
                    PCustomer->pushPacket(new CBazaarClosePacket(PTarget));
                }
            }
        }
        if (BazaarIsEmpty)
        {
            PTarget->updatemask |= UPDATE_HP;
            PTarget->nameflags.flags &= ~FLAG_BAZAAR;
        }
        return;
    }
    PChar->pushPacket(new CBazaarPurchasePacket(PTarget, false));
    return;
}

/************************************************************************
*                                                                       *
*  Bazaar (Exit Price Setting)                                          *
*                                                                       *
************************************************************************/

void SmallPacket0x109(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    CItemContainer* PStorage = PChar->getStorage(LOC_INVENTORY);

    for (uint8 slotID = 1; slotID <= PStorage->GetSize(); ++slotID)
    {
        CItem* PItem = PStorage->GetItem(slotID);

        if ((PItem != nullptr) && (PItem->getCharPrice() != 0))
        {
            PChar->nameflags.flags |= FLAG_BAZAAR;
            PChar->updatemask |= UPDATE_HP;
            return;
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Bazaar (Set Price)                                                   *
*                                                                       *
************************************************************************/

void SmallPacket0x10A(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    uint8  slotID = RBUFB(data, (0x04));
    uint32 price = RBUFL(data, (0x08));

    CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

    if ((PItem != nullptr) && !(PItem->getFlag() & ITEM_FLAG_EX))
    {
        Sql_Query(SqlHandle, "UPDATE char_inventory SET bazaar = %u WHERE charid = %u AND location = 0 AND slot = %u;", price, PChar->id, slotID);

        PItem->setCharPrice(price);
        PItem->setSubType((price == 0 ? ITEM_UNLOCKED : ITEM_LOCKED));

        PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, slotID));
        PChar->pushPacket(new CInventoryFinishPacket());
    }
    return;
}

/************************************************************************
*                                                                        *
*  Opening "Set Prices" in bazaar-menu, closing the bazaar                 *
*                                                                        *
************************************************************************/

void SmallPacket0x10B(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    for (uint16 i = 0; i < PChar->BazaarCustomers.size(); ++i)
    {
        CCharEntity* PCustomer = (CCharEntity*)PChar->GetEntity(PChar->BazaarCustomers[i].targid, TYPE_PC);

        if (PCustomer != nullptr && PCustomer->id == PChar->BazaarCustomers[i].id)
        {
            PCustomer->pushPacket(new CBazaarClosePacket(PChar));
        }
    }
    PChar->BazaarCustomers.clear();

    PChar->nameflags.flags &= ~FLAG_BAZAAR;
    PChar->updatemask |= UPDATE_HP;
    return;
}

/************************************************************************
*                                                                        *
*  Request Currency1 tab                                                  *
*                                                                        *
************************************************************************/

void SmallPacket0x10F(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->pushPacket(new CCurrencyPacket1(PChar));
    return;
}

/************************************************************************
*                                                                        *
*  Lock Style Request                                                   *
*                                                                        *
************************************************************************/

void SmallPacket0x111(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    charutils::SetStyleLock(PChar, RBUFB(data, (0x04)));
    PChar->pushPacket(new CCharAppearancePacket(PChar));
    return;
}

/************************************************************************
*                                                                        *
*  Request Currency2 tab                                                  *
*                                                                        *
************************************************************************/

void SmallPacket0x115(map_session_data_t* session, CCharEntity* PChar, CBasicPacket data)
{
    PChar->pushPacket(new CCurrencyPacket2(PChar));
    return;
}

/************************************************************************
*                                                                       *
*  Packet Array Initialization                                          *
*                                                                       *
************************************************************************/

void PacketParserInitialize()
{
    for (uint16 i = 0; i < 512; ++i)
    {
        PacketSize[i] = 0;
        PacketParser[i] = &SmallPacket0x000;
    }
    PacketSize[0x00A] = 0x2E; PacketParser[0x00A] = &SmallPacket0x00A;
    PacketSize[0x00C] = 0x00; PacketParser[0x00C] = &SmallPacket0x00C;
    PacketSize[0x00D] = 0x04; PacketParser[0x00D] = &SmallPacket0x00D;
    PacketSize[0x00F] = 0x00; PacketParser[0x00F] = &SmallPacket0x00F;
    PacketSize[0x011] = 0x00; PacketParser[0x011] = &SmallPacket0x011;
    PacketSize[0x015] = 0x10; PacketParser[0x015] = &SmallPacket0x015;
    PacketSize[0x016] = 0x04; PacketParser[0x016] = &SmallPacket0x016;
    PacketSize[0x017] = 0x00; PacketParser[0x017] = &SmallPacket0x017;
    PacketSize[0x01A] = 0x0E; PacketParser[0x01A] = &SmallPacket0x01A;
    PacketSize[0x01B] = 0x00; PacketParser[0x01B] = &SmallPacket0x01B;
    PacketSize[0x01C] = 0x00; PacketParser[0x01C] = &SmallPacket0x01C;
    PacketSize[0x028] = 0x06; PacketParser[0x028] = &SmallPacket0x028;
    PacketSize[0x029] = 0x06; PacketParser[0x029] = &SmallPacket0x029;
    PacketSize[0x032] = 0x06; PacketParser[0x032] = &SmallPacket0x032;
    PacketSize[0x033] = 0x06; PacketParser[0x033] = &SmallPacket0x033;
    PacketSize[0x034] = 0x06; PacketParser[0x034] = &SmallPacket0x034;
    PacketSize[0x036] = 0x20; PacketParser[0x036] = &SmallPacket0x036;
    PacketSize[0x037] = 0x0A; PacketParser[0x037] = &SmallPacket0x037;
    PacketSize[0x03A] = 0x04; PacketParser[0x03A] = &SmallPacket0x03A;
    PacketSize[0x03C] = 0x00; PacketParser[0x03C] = &SmallPacket0x03C;
    PacketSize[0x03D] = 0x00; PacketParser[0x03D] = &SmallPacket0x03D; // Blacklist Command
    PacketSize[0x041] = 0x00; PacketParser[0x041] = &SmallPacket0x041;
    PacketSize[0x042] = 0x00; PacketParser[0x042] = &SmallPacket0x042;
    PacketSize[0x04B] = 0x0C; PacketParser[0x04B] = &SmallPacket0x04B;
    PacketSize[0x04D] = 0x00; PacketParser[0x04D] = &SmallPacket0x04D;
    PacketSize[0x04E] = 0x1E; PacketParser[0x04E] = &SmallPacket0x04E;
    PacketSize[0x050] = 0x04; PacketParser[0x050] = &SmallPacket0x050;
    PacketSize[0x051] = 0x24; PacketParser[0x051] = &SmallPacket0x051;
    PacketSize[0x052] = 0x26; PacketParser[0x052] = &SmallPacket0x052;
    PacketSize[0x053] = 0x44; PacketParser[0x053] = &SmallPacket0x053;
    PacketSize[0x058] = 0x0A; PacketParser[0x058] = &SmallPacket0x058;
    PacketSize[0x059] = 0x00; PacketParser[0x059] = &SmallPacket0x059;
    PacketSize[0x05A] = 0x02; PacketParser[0x05A] = &SmallPacket0x05A;
    PacketSize[0x05B] = 0x0A; PacketParser[0x05B] = &SmallPacket0x05B;
    PacketSize[0x05C] = 0x00; PacketParser[0x05C] = &SmallPacket0x05C;
    PacketSize[0x05D] = 0x08; PacketParser[0x05D] = &SmallPacket0x05D;
    PacketSize[0x05E] = 0x0C; PacketParser[0x05E] = &SmallPacket0x05E;
    PacketSize[0x060] = 0x00; PacketParser[0x060] = &SmallPacket0x060;
    PacketSize[0x061] = 0x04; PacketParser[0x061] = &SmallPacket0x061;
    PacketSize[0x063] = 0x00; PacketParser[0x063] = &SmallPacket0x063;
    PacketSize[0x064] = 0x26; PacketParser[0x064] = &SmallPacket0x064;
    PacketSize[0x066] = 0x0A; PacketParser[0x066] = &SmallPacket0x066;
    PacketSize[0x06E] = 0x06; PacketParser[0x06E] = &SmallPacket0x06E;
    PacketSize[0x06F] = 0x00; PacketParser[0x06F] = &SmallPacket0x06F;
    PacketSize[0x070] = 0x00; PacketParser[0x070] = &SmallPacket0x070;
    PacketSize[0x071] = 0x00; PacketParser[0x071] = &SmallPacket0x071;
    PacketSize[0x074] = 0x00; PacketParser[0x074] = &SmallPacket0x074;
    PacketSize[0x076] = 0x00; PacketParser[0x076] = &SmallPacket0x076;
    PacketSize[0x077] = 0x00; PacketParser[0x077] = &SmallPacket0x077;
    PacketSize[0x078] = 0x00; PacketParser[0x078] = &SmallPacket0x078;
    PacketSize[0x083] = 0x08; PacketParser[0x083] = &SmallPacket0x083;
    PacketSize[0x084] = 0x06; PacketParser[0x084] = &SmallPacket0x084;
    PacketSize[0x085] = 0x04; PacketParser[0x085] = &SmallPacket0x085;
    PacketSize[0x096] = 0x12; PacketParser[0x096] = &SmallPacket0x096;
    PacketSize[0x0A0] = 0x00; PacketParser[0x0A0] = &SmallPacket0xFFF;    // not implemented
    PacketSize[0x0A1] = 0x00; PacketParser[0x0A1] = &SmallPacket0xFFF;    // not implemented
    PacketSize[0x0A2] = 0x00; PacketParser[0x0A2] = &SmallPacket0x0A2;
    PacketSize[0x0AA] = 0x00; PacketParser[0x0AA] = &SmallPacket0x0AA;
    PacketSize[0x0AB] = 0x00; PacketParser[0x0AB] = &SmallPacket0x0AB;
    PacketSize[0x0AC] = 0x00; PacketParser[0x0AC] = &SmallPacket0x0AC;
    PacketSize[0x0AD] = 0x00; PacketParser[0x0AD] = &SmallPacket0x0AD;
    PacketSize[0x0B5] = 0x00; PacketParser[0x0B5] = &SmallPacket0x0B5;
    PacketSize[0x0B6] = 0x00; PacketParser[0x0B6] = &SmallPacket0x0B6;
    PacketSize[0x0BE] = 0x00; PacketParser[0x0BE] = &SmallPacket0x0BE;    //  merit packet
    PacketSize[0x0C3] = 0x00; PacketParser[0x0C3] = &SmallPacket0x0C3;
    PacketSize[0x0C4] = 0x0E; PacketParser[0x0C4] = &SmallPacket0x0C4;
    PacketSize[0x0CB] = 0x04; PacketParser[0x0CB] = &SmallPacket0x0CB;
    PacketSize[0x0D2] = 0x00; PacketParser[0x0D2] = &SmallPacket0x0D2;
    PacketSize[0x0D3] = 0x00; PacketParser[0x0D3] = &SmallPacket0x0D3;
    PacketSize[0x0D4] = 0x00; PacketParser[0x0D4] = &SmallPacket0xFFF;    // not implemented
    PacketSize[0x0DB] = 0x00; PacketParser[0x0DB] = &SmallPacket0x0DB;
    PacketSize[0x0DC] = 0x0A; PacketParser[0x0DC] = &SmallPacket0x0DC;
    PacketSize[0x0DD] = 0x08; PacketParser[0x0DD] = &SmallPacket0x0DD;
    PacketSize[0x0DE] = 0x40; PacketParser[0x0DE] = &SmallPacket0x0DE;
    PacketSize[0x0E0] = 0x4C; PacketParser[0x0E0] = &SmallPacket0x0E0;
    PacketSize[0x0E1] = 0x00; PacketParser[0x0E1] = &SmallPacket0x0E1;
    PacketSize[0x0E2] = 0x00; PacketParser[0x0E2] = &SmallPacket0x0E2;
    PacketSize[0x0E7] = 0x04; PacketParser[0x0E7] = &SmallPacket0x0E7;
    PacketSize[0x0E8] = 0x04; PacketParser[0x0E8] = &SmallPacket0x0E8;
    PacketSize[0x0EA] = 0x00; PacketParser[0x0EA] = &SmallPacket0x0EA;
    PacketSize[0x0F1] = 0x00; PacketParser[0x0F1] = &SmallPacket0x0F1;
    PacketSize[0x0F2] = 0x00; PacketParser[0x0F2] = &SmallPacket0x0F2;
    PacketSize[0x0F4] = 0x04; PacketParser[0x0F4] = &SmallPacket0x0F4;
    PacketSize[0x0F5] = 0x00; PacketParser[0x0F5] = &SmallPacket0x0F5;
    PacketSize[0x0F6] = 0x00; PacketParser[0x0F6] = &SmallPacket0x0F6;
    PacketSize[0x0FA] = 0x00; PacketParser[0x0FA] = &SmallPacket0x0FA;
    PacketSize[0x0FB] = 0x00; PacketParser[0x0FB] = &SmallPacket0x0FB;
    PacketSize[0x100] = 0x04; PacketParser[0x100] = &SmallPacket0x100;
    PacketSize[0x102] = 0x52; PacketParser[0x102] = &SmallPacket0x102;
    PacketSize[0x104] = 0x02; PacketParser[0x104] = &SmallPacket0x104;
    PacketSize[0x105] = 0x06; PacketParser[0x105] = &SmallPacket0x105;
    PacketSize[0x106] = 0x06; PacketParser[0x106] = &SmallPacket0x106;
    PacketSize[0x109] = 0x00; PacketParser[0x109] = &SmallPacket0x109;
    PacketSize[0x10A] = 0x06; PacketParser[0x10A] = &SmallPacket0x10A;
    PacketSize[0x10B] = 0x00; PacketParser[0x10B] = &SmallPacket0x10B;
    PacketSize[0x10F] = 0x02; PacketParser[0x10F] = &SmallPacket0x10F;
    PacketSize[0x111] = 0x00; PacketParser[0x111] = &SmallPacket0x111; // Lock Style Request
    PacketSize[0x112] = 0x00; PacketParser[0x112] = &SmallPacket0xFFF;
    PacketSize[0x114] = 0x00; PacketParser[0x114] = &SmallPacket0xFFF;
    PacketSize[0x115] = 0x02; PacketParser[0x115] = &SmallPacket0x115;
}

/************************************************************************
*                                                                       *
*                                                                       *
*                                                                       *
************************************************************************/
