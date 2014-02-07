/*
===========================================================================

Copyright (c) 2010-2012 Darkstar Dev Teams

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

#include "../lua/luautils.h"
#include "../entities/mobentity.h"
#include "../../common/timer.h"


#include "../packets/char_skills.h"
#include "../packets/char_update.h"
#include "../packets/caught_fish.h"
#include "../packets/char_update.h"
#include "../packets/char_sync.h"
#include "../packets/fishing.h"
#include "../packets/inventory_finish.h"
#include "../packets/message_text.h"
#include "../packets/message_special.h"
#include "../packets/message_standard.h"
#include "../packets/release.h"
#include "../packets/message_system.h"

#include "charutils.h"
#include "fishingutils.h"
#include "itemutils.h"
#include "../map.h"
#include "../vana_time.h"
#include "zoneutils.h"


namespace fishingutils
{
	uint32 mobid[]  = { 0 };
	int catchtype[] = { 0 };
	int catchsize[] = { 0 };
	int catchlevel[] = { 0 };

	/************************************************************************
	*																		*
	*  ?????? ???????? ??? ????????? ???????								*
	*																		*
	************************************************************************/

	uint16 MessageOffset[MAX_ZONEID];

	void LoadFishingMessages()
	{
		for (uint16 ZoneID = 0; ZoneID < ARRAYLENGTH(MessageOffset); ZoneID++)
		{
			MessageOffset[ZoneID] = luautils::GetTextIDVariable(ZoneID, "FISHING_MESSAGE_OFFSET");
		}
	}

	/************************************************************************
	*																		*
	*  ????????? ???????? ??? ????????? ???????								*
	*																		*
	************************************************************************/

	uint16 GetMessageOffset(uint8 ZoneID)
	{
		return MessageOffset[ZoneID];
	}

	/************************************************************************
	*																		*
	*  ????????? ??????? ??????, ??????? ? ??????????? ?????				*
	*																		*
	************************************************************************/

	void StartFishing(CCharEntity* PChar)
	{
		if (PChar->animation != ANIMATION_NONE)
		{
			PChar->pushPacket(new CMessageSystemPacket(0, 0, 142));
			PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
			return;
		}

		uint16 MessageOffset = GetMessageOffset(PChar->getZone());

		if (MessageOffset == 0)
		{
			ShowWarning(CL_YELLOW"Player wants to fish in %s\n" CL_RESET, PChar->loc.zone->GetName());
			PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
			return;
		}

		CItemWeapon* WeaponItem = NULL;

		WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);

		if ((WeaponItem == NULL) ||
			!(WeaponItem->isType(ITEM_WEAPON)) ||
			(WeaponItem->getSkillType() != SKILL_FSH))
		{
			// Message: "You can't fish without a rod in your hands"

			PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x01));
			PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
			return;
		}

		WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

		if ((WeaponItem == NULL) ||
			!(WeaponItem->isType(ITEM_WEAPON)) ||
			(WeaponItem->getSkillType() != SKILL_FSH))
		{
			// Message: "You can't fish without bait on the hook"	

			PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x02));
			PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
			return;
		}

		PChar->status = STATUS_UPDATE;
		PChar->animation = ANIMATION_FISHING_START;

		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CCharSyncPacket(PChar));
	}


	// check to see if the mob is spawmned
	bool IsSpawned(uint32 mobid)
	{
		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		
		if (PMob == NULL)
		{
			// return true so the server will not crach on an invalid mobid
			ShowDebug(CL_CYAN"MobID: <%u> not found \n" CL_RESET, mobid);
			//DSP_DEBUG_BREAK_IF(PMob <= NULL);
			return true;
		}

		if (PMob->PBattleAI->GetCurrentAction() == ACTION_SPAWN)
		{
			return true;
		}

		if (PMob->PBattleAI->GetCurrentAction() == ACTION_ATTACK)
		{
			return true;
		}
		return false;
	}


	// Check to see if there is a list for the zone if one exists return the ListID 
	int GridList(CCharEntity* PChar)
	{

		float POSX = PChar->loc.p.x;
		float POSY = PChar->loc.p.y;
		float POSZ = PChar->loc.p.z;
		int GRIDPOSX = (POSX + POSY) / 30;
		int GRIDPOSY = (POSZ + POSY) / 30;

		const int8* Query = "SELECT ListID, x, y \
							FROM fishing_grid \
							WHERE zone = %u \
							ORDER BY zone ASC";

		int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone());

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				int32 GX = Sql_GetIntData(SqlHandle, 1);
				int32 GY = Sql_GetIntData(SqlHandle, 2);

				if (GX == GRIDPOSX && GY == GRIDPOSY)
				{
					return Sql_GetIntData(SqlHandle, 0);
				}

