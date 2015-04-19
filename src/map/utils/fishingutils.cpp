﻿/*
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

#include "../lua/luautils.h"

#include "../packets/caught_fish.h"
#include "../packets/caught_monster.h"
#include "../packets/char_skills.h"
#include "../packets/char_update.h"
#include "../packets/char_sync.h"
#include "../packets/fishing.h"
#include "../packets/inventory_finish.h"
#include "../packets/message_text.h"
#include "../packets/message_special.h"
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

/************************************************************************
*																		*
*  Массив смещений для сообщений рыбалки								*
*																		*
************************************************************************/

uint16 MessageOffset[MAX_ZONEID];

void LoadFishingMessages()
{
    zoneutils::ForEachZone([](CZone* PZone){
        MessageOffset[PZone->GetID()] = luautils::GetTextIDVariable(PZone->GetID(), "FISHING_MESSAGE_OFFSET");
    });
}

/************************************************************************
*																		*
*  Получение смещения для сообщений рыбалки								*
*																		*
************************************************************************/

uint16 GetMessageOffset(uint16 ZoneID)
{
	return MessageOffset[ZoneID];
}

/************************************************************************
*																		*
*  Проверяем наличие удочки, наживки и возможности ловли				*
*																		*
************************************************************************/

void StartFishing(CCharEntity* PChar)
{

		PChar->m_spawnMonsterID = 0;
		PChar->m_fishingUnknown = 0x0A; // unknown, it's generally 0x0A, but sometimes 0x0B

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
	
	CItemWeapon* WeaponItem = nullptr;

	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);	
			
	if ((WeaponItem == nullptr) ||
	   !(WeaponItem->isType(ITEM_WEAPON)) ||
		(WeaponItem->getSkillType() != SKILL_FSH)) 
	{													
		// сообщение: "You can't fish without a rod in your hands"

		PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x01));
			PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
		return;
	}

	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);	
							
	if ((WeaponItem == nullptr) ||
	   !(WeaponItem->isType(ITEM_WEAPON)) ||
		(WeaponItem->getSkillType() != SKILL_FSH))
	{
		// сообщение: "You can't fish without bait on the hook"	

		PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x02));
			PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
		return;
	}

		PChar->status = STATUS_NORMAL;
		PChar->animation = ANIMATION_NEW_FISHING_START;
    PChar->updatemask |= UPDATE_HP;

	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
}

/************************************************************************
*																		*
*  Персонаж теряет наживку (теряет блесну лишь при условии RemoveFly)	*
*																		*
************************************************************************/

bool LureLoss(CCharEntity* PChar, bool RemoveFly)
{	
	CItemWeapon* PLure = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);

	DSP_DEBUG_BREAK_IF(PLure == nullptr);
	DSP_DEBUG_BREAK_IF(PLure->isType(ITEM_WEAPON) == false);
	DSP_DEBUG_BREAK_IF(PLure->getSkillType() != SKILL_FSH);

	if (!RemoveFly &&
			(PLure->getStackSize() == 1))
	{
		return false;
	}
	if (PLure->getQuantity() == 1)
	{
		charutils::EquipItem(PChar, 0, PChar->equip[SLOT_AMMO], LOC_INVENTORY);
	}

	charutils::UpdateItem(PChar, PLure->getLocationID(), PLure->getSlotID(), -1);
	PChar->pushPacket(new CInventoryFinishPacket());
	return true;
}

/************************************************************************
*																		*
*  Персонаж ломает удочку												*
*																		*
************************************************************************/

