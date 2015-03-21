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

#include <string.h> 
#include <vector>

#include "../lua/luautils.h"
#include "../lua/lua_baseentity.h"
#include "../entities/mobentity.h"
#include "../../common/timer.h"

#include "../packets/char_skills.h"
#include "../packets/char_update.h"
#include "../packets/char_sync.h"
#include "../packets/chocobo_digging.h"
#include "../packets/inventory_finish.h"
#include "../packets/message_text.h"
#include "../packets/message_special.h"
#include "../packets/message_standard.h"
#include "../packets/release.h"
#include "../packets/message_system.h"

#include "charutils.h"
#include "diggingutils.h"
#include "itemutils.h"
#include "../map.h"
#include "../time_server.h"
#include "../vana_time.h"
#include "zoneutils.h"

/************************************************************************
*																		*
*	Chocobo Digging Utilities											*
*																		*
************************************************************************/

namespace diggingutils
{

	// Get message offset for  current zone
	uint16 m_MessageOffset[3][MAX_ZONEID];

/************************************************************************
*																		*
*	Load the Chocobo Digging messages									*
*																		*
************************************************************************/

	void LoadDiggingMessages()
	{
		for (uint16 zone = 0; zone < MAX_ZONEID; ++zone)
		{
			m_MessageOffset[0][zone] = luautils::GetTextIDVariable(zone, "DIG_THROW_AWAY");
			m_MessageOffset[1][zone] = luautils::GetTextIDVariable(zone, "FIND_NOTHING");
			m_MessageOffset[2][zone] = luautils::GetTextIDVariable(zone, "ITEM_OBTAINED");
		}
	}

/************************************************************************
*																		*
*	Chocobo Digging Action												*
*																		*
************************************************************************/

	void Dig(CCharEntity* PChar)
	{
		int8 PlayerCount = GetPlayerDigCount(PChar);
		uint16 MessageOffset = m_MessageOffset[0][PChar->getZone()];
		uint16 MessageOffset2 = m_MessageOffset[1][PChar->getZone()];
		uint16 MessageOffset3 = m_MessageOffset[2][PChar->getZone()];

		int8 Chance = WELL512::irand() % 100;

		if (Chance <= 15)	// Check if we lose chance
		{
			PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset2));
			CalculateSkillUp(PChar);
		}
		else				// Calculate item received and display message
		{
			int32 ItemID = 0;
			DigList_t* DigList = itemutils::GetDigList(PChar->getZone());
			if (DigList != NULL && DigList->size())
			{
				uint16 random = WELL512::irand()%1000;
				uint8 randItem = WELL512::irand()%DigList->size();
				if(random < (DigList->at(randItem).DigRate + map_config.dig_rate_bonus))
				{
					// Grab a randomly item from the list for the zone
					// Check the requirements and then give the item if they are met
					if(DigList->at(randItem).DigRequirements == 0)
					{
						ItemID = DigList->at(randItem).ItemID;
					}
					if(DigList->at(randItem).DigRequirements == 1 && CanPlayerBurrow(PChar) == true) // Burrow
					{
						ItemID = DigList->at(randItem).ItemID;
					}
					if(DigList->at(randItem).DigRequirements == 2 && CanPlayerBore(PChar) == true) // Bore
					{
						ItemID = DigList->at(randItem).ItemID;
					}
					if(DigList->at(randItem).DigRequirements == 3 && EggHelm(PChar) == true) // Egg Helm
					{
						ItemID = DigList->at(randItem).ItemID;
					}
					if(DigList->at(randItem).DigRequirements == 4 && NightDigging() == true) // Nighttime
					{
						ItemID = DigList->at(randItem).ItemID;
					}
					ShowDebug(CL_CYAN"Item ID Dug up %d \n", ItemID);
				}
				if (ItemID != 0)
				{
					if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0)
					{
						// Give the item to the player
						charutils::AddItem(PChar, LOC_INVENTORY, ItemID);
						PChar->pushPacket(new CMessageSpecialPacket(PChar, MessageOffset3, ItemID, 0, 0));
						UpdateZoneItemsDug(PChar);
					}
					else
					{
						// Inventory is full, throw item away
						PChar->pushPacket(new CMessageSpecialPacket(PChar, MessageOffset, ItemID, ItemID, 0));
					}
				}
				else
				{
					// Beat the Dig chance but not the Item chance
					PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset2));
				}
			}
			CalculateSkillUp(PChar);
		}
		UpdatePlayerDigCount(PChar);
		SetLastDig(PChar);
	}