if (GX == -99 && GY == -99)
{
	if (GRIDPOSX != -99 && GRIDPOSY != -99)
	{
		return Sql_GetIntData(SqlHandle, 0);
	}

}
			}
		}

		return 0;
	}

	// get mob info if you fish one up
	void GetMobInfo(CCharEntity* PChar)
	{
		const int8* Query = "SELECT mobid, type,zone \
							FROM fishing_mobs \
							WHERE zone = %u \
							ORDER BY zone ASC";

		int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone());
		int RC = 0;
		// this will pick a random  number from range 1 to max record count
		int RID = rand() % Sql_NumRows(SqlHandle) + 1;

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				RC = RC + 1;
				if (RC == RID && Sql_GetIntData(SqlHandle, 0) != 0)
				{
					if (IsSpawned(Sql_GetIntData(SqlHandle, 0)) == false)
					{
						mobid[0] = Sql_GetIntData(SqlHandle, 0);
						catchtype[0] = Sql_GetIntData(SqlHandle, 1); // Type
						break;
					}
				}
			}
		}
	}

	// get type and size info on items and fish
	void GetOtherInfo(uint32 EntityID)
	{
		DSP_DEBUG_BREAK_IF(EntityID == NULL);

		const int8* Query = "SELECT fishid, type, size, max \
							FROM fishing_fish \
							WHERE fishid = %u \
							ORDER BY fishid ASC";

		int32 ret = Sql_Query(SqlHandle, Query, EntityID);

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint32 ent = Sql_GetIntData(SqlHandle, 0);

				if (ent == EntityID)
				{
					catchtype[0] = Sql_GetIntData(SqlHandle, 1);
					catchsize[0] = Sql_GetIntData(SqlHandle, 2);
					catchlevel[0] = Sql_GetIntData(SqlHandle, 3);
				}

			}
		}
	}

	// make sure you can catch a fish with the current bait equipped
	bool BaitCheck(uint16 BaitID, uint32 FishID)
	{
		DSP_DEBUG_BREAK_IF(BaitID == NULL);
		DSP_DEBUG_BREAK_IF(FishID == NULL);

		const int8* Query = "SELECT baitid, fishid,rare \
							FROM fishing_bait \
							WHERE baitid = %u \
							ORDER BY baitid ASC";

		int32 ret = Sql_Query(SqlHandle, Query, BaitID);
		//ShowDebug(CL_CYAN"BaitID Record's found: %u \n" CL_RESET, Sql_NumRows(SqlHandle));

		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint32 ent = Sql_GetIntData(SqlHandle, 1);
				uint32 rare = Sql_GetIntData(SqlHandle, 2);

				if (ent == FishID)
				{
					// rare chance 20%
					if (rare = 1 && rand()% 100 <= 20)
					{
						return false;
					}
					else
					{
						return true;
					}

				}
			}
		}

		return false;
	}

