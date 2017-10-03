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
            {itemid = 13292, droprate = 75},  -- Guardian's Ring
            {itemid = 13287, droprate = 32},  -- Kampfer Ring
            {itemid = 13300, droprate = 54},  -- Conjurer's Ring
            {itemid = 13298, droprate = 32},  -- Shinobi Ring
            {itemid = 13293, droprate = 97},  -- Slayer's Ring
            {itemid = 13289, droprate = 75},  -- Sorcerer's Ring
            {itemid = 13286, droprate = 108},  -- Soldier's Ring
            {itemid = 13294, droprate = 22},  -- Tamer's Ring
            {itemid = 13296, droprate = 65},  -- Tracker's Ring
            {itemid = 13299, droprate = 32},  -- Drake Ring
            {itemid = 13290, droprate = 32},  -- Fencer's Ring
            {itemid = 13295, droprate = 86},  -- Minstrel's Ring
            {itemid = 13288, droprate = 86},  -- Medicine Ring
            {itemid = 13291, droprate = 75},  -- Rogue's Ring
            {itemid = 13297, droprate = 11},  -- Ronin Ring
            {itemid = 13447, droprate = 32},  -- Platinum Ring
        },
        {
            {itemid = 13548, droprate = 376},  -- Astral Ring
            {itemid = 13447, droprate = 22},  -- Platinum Ring
            {itemid = 4818, droprate = 65},  -- Scroll of Quake
            {itemid = 859, droprate = 0},  -- Ram Skin, 0% according to wiki
            {itemid = 4172, droprate = 11},  -- Reraiser
            {itemid = 653, droprate = 22},  -- Mythril Ingot
            {itemid = 4902, droprate = 0},  -- Light Spirit Pact, 0% according to wiki
            {itemid = 4814, droprate = 32},  -- Scroll of Freeze
            {itemid = 4719, droprate = 43},  -- Scroll of Regen III
            {itemid = 4621, droprate = 32},  -- Scroll of Raise II
            {itemid = 703, droprate = 11},  -- Petrified Log
            {itemid = 887, droprate = 11},  -- Coral Fragment
            {itemid = 700, droprate = 11},  -- Mahogany Log
            {itemid = 738, droprate = 43},  -- Platinum Ore
            {itemid = 737, droprate = 108},  -- Gold Ore
            {itemid = 645, droprate = 32},  -- Darksteel Ore
            {itemid = 644, droprate = 65},  -- Mythril Ore
            {itemid = 745, droprate = 0},  -- Gold Ingot, 0% according to wiki
            {itemid = 654, droprate = 11},  -- Darksteel Ingot
            {itemid = 746, droprate = 11},  -- Platinum Ingot
            {itemid = 702, droprate = 11},  -- Ebony Log
            {itemid = 895, droprate = 11},  -- Ram Horn
            {itemid = 902, droprate = 11},  -- Demon Horn
            {itemid = 1116, droprate = 0},  -- Manticore Hide, 0% according to wiki
            {itemid = 1122, droprate = 11},  -- Wyvern Skin
            {itemid = 866, droprate = 11},  -- Wyvern Scales
        },
    },
    [105] =
    {
        {
            {itemid = 1603, droprate = 100},
        },
        {
            {itemid = 915, droprate = 250},
            {itemid = 4112, droprate = 300},
            {itemid = 4113, droprate = 180},
            {itemid = 4898, droprate = 130},
            {itemid = 825, droprate = 280},
        },
        {
            {itemid = 749, droprate = 250},
            {itemid = 17786, droprate = 190},
            {itemid = 827, droprate = 270},
            {itemid = 18171, droprate = 145},
            {itemid = 824, droprate = 295},
            {itemid = 826, droprate = 260},
        },
        {
            {itemid = 18209, droprate = 100},
            {itemid = 0, droprate = 100},
        },
        {
            {itemid = 924, droprate = 100},
        },
        {
            {itemid = 924, droprate = 100},
        },
        {
            {itemid = 18170, droprate = 235},
            {itemid = 17271, droprate = 235},
            {itemid = 17692, droprate = 235},
            {itemid = 17571, droprate = 235},
            {itemid = 17820, droprate = 255},
            {itemid = 1601, droprate = 260},
            {itemid = 4853, droprate = 250},
            {itemid = 930, droprate = 190},
        },
    },
    [107] =
    {
        {
            {itemid = 3339, droprate = 1000},
        },
        {
            {itemid = 1441, droprate = 312},
            {itemid = 17694, droprate = 182},
            {itemid = 18047, droprate = 65},
            {itemid = 17937, droprate = 43},
            {itemid = 18173, droprate = 181},
            {itemid = 17823, droprate = 217},
            {itemid = 17575, droprate = 43},
        },
        {
            {itemid = 1442, droprate = 159},
            {itemid = 17695, droprate = 151},
            {itemid = 18088, droprate = 167},
            {itemid = 17576, droprate = 95},
            {itemid = 17245, droprate = 95},
            {itemid = 17996, droprate = 56},
            {itemid = 17789, droprate = 341},
        },
        {
            {itemid = 4486, droprate = 522},
            {itemid = 4272, droprate = 346},
            {itemid = 17928, droprate = 82},
            {itemid = 13189, droprate = 59},
        },
        {
            {itemid = 887, droprate = 32},
            {itemid = 645, droprate = 71},
            {itemid = 902, droprate = 79},
            {itemid = 702, droprate = 56},
            {itemid = 737, droprate = 71},
            {itemid = 823, droprate = 32},
            {itemid = 4173, droprate = 48},
            {itemid = 700, droprate = 127},
            {itemid = 644, droprate = 111},
            {itemid = 703, droprate = 183},
            {itemid = 942, droprate = 40},
            {itemid = 738, droprate = 56},
            {itemid = 895, droprate = 24},
            {itemid = 1132, droprate = 119},
            {itemid = 4172, droprate = 56},
            {itemid = 4175, droprate = 40},
            {itemid = 866, droprate = 24},
        },
        {
            {itemid = 1526, droprate = 210},
            {itemid = 1313, droprate = 775},
        },
        {
            {itemid = 4209, droprate = 94},
            {itemid = 4207, droprate = 130},
            {itemid = 4211, droprate = 116},
            {itemid = 4213, droprate = 51},
            {itemid = 1132, droprate = 246},
            {itemid = 17582, droprate = 246},
        },
        {
            {itemid = 4135, droprate = 290},
            {itemid = 4119, droprate = 225},
            {itemid = 4173, droprate = 210},
            {itemid = 4175, droprate = 217},
        },
        {
            {itemid = 887, droprate = 87},
            {itemid = 645, droprate = 80},
            {itemid = 902, droprate = 58},
            {itemid = 702, droprate = 72},
            {itemid = 737, droprate = 87},
            {itemid = 823, droprate = 14},
            {itemid = 4173, droprate = 22},
            {itemid = 700, droprate = 80},
            {itemid = 644, droprate = 36},
            {itemid = 703, droprate = 145},
            {itemid = 844, droprate = 7},
            {itemid = 738, droprate = 51},
            {itemid = 830, droprate = 29},
            {itemid = 895, droprate = 36},
            {itemid = 1132, droprate = 72},
            {itemid = 4172, droprate = 29},
            {itemid = 4174, droprate = 29},
            {itemid = 4175, droprate = 7},
            {itemid = 866, droprate = 22},
        },
        {
            {itemid = 1110, droprate = 58},
            {itemid = 836, droprate = 36},
            {itemid = 658, droprate = 72},
            {itemid = 837, droprate = 22},
            {itemid = 942, droprate = 275},
            {itemid = 844, droprate = 196},
            {itemid = 1132, droprate = 225},
        },
        {
            {itemid = 722, droprate = 94},
            {itemid = 1446, droprate = 196},
            {itemid = 703, droprate = 572},
            {itemid = 831, droprate = 43},
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
