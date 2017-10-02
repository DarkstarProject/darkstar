-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Armoury Crate
-- Waughroon Shrine Burning Armoury_Crate
-------------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/zones/Waughroon_Shrine/TextIDs")
require("scripts/globals/battlefield")

local loot =
{
    [73] =
    {
        {
            {itemid = 4570, roll = 1000},  -- Bird Egg
        },
        {
            {itemid = 14735, roll = 125},  -- Ashigaru Earring
            {itemid = 14732, roll = 125},  -- Trimmer's Earring
            {itemid = 14734, roll = 125},  -- Beater's Earring
            {itemid = 13437, roll = 125},  -- Healer's Earring
            {itemid = 13435, roll = 125},  -- Mercenary's Earring
            {itemid = 14733, roll = 125},  -- Singer's Earring
            {itemid = 13438, roll = 125},  -- Wizard's Earring
            {itemid = 13436, roll = 125},  -- Wrestler's Earring
        },
        {
            {itemid = 15285, roll = 142},  -- Avatar Belt
            {itemid = 15276, roll = 142},  -- Dagger Belt
            {itemid = 15284, roll = 142},  -- Lance Belt
            {itemid = 15275, roll = 142},  -- Rapier Belt
            {itemid = 15283, roll = 142},  -- Sarashi
            {itemid = 15278, roll = 142},  -- Scythe Belt
            {itemid = 15277, roll = 142},  -- Shield Belt
        },
        {
            {itemid = 4868, roll = 105},  -- Scroll of Dispel
            {itemid = 4751, roll = 79},  -- Scroll of Erase
            {itemid = 5070, roll = 421},  -- Scroll of Magic Finale
            {itemid = 4947, roll = 79},  -- Scroll of Utsusemi: Ni
        },
        {
            {itemid = 847, roll = 330},  -- Bird Feather
            {itemid = 694, roll = 130},  -- Chestnut Log
            {itemid = 690, roll = 125},  -- Elm Log
            {itemid = 4132, roll = 210},  -- Hi-Ether
            {itemid = 4222, roll = 235},  -- Horn Quiver
            {itemid = 651, roll = 98},  -- Iron Ingot
            {itemid = 795, roll = 130},  -- Lapis Lazuli
            {itemid = 796, roll = 150},  -- Light Opal
            {itemid = 653, roll = 184},  -- Mythril Ingot
            {itemid = 644, roll = 159},  -- Mythril Ore
            {itemid = 799, roll = 160},  -- Onyx
            {itemid = 736, roll = 180},  -- Silver Ore
            {itemid = 744, roll = 175},  -- Silver Ingot
        },
    },

    [76] =
    {
        {
            {itemid = 18047, roll = 188},
            {itemid = 17939, roll = 27},
            {itemid = 17937, roll = 170},
            {itemid = 1441, roll = 295},
            {itemid = 18351, roll = 27},
            {itemid = 17464, roll = 71},
            {itemid = 17575, roll = 196},
        },
        {
            {itemid = 18211, roll = 45},
            {itemid = 17576, roll = 259},
            {itemid = 17245, roll = 241},
            {itemid = 17838, roll = 143},
            {itemid = 1442, roll = 161},
            {itemid = 17996, roll = 143},
            {itemid = 17578, roll = 36},
        },
        {
            {itemid = 683, roll = 446},
            {itemid = 908, roll = 420},
            {itemid = 1312, roll = 71},
            {itemid = 14080, roll = 26},
        },
        {
            {itemid = 887, roll = 116},
            {itemid = 645, roll = 89},
            {itemid = 902, roll = 71},
            {itemid = 702, roll = 152},
            {itemid = 737, roll = 107},
            {itemid = 823, roll = 89},
            {itemid = 1465, roll = 45},
            {itemid = 4173, roll = 71},
            {itemid = 700, roll = 107},
            {itemid = 703, roll = 223},
            {itemid = 738, roll = 116},
            {itemid = 830, roll = 54},
            {itemid = 895, roll = 54},
            {itemid = 1132, roll = 71},
            {itemid = 4172, roll = 45},
            {itemid = 866, roll = 54},
            {itemid = 4174, roll = 63},
            {itemid = 4175, roll = 45},
        },
        {
            {itemid = 683, roll = 268},
            {itemid = 1525, roll = 143},
            {itemid = 4205, roll = 80},
            {itemid = 4201, roll = 143},
            {itemid = 4199, roll = 214},
            {itemid = 4203, roll = 196},
        },
        {
            {itemid = 646, roll = 107},
            {itemid = 4211, roll = 89},
            {itemid = 645, roll = 179},
            {itemid = 4213, roll = 134},
            {itemid = 4207, roll = 152},
            {itemid = 4209, roll = 80},
            {itemid = 739, roll = 80},
            {itemid = 738, roll = 107},
            {itemid = 17698, roll = 152},
        },
        {
            {itemid = 4135, roll = 295},
            {itemid = 4119, roll = 250},
            {itemid = 4173, roll = 196},
            {itemid = 4175, roll = 214},
        },
        {
            {itemid = 887, roll = 139},
            {itemid = 645, roll = 59},
            {itemid = 902, roll = 50},
            {itemid = 702, roll = 109},
            {itemid = 737, roll = 69},
            {itemid = 1465, roll = 99},
            {itemid = 4173, roll = 79},
            {itemid = 700, roll = 129},
            {itemid = 644, roll = 119},
            {itemid = 844, roll = 69},
            {itemid = 703, roll = 168},
            {itemid = 738, roll = 129},
            {itemid = 895, roll = 109},
            {itemid = 1132, roll = 79},
            {itemid = 4174, roll = 69},
            {itemid = 866, roll = 79},
            {itemid = 4172, roll = 50},
            {itemid = 823, roll = 89},
        },
        {
            {itemid = 1110, roll = 109},
            {itemid = 836, roll = 89},
            {itemid = 658, roll = 78},
            {itemid = 837, roll = 99},
            {itemid = 942, roll = 188},
            {itemid = 844, roll = 238},
            {itemid = 1132, roll = 109},
        },
        {
            {itemid = 722, roll = 79},
            {itemid = 1446, roll = 257},
            {itemid = 703, roll = 337},
            {itemid = 831, roll = 149},
        },
        {
            {itemid = 3343, roll = 1},
        },
    },
    [79] =
    {
        {
            {itemid = 793, roll = 1000},
        },
        {
            {itemid = 792, roll = 1000},
        },
        {
            {itemid = 1311, roll = 1000},
        },
        {
            {itemid = 14666, roll = 447},
            {itemid = 14662, roll = 487},
        },
        {
            {itemid = 13175, roll = 494},
            {itemid = 13176, roll = 449},
        },
        {
            {itemid = 791, roll = 51},
            {itemid = 801, roll = 32},
            {itemid = 654, roll = 39},
            {itemid = 702, roll = 21},
            {itemid = 4173, roll = 32},
            {itemid = 745, roll = 55},
            {itemid = 784, roll = 62},
            {itemid = 653, roll = 81},
            {itemid = 802, roll = 56},
            {itemid = 797, roll = 195},
            {itemid = 652, roll = 58},
            {itemid = 803, roll = 38},
            {itemid = 773, roll = 11},
            {itemid = 4175, roll = 21},
            {itemid = 771, roll = 15},
            {itemid = 805, roll = 26},
            {itemid = 769, roll = 21},
            {itemid = 700, roll = 17},
            {itemid = 770, roll = 9},
            {itemid = 810, roll = 62},
            {itemid = 774, roll = 11},
            {itemid = 775, roll = 11},
            {itemid = 772, roll = 11},
            {itemid = 776, roll = 9},
            {itemid = 17440, roll = 13},
        },
        {
            {itemid = 15185, roll = 55},
        },
    },
    [81] =
    {
        {
            {itemid = 1473, roll = 813},
            {itemid = 13552, roll = 55},
            {itemid = 901, roll = 123},
        },
        {
            {itemid = 17207, roll = 216},
            {itemid = 18005, roll = 295},
            {itemid = 18217, roll = 239},
            {itemid = 17793, roll = 231},
        },
        {
            {itemid = 17624, roll = 504},
            {itemid = 655, roll = 4},
            {itemid = 19027, roll = 86},
            {itemid = 747, roll = 22},
            {itemid = 19025, roll = 146},
            {itemid = 19024, roll = 22},
        },
        {
            {itemid = 15295, roll = 287},
            {itemid = 12407, roll = 216},
            {itemid = 14871, roll = 198},
            {itemid = 15294, roll = 287},
        },
        {
            {itemid = 887, roll = 52},
            {itemid = 645, roll = 56},
            {itemid = 902, roll = 41},
            {itemid = 702, roll = 63},
            {itemid = 737, roll = 52},
            {itemid = 823, roll = 26},
            {itemid = 1465, roll = 11},
            {itemid = 4173, roll = 37},
            {itemid = 700, roll = 101},
            {itemid = 653, roll = 0},  -- this is "zero" on ffxiclopedia???
            {itemid = 644, roll = 52},
            {itemid = 703, roll = 116},
            {itemid = 844, roll = 15},
            {itemid = 942, roll = 56},
            {itemid = 738, roll = 45},
            {itemid = 830, roll = 22},
            {itemid = 895, roll = 67},
            {itemid = 1132, roll = 119},
            {itemid = 4172, roll = 45},
            {itemid = 4174, roll = 19},
            {itemid = 4175, roll = 41},
            {itemid = 866, roll = 34},
        },
        {
            {itemid = 1110, roll = 78},
            {itemid = 836, roll = 56},
            {itemid = 658, roll = 93},
            {itemid = 837, roll = 56},
            {itemid = 942, roll = 157},
            {itemid = 844, roll = 276},
            {itemid = 1132, roll = 209},
        },
    },
    [82] =
    {
        {
            {itemid = 843, roll = 1000},
        },
        {
            {itemid = 17827, roll = 217},
            {itemid = 17699, roll = 174},
            {itemid = 17275, roll = 333},
            {itemid = 18053, roll = 174},
        },
        {
            {itemid = 19027, roll = 144},
            {itemid = 658, roll = 275},
            {itemid = 843, roll = 275},
            {itemid = 19025, roll = 203},
            {itemid = 19026, roll = 116},
        },
        {
            {itemid = 655, roll = 159},
            {itemid = 747, roll = 290},
            {itemid = 14765, roll = 406},
        },
        {
            {itemid = 15325, roll = 159},
            {itemid = 14872, roll = 217},
            {itemid = 15181, roll = 145},
            {itemid = 15387, roll = 159},
        },
        {
            {itemid = 887, roll = 101},
            {itemid = 645, roll = 29},
            {itemid = 902, roll = 29},
            {itemid = 702, roll = 29},
            {itemid = 737, roll = 101},
            {itemid = 823, roll = 29},
            {itemid = 1465, roll = 29},
            {itemid = 700, roll = 43},
            {itemid = 644, roll = 29},
            {itemid = 703, roll = 58},
            {itemid = 738, roll = 14},
            {itemid = 830, roll = 58},
            {itemid = 895, roll = 14},
            {itemid = 4174, roll = 58},
            {itemid = 4175, roll = 29},
            {itemid = 837, roll = 72},
        },
        {
            {itemid = 1110, roll = 87},
            {itemid = 658, roll = 14},
            {itemid = 836, roll = 29},
            {itemid = 942, roll = 174},
            {itemid = 844, roll = 246},
            {itemid = 1132, roll = 159},
        },
    },
}

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
