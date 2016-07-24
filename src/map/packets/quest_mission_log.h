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

#include "../../common/cbasetypes.h"
#include <map>

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

// Log Types
enum LOG_TYPE
{
    LOG_QUEST_CURR = 1,
    LOG_QUEST_COMP = 2,
    LOG_MISS_CURR = 3,
    LOG_MISS_COMP = 4,
    LOG_CAMPAIGN2 = 5,
};

// Quest Log Packet Values
static const std::map<std::pair<uint8, LOG_TYPE>, uint16> questPacketBytes =
{
    {{ QUESTS_SANDORIA , LOG_QUEST_CURR }, 0x50   }, // Sandoria Current
    {{ QUESTS_SANDORIA , LOG_QUEST_COMP }, 0x90   }, // Sandoria Complete
    {{ QUESTS_BASTOK   , LOG_QUEST_CURR }, 0x58   }, // Bastok Current
    {{ QUESTS_BASTOK   , LOG_QUEST_COMP }, 0x98   }, // Bastok Complete
    {{ QUESTS_WINDURST , LOG_QUEST_CURR }, 0x60   }, // Windurst Current
    {{ QUESTS_WINDURST , LOG_QUEST_COMP }, 0xA0   }, // Windurst Complete
    {{ QUESTS_JEUNO    , LOG_QUEST_CURR }, 0x68   }, // Jeuno Current
    {{ QUESTS_JEUNO    , LOG_QUEST_COMP }, 0xA8   }, // Jeuno Complete
    {{ QUESTS_OTHER    , LOG_QUEST_CURR }, 0x70   }, // Other Areas Current
    {{ QUESTS_OTHER    , LOG_QUEST_COMP }, 0xB0   }, // Other Areas Complete
    {{ QUESTS_OUTLANDS , LOG_QUEST_CURR }, 0x78   }, // Outlands Current
    {{ QUESTS_OUTLANDS , LOG_QUEST_COMP }, 0xB8   }, // Outlands Complete
    {{ QUESTS_TOAU     , LOG_QUEST_CURR }, 0x80   }, // Aht Urhgan Current
    {{ QUESTS_TOAU     , LOG_QUEST_COMP }, 0xC0   }, // Aht Urhgan Complete
    {{ QUESTS_WOTG     , LOG_QUEST_CURR }, 0x88   }, // Crystal War Current
    {{ QUESTS_WOTG     , LOG_QUEST_COMP }, 0xC8   }, // Crystal War Complete
    {{ QUESTS_ABYSSEA  , LOG_QUEST_CURR }, 0xE0   }, // Abyssea Current
    {{ QUESTS_ABYSSEA  , LOG_QUEST_COMP }, 0xE8   }, // Abyssea Complete
    {{ QUESTS_ADOULIN  , LOG_QUEST_CURR }, 0xF0   }, // Adoulin Current
    {{ QUESTS_ADOULIN  , LOG_QUEST_COMP }, 0xF8   }, // Adoulin Complete
    {{ QUESTS_COALITION, LOG_QUEST_CURR }, 0x0100 }, // Coalition Current
    {{ QUESTS_COALITION, LOG_QUEST_COMP }, 0x0108 }  // Coalition Complete
};

// Mission Log Packet Bytes
#define MISS_COMPLETE       0xD0
#define MISS_CURRENT        0xFFFF
#define EXP_MISS_COMPLETE   0xD8
#define EXP_MISS_CURRENT    0x80
#define ASSAULT_COMPLETE    0xC0
#define CMPGN_MISS_UN       0x30
#define CMPGN_MISS_DEUX     0x38

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CQuestMissionLogPacket : public CBasicPacket
{
public:

    CQuestMissionLogPacket(CCharEntity* PChar, uint8 logID, LOG_TYPE logType);
private:

    // формирование пакетов вынес в отдельные функции, специально для тех,
    // кто захочет понять, что же на самом деле происходит в switch(logID)

    void generateQuestPacket(CCharEntity* PChar, uint8 logID, LOG_TYPE logType);
    void generateCurrentMissionPacket(CCharEntity* PChar);
    void generateCompleteMissionPacket(CCharEntity* PChar);
    void generateCurrentExpMissionPacket(CCharEntity* PChar);
    void generateCompleteExpMissionPacket(CCharEntity* PChar);
    void generateCampaignMissionPacket(CCharEntity* PChar, uint8 startQMID);
    void generateAssaultMissionPacket(CCharEntity* PChar);
};

#endif
