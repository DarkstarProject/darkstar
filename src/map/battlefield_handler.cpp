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

#include <string.h>

#include "alliance.h"
#include "entities/charentity.h"
#include "battlefield_handler.h"
#include "entities/mobentity.h"
#include "utils/zoneutils.h"
#include "utils/charutils.h"
#include "lua/luautils.h"
#include "packets/char_recast.h"
#include "packets/char_skills.h"
#include "packets/message_basic.h"
#include "recast_container.h"
#include "status_effect_container.h"

CBattlefieldHandler::CBattlefieldHandler(uint16 zoneid)
{
    m_ZoneId = zoneid;

    //Dynamis zone (need to add COP dyna zone)
    //added ghelsba outpost here, 1 battlefield only
    if (m_ZoneId > 184 && m_ZoneId < 189 || m_ZoneId > 133 && m_ZoneId < 136 || m_ZoneId == 140 || m_ZoneId == 35 || m_ZoneId > 38 && m_ZoneId < 43)
    {
        m_MaxBattlefields = 1;
    }
    else
        if (m_ZoneId == 37)
        {
            m_MaxBattlefields = 8;
        }
        else
            if (m_ZoneId == 38)
            {
                m_MaxBattlefields = 6;
            }
            else
            {
                m_MaxBattlefields = 3;
            }
    memset(&m_Battlefields, 0, sizeof(m_Battlefields));
}

