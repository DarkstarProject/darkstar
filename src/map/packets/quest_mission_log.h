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

//Quest Log Types
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

//Mission Log Types
#define MISS_COMPLETE		0xD0
#define MISS_CURRENT		0xFFFF

// MISS_CURRENT	0xFF исключая Add-on Scenarios

#define EXP_MISS_COMPLETE				0xD8
#define EXP_MISS_CURRENT				0x80

#define CAMPAIGN_MISSION_UN				0x30
#define CAMPAIGN_MISSION_DEUX			0x38

// Mission Logs
#define MISSION_SANDORIA				0x0B
#define MISSION_BASTOK					0x0C
#define MISSION_WINDURST				0x0D
#define MISSION_ZILART					0x0E
#define MISSION_TOAU					0x0F
#define MISSION_WOTG					0x10
#define MISSION_COP						0x11

#define MISSION_ASSAULT					0x12

#define MISSION_CAMPAIGN				0x13
#define MISSION_CAMPAIGN2				0x14

#define MISSION_CRISTALLINE_PROPHECY	0x15
#define MISSION_MOOGLE_KUPO_DETAT		0x16
#define MISSION_SHANTOTTO_ASCENSION		0x17

#define MISSION_ADOULIN					0x18
#define MISSION_RHAPSODIES              0x19

/************************************************************************
*																		*
*  																		*
*																		*
************************************************************************/

class CCharEntity;

class CQuestMissionLogPacket : public CBasicPacket
{
public:

	CQuestMissionLogPacket(CCharEntity* PChar, uint8 logID, uint8 status);
private:

	// формирование пакетов вынес в отдельные функции, специально для тех,
	// кто захочет понять, что же на самом деле происходит в switch(logID)

	void generateQuestPacket(CCharEntity* PChar, uint8 logID, uint8 status);
	void generateCurrentMissionPacket(CCharEntity* PChar); 
	void generateCompleteMissionPacket(CCharEntity* PChar);
	void generateCurrentExpMissionPacket(CCharEntity* PChar); 
	void generateCompleteExpMissionPacket(CCharEntity* PChar);
	void generateFirstCampaignMissionPacket(CCharEntity* PChar);
	void generateSecondCampaignMissionPacket(CCharEntity* PChar);
	void generateAssaultMissionPacket(CCharEntity* PChar);
};

#endif