/************************************************************************
*																		*
*	Return the Chocobo Dig count for the character						*
*																		*
************************************************************************/

	int8 GetPlayerDigCount(CCharEntity* PChar)
	{
		const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = 'dig_count' LIMIT 1;";

		int32 ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);
		int32 value = 0;

		if (ret != SQL_ERROR &&
			Sql_NumRows(SqlHandle) != 0 &&
			Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			value = (int32)Sql_GetIntData(SqlHandle,0);
		}
		return value;
	}

/************************************************************************
*																		*
*	Return the character Zone In time									*
*																		*
************************************************************************/

	int32 GetZoneInTime(CCharEntity* PChar)
	{
		int32 value = 0;

		const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = 'zoneintime' LIMIT 1;";
		int32 ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);

		if (ret != SQL_ERROR &&
			Sql_NumRows(SqlHandle) != 0 &&
			Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			value = (int32)Sql_GetIntData(SqlHandle,0);
		}
		return value;
	}

/************************************************************************
*																		*
*	Return the Chocobo Dig Items dug up in the Zone						*
*																		*
************************************************************************/

	int8 GetZoneItemsDug(CCharEntity* PChar)
	{
		int16 zone = PChar->getZone();

		const int8* CharVarQuery =
			"SELECT value \
			FROM server_variables \
			WHERE 'varname'='Zone%uDugItems';";

		uint16 ret = Sql_Query(SqlHandle, CharVarQuery, zone);

		uint8 itemsDug = 0;

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				itemsDug = (uint8)Sql_GetUIntData(SqlHandle, 0);
			}
		}
		else
		{
			itemsDug = 0;
		}
		return itemsDug;
	}

/************************************************************************
*																		*
*	Add to the character's Chocobo Dig count							*
*																		*
************************************************************************/

	void UpdatePlayerDigCount(CCharEntity* PChar)
	{
		int8 PlayerCount;

		PlayerCount = GetPlayerDigCount(PChar);

		PlayerCount++;
		const int8* fmtQuery = "REPLACE INTO `char_vars` (charid, varname, value) VALUES ('%u', 'dig_count', '%u');";
		Sql_Query(SqlHandle, fmtQuery, PChar->id, PlayerCount);
	}

/************************************************************************
*																		*
*	Add to the character's Chocobo Dig count							*
*																		*
************************************************************************/

	void UpdateZoneItemsDug(CCharEntity* PChar)
	{
		int8 value = 1;
		int8 ZoneDigCount;
		ZoneDigCount = GetZoneItemsDug(PChar);
		int16 zone = PChar->getZone();

		const int8* Query = "INSERT INTO server_variables SET name = 'Zone%uDugItems', value = %i ON DUPLICATE KEY UPDATE value = value + %i;";
		Sql_Query(SqlHandle, Query, zone, value);
	}

/************************************************************************
*																		*
*	Delete the character's Chocobo Dig count							*
*																		*
************************************************************************/

	void DeletePlayersDigCounts()
	{
		const int8* fmtQuery = "DELETE FROM `char_vars` WHERE 'varname'='dig_count';";
		Sql_Query(SqlHandle, fmtQuery);
	}

/************************************************************************
*																		*
*	Check if the character is able to Dig								*
*																		*
************************************************************************/

	bool CanPlayerDig(CCharEntity* PChar)
	{
		uint32 CurrentTime = CVanaTime::getInstance()->getVanaTime();
		if (GetPlayerDigCount(PChar) < 100)		// Check Player Counter
		{
			if (GetZoneItemsDug(PChar) < 20)	// Check Zone Counter
			{
				if (GetZoneInTime(PChar) <= (ReturnAreaDigDelay(PChar) + CurrentTime))	// Check Area Dig Delay
				{
					if (GetLastDig(PChar) + ReturnDigDelay(PChar) <= CurrentTime)		// Check Character Dig Delay
					{
						return true;
					}
				}
			}
		}
		return false;
	}

/************************************************************************
*																		*
*	Check if the character's Chocobo is able to Burrow					*
*																		*
************************************************************************/

	bool CanPlayerBurrow(CCharEntity* PChar)
	{
		// Check for Chocobo Burrow ability here
		return false;
	}

/************************************************************************
*																		*
*	Check if the character's Chocobo is able to Bore					*
*																		*
************************************************************************/

	bool CanPlayerBore(CCharEntity* PChar)
	{
		// Check for Chocobo Bore ability here
		return false;
	}

