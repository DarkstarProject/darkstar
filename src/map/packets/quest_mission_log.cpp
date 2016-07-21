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

#include "../../common/socket.h"

#include <string.h>

#include "quest_mission_log.h"
#include "../entities/charentity.h"

CQuestMissionLogPacket::CQuestMissionLogPacket(CCharEntity * PChar, uint8 contentID, uint8 status)
{
    this->type = 0x56;
    this->size = 0x14;

    int16 logType = LOG_TYPES[contentID][status + (status > STATUS_QUEST_COMP ? 1 : 0)];
    int16 questLogID = LOG_TYPES[contentID][QUEST_LOG];
    int16 missionLogID = LOG_TYPES[contentID][MISSION_LOG];

    // FFXI packs different TOAU information in the same packet as certain other content
    if ((contentID >= LOG_TOAU) && (contentID <= LOG_CAMPAIGN2))
    {
        if ((contentID == LOG_WOTG) && (status <= STATUS_QUEST_COMP))
        {
            // We're updating Crystal War quests
            generateQuestPacket(PChar, questLogID, status);
        }
        else
        {
            switch (status) {
                case STATUS_QUEST_CURR:
                case STATUS_MISS_CURR:
                    // Current TOAU Quests, TOAU, WOTG, Assault, and Campaign Mission all share a packet
                    generateQuestPacket(PChar, LOG_TYPES[LOG_TOAU][QUEST_LOG], STATUS_QUEST_CURR); // "Base" of the packet
                    generateCurrentExpMissionPacket(PChar); // Writes 12 bytes in same packet
                    break;
                case STATUS_QUEST_COMP:
                    // Completed TOAU Quests share a packet with completed Assault Missions
                    generateQuestPacket(PChar, questLogID, status); // "Base" of the packet
                    generateAssaultMissionPacket(PChar);            // Writes more to it
                    break;
                case STATUS_MISS_COMP:
                    switch (contentID) {
                    case LOG_TOAU:
                    case LOG_WOTG:
                        // Completed TOAU and WOTG missions share a packet
                        generateCompleteExpMissionPacket(PChar);
                        break;
                    case LOG_ASSAULT:
                        // As before, completed TOAU Quests and Assaults share
                        generateQuestPacket(PChar, LOG_TOAU, STATUS_QUEST_COMP);
                        generateAssaultMissionPacket(PChar);
                        break;
                    // Completed Campaign missions take up two packets
                    case LOG_CAMPAIGN:
                        generateCampaignMissionPacket(PChar, 0);
                        break;
                    case LOG_CAMPAIGN2:
                        generateCampaignMissionPacket(PChar, 256);
                        break;
                    }
                    break;
            }
        }
    }
    else if ((status <= STATUS_QUEST_COMP) && (questLogID >= 0))
    {
        // We're updating any other quest log
        generateQuestPacket(PChar, questLogID, status);
    }
    else if ((status <= STATUS_MISS_COMP) && (missionLogID >= 0)) 
    {   // We're updating any other mission log
        if ((contentID <= LOG_ZILART) && (status == STATUS_MISS_COMP))
        {
            // Completed Nation and Zilart missions are updated in the same packet
            generateCompleteMissionPacket(PChar);
        } 
        else 
        {
            // All others update the mission log with a standard "current mission" update
            generateCurrentMissionPacket(PChar);
        }
    }

    WBUFW(data, (0x24)) = logType;
}

void CQuestMissionLogPacket::generateQuestPacket(CCharEntity * PChar, uint8 logID, uint8 status)
{
    if (status == STATUS_QUEST_CURR)
        memcpy(data + 4, PChar->m_questLog[logID].current, 32);
    else if (status == STATUS_QUEST_COMP)
        memcpy(data + 4, PChar->m_questLog[logID].complete, 32);
}

