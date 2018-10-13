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
#include <math.h>
#include <iomanip>      // std::setprecision

#include "../universal_container.h"
#include "../item_container.h"

#include "../lua/luautils.h"

#include "../packets/caught_fish.h"
#include "../packets/caught_monster.h"
#include "../packets/char_update.h"
#include "../packets/char_skills.h"
#include "../packets/char_sync.h"
#include "../packets/fishing.h"
#include "../packets/inventory_finish.h"
#include "../packets/message_name.h"
#include "../packets/message_text.h"
#include "../packets/release.h"
#include "../packets/message_system.h"
#include "../packets/message_special.h"
#include "../packets/entity_animation.h"

#include "../entities/battleentity.h"
#include "../entities/mobentity.h"


#include "../enmity_container.h"

#include "../status_effect_container.h"
#include "../status_effect.h"

#include "../ai/ai_container.h"

#include "battleutils.h"
#include "charutils.h"
#include "fishingutils.h"
#include "itemutils.h"
#include "../map.h"
#include "../vana_time.h"
#include "zoneutils.h"


namespace fishingutils
{

    uint16 MessageOffset[MAX_ZONEID];

    void LoadFishingMessages()
    {
        zoneutils::ForEachZone([](CZone* PZone) {
            MessageOffset[PZone->GetID()] = luautils::GetTextIDVariable(PZone->GetID(), "FISHING_MESSAGE_OFFSET");
        });
    }
        
    uint16 GetMessageOffset(uint16 ZoneID)
    {
        return MessageOffset[ZoneID];
    }

    //
    //  Take away bait/lure
    //
    bool LureLoss(CCharEntity* PChar, bool RemoveFly)
    {
        CItemWeapon* PLure = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);

        DSP_DEBUG_BREAK_IF(PLure == nullptr);
        DSP_DEBUG_BREAK_IF(PLure->isType(ITEM_WEAPON) == false);
        DSP_DEBUG_BREAK_IF(PLure->getSkillType() != SKILL_FISHING);

        if (!RemoveFly &&
            (PLure->getStackSize() == 1))
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

    //
    //  Destroy rod, take away bait/lure
    //
    void RodBreaks(CCharEntity* PChar)
    {
        CItemWeapon* PRod = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
        
        DSP_DEBUG_BREAK_IF(PRod == nullptr);

        uint8 Breakable = 0;
        uint16 BrokenRodID = 0;
        int32 ret = Sql_Query(SqlHandle, "SELECT breakable,broken_rodid FROM `fishing_rod` WHERE rodid=%u", PRod->getID());

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS && Sql_GetUIntData(SqlHandle, 0) > 0)
        {
            Breakable = Sql_GetUIntData(SqlHandle, 0);
            BrokenRodID = Sql_GetUIntData(SqlHandle, 1);
        }

