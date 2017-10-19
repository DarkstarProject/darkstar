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
            {itemid = 4570, droprate = 1000},  -- Bird Egg
        },
        {
            {itemid = 14735, droprate = 125},  -- Ashigaru Earring
            {itemid = 14732, droprate = 125},  -- Trimmer's Earring
            {itemid = 14734, droprate = 125},  -- Beater's Earring
            {itemid = 13437, droprate = 125},  -- Healer's Earring
            {itemid = 13435, droprate = 125},  -- Mercenary's Earring
            {itemid = 14733, droprate = 125},  -- Singer's Earring
            {itemid = 13438, droprate = 125},  -- Wizard's Earring
            {itemid = 13436, droprate = 125},  -- Wrestler's Earring
        },
        {
            {itemid = 15285, droprate = 142},  -- Avatar Belt
            {itemid = 15276, droprate = 142},  -- Dagger Belt
            {itemid = 15284, droprate = 142},  -- Lance Belt
            {itemid = 15275, droprate = 142},  -- Rapier Belt
            {itemid = 15283, droprate = 142},  -- Sarashi
            {itemid = 15278, droprate = 142},  -- Scythe Belt
            {itemid = 15277, droprate = 142},  -- Shield Belt
        },
        {
            {itemid = 4868, droprate = 105},  -- Scroll of Dispel
            {itemid = 4751, droprate = 79},  -- Scroll of Erase
            {itemid = 5070, droprate = 421},  -- Scroll of Magic Finale
            {itemid = 4947, droprate = 79},  -- Scroll of Utsusemi: Ni
        },
        {
            {itemid = 847, droprate = 330},  -- Bird Feather
            {itemid = 694, droprate = 130},  -- Chestnut Log
            {itemid = 690, droprate = 125},  -- Elm Log
            {itemid = 4132, droprate = 210},  -- Hi-Ether
            {itemid = 4222, droprate = 235},  -- Horn Quiver
            {itemid = 651, droprate = 98},  -- Iron Ingot
            {itemid = 795, droprate = 130},  -- Lapis Lazuli
            {itemid = 796, droprate = 150},  -- Light Opal
            {itemid = 653, droprate = 184},  -- Mythril Ingot
            {itemid = 644, droprate = 159},  -- Mythril Ore
            {itemid = 799, droprate = 160},  -- Onyx
            {itemid = 736, droprate = 180},  -- Silver Ore
            {itemid = 744, droprate = 175},  -- Silver Ingot
        },
    },

    [76] =
    {
        {
            {itemid = 18047, droprate = 188},
            {itemid = 17939, droprate = 27},
            {itemid = 17937, droprate = 170},
            {itemid = 1441, droprate = 295},
            {itemid = 18351, droprate = 27},
            {itemid = 17464, droprate = 71},
            {itemid = 17575, droprate = 196},
        },
        {
            {itemid = 18211, droprate = 45},
            {itemid = 17576, droprate = 259},
            {itemid = 17245, droprate = 241},
            {itemid = 17838, droprate = 143},
            {itemid = 1442, droprate = 161},
            {itemid = 17996, droprate = 143},
            {itemid = 17578, droprate = 36},
        },
        {
            {itemid = 683, droprate = 446},
            {itemid = 908, droprate = 420},
            {itemid = 1312, droprate = 71},
            {itemid = 14080, droprate = 26},
        },
        {
            {itemid = 887, droprate = 116},
            {itemid = 645, droprate = 89},
            {itemid = 902, droprate = 71},
            {itemid = 702, droprate = 152},
            {itemid = 737, droprate = 107},
            {itemid = 823, droprate = 89},
            {itemid = 1465, droprate = 45},
            {itemid = 4173, droprate = 71},
            {itemid = 700, droprate = 107},
            {itemid = 703, droprate = 223},
            {itemid = 738, droprate = 116},
            {itemid = 830, droprate = 54},
            {itemid = 895, droprate = 54},
            {itemid = 1132, droprate = 71},
            {itemid = 4172, droprate = 45},
            {itemid = 866, droprate = 54},
            {itemid = 4174, droprate = 63},
            {itemid = 4175, droprate = 45},
        },
        {
            {itemid = 683, droprate = 268},
            {itemid = 1525, droprate = 143},
            {itemid = 4205, droprate = 80},
            {itemid = 4201, droprate = 143},
            {itemid = 4199, droprate = 214},
            {itemid = 4203, droprate = 196},
        },
        {
            {itemid = 646, droprate = 107},
            {itemid = 4211, droprate = 89},
            {itemid = 645, droprate = 179},
            {itemid = 4213, droprate = 134},
            {itemid = 4207, droprate = 152},
            {itemid = 4209, droprate = 80},
            {itemid = 739, droprate = 80},
            {itemid = 738, droprate = 107},
            {itemid = 17698, droprate = 152},
        },
        {
            {itemid = 4135, droprate = 295},
            {itemid = 4119, droprate = 250},
            {itemid = 4173, droprate = 196},
            {itemid = 4175, droprate = 214},
        },
        {
            {itemid = 887, droprate = 139},
            {itemid = 645, droprate = 59},
            {itemid = 902, droprate = 50},
            {itemid = 702, droprate = 109},
            {itemid = 737, droprate = 69},
            {itemid = 1465, droprate = 99},
            {itemid = 4173, droprate = 79},
            {itemid = 700, droprate = 129},
            {itemid = 644, droprate = 119},
            {itemid = 844, droprate = 69},
            {itemid = 703, droprate = 168},
            {itemid = 738, droprate = 129},
            {itemid = 895, droprate = 109},
            {itemid = 1132, droprate = 79},
            {itemid = 4174, droprate = 69},
            {itemid = 866, droprate = 79},
            {itemid = 4172, droprate = 50},
            {itemid = 823, droprate = 89},
        },
        {
            {itemid = 1110, droprate = 109},
            {itemid = 836, droprate = 89},
            {itemid = 658, droprate = 78},
            {itemid = 837, droprate = 99},
            {itemid = 942, droprate = 188},
            {itemid = 844, droprate = 238},
            {itemid = 1132, droprate = 109},
        },
        {
            {itemid = 722, droprate = 79},
            {itemid = 1446, droprate = 257},
            {itemid = 703, droprate = 337},
            {itemid = 831, droprate = 149},
        },
        {
            {itemid = 3343, droprate = 1},
        },
    },
    [79] =
    {
        {
            {itemid = 793, droprate = 1000},
        },
        {
            {itemid = 792, droprate = 1000},
        },
        {
            {itemid = 1311, droprate = 1000},
        },
        {
            {itemid = 14666, droprate = 447},
            {itemid = 14662, droprate = 487},
        },
        {
            {itemid = 13175, droprate = 494},
            {itemid = 13176, droprate = 449},
        },
        {
            {itemid = 791, droprate = 51},
            {itemid = 801, droprate = 32},
            {itemid = 654, droprate = 39},
            {itemid = 702, droprate = 21},
            {itemid = 4173, droprate = 32},
            {itemid = 745, droprate = 55},
            {itemid = 784, droprate = 62},
            {itemid = 653, droprate = 81},
            {itemid = 802, droprate = 56},
            {itemid = 797, droprate = 195},
            {itemid = 652, droprate = 58},
            {itemid = 803, droprate = 38},
            {itemid = 773, droprate = 11},
            {itemid = 4175, droprate = 21},
            {itemid = 771, droprate = 15},
            {itemid = 805, droprate = 26},
            {itemid = 769, droprate = 21},
            {itemid = 700, droprate = 17},
            {itemid = 770, droprate = 9},
            {itemid = 810, droprate = 62},
            {itemid = 774, droprate = 11},
            {itemid = 775, droprate = 11},
            {itemid = 772, droprate = 11},
            {itemid = 776, droprate = 9},
            {itemid = 17440, droprate = 13},
        },
        {
            {itemid = 15185, droprate = 55},
        },
    },
    [81] =
    {
        {
            {itemid = 1473, droprate = 813},
            {itemid = 13552, droprate = 55},
            {itemid = 901, droprate = 123},
        },
        {
            {itemid = 17207, droprate = 216},
            {itemid = 18005, droprate = 295},
            {itemid = 18217, droprate = 239},
            {itemid = 17793, droprate = 231},
        },
        {
            {itemid = 17624, droprate = 504},
            {itemid = 655, droprate = 4},
            {itemid = 19027, droprate = 86},
            {itemid = 747, droprate = 22},
            {itemid = 19025, droprate = 146},
            {itemid = 19024, droprate = 22},
        },
        {
            {itemid = 15295, droprate = 287},
            {itemid = 12407, droprate = 216},
            {itemid = 14871, droprate = 198},
            {itemid = 15294, droprate = 287},
        },
        {
            {itemid = 887, droprate = 52},
            {itemid = 645, droprate = 56},
            {itemid = 902, droprate = 41},
            {itemid = 702, droprate = 63},
            {itemid = 737, droprate = 52},
            {itemid = 823, droprate = 26},
            {itemid = 1465, droprate = 11},
            {itemid = 4173, droprate = 37},
            {itemid = 700, droprate = 101},
            {itemid = 653, droprate = 0},  -- this is "zero" on ffxiclopedia???
            {itemid = 644, droprate = 52},
            {itemid = 703, droprate = 116},
            {itemid = 844, droprate = 15},
            {itemid = 942, droprate = 56},
            {itemid = 738, droprate = 45},
            {itemid = 830, droprate = 22},
            {itemid = 895, droprate = 67},
            {itemid = 1132, droprate = 119},
            {itemid = 4172, droprate = 45},
            {itemid = 4174, droprate = 19},
            {itemid = 4175, droprate = 41},
            {itemid = 866, droprate = 34},
        },
        {
            {itemid = 1110, droprate = 78},
            {itemid = 836, droprate = 56},
            {itemid = 658, droprate = 93},
            {itemid = 837, droprate = 56},
            {itemid = 942, droprate = 157},
            {itemid = 844, droprate = 276},
            {itemid = 1132, droprate = 209},
        },
    },
    [82] =
    {
        {
            {itemid = 843, droprate = 1000},
        },
        {
            {itemid = 17827, droprate = 217},
            {itemid = 17699, droprate = 174},
            {itemid = 17275, droprate = 333},
            {itemid = 18053, droprate = 174},
        },
        {
            {itemid = 19027, droprate = 144},
            {itemid = 658, droprate = 275},
            {itemid = 843, droprate = 275},
            {itemid = 19025, droprate = 203},
            {itemid = 19026, droprate = 116},
        },
        {
            {itemid = 655, droprate = 159},
            {itemid = 747, droprate = 290},
            {itemid = 14765, droprate = 406},
        },
        {
            {itemid = 15325, droprate = 159},
            {itemid = 14872, droprate = 217},
            {itemid = 15181, droprate = 145},
            {itemid = 15387, droprate = 159},
        },
        {
            {itemid = 887, droprate = 101},
            {itemid = 645, droprate = 29},
            {itemid = 902, droprate = 29},
            {itemid = 702, droprate = 29},
            {itemid = 737, droprate = 101},
            {itemid = 823, droprate = 29},
            {itemid = 1465, droprate = 29},
            {itemid = 700, droprate = 43},
            {itemid = 644, droprate = 29},
            {itemid = 703, droprate = 58},
            {itemid = 738, droprate = 14},
            {itemid = 830, droprate = 58},
            {itemid = 895, droprate = 14},
            {itemid = 4174, droprate = 58},
            {itemid = 4175, droprate = 29},
            {itemid = 837, droprate = 72},
        },
        {
            {itemid = 1110, droprate = 87},
            {itemid = 658, droprate = 14},
            {itemid = 836, droprate = 29},
            {itemid = 942, droprate = 174},
            {itemid = 844, droprate = 246},
            {itemid = 1132, droprate = 159},
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
