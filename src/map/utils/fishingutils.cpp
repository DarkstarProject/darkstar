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

#include "../universal_container.h"
#include "../item_container.h"

#include "../lua/luautils.h"

#include "../packets/char_skills.h"
#include "../packets/char_update.h"
#include "../packets/char_sync.h"
#include "../packets/fishing.h"
#include "../packets/inventory_finish.h"
#include "../packets/message_name.h"
#include "../packets/message_text.h"
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

void ClearPlayersFishingCatches()
{
    Sql_Query(SqlHandle, "update char_vars set value = 0 WHERE varname = 'FishingCatches';");

    ShowDebug(CL_CYAN"Reset players fishing catches done\n" CL_RESET);
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

// get player skill with item mod bonus added
uint16 getPlayerFishingSkill(CCharEntity* PChar)
{
    uint16 skill = 0;

    // player skill
    skill += PChar->RealSkills.skill[SKILL_FISHING];

#ifdef _DSP_SYNTH_DEBUG_MESSAGES_
    ShowDebug(CL_CYAN"player skill = %u\n" CL_RESET, skill);
#endif

    // mod bonus
    skill += PChar->getMod(Mod::FISH)*10;

#ifdef _DSP_SYNTH_DEBUG_MESSAGES_
    ShowDebug(CL_CYAN"player skill with mod bonus = %u\n" CL_RESET, skill);
#endif

    return skill;
}

/************************************************************************
*																		*
*  Проверяем наличие удочки, наживки и возможности ловли				*
*																		*
************************************************************************/

void StartFishing(CCharEntity* PChar)
{
	if (PChar->animation != ANIMATION_NONE)
	{
		PChar->pushPacket(new CMessageSystemPacket(0,0,142));
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}

	uint16 MessageOffset = GetMessageOffset(PChar->getZone());

	if (MessageOffset == 0)
	{
        ShowWarning(CL_YELLOW"Player wants to fish in %s\n" CL_RESET, PChar->loc.zone->GetName());
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}
	
	CItemWeapon* WeaponItem = nullptr;

	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);	
			
	if ((WeaponItem == nullptr) ||
	   !(WeaponItem->isType(ITEM_WEAPON)) ||
		(WeaponItem->getSkillType() != SKILL_FISHING)) 
	{													
		// сообщение: "You can't fish without a rod in your hands"

		PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x01));
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}

	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);	
							
	if ((WeaponItem == nullptr) ||
	   !(WeaponItem->isType(ITEM_WEAPON)) ||
		(WeaponItem->getSkillType() != SKILL_FISHING))
	{
		// сообщение: "You can't fish without bait on the hook"	

		PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x02));
		PChar->pushPacket(new CReleasePacket(PChar,RELEASE_FISHING));
		return;
	}

	PChar->animation = ANIMATION_FISHING_START;
    PChar->updatemask |= UPDATE_HP;

	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
}

/************************************************************************
*																		*
*  Персонаж ломает удочку												*
*																		*
************************************************************************/