        if (Breakable > 0 && BrokenRodID > 0) {
            charutils::EquipItem(PChar, 0, SLOT_RANGED, LOC_INVENTORY);
            charutils::UpdateItem(PChar, LOC_INVENTORY, PRod->getSlotID(), -1);
            charutils::AddItem(PChar, LOC_INVENTORY, BrokenRodID, 1);
        }
    }

    //
    //  Can a Mob be Fished
    //
    bool CanFishMob(CMobEntity* PMob) {
        return (PMob != nullptr &&
            //PMob->isDead() &&
            !PMob->PAI->IsSpawned() &&
            PMob->GetLocalVar("Hooked") == 0);
    }

    //
    //  Fishing Area Bounds Tests
    //
    #define MAX_POINTS 10000
    // Given three colinear areavector_ts p, q, r, the function checks if areavector_t q lies on line segment 'pr'
    bool onSegment(areavector_t p, areavector_t q, areavector_t r)
    {
        if (q.x <= std::max(p.x, r.x) && q.x >= std::min(p.x, r.x) &&
            q.z <= std::max(p.z, r.z) && q.z >= std::min(p.z, r.z))
            return true;
        return false;
    }
    // To find orientation of ordered triplet (p, q, r).
    int orientation(areavector_t p, areavector_t q, areavector_t r)
    {
        float val = std::round(q.z - p.z) * (r.x - q.x) - (q.x - p.x) * (r.z - q.z);
        if (val == 0) return 0;  
        return (val > 0) ? 1 : 2; 
    }
    // The function that returns true if line segment 'p1q1' and 'p2q2' intersect.
    bool doIntersect(areavector_t p1, areavector_t q1, areavector_t p2, areavector_t q2)
    {
        int o1 = orientation(p1, q1, p2);
        int o2 = orientation(p1, q1, q2);
        int o3 = orientation(p2, q2, p1);
        int o4 = orientation(p2, q2, q1);

        if (o1 != o2 && o3 != o4) return true;

        if (o1 == 0 && onSegment(p1, p2, q1)) return true;
        if (o2 == 0 && onSegment(p1, q2, q1)) return true;
        if (o3 == 0 && onSegment(p2, p1, q2)) return true;
        if (o4 == 0 && onSegment(p2, q1, q2)) return true;

        return false; 
    }
    // Returns true if the areavector_t p lies inside the polygon[] with n vertices
    bool isInsidePoly(areavector_t polygon[], int n, areavector_t p, float posy, uint8 height)
    {
        if (p.y < (posy - (height / 2)) || p.y >(posy + (height / 2))) return false;
        if (n < 3)  return false;
        areavector_t extreme = { MAX_POINTS, p.z };
        int count = 0, i = 0;
        do
        {
            int next = (i + 1) % n;
            if (doIntersect(polygon[i], polygon[next], p, extreme))
            {
                if (orientation(polygon[i], p, polygon[next]) == 0)
                    return onSegment(polygon[i], p, polygon[next]);
                count++;
            }
            i = next;
        } while (i != 0);
        return count & 1; 
    }
    bool isInsideCylinder(areavector_t center, areavector_t p, uint16 radius, uint8 height) {
        if (p.y < (center.y - (height / 2)) || p.y >(center.y + (height / 2))) return false;
        float dx = std::abs(p.x - center.x);
        if (dx >  radius) return false;
        float dz = std::abs(p.z - center.z);
        if (dz >  radius) return false;
        if (dx + dz <= radius) return true;
        return (dx*dx + dz*dz <= radius*radius);
        return true;
    }

    //  
    //  Get fishing area if there is one
    //    
    fishingarea_t *GetFishingArea(CCharEntity* PChar) {
        int16 zoneId = PChar->getZone();
        position_t p = PChar->loc.p;
        areavector_t loc = { p.x, p.y, p.z };
        fishingarea_t *fishingArea = new fishingarea_t();

        int32 ret = Sql_Query(SqlHandle, "SELECT areaid,bound_type,bound_height,bounds,center_x,center_y,center_z,bound_radius,name FROM `fishing_area` WHERE zoneid=%u", zoneId);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                fishingArea->areaId = Sql_GetUIntData(SqlHandle, 0);
                fishingArea->areatype = Sql_GetUIntData(SqlHandle, 1);
                fishingArea->height = Sql_GetUIntData(SqlHandle, 2);
                fishingArea->center.x = Sql_GetFloatData(SqlHandle, 4);
                fishingArea->center.y = Sql_GetFloatData(SqlHandle, 5);
                fishingArea->center.z = Sql_GetFloatData(SqlHandle, 6);
                fishingArea->radius = Sql_GetUIntData(SqlHandle, 7);
                fishingArea->areaName.clear();
                fishingArea->areaName.insert(0, (const char*)Sql_GetData(SqlHandle, 8));

                switch (fishingArea->areatype) {
                case 0: // Whole Zone
                    printf("[NEWFISHING] GOT WHOLE ZONE : AREAID:%d\n", fishingArea->areaId);
                    return fishingArea;
                    break;
                case 1: // Radial Boundary                    
                    if (isInsideCylinder(fishingArea->center, loc, fishingArea->radius, fishingArea->height)) {
                        printf("[NEWFISHING] GOT RADIUS : AREAID:%d\n", fishingArea->areaId);
                        return fishingArea;
                    }
                    break;
                case 2: // Poly Boundary
                    size_t length = 0;
                    char* bounds = nullptr;

                    Sql_GetData(SqlHandle, 3, &bounds, &length);
                    fishingArea->numBounds = (uint8)length / sizeof(areavector_t);
                    fishingArea->bounds = new areavector_t[fishingArea->numBounds];

                    for (int i = 0; i < fishingArea->numBounds; i++) {
                        memcpy((void*)&fishingArea->bounds[i], &bounds[i * sizeof(areavector_t)], sizeof(areavector_t));
                    }

                    if (isInsidePoly(fishingArea->bounds, fishingArea->numBounds, loc, fishingArea->center.y, fishingArea->height)) {
                        printf("[NEWFISHING] GOT POLY : AREAID:%d\n", fishingArea->areaId);
                        return fishingArea;
                    }

                    break;
                }
            }
        }

        return NULL;
    }

    //
    //  Get Zone Fishable Mob Count
    //
    uint16 GetZoneFishableMobCount(CCharEntity* PChar) {
        int16 zoneId = PChar->getZone();
        fishingarea_t *area = GetFishingArea(PChar);
        areavector_t p = { PChar->loc.p.x,PChar->loc.p.y, PChar->loc.p.z };

        delete area;

        int32 ret = Sql_Query(SqlHandle, "SELECT count(mobid) FROM `fishing_mob` WHERE zoneid=%u", zoneId);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS && Sql_GetUIntData(SqlHandle, 0) > 0)
        {
            return Sql_GetUIntData(SqlHandle, 0);
        }

        delete area;

        return 0;
    }

    //
    //  Get Zone Fishable Item Count
    //
    uint16 GetZoneFishableItemCount(uint16 zoneId) {
        int32 ret = Sql_Query(SqlHandle, "SELECT count(fishid) FROM `fishing_fish` WHERE item=1 AND zoneid=%u", zoneId);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS && Sql_GetUIntData(SqlHandle, 0) > 0)
        {
            return Sql_GetUIntData(SqlHandle, 0);
        }
        return 0;
    }

    //
    //  Get Zone Fishable Fish Count
    //
    uint16 GetZoneFishableFishCount(uint16 zoneId) {
        int32 ret = Sql_Query(SqlHandle, "SELECT count(fishid) FROM `fishing_fish` WHERE item=0 AND zoneid=%u", zoneId);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS && Sql_GetUIntData(SqlHandle, 0) > 0)
        {
            return Sql_GetUIntData(SqlHandle, 0);
        }
        return 0;
    }

    std::vector<fish_t> *GetFishingAreaFish(uint16 zoneId, uint16 areaId, uint16 lureId)
    {
        std::vector<fish_t> *fishList = new std::vector<fish_t>();
        
        const char* Query =
            "SELECT "
            "distinct " 
            "ff.fishid, "               // 0
            "ff.name, "                 // 1
            "ff.min_skill_level, "      // 2
            "ff.skill_level, "          // 3
            "ff.size, "                 // 4
            "ff.base_delay, "           // 5
            "ff.base_move, "            // 6
            "ff.min_length, "           // 7
            "ff.max_length, "           // 8
            "ff.size_type, "            // 9
            "ff.water_type, "           // 10
            "ff.log, "                  // 11
            "ff.quest, "                // 12
            "ff.item, "                 // 13
            "ff.max_hook, "             // 14
            "ff.required_keyitem, "     // 15
            "ff.required_catches, "     // 16
            "fla.power "                // 17
            "FROM fishing_lure_affinity fla "
            "LEFT JOIN fishing_fish ff "
            "ON ff.fishid = fla.fishid "
            "WHERE(fla.lureid = %u || ff.item = 1) "
            "AND fla.fishid IN(select fg.fishid FROM fishing_group fg WHERE fg.groupid = (select groupid from fishing_catch where zoneid = %u and areaid = %u)) "
            "GROUP BY ff.fishid";

        int32 ret = Sql_Query(SqlHandle, Query, lureId, zoneId, areaId);
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                fish_t fish;
                fish.fishId = Sql_GetUIntData(SqlHandle, 0);
                fish.fishName.insert(0, (const char*)Sql_GetData(SqlHandle, 1));
                fish.minSkill = Sql_GetUIntData(SqlHandle, 2);
                fish.maxSkill = Sql_GetUIntData(SqlHandle, 3);
                fish.size = Sql_GetUIntData(SqlHandle, 4);
                fish.baseDelay = Sql_GetUIntData(SqlHandle, 5);
                fish.baseMove = Sql_GetUIntData(SqlHandle, 6);
                fish.minLength = Sql_GetUIntData(SqlHandle, 7);
                fish.maxLength = Sql_GetUIntData(SqlHandle, 8);
                fish.sizeType = Sql_GetUIntData(SqlHandle, 9);
                fish.waterType = Sql_GetUIntData(SqlHandle, 10);
                fish.log = Sql_GetUIntData(SqlHandle, 11);
                fish.quest = Sql_GetUIntData(SqlHandle, 12);
                fish.item = Sql_GetUIntData(SqlHandle, 13);
                fish.maxhook = Sql_GetUIntData(SqlHandle, 14);
                fish.reqKeyItem = Sql_GetUIntData(SqlHandle, 15);
                fish.lurePower = Sql_GetUIntData(SqlHandle, 17);
                fishList->push_back(fish);
                //fish->reqFish = Sql_GetUIntData(SqlHandle, 16); // need to parse this blob list
            }
        }

        return fishList;
    }

    std::vector<fishmob_t> *GetFishingAreaMobs(uint16 ZoneId) {
        std::vector<fishmob_t> *mobList = new std::vector<fishmob_t>();

        const char* Query =
            "SELECT "
            "mobid, "               // 0
            "name, "                // 1
            "level, "               // 2
            "size, "                // 3
            "base_delay, "          // 4
            "base_move, "           // 5
            "log, "                 // 6
            "quest, "               // 7
            "nm, "                  // 8
            "rarity, "              // 9
            "required_key_item "    // 10
            "FROM fishing_mob "
            "WHERE zoneid = %u ";
        int32 ret = Sql_Query(SqlHandle, Query, ZoneId);
        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                fishmob_t mob;
                mob.mobId = Sql_GetUIntData(SqlHandle, 0);
                mob.mobName.insert(0, (const char*)Sql_GetData(SqlHandle, 1));
                mob.level = Sql_GetUIntData(SqlHandle, 2);
                mob.size = Sql_GetUIntData(SqlHandle, 3);
                mob.baseDelay = Sql_GetUIntData(SqlHandle, 4);
                mob.baseMove = Sql_GetUIntData(SqlHandle, 5);
                mob.log = Sql_GetUIntData(SqlHandle, 6);
                mob.quest = Sql_GetUIntData(SqlHandle, 7);
                mob.nm = Sql_GetUIntData(SqlHandle, 8);
                mob.rarity = Sql_GetUIntData(SqlHandle, 9);
                mob.reqKeyItem = Sql_GetUIntData(SqlHandle, 10);
                mobList->push_back(mob);
            }
        }
        return mobList;
    }

    fishingrod_t *GetRod(uint16 RodID)
    {
        const char* Query =
            "SELECT "
            "rodid, "               // 0
            "name, "                // 1
            "material, "            // 2
            "min_fishsize, "        // 3
            "max_fishsize, "        // 4
            "fish_attack, "         // 5
            "lgd_bonus_attack, "    // 6
            "miss_regen, "          // 7
            "lgd_miss_regen, "      // 8
            "fish_time, "           // 9
            "lgd_bonus_time, "      // 10
            "sm_delay_Bonus, "      // 11
            "sm_move_bonus, "       // 12
            "lg_delay_bonus, "      // 13
            "lg_move_bonus, "       // 14
            "breakable, "           // 15
            "broken_rodid, "        // 16
            "mmm "                  // 17
            "FROM fishing_rod "
            "WHERE rodid = %u ";

        int32 ret = Sql_Query(SqlHandle, Query, RodID);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS && Sql_GetUIntData(SqlHandle, 0) > 0)
        {
            fishingrod_t *rod = new fishingrod_t();
            rod->rodId = Sql_GetUIntData(SqlHandle, 0);
            rod->rodName.insert(0, (const char*)Sql_GetData(SqlHandle, 1));
            rod->material = Sql_GetUIntData(SqlHandle, 2);
            rod->minFishSize = Sql_GetUIntData(SqlHandle, 3);
            rod->maxFishSize = Sql_GetUIntData(SqlHandle, 4);
            rod->fishAttack = Sql_GetUIntData(SqlHandle, 5);
            rod->lgdBonusAtk = Sql_GetUIntData(SqlHandle, 6);
            rod->missRegen = Sql_GetUIntData(SqlHandle, 7);
            rod->lgdMissRegen = Sql_GetUIntData(SqlHandle, 8);
            rod->fishTime = Sql_GetUIntData(SqlHandle, 9);
            rod->lgdBonusTime = Sql_GetUIntData(SqlHandle, 10);
            rod->smDelayBonus = Sql_GetUIntData(SqlHandle, 11);
            rod->smMoveBonus = Sql_GetUIntData(SqlHandle, 12);
            rod->lgDelayBonus = Sql_GetUIntData(SqlHandle, 13);
            rod->lgMoveBonus = Sql_GetUIntData(SqlHandle, 14);
            rod->breakable = Sql_GetUIntData(SqlHandle, 15);
            rod->brokenRodId = Sql_GetUIntData(SqlHandle, 16);
            rod->isMMM = Sql_GetUIntData(SqlHandle, 17);
            return rod;
        }
        return NULL;
    }

    //
    // Lose your catch
    //
    int32 LoseCatch(CCharEntity* PChar, uint8 FailType)
    {
        uint16 MessageOffset = GetMessageOffset(PChar->getZone());
        PChar->animation = ANIMATION_NEW_FISHING_STOP;
        PChar->updatemask |= UPDATE_HP;
        switch (FailType) {
        case FISHINGFAILTYPE_NONE:
        default:
            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_LOST));
            break;
        }
        return 1;
    }

    //
    // Fail to catch anything
    //
    int32 CatchNothing(CCharEntity* PChar, uint8 FailType)
    {
        uint16 MessageOffset = GetMessageOffset(PChar->getZone());
        PChar->animation = ANIMATION_NEW_FISHING_STOP;
        PChar->updatemask |= UPDATE_HP;
        switch (FailType) {
        case FISHINGFAILTYPE_NONE:
        default:
            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_NOCATCH));
            break;
        }
        return 1;
    }

    //
    // Catch a fish/item
    //
    int32 CatchFish(CCharEntity* PChar, uint16 FishID, uint8 Count = 1)
    {
        uint16 MessageOffset = GetMessageOffset(PChar->getZone());
        PChar->animation = ANIMATION_NEW_FISHING_CAUGHT;
        PChar->updatemask |= UPDATE_HP;

        if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() != 0) {
            charutils::AddItem(PChar, LOC_INVENTORY, FishID, Count);
            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, FishID, MessageOffset + FISHMESSAGEOFFSET_CATCH));
            return 1;
        }
        else {
            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtFishPacket(PChar, FishID, MessageOffset + FISHMESSAGEOFFSET_CATCH_INV_FULL));
        }
        return 0;
    }

    //
    // Spawn a monster behind player
    //
    int32 CatchMonster(CCharEntity* PChar, uint32 MobID)
    {
        uint16 MessageOffset = GetMessageOffset(PChar->getZone());

        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(MobID, TYPE_MOB);
        if (PMob == nullptr)
        {
            ShowError("Invalid MobID %i for fished monster\n", MobID);
            PChar->animation = ANIMATION_FISHING_STOP;
            PChar->updatemask |= UPDATE_HP;
            return 1;
        }
        //bool MobFishable = CanFishMob(PMob);
        //if (MobFishable)
        //{
            PChar->animation = ANIMATION_NEW_FISHING_MONSTER;
            PChar->updatemask |= UPDATE_HP;

            PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCaughtMonsterPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_MONSTER));
            position_t p = PChar->loc.p;
            position_t m;
            double Radians = p.rotation * M_PI / 128;
            m.x = p.x - 2.0f * (float)cos(Radians);
            m.y = p.y;
            m.z = p.z + 2.0f * (float)sin(Radians);
            m.rotation = getangle(m, p);
            //PMob->loc.p = m;
            PMob->m_SpawnPoint = m;
            PMob->Spawn();
            PMob->SetLocalVar("hooked", 0);
            if (!PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK))
            {
                PMob->PEnmityContainer->AddBaseEnmity(PChar);
                battleutils::ClaimMob((CMobEntity*)PMob, (CBattleEntity*)PChar);
            }

            //PChar->StatusEffectContainer->HasStatusEffect(EFFECT_SNEAK);
            return 1;
        //}
        //else {
        //    LoseCatch(PChar, FISHINGFAILTYPE_NONE);
        //}
        //return 0;
    }



    //
    //  Handle fishing skillup
    //
    void FishingSkillup(CCharEntity* PChar, uint8 catchLevel, uint8 successType)
    {
        if (successType == FISHINGSUCCESSTYPE_NONE)
            return;

        uint8  skillRank = PChar->RealSkills.rank[SKILL_FISHING];
        uint16 maxSkill = (skillRank + 1) * 100;
        int32  charSkill = PChar->RealSkills.skill[SKILL_FISHING];
        int32  charSkillLevel = (uint32)std::floor(PChar->RealSkills.skill[SKILL_FISHING] / 10);
        uint8 levelDifference = 0;
        int maxSkillAmount = 1;


        if (catchLevel > charSkillLevel) {
            levelDifference = catchLevel - charSkillLevel;
        }

        // No skillup if fish level not between char level and 40 levels higher
        if (catchLevel <= charSkillLevel || (levelDifference > 40)) {
            return;
        }

        int maxChance = 60;
        // Moon phase skillup modifiers
        uint8 phase = CVanaTime::getInstance()->getMoonPhase();
        if (CVanaTime::getInstance()->getMoonDirection() == 0)
        {
            if (phase == 100) { // Full, decrease skillup chance
                maxChance += 10;
            }
            if (phase == 0) {   // New, increase skillup chance
                maxChance -= 10;
            }
        }

        uint16 skillChance = 20;

        // Skill chance decreases as level difference gets higher
        skillChance -= (uint16)std::floor(levelDifference / 4); // (max 10)

        // Skill chance decreases as rank gets higher
        skillChance -= (uint16)std::floor(skillRank / 2); // max 5

        // Max skill amount increases as level difference gets higher
        const int skillAmountAdd = 1 + (int)std::floor(levelDifference / 10);
        maxSkillAmount = std::min(skillAmountAdd, 3);

        if (dsprand::GetRandomNumber(maxChance) < skillChance) {
            int32  skillAmount = dsprand::GetRandomNumber(1, maxSkillAmount);

            if ((skillAmount + charSkill) > maxSkill)
            {
                skillAmount = maxSkill - charSkill;
            }

            if (skillAmount > 0) {
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
    }


    /************************************************************************
    *																		*
    *						        FISHING    								*
    *																		*
    ************************************************************************/

    //
    //  Initiate fishing session for player
    //
    void StartFishing(CCharEntity* PChar)
    {
        CItemWeapon* Rod = nullptr;
        CItemWeapon* Bait = nullptr;
        uint8 FishingAreaID = 0;
        fishingarea_t *Area = GetFishingArea(PChar);

        FishingAreaID = (Area != NULL) ? Area->areaId : 0;

        if (PChar->hookedFish == NULL)
            PChar->hookedFish = new fishresponse_t();

        PChar->hookedFish->caught = false;
        PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_NONE;

        // If in the middle of something else, can't fish
        if (PChar->animation != ANIMATION_NONE)
        {
            PChar->pushPacket(new CMessageSystemPacket(0, 0, 142));
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
            return;
        }

        uint16 MessageOffset = GetMessageOffset(PChar->getZone());

        // If not able to pull the fishing message offset for the current zone, can't fish
        if (MessageOffset == 0)
        {
            ShowWarning(CL_YELLOW"Player wants to fish in %s\n" CL_RESET, PChar->loc.zone->GetName());
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
            return;
        }

        Rod = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
        Bait = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);

        // If no rod, then can't fish
        if ((Rod == nullptr) ||
            !(Rod->isType(ITEM_WEAPON)) ||
            (Rod->getSkillType() != SKILL_FISHING))
        {
            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_NOROD));
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
            return;
        }

        // If no bait, then can't fish
        if ((Bait == nullptr) ||
            !(Bait->isType(ITEM_WEAPON)) ||
            (Bait->getSkillType() != SKILL_FISHING))
        {
            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_NOBAIT));
            PChar->pushPacket(new CReleasePacket(PChar, RELEASE_FISHING));
            return;
        }

        // Call LUA callback
        luautils::OnFishingStart(PChar, Rod->getID(), Bait->getID(), FishingAreaID);

        // Start fishing animation
        PChar->animation = ANIMATION_NEW_FISHING_START;
        PChar->updatemask |= UPDATE_HP;

        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }

    //
    //  Handle fishing actions
    //
    void FishingAction(CCharEntity* PChar, FISHACTION action, uint16 stamina, uint32 special)
    {
        uint16 MessageOffset = GetMessageOffset(PChar->getZone());

        //luautils::OnFishingAction(PChar, action, stamina, special);

        switch (action)
        {
            case FISHACTION_CHECK:
            {
                fishingarea_t *fishingArea = GetFishingArea(PChar);
                fishresponse_t* response;

                if (fishingArea != NULL) {
                    printf("[FOUND FISHING AREA %d]\n", fishingArea->areaId);

                    CItemWeapon* Rod = nullptr;
                    CItemWeapon* Bait = nullptr;

                    Rod = (CItemWeapon*)PChar->getEquip(SLOT_RANGED);
                    Bait = (CItemWeapon*)PChar->getEquip(SLOT_AMMO);
                    std::vector<fish_t> *FishList = GetFishingAreaFish(PChar->getZone(),fishingArea->areaId,Bait->getID());
                    std::vector<fishmob_t> *MobList = GetFishingAreaMobs(PChar->getZone());
                    fishingrod_t *FishingRod = GetRod(Rod->getID());

                    response = luautils::OnFishingCheck(PChar, FishingRod, FishList, MobList, fishingArea->areaId, fishingArea->areaName);
                    PChar->hookedFish = response;
                }

                if (fishingArea != NULL && response != NULL && response->caught && response->catchtype > 0 && response->catchid > 0)
                {
                    // send catch message
                    switch (response->catchtype)
                    {
                    case FISHINGCATCHTYPE_SMALLFISH:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_HOOKED_SMALL_FISH));
                        break;
                    case FISHINGCATCHTYPE_BIGFISH:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_HOOKED_LARGE_FISH));
                        break;
                    case FISHINGCATCHTYPE_ITEM:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_HOOKED_ITEM));
                        break;
                    case FISHINGCATCHTYPE_MOB:
                        CMobEntity* PMob = (CMobEntity*)zoneutils::GetEntity(PChar->hookedFish->catchid, TYPE_MOB);
                        if (CanFishMob(PMob)) {
                            PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_HOOKED_MONSTER));
                            PMob->SetLocalVar("hooked", 1);
                        }
                        else {
                            CatchNothing(PChar, FISHINGFAILTYPE_NONE);
                        }
                        break;
                    }

                    // send angler's sense message
                    switch (response->sense)
                    {
                    case FISHINGSENSETYPE_GOOD:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_GOOD_FEELING));
                        break;
                    case FISHINGSENSETYPE_BAD:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_BAD_FEELING));
                        break;
                    case FISHINGSENSETYPE_TERRIBLE:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_TERRIBLE_FEELING));
                        break;
                    case FISHINGSENSETYPE_NOSKILL_FEELING:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_NOSKILL_FEELING));
                        break;
                    case FISHINGSENSETYPE_NOSKILL_SURE_FEELING:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_NOSKILL_SURE_FEELING));
                        break;
                    case FISHINGSENSETYPE_NOSKILL_POSITIVEFEELING:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_NOSKILL_POSITIVE_FEELING));
                        break;
                    case FISHINGSENSETYPE_KEEN_ANGLERS_SENSE:
                        PChar->pushPacket(new CMessageSpecialPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_KEEN_ANGLERS_SENSE, response->catchid, 3, 3, 3));
                        break;
                    case FISHINGSENSETYPE_EPIC_CATCH:
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_EPIC_CATCH));
                        break;
                    }

                    //play the sweating animation
                    PChar->pushPacket(new CEntityAnimationPacket(PChar, "hitl"));


                    //send the fishing packet
                    PChar->animation = ANIMATION_NEW_FISHING_FISH;
                    PChar->updatemask |= UPDATE_HP;
                    PChar->pushPacket(new CFishingPacket(response->stamina, response->regen, response->response, response->attackdmg, response->delay, response->heal, response->timelimit, response->hooksense, response->special));
                }
                else
                {
                    CatchNothing(PChar, FISHINGFAILTYPE_NONE);
                }
            }
            break;

            case FISHACTION_FINISH:
            {
                if (stamina <= 4)
                {
                    
                    luautils::OnFishingCatch(PChar, PChar->hookedFish->catchtype, PChar->hookedFish->catchid);

                    switch (PChar->hookedFish->catchtype)
                    {
                    case FISHINGCATCHTYPE_NONE:
                        PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_NONE;
                        CatchNothing(PChar, FISHINGFAILTYPE_NONE);
                        break;
                    case FISHINGCATCHTYPE_SMALLFISH:
                        PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_CATCHSMALL;
                        CatchFish(PChar, PChar->hookedFish->catchid, PChar->hookedFish->count);
                        break;
                    case FISHINGCATCHTYPE_BIGFISH:
                        PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_CATCHLARGE;
                        CatchFish(PChar, PChar->hookedFish->catchid, PChar->hookedFish->count);
                        break;
                    case FISHINGCATCHTYPE_ITEM:
                        PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_CATCHITEM;
                        CatchFish(PChar, PChar->hookedFish->catchid, PChar->hookedFish->count);
                        break;
                    case FISHINGCATCHTYPE_MOB:
                        PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_CATCHMOB;
                        CatchMonster(PChar, PChar->hookedFish->catchid);
                        break;
                    }

                }
                else if (stamina <= 0x14)
                {
                    // you lost the catch due to lack of skill
                    // lose bait but keep lure
                    PChar->animation = ANIMATION_NEW_FISHING_LINE_BREAK;
                    PChar->updatemask |= UPDATE_HP;
                    LureLoss(PChar, false);
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_LOST_LOWSKILL));
                }
                else if (stamina <= 0x64)
                {
                    // message: "Your line breaks!"

                    PChar->animation = ANIMATION_NEW_FISHING_LINE_BREAK;
                    PChar->updatemask |= UPDATE_HP;
                    LureLoss(PChar, true);
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_LINEBREAK));
                }
                else if (stamina <= 0x100)
                {
                    // message: "You give up!"

                    PChar->animation = ANIMATION_NEW_FISHING_STOP;
                    PChar->updatemask |= UPDATE_HP;

                    if (PChar->hookedFish && PChar->hookedFish->caught &&
                        LureLoss(PChar, false))
                    {
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_GIVEUP_BAITLOSS));
                    }
                    else {
                        PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_GIVEUP));
                    }
                }
                else
                {
                    // message: "You lost your catch!"

                    PChar->animation = ANIMATION_NEW_FISHING_STOP;
                    PChar->updatemask |= UPDATE_HP;

                    LureLoss(PChar, false);
                    PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_LOST));
                }
            }
            break;

            case FISHACTION_WARNING:
            {
                // message: "You don't know how much longer you can keep this one on the line..."

                PChar->pushPacket(new CMessageTextPacket(PChar, MessageOffset + FISHMESSAGEOFFSET_WARNING));
                return;
            }
            break;

            default:
            case FISHACTION_END:
            {
                // skillup
                //luautils::OnFishingEnd(PChar);
                FishingSkillup(PChar, PChar->hookedFish->catchlevel, PChar->hookedFish->successtype);
                PChar->hookedFish->caught = false;
                PChar->hookedFish->successtype = FISHINGSUCCESSTYPE_NONE;

                PChar->animation = ANIMATION_NONE;
                PChar->updatemask |= UPDATE_HP;
            }
            break;
        }

        PChar->pushPacket(new CCharUpdatePacket(PChar));
        PChar->pushPacket(new CCharSyncPacket(PChar));
    }


} // namespace fishingutils
