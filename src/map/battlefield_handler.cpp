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

CBattlefieldHandler::CBattlefieldHandler(uint16 zoneid) {
    m_ZoneId = zoneid;

    // The Garden of RuHmet, Dynamis zones, and Ghelsba Outpost
    if (m_ZoneId == 35 || m_ZoneId > 38 && m_ZoneId < 43 || m_ZoneId > 133 && m_ZoneId < 136 || m_ZoneId == 140 || m_ZoneId > 184 && m_ZoneId < 189 ) {
        m_MaxBattlefields = 1;

    // Temenos
    } else if (m_ZoneId == 37) {
        m_MaxBattlefields = 8;

    // Apollyon
    } else if (m_ZoneId == 38) {
        m_MaxBattlefields = 6;

    // All other battlefield zones
    } else {
        m_MaxBattlefields = 3;
    }

    memset(&m_Battlefields, 0, sizeof(m_Battlefields));
}

/***********************************************************
 is battlefield bnum free
 ***********************************************************/
bool CBattlefieldHandler::isBattlefieldFree(uint16 bnum) {
    if (m_Battlefields[bnum-1] == nullptr)
        return true;
    else
        return false;
}

void CBattlefieldHandler::handleBattlefields(time_point tick) {
    for (int i = 0; i < m_MaxBattlefields; i++) {
        if (m_Battlefields[i] != nullptr) { //handle it!
            CBattlefield* PBattlefield = m_Battlefields[i];
            int instzone = PBattlefield->getZoneId();

            // update timers
            auto time_elapsed = std::chrono::duration_cast<std::chrono::seconds>(tick - PBattlefield->getStartTime());
            auto time_remaining = std::chrono::duration_cast<std::chrono::seconds>(PBattlefield->getTimeLimit() - time_elapsed).count();

            //handle locking of bcnm when engaged
            if (PBattlefield->getType() == BATTLEFIELDTYPE_BCNM && !PBattlefield->isLocked() && PBattlefield->isPlayersFighting()) {
                PBattlefield->lock();
                PBattlefield->fightTick = tick;
                ShowDebug("Zone %i battlefield %i with bfid %i: Battlefield locked \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
            }

            // handle death time
            if (PBattlefield->allPlayersDead()) {
                if (PBattlefield->getDeadTime() == time_point::min()) {
                    PBattlefield->setDeadTime(tick);
                    ShowDebug("Zone %i battlefield %i with bfid %i: All players have fallen \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                }
            }
            else {
                if (PBattlefield->getDeadTime() != time_point::min()) {
                    PBattlefield->setDeadTime(time_point::min()); //reset dead time when people are alive
                    ShowDebug("Zone %i battlefield %i with bfid %i: Death counter reset as a player is now alive \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                }
            }

            // time remaining messages
            if (PBattlefield->getType() == BATTLEFIELDTYPE_DYNAMIS && (time_elapsed % 60) == 0s && (PBattlefield->getTimeLimit() - time_elapsed) <= 5min) {
                PBattlefield->pushMessageToAllInBcnm(449, (time_remaining) / 60);
            } else if (time_elapsed % 60 == 0s) {
                PBattlefield->pushMessageToAllInBcnm(202, time_remaining);
            }

            // handle win conditions
            if (PBattlefield->getType() == BATTLEFIELDTYPE_BCNM && battlefieldutils::meetsWinningConditions(PBattlefield, tick)) {

                //check rule mask to see if warp immediately or pop a chest
                if (PBattlefield->m_RuleMask & RULES_SPAWN_TREASURE_ON_WIN) {
                    //spawn chest
                    if (!PBattlefield->m_chestSpawned)
                    {
                        ShowDebug("Zone %i battlefield %i with bfid %i: Winning conditions met. Spawning chest. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                        PBattlefield->spawnChest();
                    }
                }
                else {
                    // BCNMs that ends before killing mobs exits immediately.
                    if (!PBattlefield->allEnemiesDefeated() && !PBattlefield->cleared()) {
                        ShowDebug("Zone %i battlefield %i with bfid %i: Winning conditions met. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                        PBattlefield->winBcnm();
                    }
                    // BCNMs with no treasure chest ends around 7 seconds after winning.
                    else if (!PBattlefield->won()) {
                        ShowDebug("Zone %i battlefield %i with bfid %i: Winning conditions met. Waiting 7 seconds before exiting battlefield. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                        PBattlefield->win(tick);
                    }
                    else {
                        if (!PBattlefield->cleared() && (tick - PBattlefield->getWinTime()) > 6s) {
                            ShowDebug("Zone %i battlefield %i with bfid %i: Winning conditions met. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                            PBattlefield->winBcnm();
                        }
                    }
                }

            // handle lose conditions
            } else if (!PBattlefield->cleared() && battlefieldutils::meetsLosingConditions(PBattlefield, tick)) {
                ShowDebug("Zone %i battlefield %i with bfid %i: Losing conditions met. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                PBattlefield->loseBcnm();
            }

        }
    }
}

void CBattlefieldHandler::wipeBattlefield(CBattlefield* PBattlefield) {
    if (PBattlefield->getBattlefieldNumber() <= m_MaxBattlefields && PBattlefield->getBattlefieldNumber() > 0 && m_Battlefields[PBattlefield->getBattlefieldNumber() - 1] != nullptr) {
        ShowDebug("Zone %i battlefield %i with bfid %i: Wiping battlefield from handler. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
        m_Battlefields[PBattlefield->getBattlefieldNumber() - 1] = nullptr;
    }
}

/* Disconnecting from BCNM (including warp)
This removes the player from the active list and calls the warp/dc callback. Must bear in mind
that this will be called if you warp BEFORE entering the bcnm (but still have battleifeld status)
hence it doesn't check if you're "in" the BCNM, it just tries to remove you from the list.
*/
bool CBattlefieldHandler::disconnectFromBattlefield(CCharEntity* PChar) {
    uint16 bnum = 0;

    if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_BATTLEFIELD))
        bnum = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_BATTLEFIELD)->GetPower();
    else if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_DYNAMIS))
        bnum = PChar->StatusEffectContainer->GetStatusEffect(EFFECT_DYNAMIS)->GetPower();

    if (bnum == 0)
        return false;

    if (m_Battlefields[bnum-1] != nullptr) {
        CBattlefield* PBattlefield = m_Battlefields[bnum-1];
        if (PBattlefield->delPlayer(PChar)) {
            luautils::OnBcnmLeave(PChar, PBattlefield, LEAVE_WARPDC);
            if (!PBattlefield->isReserved()) {//no more players in BCNM
                ShowDebug("Zone %i battlefield %i with bfid %i: No more players detected. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
                luautils::OnBcnmLeave(PChar, PBattlefield, LEAVE_LOSE);
                PBattlefield->cleanup();
            }
            return true;
        }

    }

    return false;
}

bool CBattlefieldHandler::leaveBcnm(uint16 bnum, CCharEntity* PChar) {
    if (m_Battlefields[bnum-1] != nullptr && m_Battlefields[bnum-1]->isPlayerInBcnm(PChar) && m_Battlefields[bnum-1] == PChar->PBCNM) {
        luautils::OnBcnmLeave(PChar, m_Battlefields[bnum-1], LEAVE_EXIT);
        m_Battlefields[bnum-1]->delPlayer(PChar);
        return true;
    }
    return false;
}

bool CBattlefieldHandler::winBcnm(uint16 bnum, CCharEntity* PChar) {
    if (m_Battlefields[bnum-1] != nullptr && m_Battlefields[bnum-1]->isPlayerInBcnm(PChar)) {
        m_Battlefields[bnum-1]->winBcnm();
        return true;
    }
    return false;
}

bool CBattlefieldHandler::enterBcnm(uint16 bnum, CCharEntity* PChar) {
    if (m_Battlefields[bnum-1] != nullptr && m_Battlefields[bnum-1]->isValidPlayerForBcnm(PChar)) {
        if (m_Battlefields[bnum-1]->enterBcnm(PChar)) {
            return true;
        }
    }
    return false;
}

int CBattlefieldHandler::registerBattlefield(uint16 bnum, uint16 id, CCharEntity* PChar) {
    if (!isBattlefieldFree(bnum)) {
        return -1;
    }

    CZone* PZone = PChar->loc.zone == nullptr ? zoneutils::GetZone(PChar->loc.destination) : PChar->loc.zone;
    int ZoneID = PZone->GetID();

    BATTLEFIELDTYPE type;
    if (ZoneID == 37 || ZoneID == 38)
        type = BATTLEFIELDTYPE_LIMBUS;
    else if ((ZoneID >= 39 && ZoneID <= 42) || ZoneID == 134 || ZoneID == 135 || (ZoneID >= 185 && ZoneID <= 188))
        type = BATTLEFIELDTYPE_DYNAMIS;
    else
        type = BATTLEFIELDTYPE_BCNM;

    CBattlefield* PBattlefield = battlefieldutils::loadBattlefield(this, id, type);
    if (PBattlefield == nullptr) {
        return -1;
    }
    PBattlefield->setBattlefieldNumber(bnum);

    if (type == BATTLEFIELDTYPE_DYNAMIS) {
        PBattlefield->addPlayer(PChar);
    } else {
        switch (PBattlefield->getMaxParticipants()) {
            case 1:
                if (PBattlefield->addPlayer(PChar)) {
                    ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->GetName());
                }
                break;
            case 3:
                if (PChar->PParty == nullptr) {//just add the initiator
                    if (PBattlefield->addPlayer(PChar)) {
                        ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->GetName());
                    }
                }
                else {
                    int numRegistered = 0;
                    for (int j = 0; j < PChar->PParty->members.size(); j++) {
                        if (PBattlefield->addPlayer((CCharEntity*)PChar->PParty->members.at(j))) {
                            ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->PParty->members.at(j)->GetName());
                            numRegistered++;
                        }
                        if (numRegistered >= 3) { break; }
                    }
                }
                break;
            case 6:
                if (PChar->PParty == nullptr) {//just add the initiator
                    if (PBattlefield->addPlayer(PChar)) {
                        ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->GetName());
                    }
                }
                else {
                    for (int j = 0; j < PChar->PParty->members.size(); j++) {
                        if (PBattlefield->addPlayer((CCharEntity*)PChar->PParty->members.at(j))) {
                            ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->PParty->members.at(j)->GetName());
                        }
                    }
                }
                break;
            case 12: ShowDebug("BCNMs for 12 people are not implemented yet.\n"); break;

            case 18:
                if (PChar->PParty == nullptr) {//1 player entering 18 man bcnm
                    if (PBattlefield->addPlayer(PChar)) {
                        ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->GetName());
                    }
                }
                else {//alliance entering 18 man bcnm
                    if (PChar->PParty->m_PAlliance != nullptr)
                    {
                        for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
                        {
                            for (uint8 j = 0; j < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); j++) {
                                if (PBattlefield->addPlayer((CCharEntity*)PChar->PParty->m_PAlliance->partyList.at(a)->members.at(j))) {
                                    ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->PParty->m_PAlliance->partyList.at(a)->members.at(j)->GetName());
                                }
                            }
                        }
                    }
                    else {//single party entering 18 man bcnm
                        for (uint8 j = 0; j < PChar->PParty->members.size(); j++) {
                            if (PBattlefield->addPlayer((CCharEntity*)PChar->PParty->members.at(j))) {
                                ShowDebug("Zone %i battlefield %i with bfid %i: Added %s. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->PParty->members.at(j)->GetName());
                            }
                        }
                    }
                }
                break;

            default: ShowDebug("Unknown max participants value %i \n", PBattlefield->getMaxParticipants());
        }
    }

    if (!PBattlefield->isReserved()) {//no player met the criteria for entering, so revoke the previous permission.
        ShowDebug("Zone %i battlefield %i with bfid %i: No player has met the requirements for entering the battlefield. \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID());
        delete PBattlefield;
        return -1;
    }

    m_Battlefields[PBattlefield->getBattlefieldNumber() - 1] = PBattlefield;
    PBattlefield->init();
    luautils::OnBcnmRegister(PChar, PBattlefield);
    return PBattlefield->getBattlefieldNumber();
}

void CBattlefieldHandler::SetLootToBCNM(uint16 LootID, uint16 bnum, uint32 npcID) {
    m_Battlefields[bnum - 1]->setLootId(LootID);
    CBaseEntity* PNpc = (CBaseEntity*)zoneutils::GetEntity(npcID, TYPE_NPC);
    m_Battlefields[bnum - 1]->addNpc(PNpc);
}

void CBattlefieldHandler::RestoreOnBattlefield(uint16 bnum) {
    int playermaxMP = 0;
    int playermaxHP = 0;
    if (bnum <= m_MaxBattlefields &&  bnum > 0) {
        CBattlefield* PBattlefield = m_Battlefields[bnum - 1];
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

duration CBattlefieldHandler::getBattlefieldTimeLeft(uint16 bnum, time_point tick) {

    if (bnum <= m_MaxBattlefields &&  bnum > 0) {

        if (m_Battlefields[bnum - 1] != nullptr) {
            auto Tremaining = (tick - m_Battlefields[bnum - 1]->getStartTime());  //66
            auto timelimit = m_Battlefields[bnum - 1]->getTimeLimit();             ///3600
            return (timelimit - Tremaining);
        }
    }
    return 0s;
}

int CBattlefieldHandler::GiveTimeToBattlefield(uint16 bnum, duration Time) {
    if (bnum <= m_MaxBattlefields &&  bnum > 0) {
        if (m_Battlefields[bnum - 1] != nullptr) {
            CBattlefield* PBattlefield = m_Battlefields[bnum - 1];
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

CBattlefield* CBattlefieldHandler::getBattlefield(uint16 bnum)
{
    return m_Battlefields[bnum-1];
}

int CBattlefieldHandler::addPlayerToBattlefield(uint16 bnum, CCharEntity* PChar) {

    if (m_Battlefields[bnum-1]->addPlayer(PChar)) {
        ShowDebug("Zone %i battlefield %i with bfid %i: Added %s \n", m_Battlefields[bnum-1]->getZoneId(), m_Battlefields[bnum-1]->getBattlefieldNumber(), m_Battlefields[bnum-1]->getID(), PChar->GetName());
    }

    return 1;
}


//========================DYNAMIS FUNCTIONS=============================================//

int CBattlefieldHandler::registerDynamis(uint16 bnum, uint16 id, CCharEntity* PChar) {
    if (!isBattlefieldFree(bnum)) {
        return -1;
    }
    CBattlefield* PBattlefield = battlefieldutils::loadBattlefield(this, id, BATTLEFIELDTYPE_DYNAMIS);
    if (PBattlefield == nullptr) {
        return -1;
    }
    PBattlefield->setBattlefieldNumber(bnum);

    if (PBattlefield->addPlayer(PChar)) {
        ShowDebug("Zone %i battlefield %i with bfid %i: Added %s \n", PBattlefield->getZoneId(), PBattlefield->getBattlefieldNumber(), PBattlefield->getID(), PChar->GetName());
    }

    m_Battlefields[PBattlefield->getBattlefieldNumber() - 1] = PBattlefield;
    PBattlefield->init();
    luautils::OnBcnmRegister(PChar, PBattlefield);
    return PBattlefield->getBattlefieldNumber();
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

void CBattlefieldHandler::insertMonsterInList(CMobEntity* PMob)
{
    CBattlefield* PBattlefield = m_Battlefields[0];

    if (!PBattlefield->isEnemyInList(PMob))
        PBattlefield->addEnemy(PMob, 0);
}

bool CBattlefieldHandler::checkMonsterInList(CMobEntity* PMob)
{
    return m_Battlefields[0]->isEnemyInList(PMob);
}