// Armor and item check function
int GearCheck(CCharEntity* PChar, uint8 GetSlotID)
{
	uint8  SlotID = PChar->equip[GetSlotID];
	CItem* Armor = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

	//DSP_DEBUG_BREAK_IF(PRod == NULL);

	int Check = 0;
	
	// Fishing Gear check
	switch (Armor->getID())
	{
	case 0x35F0:  Check = 1; break; // Fishermans Tunica
	case 0x36F6:  Check = 1; break; // Fishermans Gloves
	case 0x37D4:  Check = 1; break; // Fishermans Hose
	case 0x375B:  Check = 1; break; // Fishermans Boots
	case 0x35F1:  Check = 1; break; // Anglers Tunica
	case 0x36F7:  Check = 1; break; // Anglers Gloves
	case 0x37D5:  Check = 1; break; // Anglers Hose
	case 0x375C:  Check = 1; break; // Anglers Boots
	case 0x3773:  Check = 2; break; // Waders
	case 0x2AAD:  Check = 2; break; // Fishers Torque
	case 0x2C49:  Check = 3; break; // Fishermans Smock
	case 0x2CEB:  Check = 4; break; // Trainees Spectacles
	case 0x3CC2:  Check = 5; break; // Pelican Ring
	case 0x3CC0:  Check = 6; break; // Albatross Ring
	case 0x3CC1:  Check = 7; break; // Penguin Ring
	case 0x3DE6:  Check = 8; break; // Heron Ring
	case 0x3DE5:  Check = 9; break; // Seagull Ring
	case 0x2D86:  Check = 10; break; // Puffin Ring
	case 0x2D87:  Check = 11; break; // Noddy Ring
	case 0x2DF8:  Check = 12; break; // Fishers Rope
	}

	return Check;
}

	/************************************************************************
	*																		*
	*  Main Fising function													*
	*																		*
	************************************************************************/

	bool CheckFisherLuck(CCharEntity* PChar)
	{
		if (PChar->UContainer->GetType() != UCONTAINER_EMPTY)
		{
			ShowDebug(CL_CYAN"Player cannot fish! UContainer is not empty\n" CL_RESET);
			return false;
		}

		CItemFish* PFish = NULL;
		CItemWeapon* WeaponItem = NULL;

		WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_RANGED]);

		DSP_DEBUG_BREAK_IF(WeaponItem == NULL);
		DSP_DEBUG_BREAK_IF(WeaponItem->isType(ITEM_WEAPON) == false);
		DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FSH);

		uint16 RodID = WeaponItem->getID();

		WeaponItem = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

		DSP_DEBUG_BREAK_IF(WeaponItem == NULL);
		DSP_DEBUG_BREAK_IF(WeaponItem->isType(ITEM_WEAPON) == false);
		DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FSH);

		uint16 LureID = WeaponItem->getID();

		int FishingChance = rand() % 100;

		int ListID = GridList(PChar);

		if (ListID == 0)
		{
			ShowDebug(CL_CYAN"Fish list not found for Zone: %u \n" CL_RESET, PChar->getZone());
		}

		if (ListID > 0 && FishingChance <= 50)
		{
			const int8* Query = "SELECT ListID, EntityID \
								FROM fishing_list \
								WHERE ListID = %u \
								ORDER BY ListID ASC";

			int32 ret = Sql_Query(SqlHandle, Query, ListID);

			int RC = 0;
			// this will pick a random  number from range 1 to max record count
			int RID = rand() % Sql_NumRows(SqlHandle) + 1;
			
			if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
			{
				while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
				{
					RC = RC + 1;
					uint32 EntityID = Sql_GetIntData(SqlHandle, 1);
					
					if (RC == RID)
					{
						// Gil
						if (EntityID == 0x0000FFFF)
						{   
							// do not change this item number this is a place holder ID for gil
							PFish = new CItemFish(*itemutils::GetItemPointer(14117));
							PChar->UContainer->SetType(UCONTAINER_FISHING);
							PChar->UContainer->SetItem(0, PFish);
							catchtype[0] = 2;
							break;
						}
						// Monster
						if (EntityID == 0x0001046A)
						{
							GetMobInfo(PChar);
							if (IsSpawned(mobid[0]) == false && mobid[0] > 0)
							{
								// do not change this item number this is a place holder ID for mobs
								PFish = new CItemFish(*itemutils::GetItemPointer(14117));
								PChar->UContainer->SetType(UCONTAINER_FISHING);
								PChar->UContainer->SetItem(0, PFish);
								break;
							}
						}
						if (EntityID != 0x0000FFFF || EntityID != 0x0001046A)
						{
							// get fish or item for returned record if its not a monster or gil
							GetOtherInfo(EntityID);
							// Fish
							if (catchtype[0] == 0)
							{
								// will create a fish entity if the bait can be used to catch the fish 
								if (BaitCheck(LureID, EntityID) == true)
								{
									PFish = new CItemFish(*itemutils::GetItemPointer(EntityID));
									PChar->UContainer->SetType(UCONTAINER_FISHING);
									PChar->UContainer->SetItem(0, PFish);
									break;
								}
							}
							// Item
							if (catchtype[0] == 1)
							{
								PFish = new CItemFish(*itemutils::GetItemPointer(EntityID));
								PChar->UContainer->SetType(UCONTAINER_FISHING);
								PChar->UContainer->SetItem(0, PFish);
								break;
							}
						}

					}

					if(RC == Sql_NumRows(SqlHandle))
					{
						break;
					}

				}

			}
		}

		return (PFish != NULL);
	}

	/************************************************************************
	*																		*
	*  ???????? ?????? ??????? (?????? ?????? ???? ??? ??????? RemoveFly)	*
	*																		*
	************************************************************************/

	bool LureLoss(CCharEntity* PChar, bool RemoveFly)
	{
		CItemWeapon* PLure = (CItemWeapon*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_AMMO]);

		DSP_DEBUG_BREAK_IF(PLure == NULL);
		DSP_DEBUG_BREAK_IF(PLure->isType(ITEM_WEAPON) == false);
		DSP_DEBUG_BREAK_IF(PLure->getSkillType() != SKILL_FSH);

		if (!RemoveFly &&
			(PLure->getStackSize() == 1))
		{
			return false;
		}
		if (PLure->getQuantity() == 1)
		{
			charutils::EquipItem(PChar, 0, PChar->equip[SLOT_AMMO]);
		}

		charutils::UpdateItem(PChar, PLure->getLocationID(), PLure->getSlotID(), -1);
		PChar->pushPacket(new CInventoryFinishPacket());
		return true;
	}