void CBattlefieldHandler::handleBattlefields(time_point tick) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr) { //handle it!
            CBattlefield* PBattlefield = m_Battlefields[i];
            int instzone = PBattlefield->getZoneId();

            //handle time remaining prompts (since its useful!) Prompts every minute
            auto time_elapsed = std::chrono::duration_cast<std::chrono::seconds>(tick - PBattlefield->getStartTime());
            auto time_remaining = std::chrono::duration_cast<std::chrono::seconds>(PBattlefield->getTimeLimit() - time_elapsed).count();

            //Dynamis zone (need to add COP Dyna)
            if (instzone > 184 && instzone < 189 || instzone > 133 && instzone < 136 || instzone > 38 && instzone < 43) {
                //handle death time
                if (PBattlefield->allPlayersDead()) {//set dead time
                    if (PBattlefield->getDeadTime() == time_point::min()) {
                        PBattlefield->setDeadTime(tick);
                        ShowDebug("Dynamis %i battlefield %i : All players have fallen.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                    }
                }
                else {
                    if (PBattlefield->getDeadTime() != time_point::min()) {
                        PBattlefield->setDeadTime(time_point::min()); //reset dead time when people are alive
                        ShowDebug("Dynamis %i battlefield %i : Death counter reset as a player is now alive.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                    }
                }


                //New message (in yellow) at the end of dynamis (5min before the end)
                if ((time_elapsed % 60) == 0s && (PBattlefield->getTimeLimit() - time_elapsed) <= 5min) {
                    PBattlefield->pushMessageToAllInBcnm(449, (time_remaining) / 60);
                }
                else {
                    if (time_elapsed % 60 == 0s) {
                        PBattlefield->pushMessageToAllInBcnm(202, time_remaining);
                    }
                }

                //if the time is finished, exiting dynamis
                if (battlefieldutils::meetsLosingConditions(PBattlefield, tick)) {
                    ShowDebug("Dynamis %i battlefield %i : Dynamis is finished. Exiting battlefield.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                    PBattlefield->finishDynamis();
                }
            }
            else
                if (instzone == 37 || instzone == 38) { //limbus ///////////////////////////////////////////////////////////
                                //handle death time
                    if (PBattlefield->allPlayersDead()) {//set dead time
                        if (PBattlefield->getDeadTime() == time_point::min()) {
                            PBattlefield->setDeadTime(tick);
                            ShowDebug("Limbus %i battlefield %i : All players have fallen.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                        }
                    }
                    else {
                        if (PBattlefield->getDeadTime() != time_point::min()) {
                            PBattlefield->setDeadTime(time_point::min()); //reset dead time when people are alive
                            ShowDebug("Limbus %i battlefield %i : Death counter reset as a player is now alive.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                        }
                    }

                    if (time_elapsed % 60 == 0s) {
                        PBattlefield->pushMessageToAllInBcnm(202, time_remaining);
                    }

                    //if the time is finished, exiting Limbus
                    if (battlefieldutils::meetsLosingConditions(PBattlefield, tick)) {

                        ShowDebug("Limbus %i battlefield %i : Limbus is finished. Exiting battlefield.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                        PBattlefield->loseBcnm();
                    }
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
                }
                else {
                    //handle locking of bcnm when engaged
                    if (!PBattlefield->locked && PBattlefield->isPlayersFighting()) {
                        PBattlefield->lockBcnm();
                        PBattlefield->fightTick = tick;
                        PBattlefield->locked = true;
                        ShowDebug("BCNM %i battlefield %i : Battlefield has been locked. No more players can enter.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                    }
                    //handle death time
                    if (PBattlefield->allPlayersDead()) {//set dead time
                        if (PBattlefield->getDeadTime() == time_point::min()) {
                            PBattlefield->setDeadTime(tick);
                            ShowDebug("BCNM %i battlefield %i : All players have fallen.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                        }
                    }
                    else {
                        if (PBattlefield->getDeadTime() != time_point::min()) {
                            PBattlefield->setDeadTime(time_point::min()); //reset dead time when people are alive
                            ShowDebug("BCNM %i battlefield %i : Death counter reset as a player is now alive.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                        }
                    }
                    //handle time remaining prompts (since its useful!) Prompts every minute
                    if (time_elapsed % 60 == 0s) {
                        PBattlefield->pushMessageToAllInBcnm(202, time_remaining);
                    }

                    //handle win conditions
                    if (battlefieldutils::meetsWinningConditions(PBattlefield, tick)) {
                        //check rule mask to see if warp immediately or pop a chest
                        if (PBattlefield->m_RuleMask & RULES_SPAWN_TREASURE_ON_WIN) {
                            //spawn chest
                            if (PBattlefield->treasureChestSpawned == false)
                            {
                                ShowDebug("BCNM %i battlefield %i : Winning conditions met. Spawning chest.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                                PBattlefield->spawnTreasureChest();
                                //PBattlefield->getHighestTHforBcnm(); apparently not used in bcnm
                                PBattlefield->treasureChestSpawned = true;
                            }
                        }
                        else {
                            // BCNMs that ends before killing mobs exits immediately.
                            if (!PBattlefield->allEnemiesDefeated() && !PBattlefield->cleared()) {
                                ShowDebug("BCNM %i battlefield %i : Winning conditions met.\n",
                                    PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                                PBattlefield->winBcnm();
                            }
                            // BCNMs with no treasure chest ends around 7 seconds after winning.
                            else if (!PBattlefield->won()) {
                                ShowDebug("BCNM %i battlefield %i : Winning conditions met. Waiting 7 seconds before exiting battlefield.\n",
                                    PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                                PBattlefield->win(tick);
                            }
                            else {
                                if (!PBattlefield->cleared() && (tick - PBattlefield->getWinTime()) > 6s) {
                                    ShowDebug("BCNM %i battlefield %i : Exiting battlefield.\n",
                                        PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                                    PBattlefield->winBcnm();
                                }
                            }
                        }
                    }
                    //handle lose conditions
                    else if (battlefieldutils::meetsLosingConditions(PBattlefield, tick) && !PBattlefield->cleared()) {
                        ShowDebug("BCNM %i battlefield %i : Losing conditions met. Exiting battlefield.\n", PBattlefield->getID(), PBattlefield->getBattlefieldNumber());
                        PBattlefield->loseBcnm();
                    }
                }
        }
    }

    //send 246 with bunrning circle as target (bcnm is full. followed by time remaining)

}

void CBattlefieldHandler::wipeBattlefield(CBattlefield* inst) {
    if (inst->getBattlefieldNumber() <= m_MaxBattlefields && inst->getBattlefieldNumber() > 0 &&
        m_Battlefields[inst->getBattlefieldNumber() - 1] != nullptr) {
        ShowDebug("Wiping battlefield BCNMID: %i Battlefield %i \n", inst->getID(), inst->getBattlefieldNumber());
        m_Battlefields[inst->getBattlefieldNumber() - 1] = nullptr;
    }
}

/* Disconnecting from BCNM (including warp)
This removes the player from the active list and calls the warp/dc callback. Must bear in mind
that this will be called if you warp BEFORE entering the bcnm (but still have battleifeld status)
hence it doesn't check if you're "in" the BCNM, it just tries to remove you from the list.
*/
bool CBattlefieldHandler::disconnectFromBcnm(CCharEntity* PChar) //includes warping
{
    if (!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD))
        return false;
    
    uint16 effectid = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD, 0)->GetPower();

    for (int i = 0; i < m_MaxBattlefields; i++)
    {
        if (m_Battlefields[i] != nullptr)
        {
            if (m_Battlefields[i]->getID() == effectid)
            //PChar->PBCNM will be nullptr if the player has not yet entered so we check their status effect instead
            { 
                luautils::OnBcnmLeave(PChar, m_Battlefields[i], LEAVE_WARPDC);
                m_Battlefields[i]->delPlayerFromBcnm(PChar);
                return true;
            }
        }
    }
    return false;
}

bool CBattlefieldHandler::leaveBcnm(uint16 bcnmid, CCharEntity* PChar) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr && m_Battlefields[i]->getID() == bcnmid) {
            if (m_Battlefields[i]->isPlayerInBcnm(PChar)) {
                if (m_Battlefields[i] == PChar->PBCNM) {
                    luautils::OnBcnmLeave(PChar, m_Battlefields[i], LEAVE_EXIT);
                    return true;
                }
            }
        }
    }
    return false;
}

bool CBattlefieldHandler::winBcnm(uint16 bcnmid, CCharEntity* PChar) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr && m_Battlefields[i]->getID() == bcnmid) {
            if (m_Battlefields[i]->isPlayerInBcnm(PChar)) {
                m_Battlefields[i]->winBcnm();
                return true;
            }
        }
    }
    return false;
}

bool CBattlefieldHandler::enterBcnm(uint16 bcnmid, CCharEntity* PChar) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr && m_Battlefields[i]->getID() == bcnmid) {
            if (m_Battlefields[i]->isValidPlayerForBcnm(PChar)) {
                if (m_Battlefields[i]->enterBcnm(PChar)) {
                    return true;
                }
            }
        }
    }
    return false;
}

int CBattlefieldHandler::registerBcnm(uint16 id, CCharEntity* PChar) {
    if (!hasFreeBattlefield()) {
        return -1;
    }
    CBattlefield* PBattlefield = battlefieldutils::loadBattlefield(this, id, BATTLEFIELDTYPE_BCNM);
    if (PBattlefield == nullptr) {
        return -1;
    }
    if (id > 1289 && id < 1308) {

        switch (id)
        {
            case 1290:
            {PBattlefield->setBattlefieldNumber(1); }
            break;
            case 1291:
            {PBattlefield->setBattlefieldNumber(2); }
            break;
            case 1292:
            {PBattlefield->setBattlefieldNumber(3); }
            break;
            case 1293:
            {PBattlefield->setBattlefieldNumber(4); }
            break;
            case 1294:
            {PBattlefield->setBattlefieldNumber(5); }
            break;
            case 1295:
            {PBattlefield->setBattlefieldNumber(5); }
            break;
            case 1296:
            {PBattlefield->setBattlefieldNumber(6); }
            break;
            case 1297:
            {PBattlefield->setBattlefieldNumber(6); }
            break;
            case 1298:
            {PBattlefield->setBattlefieldNumber(1); }
            break;
            case 1299:
            {PBattlefield->setBattlefieldNumber(2); }
            break;
            case 1300:
            {PBattlefield->setBattlefieldNumber(3); }
            break;
            case 1301:
            {PBattlefield->setBattlefieldNumber(4); }
            break;
            case 1302:
            {PBattlefield->setBattlefieldNumber(4); }
            break;
            case 1303:
            {PBattlefield->setBattlefieldNumber(5); }
            break;
            case 1304:
            {PBattlefield->setBattlefieldNumber(6); }
            break;
            case 1305:
            {PBattlefield->setBattlefieldNumber(7); }
            break;
            case 1306:
            {PBattlefield->setBattlefieldNumber(8); }
            break;
            case 1307:
            {PBattlefield->setBattlefieldNumber(8); }
            break;
        }
    }
    else {
        for (int i = 0; i < m_MaxBattlefields; i++) {
            if (m_Battlefields[i] == nullptr) {
                PBattlefield->setBattlefieldNumber(i + 1);
                break;
            }
        }
    }
    switch (PBattlefield->getMaxParticipants()) {
        case 1:
            if (PBattlefield->addPlayerToBcnm(PChar)) {
                ShowDebug("BattlefieldHandler ::1 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                    PChar->GetName(), id, PBattlefield->getBattlefieldNumber());
            }
            break;
        case 3:
            if (PChar->PParty == nullptr) {//just add the initiator
                if (PBattlefield->addPlayerToBcnm(PChar)) {
                    ShowDebug("BattlefieldHandler ::3 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                        PChar->GetName(), id, PBattlefield->getBattlefieldNumber());
                }
            }
            else {
                int numRegistered = 0;
                for (int j = 0; j < PChar->PParty->members.size(); j++) {
                    if (PBattlefield->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(j))) {
                        ShowDebug("BattlefieldHandler ::3 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                            PChar->PParty->members.at(j)->GetName(), id, PBattlefield->getBattlefieldNumber());
                        numRegistered++;
                    }
                    if (numRegistered >= 3) { break; }
                }
            }
            break;
        case 6:
            if (PChar->PParty == nullptr) {//just add the initiator
                if (PBattlefield->addPlayerToBcnm(PChar)) {
                    ShowDebug("BattlefieldHandler ::6 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                        PChar->GetName(), id, PBattlefield->getBattlefieldNumber());
                }
            }
            else {
                for (int j = 0; j < PChar->PParty->members.size(); j++) {
                    if (PBattlefield->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(j))) {
                        ShowDebug("BattlefieldHandler ::6 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                            PChar->PParty->members.at(j)->GetName(), id, PBattlefield->getBattlefieldNumber());
                    }
                }
            }
            break;
        case 12: ShowDebug("BCNMs for 12 people are not implemented yet.\n"); break;

        case 18:
            if (PChar->PParty == nullptr) {//1 player entering 18 man bcnm
                if (PBattlefield->addPlayerToBcnm(PChar)) {
                    ShowDebug("BattlefieldHandler ::18 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                        PChar->GetName(), id, PBattlefield->getBattlefieldNumber());
                }
            }
            else {//alliance entering 18 man bcnm
                if (PChar->PParty->m_PAlliance != nullptr)
                {
                    for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
                    {
                        for (uint8 j = 0; j < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); j++) {
                            if (PBattlefield->addPlayerToBcnm((CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members.at(j))) {
                                ShowDebug("BattlefieldHandler ::18 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                                    PChar->PParty->m_PAlliance->partyList.at(a)->members.at(j)->GetName(), id, PBattlefield->getBattlefieldNumber());
                            }
                        }
                    }
                }
                else {//single party entering 18 man bcnm
                    for (uint8 j = 0; j < PChar->PParty->members.size(); j++) {
                        if (PBattlefield->addPlayerToBcnm((CCharEntity*)PChar->PParty->members.at(j))) {
                            ShowDebug("BattlefieldHandler ::18 Added %s to the valid players list for BCNM %i Battlefield %i \n",
                                PChar->PParty->members.at(j)->GetName(), id, PBattlefield->getBattlefieldNumber());
                        }
                    }
                }
            }
            break;

        default: ShowDebug("Unknown max participants value %i \n", PBattlefield->getMaxParticipants());
    }

    if (!PBattlefield->isReserved()) {//no player met the criteria for entering, so revoke the previous permission.
        ShowDebug("No player has met the requirements for entering the BCNM.\n");
        delete PBattlefield;
        return -1;
    }

    m_Battlefields[PBattlefield->getBattlefieldNumber() - 1] = PBattlefield;
    PBattlefield->init();
    luautils::OnBcnmRegister(PChar, PBattlefield);
    return PBattlefield->getBattlefieldNumber();
}

bool CBattlefieldHandler::hasFreeSpecialBattlefield(uint16 id) { //reserved for special battlefield like limbus

    switch (id)
    {
        case 1290:
        { if (m_Battlefields[0] == nullptr) { return true; }}
        break;
        case 1291:
        { if (m_Battlefields[1] == nullptr) { return true; }}
        break;
        case 1292:
        { if (m_Battlefields[2] == nullptr) { return true; }}
        break;
        case 1293:
        { if (m_Battlefields[3] == nullptr) { return true; }}
        break;
        case 1294:
        { if (m_Battlefields[4] == nullptr) { return true; }}
        break;
        case 1295:
        { if (m_Battlefields[4] == nullptr) { return true; }}
        break;
        case 1296:
        { if (m_Battlefields[5] == nullptr) { return true; }}
        break;
        case 1297:
        { if (m_Battlefields[5] == nullptr) { return true; }}
        break;
        case 1298:
        { if (m_Battlefields[0] == nullptr) { return true; }}
        break;
        case 1299:
        {if (m_Battlefields[1] == nullptr) { return true; }}
        break;
        case 1300:
        {if (m_Battlefields[2] == nullptr) { return true; }}
        break;
        case 1301:
        {if (m_Battlefields[3] == nullptr) { return true; }}
        break;
        case 1302:
        {if (m_Battlefields[3] == nullptr) { return true; }}
        break;
        case 1303:
        {if (m_Battlefields[4] == nullptr) { return true; }}
        break;
        case 1304:
        {if (m_Battlefields[5] == nullptr) { return true; }}
        break;
        case 1305:
        {if (m_Battlefields[6] == nullptr) { return true; }}
        break;
        case 1306:
        {if (m_Battlefields[7] == nullptr) { return true; }}
        break;
        case 1307:
        {if (m_Battlefields[7] == nullptr) { return true; }}
        break;
        default:
            return false;
            break;
    }
    return false;
}

bool CBattlefieldHandler::hasSpecialBattlefieldEmpty(uint16 id) { //reserved for special battlefield like limbus
    if (id <= m_MaxBattlefields &&  id != 0) {
        if (m_Battlefields[id - 1] != nullptr) {
            return false;
        }
    }
    return true;
}
void CBattlefieldHandler::SetLootToBCNM(uint16 LootID, uint16 id, uint32 npcID) {
    m_Battlefields[id - 1]->setLootId(LootID);
    CBaseEntity* PNpc = (CBaseEntity*)zoneutils::GetEntity(npcID, TYPE_NPC);
    m_Battlefields[id - 1]->addNpc(PNpc);
}
void CBattlefieldHandler::RestoreOnBattlefield(uint16 id) {
    int playermaxMP = 0;
    int playermaxHP = 0;
    if (id <= m_MaxBattlefields &&  id > 0) {
        CBattlefield* PBattlefield = m_Battlefields[id - 1];
        for (int i = 0; i < PBattlefield->m_PlayerList.size(); i++) {
            if (PBattlefield->m_PlayerList.at(i)->animation != ANIMATION_DEATH) {

                PBattlefield->m_PlayerList.at(i)->PRecastContainer->Del(RECAST_MAGIC);
                PBattlefield->m_PlayerList.at(i)->PRecastContainer->Del(RECAST_ABILITY);

                playermaxMP = PBattlefield->m_PlayerList.at(i)->GetMaxMP();
                playermaxHP = PBattlefield->m_PlayerList.at(i)->GetMaxHP();

                PBattlefield->m_PlayerList.at(i)->addHP(playermaxHP);
                PBattlefield->m_PlayerList.at(i)->addMP(playermaxMP);

                PBattlefield->m_PlayerList.at(i)->pushPacket(new CCharSkillsPacket(PBattlefield->m_PlayerList.at(i)));
                PBattlefield->m_PlayerList.at(i)->pushPacket(new CCharRecastPacket(PBattlefield->m_PlayerList.at(i)));

                //361 - All of <target>'s abilities are recharged.
                PBattlefield->m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(PBattlefield->m_PlayerList.at(i), PBattlefield->m_PlayerList.at(i), 0, 0, 361));

                //357 - <target> regains .. HP.
                PBattlefield->m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(PBattlefield->m_PlayerList.at(i), PBattlefield->m_PlayerList.at(i), playermaxHP, playermaxHP, 357));

                //357 - <target> regains .. HP.
                PBattlefield->m_PlayerList.at(i)->pushPacket(new CMessageBasicPacket(PBattlefield->m_PlayerList.at(i), PBattlefield->m_PlayerList.at(i), playermaxMP, playermaxMP, 358));
            }
        }
    }
}
duration CBattlefieldHandler::SpecialBattlefieldLeftTime(uint16 id, time_point tick) { //reserved for special battlefield like limbus

    if (id <= m_MaxBattlefields &&  id > 0) {

        if (m_Battlefields[id - 1] != nullptr) {
            auto Tremaining = (tick - m_Battlefields[id - 1]->getStartTime());  //66
            auto timelimit = m_Battlefields[id - 1]->getTimeLimit();		  	 ///3600
            return (timelimit - Tremaining);
        }
    }
    return 0s;
}
int CBattlefieldHandler::GiveTimeToBattlefield(uint16 id, duration Time) {
    if (id <= m_MaxBattlefields &&  id > 0) {
        if (m_Battlefields[id - 1] != nullptr) {
            CBattlefield* PBattlefield = m_Battlefields[id - 1];
            PBattlefield->addTimeLimit(Time);
        }
    }
    return 1;
}
bool CBattlefieldHandler::hasFreeBattlefield() {

    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] == nullptr) {
            return true;
        }
    }
    return false;
}

uint8 CBattlefieldHandler::findBattlefieldIDFor(CCharEntity* PChar) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr) {
            if (m_Battlefields[i]->isValidPlayerForBcnm(PChar)) {
                return m_Battlefields[i]->getBattlefieldNumber();
            }
        }
    }
    return 255;
}

CBattlefield* CBattlefieldHandler::getBattlefield(CCharEntity* PChar)
{
    for (int i = 0; i < m_MaxBattlefields; i++)
        if (m_Battlefields[i] != nullptr)
            if (m_Battlefields[i]->isValidPlayerForBcnm(PChar))
                return m_Battlefields[i];
    return nullptr;
}

uint32 CBattlefieldHandler::pollTimeLeft(uint16 id) {
    return 0;
}

void CBattlefieldHandler::openTreasureChest(CCharEntity* PChar) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr) {
            if (m_Battlefields[i]->isValidPlayerForBcnm(PChar)) {
                CBattlefield* PBattlefield = m_Battlefields[i];
                PBattlefield->OpenChestinBcnm();
            }
        }
    }
}

//========================DYNAMIS FUNCTIONS=============================================//

int CBattlefieldHandler::getUniqueDynaID(uint16 id) {

    CBattlefield* PBattlefield = m_Battlefields[0];
    return PBattlefield->getDynaUniqueID();
}

int CBattlefieldHandler::registerDynamis(uint16 id, CCharEntity* PChar) {
    if (!hasFreeBattlefield()) {
        return -1;
    }
    CBattlefield* PBattlefield = battlefieldutils::loadBattlefield(this, id, BATTLEFIELDTYPE_DYNAMIS);
    if (PBattlefield == nullptr) {
        return -1;
    }
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] == nullptr) {
            PBattlefield->setBattlefieldNumber(i + 1);
            break;
        }
    }

    if (PBattlefield->addPlayerToDynamis(PChar)) {
        ShowDebug("BattlefieldHandler ::1 Added %s to the valid players list for Dynamis %i Battlefield %i \n",
            PChar->GetName(), id, PBattlefield->getBattlefieldNumber());
    }

    m_Battlefields[PBattlefield->getBattlefieldNumber() - 1] = PBattlefield;
    PBattlefield->init();
    PBattlefield->setDynaUniqueID();
    luautils::OnBcnmRegister(PChar, PBattlefield);
    return PBattlefield->getBattlefieldNumber();
}