void RodBreaks(CCharEntity* PChar)
{
	uint8  SlotID = PChar->equip[SLOT_RANGED];
		CItem* PRod = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

	DSP_DEBUG_BREAK_IF(PRod == nullptr);

	uint16 BrokenRodID = 0;

	switch (PRod->getID())
	{
		case 0x4276:  BrokenRodID = 0x0728; break;
		case 0x4277:  BrokenRodID = 0x0729; break;
		case 0x43E4:  BrokenRodID = 0x01E3; break;
		case 0x43E5:  BrokenRodID = 0x01D9; break;
		case 0x43E6:  BrokenRodID = 0x01D8; break;
		case 0x43E7:  BrokenRodID = 0x01E2; break;
		case 0x43E8:  BrokenRodID = 0x01EA; break;
		case 0x43E9:  BrokenRodID = 0x01EB; break;
		case 0x43EA:  BrokenRodID = 0x01E9; break;
		case 0x43EB:  BrokenRodID = 0x01E4; break;
		case 0x43EC:  BrokenRodID = 0x01E8; break;
		case 0x43ED:  BrokenRodID = 0x01E7; break;
		case 0x43EE:  BrokenRodID = 0x01E6; break;
		case 0x43EF:  BrokenRodID = 0x01E5; break;
	}

	DSP_DEBUG_BREAK_IF(BrokenRodID == 0);

	charutils::EquipItem(PChar, 0, SLOT_RANGED, LOC_INVENTORY);
	charutils::UpdateItem(PChar, LOC_INVENTORY, SlotID, -1); 
	charutils::AddItem(PChar, LOC_INVENTORY, BrokenRodID, 1);
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

	void FishingAction(CCharEntity* PChar, FISHACTION action, uint16 stamina, uint8 unknown)
{
	uint16 MessageOffset = GetMessageOffset(PChar->getZone());
		int32  charSkill = PChar->RealSkills.skill[SKILL_FSH];
		ZONETYPE zonetype = PChar->loc.zone->GetType();
		CItemFish* PFish = NULL;
		fishResult *retVal;
		uint16 Message;
		uint16 Zone = PChar->getZone();
		uint8 isMonster = 0;

	switch (action) 
	{
		case FISHACTION_CHECK:
		{
			//call our lua script to determine what we caught

			retVal = luautils::OnFishingCheck(PChar, Zone);
			printf("fishResult FISHACTION_CHECK: %u %u %u %u %u %u \n", retVal->a, retVal->b, retVal->c, retVal->d, retVal->e, retVal->f);
			// retVal->
			//   a: did we catch a fish (0/1)
			//   b: what did we catch (1-4)
			//   c: how do we feel about it (1-6)
			//   d: which item/monster did we catch (item/monsterid)
			//   e: size
			//   f: stamina

			//process our results
			if (retVal->a == 1) { //If we caught something
				switch (retVal->b) {// what caught our hook
				case 1:
					//Something caught the hook! - small fish
					printf("retVal->a == 1 \n");
					Message = MessageOffset + 8;
					break;
				case 2:
					//Something caught the hook!!! - large fish
					printf("retVal->a == 2 \n");
					Message = MessageOffset + 50;
					// + 54 = This strength... You get the sense that you are on the verge of an epic catch!
					break;
				case 3:
					//You feel something pulling at your line. - item
					printf("retVal->a == 3 \n");
					Message = MessageOffset + 51;
					break;
				case 4:
					//Something clamps onto your line ferociously! - monster
					printf("retVal->a == 4 \n");
					PChar->m_spawnMonsterID = retVal->d;
					isMonster = 1;
					Message = MessageOffset + 52;
					break;
				}

				//if not a monster, assign caught fish to player
				if (PChar->m_spawnMonsterID == 0) {
					PFish = new CItemFish(*itemutils::GetItemPointer(retVal->d));
					PChar->UContainer->SetType(UCONTAINER_FISHING);
					PChar->UContainer->SetItem(0, PFish);
				}

				PChar->pushPacket(new CMessageTextPacket(PChar, Message));

				switch (retVal->c) { //Fish feeling
				case 1:
					//You have a good feeling about this one!
					printf("retVal->c == 1 \n");
					Message = MessageOffset + 41;
					break;
				case 2:
					//You have a bad feeling about this one.
					printf("retVal->c == 2 \n");
					Message = MessageOffset + 42;
					break;
				case 3:
					//You have a terrible feeling about this one...
					printf("retVal->c == 3 \n");
					Message = MessageOffset + 43;
					break;
				case 4:
					//You don't know if you have enough skill to reel this one in. 
					printf("retVal->c == 4 \n");
					Message = MessageOffset + 44;
					break;
				case 5:
					//You're fairly sure you don't have enough skill to reel this one in.
					printf("retVal->c == 5 \n");
					Message = MessageOffset + 45;
					break;
				case 6:
					//You're positive you don't have enough skill to reel this one in!
					printf("retVal->c == 6 \n");
					Message = MessageOffset + 46;
					break;
				}
				if (retVal->c > 0) {
					PChar->pushPacket(new CMessageTextPacket(PChar, Message));
				}
				if (PChar->m_spawnMonsterID == 0) {

					PChar->pushPacket(new CMessageSpecialPacket(PChar, MessageOffset + 53, retVal->d, 3, 3, 3));
			
				}
				PChar->animation = ANIMATION_NEW_FISHING_FISH;
                PChar->updatemask |= UPDATE_HP;
				PChar->pushPacket(new CFishingPacket(2500, 128, 8, 800, 50, 200, 40, isMonster, 30));

			}
			else { //if we didn't catch something

				PChar->animation = ANIMATION_NEW_FISHING_STOP;
                PChar->updatemask |= UPDATE_HP;
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x04));

			}

		}
		break;

		case FISHACTION_FINISH:
		{
			retVal = luautils::OnFishingComplete(PChar, zonetype, action, stamina, PChar->m_spawnMonsterID);
			printf("fishResult FISHACTION_FINISH: %u \n", retVal->a);


			if (stamina == 0)
			{


				if (PChar->m_spawnMonsterID > 0) {

					// <Player> caught a monster!
					PChar->animation = ANIMATION_NEW_FISHING_MONSTER;
					PChar->updatemask |= UPDATE_HP;
					LureLoss(PChar, false);
					PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtMonsterPacket(PChar, MessageOffset + 0x05));

				}
				else {

				// сообщение: "You caught fish!"

				DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
				DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == nullptr);

					PChar->animation = ANIMATION_NEW_FISHING_CAUGHT;
                PChar->updatemask |= UPDATE_HP;
				CItem* PFish = PChar->UContainer->GetItem(0);

                // TODO: анализируем RodFlag

				charutils::AddItem(PChar, LOC_INVENTORY, PFish->getID(), 1);
                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, PFish->getID(), MessageOffset + 0x27));

				if (PFish->isType(ITEM_USABLE))
				{
					LureLoss(PChar, false);
				}
                delete PFish;
			}
			}
			else if (stamina <= 0x64)
			{
				// сообщение: "Your line breaks!"
	
				PChar->animation = ANIMATION_NEW_FISHING_LINE_BREAK;
                PChar->updatemask |= UPDATE_HP;
				LureLoss(PChar, true);
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x06));
			}
			else if (stamina <= 0x100)
			{
				// сообщение: "You give up!"

				PChar->animation = ANIMATION_NEW_FISHING_STOP;
                PChar->updatemask |= UPDATE_HP;
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
				// сообщение: "You lost your catch!"

				PChar->animation = ANIMATION_NEW_FISHING_STOP;
                PChar->updatemask |= UPDATE_HP;
				LureLoss(PChar, false);
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x09));
				// + 60 = You lost your catch. Whatever caught the hook was too large to catch with this rod.
			}
			PChar->UContainer->Clean();
		}
		break;

		case FISHACTION_WARNING:
		{
			//You don't know how much longer you can keep this one on the line...
			PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x28));
			return;
		}
		break;

		case FISHACTION_END:
		{
			retVal = luautils::OnFishingEnd(PChar);
			printf("fishResult FISHACTION_END: %u,%u \n", retVal->a, retVal->b);

			//		 skillup
			//PChar->RealSkills.skill[SKILL_FSH] += 1;
			//PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FSH, 1, 38));

			//if ((charSkill / 10) < (charSkill + 1) / 10)
			//{
			//	PChar->WorkingSkills.skill[SKILL_FSH] += 0x20;

			//	PChar->pushPacket(new CCharSkillsPacket(PChar));
			//	PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FSH, (charSkill + 1) / 10, 53));
			//}

			//charutils::SaveCharSkills(PChar, SKILL_FSH);

			PChar->animation = ANIMATION_NONE;
            PChar->updatemask |= UPDATE_HP;
		}
		break;
	}

	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
}

} // namespace fishingutils