// get broken rod info
	uint32 GetBrokenID(uint16 RodID)
	{
		const int8* Query = "SELECT rodid, brokenid \
							FROM fishing_rods \
							WHERE rodid = %u \
							ORDER BY rodid ASC";

		int32 ret = Sql_Query(SqlHandle, Query, RodID);
	
		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint32 rod = Sql_GetIntData(SqlHandle,0);
				uint32 brokeid = Sql_GetIntData(SqlHandle, 1);
				
				if (rod == RodID)
				{
					return brokeid;
				}
			}
		}
		return -1;
	}

// rod break and line break code
	int Breakage(CCharEntity* PChar, uint16 FishID)
	{
		uint8  SlotID = PChar->equip[SLOT_RANGED];
		CItem* PRod = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

		DSP_DEBUG_BREAK_IF(PRod == NULL);

		int RodBeakType = 0;
		uint16 BrokenRodID = GetBrokenID(PRod->getID());
		
		if (BrokenRodID == -1)
		{
			ShowDebug(CL_CYAN"RodID not found Please check the database: %u \n" CL_RESET);
		}

		const int8* Query = "SELECT rodid, fishid, break_type, loose_catch \
							FROM fishing_rod_breakage \
							WHERE fishid = %u \
							ORDER BY rodid ASC";

		int32 ret = Sql_Query(SqlHandle, Query, FishID);
		
		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
				uint16 ent = Sql_GetIntData(SqlHandle, 0);
				int32 break_type = Sql_GetIntData(SqlHandle, 2);
				int32 loose_catch = Sql_GetIntData(SqlHandle, 3);

				if (PRod->getID() == ent)
				{
		
					if (break_type > 0 && loose_catch > 0)
					{
						// 40% chance to break the rod and 60% chance to break the line
						if (rand() % 100 <= 60)
						{
							// break line only
							RodBeakType = 2;
						}
						else
						{
							// break rod
							RodBeakType = 1;
						}
					}

					if (break_type == 1 && loose_catch == 0)
					{
						// break rod
						RodBeakType = 1;
					}
					
					if (break_type == 2 && loose_catch == 0)
					{
						// break line
						RodBeakType = 2;
					}

					if (break_type == 0 && loose_catch == 1)
					{
						// loose catch
						RodBeakType = 3;
					}

				}
			}
		}

		// RodBeakType 0 = none ( Ebishu & Judges rod is not breakable )
		// RodBeakType 1 = rod 
		// RodBeakType 2 = line
		// RodBeakType 3 = loose catch
		if (BrokenRodID > 0 && RodBeakType == 1)
		{
			// 30% chance to loose your bait / Lure on a rod break
			if (rand()% + 100 <= 30)
			{
				LureLoss(PChar, true);
			}
			else
			{
				LureLoss(PChar, false);
			}
			
			charutils::EquipItem(PChar, 0, SLOT_RANGED);
			charutils::UpdateItem(PChar, LOC_INVENTORY, SlotID, -1);
			charutils::AddItem(PChar, LOC_INVENTORY, BrokenRodID, 1);			
			return 1;
		}

		if (RodBeakType == 2)
		{
			LureLoss(PChar, true);
			return 2;
		}

		// 20% chance to loose your catch
		if (RodBeakType == 3 && rand()% + 100 <= 20)
		{
			return 3;
		}

		return 0;
	}

