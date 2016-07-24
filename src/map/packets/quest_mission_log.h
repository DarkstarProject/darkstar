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

#ifndef _CQUESTMISSIONLOGPACKET_H
#define _CQUESTMISSIONLOGPACKET_H

#include <unordered_map>
#include "../../common/cbasetypes.h"

#include "basic.h"

// Quest/Mission Area Identifiers
#define QUESTS_SANDORIA      0
#define QUESTS_BASTOK        1
#define QUESTS_WINDURST      2
#define QUESTS_JEUNO         3
#define QUESTS_OTHER         4
#define QUESTS_OUTLANDS      5
#define QUESTS_TOAU          6
#define QUESTS_WOTG          7
#define QUESTS_ABYSSEA       8
#define QUESTS_ADOULIN       9
#define QUESTS_COALITION    10

#define MISSION_SANDORIA     0
#define MISSION_BASTOK       1
#define MISSION_WINDURST     2
#define MISSION_ZILART       3
#define MISSION_TOAU         4
#define MISSION_WOTG         5
#define MISSION_COP          6
#define MISSION_ASSAULT      7
#define MISSION_CAMPAIGN     8
#define MISSION_ACP          9
#define MISSION_AMK         10
#define MISSION_ASA         11
#define MISSION_SOA         12
#define MISSION_ROV         13

// Quest Log Packet Bytes
const std::unordered_map<uint8, uint16> QUEST_PACKET_BYTES =
{
    { 1,  0x50   }, // SAN_CURRENT
    { 2,  0x90   }, // SAN_COMPLETE
    { 3,  0x58   }, // BAS_CURRENT
    { 4,  0x98   }, // BAS_COMPLETE
    { 5,  0x60   }, // WIN_CURRENT
    { 6,  0xA0   }, // WIN_COMPLETE
    { 7,  0x68   }, // JEU_CURRENT
    { 8,  0xA8   }, // JEU_COMPLETE
    { 9,  0x70   }, // OTH_CURRENT
    { 10, 0xB0   }, // OTH_COMPLETE
    { 11, 0x78   }, // OUT_CURRENT
    { 12, 0xB8   }, // OUT_COMPLETE
    { 13, 0x80   }, // EXP_CURRENT
    { 14, 0xC0   }, // EXP_COMPLETE
    { 15, 0x88   }, // WAR_CURRENT
    { 16, 0xC8   }, // WAR_COMPLETE
    { 17, 0xE0   }, // ABY_CURRENT
    { 18, 0xE8   }, // ABY_COMPLETE
    { 19, 0xF0   }, // ADO_CURRENT
    { 20, 0xF8   }, // ADO_COMPLETE
    { 21, 0x0100 }, // COA_CURRENT
    { 22, 0x0108 }  // COA_COMPLETE
};

// Mission Log Packet Bytes
#define MISS_COMPLETE       0xD0
#define MISS_CURRENT        0xFFFF
#define EXP_MISS_COMPLETE   0xD8
#define EXP_MISS_CURRENT    0x80
#define ASSAULT_COMPLETE    0xC0
#define CMPGN_MISS_UN       0x30
#define CMPGN_MISS_DEUX     0x38

// Log Types
#define LOG_QUEST_CURR  0x01
#define LOG_QUEST_COMP  0x02
#define LOG_MISS_CURR   0x03
#define LOG_MISS_COMP   0x04
#define LOG_CAMPAIGN2   0x05

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CQuestMissionLogPacket : public CBasicPacket
{
public:

    CQuestMissionLogPacket(CCharEntity* PChar, uint8 logID, uint8 logType);
private:

    // формирование пакетов вынес в отдельные функции, специально для тех,
    // кто захочет понять, что же на самом деле происходит в switch(logID)

    void generateQuestPacket(CCharEntity* PChar, uint8 logID, uint8 status);
    void generateCurrentMissionPacket(CCharEntity* PChar);
    void generateCompleteMissionPacket(CCharEntity* PChar);
    void generateCurrentExpMissionPacket(CCharEntity* PChar);
    void generateCompleteExpMissionPacket(CCharEntity* PChar);
    void generateCampaignMissionPacket(CCharEntity* PChar, uint8 startQMID);
    void generateAssaultMissionPacket(CCharEntity* PChar);
};

#endif