///************************************************************************
//*																		*
//*  Персонаж ломает удочку												*
//*																		*
//************************************************************************/

//bool CheckFisherLuck(CCharEntity* PChar)
//{
//	if (PChar->UContainer->GetType() != UCONTAINER_EMPTY)
//	{
//		ShowDebug(CL_CYAN"Player cannot fish! UContainer is not empty\n" CL_RESET);
//		return false;
//	}

//	CItemFish* PFish = NULL;
//	CItemWeapon* WeaponItem = NULL;

//	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);

//	DSP_DEBUG_BREAK_IF(WeaponItem == NULL);
//	DSP_DEBUG_BREAK_IF(WeaponItem->isType(ITEM_WEAPON) == false);
//	DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FSH);

//	uint16 RodID = WeaponItem->getID();

//	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);

//	DSP_DEBUG_BREAK_IF(WeaponItem == NULL);
//	DSP_DEBUG_BREAK_IF(WeaponItem->isType(ITEM_WEAPON) == false);
//	DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FSH);

//	uint16 LureID = WeaponItem->getID();

//	int32 FishingChance = WELL512::irand() % 100;

//	if (FishingChance <= 20)
//	{
//		const int8* Query =
//			"SELECT "
//			"fish.fishid,"      // 0
//			"fish.max,"         // 1
//			"fish.watertype,"   // 2
//			"fish.size,"        // 3
//			"fish.stamina,"     // 4
//			"fish.log,"         // 5
//			"fish.quest,"       // 6
//			"rod.flag "         // 7
//			"FROM fishing_zone AS zone "
//			"INNER JOIN fishing_rod  AS rod  USING (fishid) "
//			"INNER JOIN fishing_lure AS lure USING (fishid) "
//			"INNER JOIN fishing_fish AS fish USING (fishid) "
//			"WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck = 0";