bool CheckFisherLuck(CCharEntity* PChar)
{
	if (PChar->UContainer->GetType() != UCONTAINER_EMPTY)
	{
		ShowDebug(CL_CYAN"Player cannot fish! UContainer is not empty\n" CL_RESET);
		return false;
	}

    // if there's a daily limit and the player reached it, then he can't get more fish
    if (map_config.fishing_daily_limit != 0 && PChar->fishingCatches >= map_config.fishing_daily_limit)
        return false;

	CItemFish* PFish = nullptr;
	CItemWeapon* WeaponItem = nullptr;
    uint16 playerFishingSkill = getPlayerFishingSkill(PChar);

	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);	

	DSP_DEBUG_BREAK_IF(WeaponItem == nullptr);
	DSP_DEBUG_BREAK_IF(WeaponItem->isType(ITEM_WEAPON) == false);
	DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FISHING);

	uint16 RodID = WeaponItem->getID();

	WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);	
							
	DSP_DEBUG_BREAK_IF(WeaponItem == nullptr);
	DSP_DEBUG_BREAK_IF(WeaponItem->isType(ITEM_WEAPON) == false);
	DSP_DEBUG_BREAK_IF(WeaponItem->getSkillType() != SKILL_FISHING);

	uint16 LureID = WeaponItem->getID();

	int32 FishingChance = dsprand::GetRandomNumber(100);

	if (FishingChance <= 20)
	{

        // at time of this comment 2019-06-03 , all fish on lure.luck = 0 , have min and max = 0
        // so no need to add filter conditions
        //
        // for future check : SELECT * FROM dspdb.fishing_lure as l , fishing_fish as f where l.luck = 0 and l.fishid = f.fishid and ( f.min > 0 or f.max > 0 )

		const char* Query = 
            "SELECT "
                "fish.fishid,"      // 0
                "fish.max,"         // 1
                "fish.watertype,"   // 2
                "fish.size,"        // 3
                "fish.stamina,"     // 4
                "fish.log,"         // 5
                "fish.quest,"       // 6
                "rod.flag "         // 7
            "FROM fishing_zone AS zone "
			"INNER JOIN fishing_rod  AS rod  USING (fishid) "
			"INNER JOIN fishing_lure AS lure USING (fishid) "
			"INNER JOIN fishing_fish AS fish USING (fishid) "
			"WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck = 0";

		int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone(), RodID, LureID);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
            // array to store fish ids that i can get
            std::vector<int32> fishIDs((int32)Sql_NumRows(SqlHandle));
            int32 fishCounter = 0;
            bool caughtQuestedFish = false;
            
            while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
                // store fish id
                fishIDs[fishCounter] = Sql_GetIntData(SqlHandle, 0);
                
                // ловля предметов, необходимых для поисков

                uint8 logid = (uint8)Sql_GetIntData(SqlHandle,5);
                uint8 quest = (uint8)Sql_GetIntData(SqlHandle,6);

                if(logid < MAX_QUESTAREA && quest < MAX_QUESTID)
	            {
		            uint8 current  = PChar->m_questLog[logid].current [quest/8] & (1 << (quest % 8));
		            uint8 complete = PChar->m_questLog[logid].complete[quest/8] & (1 << (quest % 8));

                    if (complete == 0 && current != 0)
                    {
		                PFish = new CItemFish(*itemutils::GetItemPointer(Sql_GetIntData(SqlHandle,0)));

					    PChar->UContainer->SetType(UCONTAINER_FISHING);
					    PChar->UContainer->SetItem(0, PFish);
                        
                        // got my quested fish
                        caughtQuestedFish = true;
					    break;
                    }
	            }
                fishCounter++;
                // TODO: ловля простых предметов
            }
            
            if (!caughtQuestedFish)
            {
                int32 luckyFish = dsprand::GetRandomNumber((int32)Sql_NumRows(SqlHandle));
                PFish = new CItemFish(*itemutils::GetItemPointer(fishIDs[luckyFish]));

                PChar->UContainer->SetType(UCONTAINER_FISHING);
                PChar->UContainer->SetItem(0, PFish);
            }
		}						
	}
	else
	{
        // fishes with min 90 max 100 , are the legendary / mythical
        // added filter so player can only get chance to fish within min gap off his skill

		const char* Query = 
            "SELECT "
                "fish.fishid,"      // 0
                "fish.min,"         // 1
                "fish.max,"         // 2
                "fish.size,"        // 3
                "fish.stamina,"     // 4
                "fish.watertype,"   // 5
                "rod.flag, "        // 6
                "lure.luck "        // 7
            "FROM fishing_zone AS zone "
            "INNER JOIN fishing_rod  AS rod  USING (fishid) "
			"INNER JOIN fishing_lure AS lure USING (fishid) "
			"INNER JOIN fishing_fish AS fish USING (fishid) "
			"WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck != 0 AND fish.min <= %u "
			"ORDER BY luck"; 
		
		int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone(), RodID, LureID, playerFishingSkill);

		if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
			int32 FisherLuck = 0;
            int32 FishingChance = dsprand::GetRandomNumber(1000);

			while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
			{
				FisherLuck += Sql_GetIntData(SqlHandle,7);

				if (FishingChance <= FisherLuck)
				{
					PFish = new CItemFish(*itemutils::GetItemPointer(Sql_GetIntData(SqlHandle,0)), Sql_GetIntData(SqlHandle, 1), Sql_GetIntData(SqlHandle, 2));

					PChar->UContainer->SetType(UCONTAINER_FISHING);
					PChar->UContainer->SetItem(0, PFish);
					break;
				}	
			}
		}
	}

	return (PFish != nullptr);
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
	DSP_DEBUG_BREAK_IF(PLure->getSkillType() != SKILL_FISHING);

	if (!RemoveFly &&
	   ( PLure->getStackSize() == 1))
	{
		return false;
	}
	if (PLure->getQuantity() == 1)
	{
		charutils::EquipItem(PChar, 0, SLOT_AMMO, LOC_INVENTORY);
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
	CItem* PRod   = PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

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

int32 doFishingSkillUp(CCharEntity* PChar)
{
    CItemFish* PIFish = (CItemFish*)PChar->UContainer->GetItem(0);

    uint8  skillRank = PChar->RealSkills.rank[SKILL_FISHING];
    uint16 maxSkill = (skillRank + 1) * 100;

    int32  charSkill = PChar->RealSkills.skill[SKILL_FISHING];
    int32  baseDiff = PIFish->GetMax() - charSkill / 10;

    if (charSkill < maxSkill && baseDiff > 0)
    {
        // higher the baseDiff, lower the chance
        double difChance = (double)(100 - baseDiff) / 100;

        double skillUpChance = difChance * ((map_config.craft_chance_multiplier - (log(1.2 + charSkill / 100)))) / 10;

        // Apply synthesis skill gain rate modifier before synthesis fail modifier
        int16 modSynthSkillGain = PChar->getMod(Mod::SYNTH_SKILL_GAIN);
        skillUpChance += (double)modSynthSkillGain * 0.01;

        double random = dsprand::GetRandomNumber(1.);
#ifdef _DSP_SYNTH_DEBUG_MESSAGES_
        ShowDebug(CL_CYAN"Skill up chance: %g  Random: %g\n" CL_RESET, skillUpChance, random);
#endif

        if (random < skillUpChance)
        {
            int32  satier = 0;
            int32  skillAmount = 1;
            double chance = 0;

            if ((baseDiff >= 1) && (baseDiff < 11))
                satier = 1;
            else if ((baseDiff >= 11) && (baseDiff < 21))
                satier = 2;
            else if ((baseDiff >= 21) && (baseDiff < 31))
                satier = 3;
            else if ((baseDiff >= 31) && (baseDiff < 41))
                satier = 4;
            else if (baseDiff >= 41)
                satier = 5;

            for (uint8 i = 0; i < 4; i++)
            {
                random = dsprand::GetRandomNumber(1.);
#ifdef _DSP_SYNTH_DEBUG_MESSAGES_
                ShowDebug(CL_CYAN"SkillAmount Tier: %i  Random: %g\n" CL_RESET, satier, random);
#endif

                switch (satier)
                {
                case 5:  chance = 0.900; break;
                case 4:  chance = 0.700; break;
                case 3:  chance = 0.500; break;
                case 2:  chance = 0.300; break;
                case 1:  chance = 0.200; break;
                default: chance = 0.000; break;
                }

                if (chance < random)
                    break;

                skillAmount++;
                satier--;
            }

            // Do craft amount multiplier
            if (map_config.craft_amount_multiplier > 1)
            {
                skillAmount += (int32)(skillAmount * map_config.craft_amount_multiplier);
                if (skillAmount > 9)
                {
                    skillAmount = 9;
                }
            }

            if ((skillAmount + charSkill) > maxSkill)
            {
                skillAmount = maxSkill - charSkill;
            }

            PChar->RealSkills.skill[SKILL_FISHING] += skillAmount;
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FISHING, skillAmount, 38));

            if ((charSkill / 10) < (charSkill + skillAmount) / 10)
            {
                PChar->WorkingSkills.skill[SKILL_FISHING] += 0x20;

                PChar->pushPacket(new CCharSkillsPacket(PChar));
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FISHING, (charSkill + skillAmount) / 10, 53));
            }

            charutils::SaveCharSkills(PChar, SKILL_FISHING);
        }
    }

    return 0;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