void CQuestMissionLogPacket::generateCurrentMissionPacket(CCharEntity * PChar)
{
    uint16 add_on_scenarios = 0;
    
    add_on_scenarios += PChar->m_missionLog[LOG_TYPES[LOG_ACP][MISSION_LOG]].current;
    add_on_scenarios += PChar->m_missionLog[LOG_TYPES[LOG_AMK][MISSION_LOG]].current << 0x04;
    add_on_scenarios += PChar->m_missionLog[LOG_TYPES[LOG_ASA][MISSION_LOG]].current << 0x08;
    // Not perfect, but they display and missions DO progress. Can fix properly later. There is a delay before when the menu updates. Zoning will force it.

    uint32 chains = 0;
    chains = PChar->m_missionLog[LOG_TYPES[LOG_COP][MISSION_LOG]].current + 1;
    chains = ((chains * 0x08) + 0x60);

    uint32 soa = (PChar->m_missionLog[LOG_TYPES[LOG_SOA][MISSION_LOG]].current * 2) + 0x6E;
    uint32 rov = PChar->m_missionLog[LOG_TYPES[LOG_ROV][MISSION_LOG]].current + 0x6C;

    WBUFB(data, (0x04)) = PChar->profile.nation;								            // Nation
    WBUFW(data, (0x08)) = PChar->m_missionLog[PChar->profile.nation].current;	            // National Missions
    WBUFW(data, (0x0C)) = PChar->m_missionLog[LOG_TYPES[LOG_ZILART][MISSION_LOG]].current;  // Rise of the Zilart

    WBUFL(data, (0x10)) = chains;												// Chains of Promathia Missions
    //WBUFB(data,(0x16)) = 0x30;                                                // назначение неизвестно
    WBUFW(data, (0x18)) = add_on_scenarios;                                     // A Crystalline Prophecy, A Moogle Kupo d'Etat, A Shantotto Ascension
    WBUFW(data, (0x1C)) = soa;                                                  // Seekers of Adoulin
    WBUFW(data, (0x20)) = rov;                                                  // Rhapsodies of Vana'diel
}

void CQuestMissionLogPacket::generateCompleteMissionPacket(CCharEntity * PChar)
{
    // This packet simultaneously updates completed mission logs for Nation and Zilart missions.
    uint8 logID = 0x00;
    uint8 missionAreas[4] = { LOG_SANDORIA, LOG_BASTOK, LOG_WINDURST, LOG_ZILART };
    for (uint8 i = 0; i <= 3; i++) {
        logID = LOG_TYPES[missionAreas[i]][MISSION_LOG];
        for (uint8 questMissionID = 0; questMissionID < 64; questMissionID++)
            data[(questMissionID / 8) + (i * 0x08) + 4] ^= ((PChar->m_missionLog[logID].complete[questMissionID]) << (questMissionID % 8));
    }
}

void CQuestMissionLogPacket::generateCurrentExpMissionPacket(CCharEntity * PChar)
{
    WBUFW(data, (0x14)) = PChar->m_assaultLog.current;						                // Assault Missions
    WBUFW(data, (0x18)) = PChar->m_missionLog[LOG_TYPES[LOG_TOAU][MISSION_LOG]].current;	// Treasures of Aht Urhgan
    WBUFW(data, (0x1C)) = PChar->m_missionLog[LOG_TYPES[LOG_WOTG][MISSION_LOG]].current;	// Wings of the Goddess
    WBUFW(data, (0x20)) = PChar->m_campaignLog.current;						                // Campaign Operations
}

void CQuestMissionLogPacket::generateCompleteExpMissionPacket(CCharEntity * PChar)
{
    // This packet simultaenously updates completed mission logs for TOAU and WOTG missions.
    uint8 logID = LOG_TYPES[LOG_TOAU][MISSION_LOG];
    for (uint8 questMissionID = 0; questMissionID < 64; questMissionID++)
        data[(questMissionID / 8) + 4] ^= ((PChar->m_missionLog[logID].complete[questMissionID]) << (questMissionID % 8));

    logID = LOG_TYPES[LOG_WOTG][MISSION_LOG];
    for (uint8 questMissionID = 0; questMissionID < 64; questMissionID++)
        data[(questMissionID / 8) + 0x08 + 4] ^= ((PChar->m_missionLog[logID].complete[questMissionID]) << (questMissionID % 8));
}

void CQuestMissionLogPacket::generateCampaignMissionPacket(CCharEntity * PChar, uint8 startQMID)
{
    for (uint16 questMissionID = startQMID; questMissionID < (startQMID + 256); questMissionID++)
        data[(questMissionID / 8) + 4] ^= ((PChar->m_campaignLog.complete[questMissionID]) << (questMissionID % 8));
}

void CQuestMissionLogPacket::generateAssaultMissionPacket(CCharEntity * PChar)
{
    for (uint16 questMissionID = 0; questMissionID < 128; questMissionID++)
        data[(questMissionID / 8) + 0x10 + 4] ^= ((PChar->m_assaultLog.complete[questMissionID]) << (questMissionID % 8));
}