//		int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone(), RodID, LureID);

//		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
//		{
//			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
//			{
//				// ловля предметов, необходимых для поисков

//				uint8 logid = (uint8)Sql_GetIntData(SqlHandle, 5);
//				uint8 quest = (uint8)Sql_GetIntData(SqlHandle, 6);

//				if (logid < MAX_QUESTAREA && quest < MAX_QUESTID)
//				{
//					uint8 current = PChar->m_questLog[logid].current[quest / 8] & (1 << (quest % 8));
//					uint8 complete = PChar->m_questLog[logid].complete[quest / 8] & (1 << (quest % 8));

//					if (complete == 0 && current != 0)
//					{
//						PFish = new CItemFish(*itemutils::GetItemPointer(Sql_GetIntData(SqlHandle, 0)));

//						PChar->UContainer->SetType(UCONTAINER_FISHING);
//						PChar->UContainer->SetItem(0, PFish);
//						break;
//					}
//				}
//				// TODO: ловля простых предметов
//			}
//		}
//	}
//	else
//	{
//		const int8* Query =
//			"SELECT "
//			"fish.fishid,"      // 0
//			"fish.min,"         // 1
//			"fish.max,"         // 2
//			"fish.size,"        // 3
//			"fish.stamina,"     // 4
//			"fish.watertype,"   // 5
//			"rod.flag, "         // 6
//			"lure.luck "        // 7
//			"FROM fishing_zone AS zone "
//			"INNER JOIN fishing_rod  AS rod  USING (fishid) "
//			"INNER JOIN fishing_lure AS lure USING (fishid) "
//			"INNER JOIN fishing_fish AS fish USING (fishid) "
//			"WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck != 0 "
//			"ORDER BY luck";

//		int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone(), RodID, LureID);

//		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
//		{
//			int32 FisherLuck = 0;
//			int32 FishingChance = WELL512::irand() % 1000;

//			while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
//			{
//				FisherLuck += Sql_GetIntData(SqlHandle, 7);

//				if (FishingChance <= FisherLuck)
//				{
//					PFish = new CItemFish(*itemutils::GetItemPointer(Sql_GetIntData(SqlHandle, 0)));

//					PChar->UContainer->SetType(UCONTAINER_FISHING);
//					PChar->UContainer->SetItem(0, PFish);
//					break;
//				}
//			}
//		}
//	}

//	return (PFish != NULL);
//}