int CBattlefieldHandler::dynamisAddPlayer(uint16 dynaid, CCharEntity* PChar) {

    if (m_Battlefields[0]->addPlayerToDynamis(PChar)) {
        ShowDebug("BattlefieldHandler ::Registration for Dynamis by %s succeeded \n", PChar->GetName());
    }

    return 1;
}

int CBattlefieldHandler::SpecialBattlefieldAddPlayer(uint16 id, CCharEntity* PChar)
{
    short Inst = 0;
    switch (id)
    {
        case 1290: Inst = 0; break;
        case 1291: Inst = 1; break;
        case 1292: Inst = 2; break;
        case 1293: Inst = 3; break;
        case 1294: Inst = 4; break;
        case 1295: Inst = 4; break;
        case 1296: Inst = 5; break;
        case 1297: Inst = 5; break;
        case 1298: Inst = 0; break;
        case 1299: Inst = 1; break;
        case 1300: Inst = 2; break;
        case 1301: Inst = 3; break;
        case 1302: Inst = 3; break;
        case 1303: Inst = 4; break;
        case 1304: Inst = 5; break;
        case 1305: Inst = 6; break;
        case 1306: Inst = 7; break;
        case 1307: Inst = 7; break;
    }

    if (m_Battlefields[Inst]->addPlayerToBcnm(PChar)) {
        ShowDebug("BattlefieldHandler ::Registration for Special Battlefield by %s succeeded \n", PChar->GetName());
    }
    return 1;
}
int CBattlefieldHandler::dynamisMessage(uint16 Param1, uint16 Param2) {

    CBattlefield* PBattlefield = m_Battlefields[0];

    PBattlefield->addTimeLimit(std::chrono::minutes(Param2));
    PBattlefield->pushMessageToAllInBcnm(Param1, Param2);

    return 1;
}

