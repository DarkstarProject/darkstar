-----------------------------------
-- Area: Balgas Dais
-- NPC:  Armoury Crate
-- Balgas Dais Burning Cicrcle Armoury Crate
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil
-------------------------------------

local loot =
{
    [100] =
    {
        {
            {itemid = 13292, roll = 75},  -- Guardian's Ring
            {itemid = 13287, roll = 32},  -- Kampfer Ring
            {itemid = 13300, roll = 54},  -- Conjurer's Ring
            {itemid = 13298, roll = 32},  -- Shinobi Ring
            {itemid = 13293, roll = 97},  -- Slayer's Ring
            {itemid = 13289, roll = 75},  -- Sorcerer's Ring
            {itemid = 13286, roll = 108},  -- Soldier's Ring
            {itemid = 13294, roll = 22},  -- Tamer's Ring
            {itemid = 13296, roll = 65},  -- Tracker's Ring
            {itemid = 13299, roll = 32},  -- Drake Ring
            {itemid = 13290, roll = 32},  -- Fencer's Ring
            {itemid = 13295, roll = 86},  -- Minstrel's Ring
            {itemid = 13288, roll = 86},  -- Medicine Ring
            {itemid = 13291, roll = 75},  -- Rogue's Ring
            {itemid = 13297, roll = 11},  -- Ronin Ring
            {itemid = 13447, roll = 32},  -- Platinum Ring
        },
        {
            {itemid = 13548, roll = 376},  -- Astral Ring
            {itemid = 13447, roll = 22},  -- Platinum Ring
            {itemid = 4818, roll = 65},  -- Scroll of Quake
            {itemid = 859, roll = 0},  -- Ram Skin, 0% according to wiki
            {itemid = 4172, roll = 11},  -- Reraiser
            {itemid = 653, roll = 22},  -- Mythril Ingot
            {itemid = 4902, roll = 0},  -- Light Spirit Pact, 0% according to wiki
            {itemid = 4814, roll = 32},  -- Scroll of Freeze
            {itemid = 4719, roll = 43},  -- Scroll of Regen III
            {itemid = 4621, roll = 32},  -- Scroll of Raise II
            {itemid = 703, roll = 11},  -- Petrified Log
            {itemid = 887, roll = 11},  -- Coral Fragment
            {itemid = 700, roll = 11},  -- Mahogany Log
            {itemid = 738, roll = 43},  -- Platinum Ore
            {itemid = 737, roll = 108},  -- Gold Ore
            {itemid = 645, roll = 32},  -- Darksteel Ore
            {itemid = 644, roll = 65},  -- Mythril Ore
            {itemid = 745, roll = 0},  -- Gold Ingot, 0% according to wiki
            {itemid = 654, roll = 11},  -- Darksteel Ingot
            {itemid = 746, roll = 11},  -- Platinum Ingot
            {itemid = 702, roll = 11},  -- Ebony Log
            {itemid = 895, roll = 11},  -- Ram Horn
            {itemid = 902, roll = 11},  -- Demon Horn
            {itemid = 1116, roll = 0},  -- Manticore Hide, 0% according to wiki
            {itemid = 1122, roll = 11},  -- Wyvern Skin
            {itemid = 866, roll = 11},  -- Wyvern Scales
        },
    },
    [105] =
    {
        {
            {itemid = 1603, roll = 100},
        },
        {
            {itemid = 915, roll = 250},
            {itemid = 4112, roll = 300},
            {itemid = 4113, roll = 180},
            {itemid = 4898, roll = 130},
            {itemid = 825, roll = 280},
        },
        {
            {itemid = 749, roll = 250},
            {itemid = 17786, roll = 190},
            {itemid = 827, roll = 270},
            {itemid = 18171, roll = 145},
            {itemid = 824, roll = 295},
            {itemid = 826, roll = 260},
        },
        {
            {itemid = 18209, roll = 100},
            {itemid = 0, roll = 100},
        },
        {
            {itemid = 924, roll = 100},
        },
        {
            {itemid = 924, roll = 100},
        },
        {
            {itemid = 18170, roll = 235},
            {itemid = 17271, roll = 235},
            {itemid = 17692, roll = 235},
            {itemid = 17571, roll = 235},
            {itemid = 17820, roll = 255},
            {itemid = 1601, roll = 260},
            {itemid = 4853, roll = 250},
            {itemid = 930, roll = 190},
        },
    },
    [107] =
    {
        {
            {itemid = 3339, roll = 1000},
        },
        {
            {itemid = 1441, roll = 312},
            {itemid = 17694, roll = 182},
            {itemid = 18047, roll = 65},
            {itemid = 17937, roll = 43},
            {itemid = 18173, roll = 181},
            {itemid = 17823, roll = 217},
            {itemid = 17575, roll = 43},
        },
        {
            {itemid = 1442, roll = 159},
            {itemid = 17695, roll = 151},
            {itemid = 18088, roll = 167},
            {itemid = 17576, roll = 95},
            {itemid = 17245, roll = 95},
            {itemid = 17996, roll = 56},
            {itemid = 17789, roll = 341},
        },
        {
            {itemid = 4486, roll = 522},
            {itemid = 4272, roll = 346},
            {itemid = 17928, roll = 82},
            {itemid = 13189, roll = 59},
        },
        {
            {itemid = 887, roll = 32},
            {itemid = 645, roll = 71},
            {itemid = 902, roll = 79},
            {itemid = 702, roll = 56},
            {itemid = 737, roll = 71},
            {itemid = 823, roll = 32},
            {itemid = 4173, roll = 48},
            {itemid = 700, roll = 127},
            {itemid = 644, roll = 111},
            {itemid = 703, roll = 183},
            {itemid = 942, roll = 40},
            {itemid = 738, roll = 56},
            {itemid = 895, roll = 24},
            {itemid = 1132, roll = 119},
            {itemid = 4172, roll = 56},
            {itemid = 4175, roll = 40},
            {itemid = 866, roll = 24},
        },
        {
            {itemid = 1526, roll = 210},
            {itemid = 1313, roll = 775},
        },
        {
            {itemid = 4209, roll = 94},
            {itemid = 4207, roll = 130},
            {itemid = 4211, roll = 116},
            {itemid = 4213, roll = 51},
            {itemid = 1132, roll = 246},
            {itemid = 17582, roll = 246},
        },
        {
            {itemid = 4135, roll = 290},
            {itemid = 4119, roll = 225},
            {itemid = 4173, roll = 210},
            {itemid = 4175, roll = 217},
        },
        {
            {itemid = 887, roll = 87},
            {itemid = 645, roll = 80},
            {itemid = 902, roll = 58},
            {itemid = 702, roll = 72},
            {itemid = 737, roll = 87},
            {itemid = 823, roll = 14},
            {itemid = 4173, roll = 22},
            {itemid = 700, roll = 80},
            {itemid = 644, roll = 36},
            {itemid = 703, roll = 145},
            {itemid = 844, roll = 7},
            {itemid = 738, roll = 51},
            {itemid = 830, roll = 29},
            {itemid = 895, roll = 36},
            {itemid = 1132, roll = 72},
            {itemid = 4172, roll = 29},
            {itemid = 4174, roll = 29},
            {itemid = 4175, roll = 7},
            {itemid = 866, roll = 22},
        },
        {
            {itemid = 1110, roll = 58},
            {itemid = 836, roll = 36},
            {itemid = 658, roll = 72},
            {itemid = 837, roll = 22},
            {itemid = 942, roll = 275},
            {itemid = 844, roll = 196},
            {itemid = 1132, roll = 225},
        },
        {
            {itemid = 722, roll = 94},
            {itemid = 1446, roll = 196},
            {itemid = 703, roll = 572},
            {itemid = 831, roll = 43},
        },
    }
}

require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/zones/Balgas_Dais/TextIDs")
require("scripts/globals/battlefield")
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        g_Battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end
