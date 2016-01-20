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


CQuestMissionLogPacket::CQuestMissionLogPacket(CCharEntity * PChar, uint8 logID, uint8 status)
{
	this->type = 0x56;
	this->size = 0x14;

	// настоятельно советую в switch(logID) ничего не менять,
	// если вы НЕ УВЕРЕНЫ в том, что делаете
	// даже простая перестановка case местами может привести к логическим ошибкам

	uint16 logType = 0x0000;
	switch(logID) {
		case QUESTS_SANDORIA:
			generateQuestPacket(PChar, QUESTS_SANDORIA, status);
			if(status == 0x01)
				logType = SAN_CURRENT;
			if(status == 0x02)
				logType = SAN_COMPLETE;
			break;
		case QUESTS_BASTOK:
			generateQuestPacket(PChar, QUESTS_BASTOK, status);
			if(status == 0x01)
				logType = BAS_CURRENT;
			if(status == 0x02)
				logType = BAS_COMPLETE;
			break;
		case QUESTS_WINDURST:
			generateQuestPacket(PChar, QUESTS_WINDURST, status);
			if(status == 0x01)
				logType = WIN_CURRENT;
			if(status == 0x02)
				logType = WIN_COMPLETE;
			break;
		case QUESTS_JEUNO:
			generateQuestPacket(PChar, QUESTS_JEUNO, status);
			if(status == 0x01)
				logType = JEU_CURRENT;
			if(status == 0x02)
				logType = JEU_COMPLETE;
			break;
		case QUESTS_OTHER:
			generateQuestPacket(PChar, QUESTS_OTHER, status);
			if(status == 0x01)
				logType = OTH_CURRENT;
			if(status == 0x02)
				logType = OTH_COMPLETE;
			break;
		case QUESTS_OUTLANDS:
			generateQuestPacket(PChar, QUESTS_OUTLANDS, status);
			if(status == 0x01)
				logType = OUT_CURRENT;
			if(status == 0x02)
				logType = OUT_COMPLETE;
			break;
		case QUESTS_CRYSTALWAR:
			generateQuestPacket(PChar, QUESTS_CRYSTALWAR, status);
			if(status == 0x01)
				logType = WAR_CURRENT;
			if(status == 0x02)
				logType = WAR_COMPLETE;
			break;
		case QUESTS_ABYSSEA:
			generateQuestPacket(PChar, QUESTS_ABYSSEA, status);
			if(status == 0x01)
				logType = ABY_CURRENT;
			if(status == 0x02)
				logType = ABY_COMPLETE;
			break;
		case QUESTS_ADOULIN:
			generateQuestPacket(PChar, QUESTS_ADOULIN, status);
			if(status == 0x01)
				logType = ADO_CURRENT;
			if(status == 0x02)
				logType = ADO_COMPLETE;
			break;
		case QUESTS_COALITION:
			generateQuestPacket(PChar, QUESTS_COALITION, status);
			if(status == 0x01)
				logType = COA_CURRENT;
			if(status == 0x02)
				logType = COA_COMPLETE;
			break;
		case QUESTS_AHTURHGAN:
		case MISSION_ASSAULT:
			if(status == 0x02) {
				generateQuestPacket(PChar, QUESTS_AHTURHGAN, status);
				generateAssaultMissionPacket(PChar);
				logType = EXP_COMPLETE;
				break;
			}
		case MISSION_TOAU:
		case MISSION_WOTG:
			if(status == 0x02) {
				generateCompleteExpMissionPacket(PChar);
				logType = EXP_MISS_COMPLETE;
				break;
			}
		case MISSION_CAMPAIGN:
			if(status == 0x02) {
				generateFirstCampaignMissionPacket(PChar);
				logType = CAMPAIGN_MISSION_UN;
				break;
			}
		case MISSION_CAMPAIGN2:
			if(status == 0x01) {
				generateQuestPacket(PChar, QUESTS_AHTURHGAN, status);
				generateCurrentExpMissionPacket(PChar);
				logType = EXP_CURRENT;
				break;
			}
			if(status == 0x02) {
				generateSecondCampaignMissionPacket(PChar);
				logType = CAMPAIGN_MISSION_DEUX;
				break;
			}
		case MISSION_SANDORIA:
			if(status == 0x01) {
				generateCurrentMissionPacket(PChar);
				logType = MISS_CURRENT;
				break;
			}
			if(status == 0x02) {
				generateCompleteMissionPacket(PChar);
				logType = MISS_COMPLETE;
				break;
			}
		case MISSION_BASTOK:
			if(status == 0x01) {
				generateCurrentMissionPacket(PChar);
				logType = MISS_CURRENT;
				break;
			}
			if(status == 0x02) {
				generateCompleteMissionPacket(PChar);
				logType = MISS_COMPLETE;
				break;
			}
		case MISSION_WINDURST:
			if(status == 0x01) {
				generateCurrentMissionPacket(PChar);
				logType = MISS_CURRENT;
				break;
			}
			if(status == 0x02) {
				generateCompleteMissionPacket(PChar);
				logType = MISS_COMPLETE;
				break;
			}

		case MISSION_ZILART:
			if(status == 0x01) {
				generateCurrentMissionPacket(PChar);
				logType = MISS_CURRENT;
				break;
			}
			if(status == 0x02) {
				generateCompleteMissionPacket(PChar);
				logType = MISS_COMPLETE;
				break;
			}
		case MISSION_COP:
		case MISSION_CRISTALLINE_PROPHECY:
		case MISSION_MOOGLE_KUPO_DETAT:
		case MISSION_SHANTOTTO_ASCENSION:
		case MISSION_ADOULIN:
        case MISSION_RHAPSODIES:
			if(status == 0x01)
			{
				generateCurrentMissionPacket(PChar);
				logType = MISS_CURRENT;
				break;
			}
	}

	WBUFW(data,(0x24)) = logType;
}