/************************************************************************
*																		*
*	Check if the character has the Egg Helm equipped					*
*																		*
************************************************************************/

	bool EggHelm(CCharEntity* PChar)
	{
		if (PChar->getMod(MOD_EGGHELM) > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

/************************************************************************
*																		*
*	Check if the character is digging at Night Time						*
*																		*
************************************************************************/

	bool NightDigging()
	{
		TIMETYPE VanadielTOTD = CVanaTime::getInstance()->SyncTime();
		if (VanadielTOTD == TIME_NIGHT)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

/************************************************************************
*																		*
*	Get / Set the time of the last Chocobo Digging attempt				*
*																		*
************************************************************************/

	int32 SetLastDig(CCharEntity* PChar)
	{
		uint32 CurrentTime = CVanaTime::getInstance()->getVanaTime();
		Sql_Query(SqlHandle, "REPLACE INTO char_vars (charid, varname, value) VALUES ('%u', 'Last_Dig_Time', '%u');", PChar->id, CurrentTime); 
		return 1;
	}

	int32 GetLastDig(CCharEntity* PChar)
	{
		const int8* fmtQuery = "SELECT value FROM char_vars WHERE charid = %u AND varname = 'Last_Dig_Time' LIMIT 1;";
		int32 ret = Sql_Query(SqlHandle,fmtQuery,PChar->id);
		int32 value = 0;

		if (ret != SQL_ERROR &&
			Sql_NumRows(SqlHandle) != 0 &&
			Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			value = (int32)Sql_GetIntData(SqlHandle,0);
		}
		return value;
	}

/************************************************************************
*																		*
*	Update the Chocobo Digging delay									*
*																		*
************************************************************************/

	void UpdateDigDelay(CCharEntity* PChar)
	{
	}

/************************************************************************
*																		*
*	Return the Chocobo Digging delay									*
*																		*
************************************************************************/

	int8 ReturnDigDelay(CCharEntity* PChar)
	{
		uint8 delay		= 16;								// Base Delay of 16
		uint8 skillRank = PChar->RealSkills.rank[SKILL_DIG];		// Grab Digging Rank
		delay = dsp_cap(delay - (skillRank * 5), 0, 16);

		return delay;
	}

/************************************************************************
*																		*
*	Return the Area Chocobo Digging delay								*
*																		*
************************************************************************/

	int8 ReturnAreaDigDelay(CCharEntity* PChar)
	{
		uint8 delay		= 60;								// Base Delay of 60
		uint8 skillRank = PChar->RealSkills.rank[SKILL_DIG];		// Grab Digging Rank
		delay = 60 - (skillRank * 5);
		
		return delay;
	}

/************************************************************************
*																		*
*	Calculate the Chocobo Digging skill									*
*																		*
************************************************************************/

	int32 CalculateSkillUp(CCharEntity* PChar)
	{
		uint8  skillRank = PChar->RealSkills.rank[SKILL_DIG];
		uint16 maxSkill  = (skillRank + 1) * 100;
		int32  charSkill = PChar->RealSkills.skill[SKILL_DIG];
		int8 success = WELL512::irand() % 100 + 1;
		int32  skillAmount  = 1;

		if (charSkill < maxSkill)
		{
			if (success <= 15)
			{
				// ShowDebug(CL_CYAN"Digging Skill Increase \n");
				if((skillAmount + charSkill) > maxSkill)
				{
					skillAmount = maxSkill - charSkill;
				}
				// Success, give a skill up
				PChar->RealSkills.skill[SKILL_DIG] += skillAmount;
				if ((skillRank == 0 && charSkill >= 100) ||
				(skillRank == 1 && charSkill >= 200) ||
				(skillRank == 2 && charSkill >= 300) ||
				(skillRank == 3 && charSkill >= 400) ||
				(skillRank == 4 && charSkill >= 500) ||
				(skillRank == 5 && charSkill >= 600) ||
				(skillRank == 6 && charSkill >= 700) ||
				(skillRank == 7 && charSkill >= 800) ||
				(skillRank == 8 && charSkill >= 900) ||
				(skillRank == 9 && charSkill >= 1000) ||
				(skillRank == 10 && charSkill >= 1100))
				{
					PChar->RealSkills.rank[SKILL_DIG] += 1;
				}
				if((charSkill / 10) < (charSkill + skillAmount) / 10)
				{
					PChar->WorkingSkills.skill[SKILL_DIG] += 0x20;

					PChar->pushPacket(new CCharSkillsPacket(PChar));
				}
				charutils::SaveCharSkills(PChar, SKILL_DIG);
			} 
		}
		return 0;
	}
} // Namespace diggingutils