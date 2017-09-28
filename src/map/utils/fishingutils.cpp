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
#include "../entities/mobentity.h"
#include "../ai/ai_container.h"
#include "../enmity_container.h"

#include "../packets/caught_fish.h"
#include "../packets/char_update.h"
#include "../packets/char_sync.h"
#include "../packets/char_skills.h"
#include "../packets/fishing.h"
#include "../packets/inventory_finish.h"
#include "../packets/message_text.h"
#include "../packets/message_special.h"
#include "../packets/release.h"
#include "../packets/message_system.h"

#include "battleutils.h"
#include "charutils.h"
#include "fishingutils.h"
#include "itemutils.h"
#include "../map.h"
#include "../vana_time.h"
#include "zoneutils.h"
#include "../../common/timer.h"


namespace fishingutils
{

    /************************************************************************
    *									*
    *  Массив смещений для сообщений рыбалки				*
    *  Array of offsets for fishing messages				*
    *									*
    ************************************************************************/
    uint16 MessageOffset[MAX_ZONEID];

    void LoadFishingMessages()
    {
        zoneutils::ForEachZone([](CZone* PZone)
		{
            MessageOffset[PZone->GetID()] = luautils::GetTextIDVariable(PZone->GetID(), "FISHING_MESSAGE_OFFSET");
        });
    }

    /************************************************************************
    *									*
    *  Получение смещения для сообщений рыбалки				*
    *  Receiving messages bias fishing					*
    *									*
    ************************************************************************/
    uint16 GetMessageOffset(uint16 ZoneID)
    {
        return MessageOffset[ZoneID];
    }

    /* Fishing Message Offsets
    MessageOffset + 0x01 - You can't fish without a rod in your hands.
    MessageOffset + 0x02 - You can't fish without bait on the hook.
    MessageOffset + 0x03 - You can't fish at the moment.
    MessageOffset + 0x04 - You didn't catch anything.
    MessageOffset + 0x05 - <blank> caught a monster!
    MessageOffset + 0x06 - Your line breaks.
    MessageOffset + 0x07 - Your rod breaks.
    MessageOffset + 0x08 - Something Caught the hook!
    MessageOffset + 0x09 - You lost your catch.
    MessageOffset + 0x0A - <blank> caught <blank>, but cannot carry any more items.
    MessageOffset + 0x0B - <blank> <blank> regretfully releases the <blank>.
    MessageOffset + 0x11 - Your rod breaks\n  Whatever caught the hook was pretty big.
    MessageOffset + 0x12 - Your rod breaks\n  Whatever caught the hook was too heavy to catch with this rod.
    MessageOffset + 0x13 - You lost your catch.\n  Whatever caught the hook was too small to catch with this rod.
    MessageOffset + 0x14 - You lost your catch due to lack of skill.
    MessageOffset + 0x24 - You give up and reel in your line.
    MessageOffset + 0x25 - You give up.
    MessageOffset + 0x26 - <blank> obtains 0 gil.
    MessageOffset + 0x27 - <blank> caught <blank>!
    MessageOffset + 0x28 - You don't know how much longer you can keep this one on the line...
    MessageOffset + 0x29 - You have a good feeling about this one!
    MessageOffset + 0x2A - You have a bad feeling about this one.
    MessageOffset + 0x2B - You have a terrible feeling abou this one...
    MessageOffset + 0x2C - You don't know if you have enough skill to reel this one in.
    MessageOffset + 0x2D - You're fairly sure you don't have enough skill to reel this one in.
    MessageOffset + 0x2E - You're positive you don't have enough skill to reel this one in!
    MessageOffset + 0x32 - Something caught the hook!!!
    MessageOffset + 0x33 - You feel something pulling at your line.
    MessageOffset + 0x34 - Something clamps onto your line ferociously!
    MessageOffset + 0x35 - Your keen angler's senses tell you that this is the pull of <blank>!
    MessageOffset + 0x36 - This strength... You get the sense that you are on the verge of an epic catch!
    MessageOffset + 0x3C - You lost your catch.\n  Whatever caught the hook was too large to catch with this rod.
    MessageOffset + 0x40 - <blank> fishes up a large box!
    */