void CBattlefieldHandler::launchDynamisSecondPart() {
    battlefieldutils::spawnSecondPartDynamis(m_Battlefields[0]);
}

/* Disconnecting from Dynamis (including warp)
This removes the player from the active list and calls the warp/dc callback. Must bear in mind
that this will be called if you warp BEFORE entering the dyna (but still have dynamis status)
hence it doesn't check if you're "in" the BCNM, it just tries to remove you from the list.
*/
bool CBattlefieldHandler::disconnectFromDynamis(CCharEntity* PChar) { //includes warping
    if (m_Battlefields[0] != nullptr) {
        if (m_Battlefields[0]->delPlayerFromDynamis(PChar)) {
            luautils::OnBcnmLeave(PChar, m_Battlefields[0], LEAVE_WARPDC);
            if (!m_Battlefields[0]->isReserved()) {//no more players in BCNM
                ShowDebug("Detected no more players in Dynamis Battlefield %i. Cleaning up. \n", m_Battlefields[0]->getBattlefieldNumber());
                luautils::OnBcnmLeave(PChar, m_Battlefields[0], LEAVE_LOSE);
                m_Battlefields[0]->finishDynamis();
            }
            return true;
        }
    }
    return false;
}

void CBattlefieldHandler::insertMonsterInList(CMobEntity* PMob)
{
    CBattlefield* PBattlefield = m_Battlefields[0];

    if (PBattlefield->isMonsterInList(PMob) == false)
    {
        PBattlefield->addMonsterInList(PMob);
    }
}

bool CBattlefieldHandler::checkMonsterInList(CMobEntity* PMob)
{
    CBattlefield* PBattlefield = m_Battlefields[0];

    if (PBattlefield->isMonsterInList(PMob))
        return true;
    else
        return false;
}