void FishingAction(CCharEntity* PChar, FISHACTION action, uint16 stamina, uint32 special)
{
	uint16 MessageOffset = GetMessageOffset(PChar->getZone());

	switch (action) 
	{
		case FISHACTION_CHECK:
		{
			if (CheckFisherLuck(PChar))
			{
				// сообщение: "Something caught the hook!"
			
				//PChar->animation = ANIMATION_FISHING_FISH;
                //PChar->updatemask |= UPDATE_HP;
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x08));
                PChar->pushPacket(new CFishingPacket(10128, 128, 20, 500, 13, 140, 60, 0, 0));
			}
			else
			{
				// сообщение: "You didn't catch anything."

				PChar->animation = ANIMATION_FISHING_STOP;
                PChar->updatemask |= UPDATE_HP;
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x04));
			}
		}
		break;
		case FISHACTION_FINISH:
		{
			if (stamina == 0)
			{
				// сообщение: "You caught fish!"

				DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
				DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == nullptr);

				PChar->animation = ANIMATION_FISHING_CAUGHT;
                PChar->updatemask |= UPDATE_HP;

                CItem * PFish = PChar->UContainer->GetItem(0);
                CItemFish * PIFish = (CItemFish*)PChar->UContainer->GetItem(0);

                #ifdef _DSP_SYNTH_DEBUG_MESSAGES_
                  ShowDebug(CL_BG_GREEN"player skill got fish with min = %u max = %u\n" CL_RESET, PIFish->GetMin(), PIFish->GetMax());
                #endif

                // TODO: анализируем RodFlag

				charutils::AddItem(PChar, LOC_INVENTORY, PFish->getID(), 1);
                PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageNamePacket(PChar, MessageOffset + 0x27, PChar, PFish->getID()));

                if (PFish->isType(ITEM_USABLE))
                {
                    LureLoss(PChar, false);
                }

                doFishingSkillUp(PChar);

                //if there's a daily limit, then update player fish count
                if (map_config.fishing_daily_limit != 0)
                {
                    PChar->fishingCatches += 1;
                    charutils::SetVar(PChar, "FishingCatches", PChar->fishingCatches);
                }

                delete PFish;
			}
			else if (stamina <= 0x64)
			{
				// сообщение: "Your line breaks!"
	
				PChar->animation = ANIMATION_FISHING_LINE_BREAK;
                PChar->updatemask |= UPDATE_HP;
				LureLoss(PChar, true);
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x06));
			}
			else if (stamina <= 0x100)
			{
				// сообщение: "You give up!"

				PChar->animation = ANIMATION_FISHING_STOP;
                PChar->updatemask |= UPDATE_HP;

				if (PChar->UContainer->GetType() == UCONTAINER_FISHING &&
					LureLoss(PChar, false))
				{
					PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x24));
				} else {
					PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x25));
				}
			}
			else
			{
				// сообщение: "You lost your catch!"

				PChar->animation = ANIMATION_FISHING_STOP;
                PChar->updatemask |= UPDATE_HP;
				LureLoss(PChar, false);
				PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x09));
			}
			PChar->UContainer->Clean();
		}
		break;
		case FISHACTION_WARNING:
		{
			// сообщение: "You don't know how much longer you can keep this one on the line..."

			PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x28));
			return;
		}
		break;
		case FISHACTION_END:
		{
			// skillup

			PChar->animation = ANIMATION_NONE;
            PChar->updatemask |= UPDATE_HP;
		}
		break;
	}
			
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
}

} // namespace fishingutils