    //
    // Utility Functions. //
    //

    //-------------------------------------------------------------------------//
    bool lureLoss(CCharEntity* PChar, bool RemoveFly)
    {
        CItemWeapon* PLure = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);

        DSP_DEBUG_BREAK_IF(PLure == nullptr);
        DSP_DEBUG_BREAK_IF(PLure->isType(ITEM_WEAPON) == false);
        DSP_DEBUG_BREAK_IF(PLure->getSkillType() != SKILL_FISHING);

        if (!RemoveFly && (PLure->getStackSize() == 1))
            return false;

        if (PLure->getQuantity() == 1)
        {
		    charutils::EquipItem(PChar, 0, SLOT_AMMO, LOC_INVENTORY);
        }

        charutils::UpdateItem(PChar, PLure->getLocationID(), PLure->getSlotID(), -1);
        PChar->pushPacket(new CInventoryFinishPacket());
        return true;
    }

    void rodBreaks(CCharEntity* PChar)
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

    void setCaughtMonster(CCharEntity* PChar, uint32 mobid)
    {
        PChar->SetLocalVar("CaughtMonster", mobid);
    }

    void resetCaughtMonster(CCharEntity* PChar)
    {
        PChar->SetLocalVar("CaughtMonster", 0);
    }

    auto getCaughtMonster(CCharEntity* PChar)
    {
        return PChar->GetLocalVar("CaughtMonster");
    }

    bool checkMonsterLuck(CCharEntity* PChar, uint16 lureID)
    {
        uint32 mobid = 0;
        if (PChar->loc.zone->GetType() == ZONETYPE_CITY || dsprand::GetRandomNumber(100) < 95)  //monster chance may need verification
            return false;

        uint16 zoneID = PChar->loc.zone->GetID();

        int32 ret = Sql_Query(SqlHandle, "SELECT mobid FROM fishing_mobs WHERE zone = %u;", zoneID);
        if (ret != SQL_ERROR || Sql_NumRows(SqlHandle) != 0)
        {
            uint16 monster = dsprand::GetRandomNumber(1, (int)Sql_NumRows(SqlHandle));
            uint16 mCount = 1;

            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (mCount == monster)
                {
                    mobid = Sql_GetIntData(SqlHandle, 0);

                    // The ONLY fished notorious monster.
                    if (zoneID == 151) // Castle Oztroja.
                    { 
                        if ((mobid == 17396141 || mobid == 17182721) && (lureID == 17001))
                        {
                            // Paladin AF2 Feet NM: Odontotyrannus + Giant Shell Bug. //
                            int8 questState = 0;
                            float playerPosY = PChar->loc.p.y;
                            ret = Sql_Query(SqlHandle, "SELECT value FROM char_vars WHERE charid = %u AND varname = 'aBoysDreamCS';", PChar->id);
                            if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                                questState = Sql_GetIntData(SqlHandle, 0);

                            if (questState < 3 || questState > 4 || ((playerPosY < 22) && (playerPosY > 24))) // Player is not at a point where they can fish up this monster.
                                return false;
                        }
                        else
                            return false;
                    }

                    setCaughtMonster(PChar, mobid);
                    return true;
                }
                mCount++;
            }
        }
        return false;
    }

    bool checkFisherLuck(CCharEntity* PChar, uint16 rodID, uint16 lureID)
    {
        CItemFish* PFish = nullptr;

        const int8* Query =
            "SELECT "
            "fish.fishid, "
            "lure.luck "
            "FROM fishing_zone AS zone "
            "INNER JOIN fishing_rod  AS rod  USING (fishid) "
            "INNER JOIN fishing_lure AS lure USING (fishid) "
            "INNER JOIN fishing_fish AS fish USING (fishid) "
            "WHERE zone.zoneid = %u AND rod.rodid = %u AND lure.lureid = %u AND lure.luck != 0 "
            "ORDER BY luck;";
        int32 ret = Sql_Query(SqlHandle, Query, PChar->getZone(), rodID, lureID);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (dsprand::GetRandomNumber(600) <= Sql_GetIntData(SqlHandle, 1))
                {
                    PFish = new CItemFish(*itemutils::GetItemPointer(Sql_GetIntData(SqlHandle, 0)));

                    PChar->UContainer->SetType(UCONTAINER_FISHING);
                    PChar->UContainer->SetItem(0, PFish);
                    return true;
                }
            }
        }
        return false;
    }

    int32 fishingSkillUp(CCharEntity* PChar, uint8 special) {
        DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
        DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == nullptr);

		if (special < 20)
		{
            return 0;
        }
		
        CItem* PFish = PChar->UContainer->GetItem(0);

        uint8 skillRank = PChar->RealSkills.rank[SKILL_FISHING];
        uint16 maxSkill = (skillRank + 1) * 100;
        int32 charSkill = PChar->RealSkills.skill[SKILL_FISHING];
        uint16 fishMinSkill = 0;
        uint16 fishMaxSkill = 0;
        double skillUpChance = 0;
        int32 skillUpAmount = 0;
        double random = dsprand::GetRandomNumber(1.);

        int32 ret = Sql_Query(SqlHandle, "SELECT min, max FROM fishing_fish WHERE fishid = %u;", PFish->getID());
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
		{
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
			{
                fishMinSkill = Sql_GetIntData(SqlHandle, 0);
                fishMaxSkill = Sql_GetIntData(SqlHandle, 1);
            }
        }

        if (((charSkill / 10) < (maxSkill / 10)) && ((charSkill / 10) < fishMaxSkill))
		{
            // Player must be beneath their rank cap, and less than the fish's maximum skill level. //
            if (((charSkill / 10) >= fishMinSkill) && ((charSkill / 10) < fishMaxSkill))
			{
                // Player is between the fish min and max skill level, so increase chance of skill up. //
                skillUpChance = (map_config.craft_chance_multiplier - (log(1 + charSkill / 100))) / 9;
				skillUpAmount += 1;
            }
            else if (((charSkill / 10) < fishMaxSkill))
			{
                // Player is below the fish's maximum skill, so increase chance of skill up. //
                skillUpChance = (map_config.craft_chance_multiplier - (log(1 + charSkill / 100))) / 10;
				skillUpAmount += 2;
            }

            if (random < skillUpChance)
			{
                skillUpAmount += 1;
            }

            if (map_config.craft_amount_multiplier > 1)
			{
                skillUpAmount += skillUpAmount * map_config.craft_amount_multiplier;
                if (skillUpAmount > 9)
				{
                    skillUpAmount = 9;
                }
            }
            if ((skillUpAmount + charSkill) > maxSkill)
			{
                skillUpAmount = maxSkill - charSkill;
            }

            PChar->RealSkills.skill[SKILL_FISHING] += skillUpAmount;
            PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FISHING, skillUpAmount, 38));

			if ((charSkill/10) < (charSkill + skillUpAmount) / 10)
			{
                PChar->WorkingSkills.skill[SKILL_FISHING] += 0x20;
                PChar->pushPacket(new CCharSkillsPacket(PChar));
                PChar->pushPacket(new CMessageBasicPacket(PChar, PChar, SKILL_FISHING, (charSkill + skillUpAmount) / 10, 53));
            }

            charutils::SaveCharSkills(PChar, SKILL_FISHING);
        }
        return 0;
    }

    //
    // Mini-game Handler. //
    //

    /************************************************************************
    *																		*
    *  Проверяем наличие удочки, наживки и возможности ловли				*
    *  Checks for rod, bait, and fishing opportunities						*
    *																		*
    ************************************************************************/
    void StartFishing(CCharEntity* PChar)
    {
        resetCaughtMonster(PChar);

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
        if ((WeaponItem == nullptr) || !(WeaponItem->isType(ITEM_WEAPON)) || (WeaponItem->getSkillType() != SKILL_FISHING))
        {
            // Message: "You can't fish without a rod in your hands"
            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x01));
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
            return;
        }

        WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);
        if ((WeaponItem == nullptr) || !(WeaponItem->isType(ITEM_WEAPON)) || (WeaponItem->getSkillType() != SKILL_FISHING))
        {
            // Message: "You can't fish without bait on the hook"
            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x02));
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
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
    *  Character breaks bait												*
    *																		*
    ************************************************************************/

    void FishingAction(CCharEntity* PChar, FISHACTION action, uint16 fightStamina, uint32 special)
    {
        uint16 MessageOffset = GetMessageOffset(PChar->getZone());

        switch (action)
        {
            case FISHACTION_CHECK:
            {
                if (PChar->UContainer->GetType() != UCONTAINER_EMPTY)
                {
                    ShowDebug(CL_CYAN"Attempt to fish but UContainer was not empty, Cleaning...\n" CL_RESET);
                    PChar->UContainer->Clean();
                }

                CItemWeapon* WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
                CItemWeapon* AmmoItem = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);
                if ((WeaponItem == nullptr || WeaponItem->isType(ITEM_WEAPON) == false || WeaponItem->getSkillType() != SKILL_FISHING) ||
                    (AmmoItem == nullptr || AmmoItem->isType(ITEM_WEAPON) == false || AmmoItem->getSkillType() != SKILL_FISHING))
                {
                    ShowDebug(CL_CYAN"Attempt to fish with invalid equipment.\n" CL_RESET);
                    // Message: "You didn't catch anything."
                    PChar->animation = ANIMATION_FISHING_STOP;
                    PChar->updatemask |= UPDATE_HP;
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x04));
                    break;
                }


                if (checkMonsterLuck(PChar, AmmoItem->getID()))
                {
                    //New system does not use this animation
                    //PChar->animation = ANIMATION_FISHING_FISH;
                    //PChar->updatemask |= UPDATE_HP;

                    // Message: "Something caught the hook!!!" //
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x32));
                    // Message: "Something clamps onto your line ferociously!" //
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x34));
                    PChar->pushPacket(new CFishingPacket(3081, 128, 15, 500, 13, 140, 30, 1, 12)); //monster values may need verification
                }
                else if (checkFisherLuck(PChar, WeaponItem->getID(), AmmoItem->getID()))
                {
                    CItem* PFish = PChar->UContainer->GetItem(0);

                    uint8 rankSkill = PChar->RealSkills.rank[SKILL_FISHING];
                    uint16 rankSkillCap = (rankSkill + 1) * 100;
                    int32 charSkill = PChar->WorkingSkills.skill[SKILL_FISHING];
                    uint16 fishMinSkill = 0;
                    uint16 fishMaxSkill = 0;
                    uint16 fishSize = 0;
                    uint16 fishType = PFish->isType(ITEM_USABLE);
                    uint16 stamina = 0;
                    uint16 regen = 0;
                    uint16 response = 0;
                    uint16 gTime = 0;
                    uint16 rod = 0;
                    uint16 arrowLuck = 0;
                    uint16 arrowDelay = 13;
                    uint16 damage = 0;
                    uint16 miss = 0;

                    const int8* Query =
                        "SELECT "
                        "stamina,"		// 0
                        "regen,"		// 1
                        "response,"		// 2
                        "max_dmg,"		// 3
                        "miss_regen,"	// 4
                        "max_time,"		// 5
                        "min,"			// 6
                        "max,"			// 7
                        "size "			// 8
                        "FROM fishing_fish WHERE fishid = %u;";
                    int32 ret = Sql_Query(SqlHandle, Query, PFish->getID());

                    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                    {
                        stamina = Sql_GetIntData(SqlHandle, 0);
                        regen = Sql_GetIntData(SqlHandle, 1);
                        response = Sql_GetIntData(SqlHandle, 2);
                        damage = Sql_GetIntData(SqlHandle, 3);
                        miss = Sql_GetIntData(SqlHandle, 4);
                        gTime = Sql_GetIntData(SqlHandle, 5);
                        fishMinSkill = Sql_GetIntData(SqlHandle, 6);
                        fishMaxSkill = Sql_GetIntData(SqlHandle, 7);
                        fishSize = Sql_GetIntData(SqlHandle, 8);
                    }

                    if (!fishType)
                    {
                        // Message: "You feel something pulling at your line." //
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x33));
                    }
                    else if (fishSize == 1)
                    {
                        // Message: "Something caught the hook!!!" //
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x32));
                    }
                    else
                    {
                        // Message: "Something caught the hook!" //
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x08));
                    }

                    arrowLuck = dsprand::GetRandomNumber(100);
                    if ((fishMaxSkill - (charSkill / 10)) > 0)
                    {
                        uint8 lower = 0;
                        for (auto r = 0; r < 2; r++)
                        {
                            lower = dsprand::GetRandomNumber(100);
                            if (arrowLuck > lower)
                                arrowLuck = lower;
                        }
                    }
                    else if (((charSkill / 10) - fishMaxSkill) > 0)
                    {
                        uint8 upper = dsprand::GetRandomNumber(100);
                        if (arrowLuck < upper)
                            arrowLuck = upper;
                    }

                    if (arrowLuck >= 90 && ((charSkill / 10) > (fishMaxSkill - 5)))
                    {
                        // Message: "Your keen angler senses tell you this is ths pull of a <blank>!" //
                        PChar->pushPacket(new CMessageSpecialPacket(PChar, MessageOffset + 0x35, PFish->getID(), 0, 0, 0, 0));
                        rod = 0x02;
                    }
                    else if (arrowLuck >= 80 && ((charSkill / 10) > (fishMaxSkill - 10)) && !fishType)
                    {
                        // Message: "You have a good feeling about this one."
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x29));
                        rod = 0x00;
                    }

                    //New system does not use this animation
                    //PChar->animation = ANIMATION_FISHING_FISH;
                    //PChar->updatemask |= UPDATE_HP;
                    PChar->pushPacket(new CFishingPacket(stamina, regen, response, damage, arrowDelay, miss, gTime, rod, arrowLuck));
                }
                else
                {
                    // Message: "You didn't catch anything."
                    PChar->animation = ANIMATION_FISHING_STOP;
                    PChar->updatemask |= UPDATE_HP;
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x04));
                }
                break;
            }
            case FISHACTION_FINISH:
            {
                if (fightStamina == 0)
                {
                    uint32 mobid = getCaughtMonster(PChar);
                    if (mobid > 0)
                    {
                        CMobEntity* PMob = nullptr;
                        PMob = (CMobEntity*)zoneutils::GetEntity(mobid, TYPE_MOB);
                        if (PMob && PMob->m_Type & MOBTYPE_FISHED && !PMob->PAI->IsSpawned())
                        {
                            PMob->m_SpawnPoint = nearPosition(PChar->loc.p, 2.2f, M_PI);
                            PMob->m_AllowRespawn = false;
                            PMob->Spawn();
                            battleutils::ClaimMob((CBattleEntity*)PMob, (CBattleEntity*)PChar);
                        }
						
                        // Message: "<blank> caught a monster!" //
                        PChar->animation = ANIMATION_FISHING_MONSTER;
                        PChar->updatemask |= UPDATE_HP;
                        PChar->pushPacket(new CMessageSpecialPacket(PChar, MessageOffset + 0x05, 0, 0, 0, 0, true));
                    }
                    else
                    {
                        // Message: "You caught fish!" //
                        DSP_DEBUG_BREAK_IF(PChar->UContainer->GetType() != UCONTAINER_FISHING);
                        DSP_DEBUG_BREAK_IF(PChar->UContainer->GetItem(0) == nullptr);
                        CItemWeapon* WeaponItem = nullptr;
                        WeaponItem = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
                        uint16 RodID = WeaponItem->getID();

                        CItem* PFish = PChar->UContainer->GetItem(0);
                        uint8 rankSkill = PChar->RealSkills.rank[SKILL_FISHING];
                        uint16 rankSkillCap = (rankSkill + 1) * 100;
                        int32 charSkill = PChar->RealSkills.skill[SKILL_FISHING];
                        int32 fishMinSkill = 0;
                        int32 fishMaxSkill = 0;
                        int32 rodbreak = 0;
                        int32 breakpercent = 0;

                        int32 ret = Sql_Query(SqlHandle, "SELECT min, max FROM fishing_fish WHERE fishid = %u;", PFish->getID());
                        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                        {
                            fishMinSkill = Sql_GetIntData(SqlHandle, 0);
                            fishMaxSkill = Sql_GetIntData(SqlHandle, 1);
                        }

                        ret = Sql_Query(SqlHandle, "SELECT break FROM fishing_rod_break WHERE fishid = %u and rodid = %u;", PFish->getID(), RodID);
                        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
                            rodbreak = Sql_GetIntData(SqlHandle, 0);

                        if (rodbreak == 1)
                        {
                            breakpercent = dsprand::GetRandomNumber(100);
                            if (breakpercent >= 25)
                            {
                                // Message: Your rod breaks\n  Whatever caught the hook was too heavy to catch with this rod.
                                PChar->animation = ANIMATION_FISHING_ROD_BREAK;
                                PChar->updatemask |= UPDATE_HP;
                                rodBreaks(PChar);
                                PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x12));
                            }
                        }
                        else if (((charSkill / 10 + ((charSkill / 10) * 0.5)) < fishMinSkill) && (special < 10))
                        {
                            // Message: "You lost your catch due to lack of skill." //
                            PChar->animation = ANIMATION_FISHING_STOP;
                            PChar->updatemask |= UPDATE_HP;
                            lureLoss(PChar, false);
                            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x14));
                        }
                        else
                        {
                            // Message: "You caught <blank>" //
                            // TODO: Analyze RodFlag
                            PChar->animation = ANIMATION_FISHING_CAUGHT;
                            PChar->updatemask |= UPDATE_HP;

                            charutils::AddItem(PChar, LOC_INVENTORY, PFish->getID(), 1);
                            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, PFish->getID(), MessageOffset + 0x27));
                            if (PFish->isType(ITEM_USABLE))
                            {
                                lureLoss(PChar, false);
                            }

							if (((charSkill / 10) < fishMaxSkill) && ((charSkill / 10) < (rankSkillCap / 10)))
                            {
                                // If the player's skill level is less than the fish's maximum skill level,
                                // and, the player's skill level is less than the player's rank skill cap.
                                if ((fishMinSkill > (charSkill / 10)) && (special > 40))
                                {
                                    // If the fish's minimum skill level is greater than the player's skill level,
                                    // but the player maintained a high special greater than 50. //
                                    fishingSkillUp(PChar, special);
                                }
                                else if ((fishMaxSkill / 4) < (charSkill / 10))
                                {
                                    if (((special % 3) == 0) || (special > 40))
                                        fishingSkillUp(PChar, special);
                                }
                                else
                                {
                                    if (((special % 3) == 0) || (special > 50))
                                        fishingSkillUp(PChar, special);
                                }
							}
                        }
                        delete PFish;
                    }
                }
                else if (fightStamina <= 0x64)
                {
                    // Message: "Your line breaks!" //
                    PChar->animation = ANIMATION_FISHING_LINE_BREAK;
                    PChar->updatemask |= UPDATE_HP;

                    lureLoss(PChar, true);
                    resetCaughtMonster(PChar);
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x06));
                }
                else if (fightStamina <= 0x100)
                {
                    // Message: "You give up!" //
                    PChar->animation = ANIMATION_FISHING_STOP;
                    PChar->updatemask |= UPDATE_HP;

                    resetCaughtMonster(PChar);
                    if (PChar->UContainer->GetType() == UCONTAINER_FISHING && lureLoss(PChar, false))
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x24));
                    else
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x25));
                }
                else
                {
                    // Message: "You lost your catch!"
                    PChar->animation = ANIMATION_FISHING_STOP;
                    PChar->updatemask |= UPDATE_HP;

                    lureLoss(PChar, false);
                    resetCaughtMonster(PChar);
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x09));
                }
                PChar->UContainer->Clean();
                break;
            }
            case FISHACTION_WARNING:
            {
                // Message: "You don't know how much longer you can keep this one on the line..." //
                PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + 0x28));
                return;
            }
            case FISHACTION_END:
            {
                PChar->animation = ANIMATION_NONE;
                PChar->updatemask |= UPDATE_HP;
                resetCaughtMonster(PChar);
                break;
            }
        }

        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }

} // namespace fishingutils