void CQuestMissionLogPacket::generateQuestPacket(CCharEntity * PChar, uint8 logID, uint8 status)
{
	if(status == 0x01)
		memcpy(data + 4, PChar->m_questLog[logID].current, 32);
	else if(status == 0x02)
		memcpy(data + 4, PChar->m_questLog[logID].complete, 32);
}

void CQuestMissionLogPacket::generateCurrentMissionPacket(CCharEntity * PChar)
{
	uint16 add_on_scenarios = 0;

	add_on_scenarios +=	PChar->m_missionLog[9].current;
	add_on_scenarios +=	PChar->m_missionLog[10].current << 0x04;
	add_on_scenarios +=	PChar->m_missionLog[11].current << 0x08;
	// Not perfect, but they display and missions DO progress. Can fix properly later. There is a delay before when the menu updates. Zoning will force it.

	uint32 chains = 0;
	chains = PChar->m_missionLog[MISSION_COP-11].current+1;
	chains = ((chains * 0x08) + 0x60);

	WBUFB(data,(0x04)) = PChar->profile.nation;								// Nation
	WBUFW(data,(0x08)) = PChar->m_missionLog[PChar->profile.nation].current;	// National Missions
	WBUFW(data,(0x0C)) = PChar->m_missionLog[MISSION_ZILART-11].current;		// Rise of the Zilart

	WBUFL(data,(0x10)) = chains;												// Chains of Promathia Missions
  //WBUFB(data,(0x16)) = 0x30;                                                // назначение неизвестно
	WBUFW(data,(0x18)) = add_on_scenarios;                                    // A Crystalline Prophecy, A Moogle Kupo d'Etat, A Shantotto Ascension
	WBUFW(data,(0x1C)) = PChar->m_missionLog[MISSION_ADOULIN-11].current;
    WBUFW(data,(0x20)) = PChar->m_missionLog[MISSION_RHAPSODIES-11].current;
}

void CQuestMissionLogPacket::generateCompleteMissionPacket(CCharEntity * PChar)
{
	for(uint8 logID = 0x00; logID <= 0x03; logID++)
		for(uint8 questMissionID = 0; questMissionID < 64; questMissionID++)
			data[(questMissionID/8) + (logID*0x08) + 4] ^= ((PChar->m_missionLog[logID].complete[questMissionID]) << (questMissionID % 8));
}

void CQuestMissionLogPacket::generateCurrentExpMissionPacket(CCharEntity * PChar)
{
	WBUFW(data,(0x14)) = PChar->m_assaultLog.current;							// Assault Missions
	WBUFW(data,(0x18)) = PChar->m_missionLog[MISSION_TOAU-11].current;		// Treasures of Aht Urhgan
	WBUFW(data,(0x1C)) = PChar->m_missionLog[MISSION_WOTG-11].current;		// Wings of the Goddess
	WBUFW(data,(0x20)) = PChar->m_campaignLog.current;						// Campaign Operations
}

void CQuestMissionLogPacket::generateCompleteExpMissionPacket(CCharEntity * PChar)
{
	for(uint8 logID = 0x04; logID <= 0x05; logID++)
		for(uint8 questMissionID = 0; questMissionID < 64; questMissionID++)
			data[(questMissionID/8) + ((logID-0x04)*0x08) + 4] ^= ((PChar->m_missionLog[logID].complete[questMissionID]) << (questMissionID % 8));
}

void CQuestMissionLogPacket::generateFirstCampaignMissionPacket(CCharEntity * PChar)
{
	for(uint16 questMissionID = 0; questMissionID < 256; questMissionID++)
		data[(questMissionID/8) + 4] ^= ((PChar->m_campaignLog.complete[questMissionID]) << (questMissionID % 8));
}

void CQuestMissionLogPacket::generateSecondCampaignMissionPacket(CCharEntity * PChar)
{
	for(uint16 questMissionID = 256; questMissionID < 512; questMissionID++)
		data[(questMissionID/8) + 4] ^= ((PChar->m_campaignLog.complete[questMissionID]) << (questMissionID % 8));
}

void CQuestMissionLogPacket::generateAssaultMissionPacket(CCharEntity * PChar)
{
	for(uint16 questMissionID = 0; questMissionID < 128; questMissionID++)
		data[(questMissionID/8) + 0x10 + 4] ^= ((PChar->m_assaultLog.complete[questMissionID]) << (questMissionID % 8));
}