void SpawnCatch(CCharEntity* PChar, uint32 mobid)
	{
		CBattleEntity* TargetID = (CBattleEntity*)PChar;
		CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
		
		if (PMob->PBattleAI->GetCurrentAction() == ACTION_NONE)
		{
			PMob->SetDespawnTimer(3);
			PMob->m_AllowRespawn = false;
			PMob->m_Type = MOBTYPE_FISHED;
			PMob->CanDetectTarget(TargetID, true);
			PMob->m_Behaviour = BEHAVIOUR_NO_TURN;
			PMob->m_SpawnPoint = nearPosition(PChar->loc.p, 2.2f, M_PI);
			PMob->PBattleAI->SetLastActionTime(gettick());
			PMob->PBattleAI->SetCurrentAction(ACTION_SPAWN);
			PMob->PBattleAI->CheckCurrentAction(gettick());
			PMob->PEnmityContainer->AddBaseEnmity(TargetID);
		}

	}

// can get Skill up check
int CanSkillUp(CCharEntity* PChar)
{
	int32  charSkill = PChar->RealSkills.skill[SKILL_FSH];

	int gearbonus = 0;
	gearbonus = gearbonus + GearCheck(PChar, SLOT_BODY);
	gearbonus = gearbonus + GearCheck(PChar, SLOT_HANDS);
	gearbonus = gearbonus + GearCheck(PChar, SLOT_LEGS);
	gearbonus = gearbonus + GearCheck(PChar, SLOT_FEET);
	gearbonus = gearbonus + GearCheck(PChar, SLOT_NECK);

	int GiveSkill = 0;
	int fish0 = catchlevel[0];
	int fish1 = catchlevel[0] - 1;
	int fish2 = catchlevel[0] - 2;
	int fish3 = catchlevel[0] - 3;
	int fish4 = catchlevel[0] - 4;
	int fish5 = catchlevel[0] - 5;
	int player = (charSkill / 10) + gearbonus;

	if (catchtype[0] == 0)
	{
		if (fish0 == player){ GiveSkill = 1; }
		if (fish1 == player){ GiveSkill = 1; }
		if (fish2 == player){ GiveSkill = 1; }
		if (fish3 == player){ GiveSkill = 1; }
		if (fish4 == player){ GiveSkill = 1; }
		if (fish5 == player){ GiveSkill = 1; }
	}
	
	if (catchtype[0] != 0){ GiveSkill = 2; }
	if (player-gearbonus > catchlevel[0]){ GiveSkill = 2; }

	return GiveSkill;
}
	/************************************************************************
	*																		*
	*																		*
	*																		*
	************************************************************************/

	void FishingAction(CCharEntity* PChar, FISHACTION action, uint16 stamina)
	{
		uint16 MessageOffset = GetMessageOffset(PChar->getZone());

		switch (action)
		{
		case FISHACTION_CHECK:
		{

								 if (CheckFisherLuck(PChar))
								 {
									 // send messages
									 if (catchtype[0] >= 0)
									 {
										 PChar->animation = ANIMATION_FISHING_FISH;
										 if (catchtype[0] == 0)
										 {
											 if (catchsize[0] == 1)
											 {
												 // Large Fish: "Something caught the hook!!!"
												 PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x32));
											 }
											 else
											 {
												 // Small Fish: "Something caught the hook!"	
												 PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x08));
											 }
										 }
										 if (catchtype[0] >= 1 && catchtype[0] < 3)
										 {
											 // Non-fish targets: "You feel something pulling at your line."
											 PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x33));
										 }
										 if (catchtype[0] == 3)
										 {
											 // Monster: "Something clamps onto your line ferociously!"	
											 PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x34));
										 }
										 PChar->pushPacket(new CFishingPacket(catchtype[0], catchsize[0]));
									 }
								 }
								 else
								 {
									 // Message: "You didn't catch anything."

									 PChar->animation = ANIMATION_FISHING_STOP;
									 PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x04));
								 }
		}
			break;
		case FISHACTION_FINISH:
		{

								  // you have a 15% change to break the rod, Line or loose a catch while reeling it in.
								  if (rand() % 100 <= 15 && catchtype[0] <= 1 && stamina == 0)
								  {
									  DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
									  DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == NULL);
									  CItem* PFish = PChar->UContainer->GetItem(0);
									  
									  int messageID = Breakage(PChar, PFish->getID());
									  
									  if (messageID == 1)
									  {
										  // Message: "Your rod breaks. Whatever caught the hook was pretty big"
										  PChar->animation = ANIMATION_FISHING_ROD_BREAK;
										  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x11));
									  }
									  if (messageID == 2)
									  {
										  // Message: "Your line breaks!"
										  PChar->animation = ANIMATION_FISHING_LINE_BREAK;
										  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x06));
									  }
									  
									  if (messageID == 3)
									  {
										  // Message: "You lost your catch Whatever caught thr hook was too small to catch with this rod"
										  PChar->animation = ANIMATION_FISHING_LINE_BREAK;
										  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x13));
									  }

									  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x09));
									  PChar->animation = ANIMATION_FISHING_STOP;
									  PChar->UContainer->Clean();
									  catchlevel[0] = 0;
									  break;
								  }

								  if (stamina == 0)
								  {
									  DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
									  DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == NULL);
									  CItem* PFish = PChar->UContainer->GetItem(0);
									  								  
									  if (catchtype[0] == 3)
									  {
										  PChar->animation = ANIMATION_FISHING_MONSTER;
									  }
									  else
									  {
										  PChar->animation = ANIMATION_FISHING_CAUGHT;
									  }
									  									  
									  if (catchtype[0] == 3)
									  {
										  // Message: "You caught  a monster"
										  PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, 0x01, mobid[0], MessageOffset + 0x05));
										  SpawnCatch(PChar, mobid[0]);
									  }

									  if (catchtype[0] <= 2)
									  {
										  if (catchtype[0] == 2)
										  {
											  int GilChance = rand() % 100 ;
											  if (GilChance <= 10)
											  {
												  // Give 100 Gil if gillchance <= 10%
												  charutils::UpdateItem(PChar, LOC_INVENTORY, 0, 100);
												  PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, 0x01, 0x0000FFFF, MessageOffset + 0x27));
												  PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, 0x64, 0x0000FFFF, MessageOffset + 0x26));
											  }
											  else
											  {     
												    // give 1 Gil
												  charutils::UpdateItem(PChar, LOC_INVENTORY, 0, 1);
												  PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, 0x01, 0x0000FFFF, MessageOffset + 0x27));
												  PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, 0x01, 0x0000FFFF, MessageOffset + 0x26));
											  }

										  }
										  else
										  {
											  if (CanSkillUp(PChar) == 0)
											  {
												  // Message: " You lost your catch due to lack of skill."
												  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x14));
											  }
											  else
											  {
												  // if type is 0:fish or 1:item add item to invintory
												  charutils::AddItem(PChar, LOC_INVENTORY, PFish->getID(), 1);
												  PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, 0x01, PFish->getID(), MessageOffset + 0x27));
											  }
										  }
									  }

									  if (PFish->isType(ITEM_USABLE))
									  {
										  LureLoss(PChar, false);
									  }
									  delete PFish;
								  }
								  else if (stamina <= 0x64)
								  {
									  // Message: "Your line breaks!"
									  PChar->animation = ANIMATION_FISHING_LINE_BREAK;
									  LureLoss(PChar, true);
									  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x06));
								  }
								  else if (stamina <= 0x100)
								  {
									  // Message: "You give up!"
									  PChar->animation = ANIMATION_FISHING_STOP;

									  if (PChar->UContainer->GetType() == UCONTAINER_FISHING &&
										  LureLoss(PChar, false))
									  {
										  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x24));
									  }
									  else {
										  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x25));
									  }
								  }
								  else
								  {
									  // Message: "You lost your catch!"
									  PChar->animation = ANIMATION_FISHING_STOP;
									  LureLoss(PChar, false);
									  PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x09));
								  }
								  PChar->UContainer->Clean();
		}
			break;
		case FISHACTION_WARNING:
		{
								   // Message: "You don't know how much longer you can keep this one on the line..."
								   PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x28));
								   return;
		}
			break;
		case FISHACTION_END:
		{
							   // skillup
							   PChar->animation = ANIMATION_NONE;

							   if (catchtype[0] == 0 && catchlevel[0] >= 1 && CanSkillUp(PChar) == 1)
							   {

								   uint8  skillRank = PChar->RealSkills.rank[SKILL_FSH];
								   uint16 maxSkill = (skillRank + 1) * 100;

								   int32  charSkill = PChar->RealSkills.skill[SKILL_FSH];

								   
								   int skillAmount = rand() % 5;
								   
								   if (skillAmount > 0)
								   {
									   if ((skillAmount + charSkill) > maxSkill)
									   {
										   skillAmount = maxSkill - charSkill;
									   }

									   if (skillAmount > 0)
									   {
										   PChar->RealSkills.skill[SKILL_FSH] += skillAmount;
										   PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FSH, skillAmount, 38));

										   charutils::SaveCharSkills(PChar, SKILL_FSH);
									   }

									   if ((charSkill / 10) < (charSkill + skillAmount) / 10)
									   {
										   PChar->WorkingSkills.skill[SKILL_FSH] += 0x20;

										   PChar->pushPacket(new CCharSkillsPacket(PChar));
										   PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FSH, (charSkill + skillAmount) / 10, 53));
									   }

								   }
								    catchlevel[0] = 0;
							   }
							   

		}
			break;
		}

		PChar->status = STATUS_UPDATE;

		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CCharSyncPacket(PChar));
	}


} // namespace fishingutils
