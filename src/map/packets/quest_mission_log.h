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

// Quest Log Packet Values
#define SAN_CURRENT			0x50
#define BAS_CURRENT			0x58
#define WIN_CURRENT			0x60
#define JEU_CURRENT			0x68
#define OTH_CURRENT			0x70
#define OUT_CURRENT			0x78
#define EXP_CURRENT			0x80
#define WAR_CURRENT			0x88
#define ABY_CURRENT			0xE0
#define ADO_CURRENT			0xF0
#define COA_CURRENT			0x0100

#define SAN_COMPLETE		0x90
#define BAS_COMPLETE		0x98
#define WIN_COMPLETE		0xA0
#define JEU_COMPLETE		0xA8
#define OTH_COMPLETE		0xB0
#define OUT_COMPLETE		0xB8
#define EXP_COMPLETE		0xC0
#define WAR_COMPLETE		0xC8
#define ABY_COMPLETE		0xE8
#define ADO_COMPLETE		0xF8
#define COA_COMPLETE		0x0108

const int QUEST_PACKET_BYTES[11][2] =
{
    // Quest Cur. | Quest Comp.
    { SAN_CURRENT, SAN_COMPLETE }, // SANDORIA
    { BAS_CURRENT, BAS_COMPLETE }, // BASTOK
    { WIN_CURRENT, WIN_COMPLETE }, // WINDURST
    { JEU_CURRENT, JEU_COMPLETE }, // JEUNO
    { OTH_CURRENT, OTH_COMPLETE }, // OTHER_AREAS
    { OUT_CURRENT, OUT_COMPLETE }, // OUTLANDS
    { EXP_CURRENT, EXP_COMPLETE }, // TOAU
    { WAR_CURRENT, WAR_COMPLETE }, // WOTG
    { ABY_CURRENT, ABY_COMPLETE }, // ABYSSEA
    { ADO_CURRENT, ADO_COMPLETE }, // ADOULIN
    { COA_CURRENT, COA_COMPLETE }  // COALITION
};

// Mission Log Packet Bytes
#define MISS_COMPLETE		0xD0
#define MISS_CURRENT		0xFFFF
#define EXP_MISS_COMPLETE   0xD8
#define EXP_MISS_CURRENT    0x80
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
