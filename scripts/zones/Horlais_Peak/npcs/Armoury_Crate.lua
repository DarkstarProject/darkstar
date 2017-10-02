-----------------------------------
-- Area: Horlais Peak
-- NPC:  Armoury Crate
-------------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/zones/Horlais_Peak/TextIDs")
require("scripts/globals/battlefield")

local loot =
{
    [11] =
    {
        {
            {itemid = 1441, roll = 169},
            {itemid = 17939, roll = 268},
            {itemid = 17823, roll = 99},
            {itemid = 18173, roll = 85},
            {itemid = 17694, roll = 70},
            {itemid = 17464, roll = 85},
            {itemid = 18351, roll = 225},
        },
        {
            {itemid = 1442, roll = 169},
            {itemid = 17789, roll = 14},
            {itemid = 17838, roll = 239},
            {itemid = 18088, roll = 85},
            {itemid = 18211, roll = 254},
            {itemid = 17578, roll = 183},
            {itemid = 17695, roll = 70},
        },
        {
            {itemid = 860, roll = 535},
            {itemid = 883, roll = 366},
            {itemid = 17108, roll = 48},
        },
        {
            {itemid = 902, roll = 99},
            {itemid = 703, roll = 70},
            {itemid = 1132, roll = 70},
            {itemid = 830, roll = 28},
            {itemid = 4173, roll = 113},
            {itemid = 703, roll = 211},
            {itemid = 942, roll = 141},
            {itemid = 737, roll = 56},
            {itemid = 644, roll = 85},
            {itemid = 887, roll = 70},
            {itemid = 700, roll = 85},
            {itemid = 866, roll = 42},
            {itemid = 645, roll = 42},
            {itemid = 895, roll = 70},
            {itemid = 702, roll = 85},
            {itemid = 4172, roll = 28},
            {itemid = 738, roll = 42},
            {itemid = 4174, roll = 42},
            {itemid = 4175, roll = 7},
        },
        {
            {itemid = 1527, roll = 208},
            {itemid = 883, roll = 296},
            {itemid = 4199, roll = 155},
            {itemid = 4201, roll = 70},
            {itemid = 4205, roll = 141},
            {itemid = 4203, roll = 113},
        },
        {
            {itemid = 3341, roll = 1000},
        },
        {
            {itemid = 4209, roll = 169},
            {itemid = 4207, roll = 70},
            {itemid = 4211, roll = 113},
            {itemid = 4213, roll = 155},
            {itemid = 17840, roll = 254},
            {itemid = 785, roll = 99},
            {itemid = 804, roll = 42},
            {itemid = 786, roll = 56},
            {itemid = 787, roll = 28},
        },
        {
            {itemid = 4135, roll = 296},
            {itemid = 4119, roll = 225},
            {itemid = 4173, roll = 197},
            {itemid = 4175, roll = 282},
        },
        {
            {itemid = 887, roll = 141},
            {itemid = 1132, roll = 14},
            {itemid = 902, roll = 113},
            {itemid = 737, roll = 28},
            {itemid = 644, roll = 85},
            {itemid = 4174, roll = 56},
            {itemid = 895, roll = 28},
            {itemid = 703, roll = 296},
            {itemid = 738, roll = 14},
            {itemid = 700, roll = 56},
            {itemid = 866, roll = 70},
            {itemid = 1465, roll = 42},
            {itemid = 645, roll = 42},
            {itemid = 702, roll = 42},
            {itemid = 4173, roll = 42},
            {itemid = 823, roll = 113},
            {itemid = 830, roll = 28},
        },
        {
            {itemid = 1132, roll = 127},
            {itemid = 837, roll = 56},
            {itemid = 942, roll = 225},
            {itemid = 844, roll = 423},
            {itemid = 836, roll = 70},
            {itemid = 658, roll = 42},
            {itemid = 1110, roll = 85},
        },
        {
            {itemid = 703, roll = 563},
            {itemid = 1446, roll = 296},
            {itemid = 831, roll = 14},
            {itemid = 722, roll = 141},
        }
    },
    [10] =
    {
        {
            {itemid = 846, roll = 1000},  -- LootID 12 needs 100% chance to drop 4k gil
        },
        {
            {itemid = 1601, roll = 1000},
        },
        {
            {itemid = 12486, roll = 364},
            {itemid = 846, roll = 636},  -- Temp fix for Chance to get zero items (This item doesnt drop here)  ~63.6%
        },
        {
            {itemid = 12400, roll = 175},
            {itemid = 12399, roll = 175},
            {itemid = 12395, roll = 175},
            {itemid = 12390, roll = 175},
            {itemid = 809, roll = 100},
            {itemid = 795, roll = 100},
            {itemid = 796, roll = 100},
        },
        {
            {itemid = 13659, roll = 250},
            {itemid = 13668, roll = 250},
            {itemid = 13662, roll = 250},
            {itemid = 13672, roll = 250},
        },
        {
            {itemid = 4947, roll = 70},
            {itemid = 5070, roll = 70},
            {itemid = 17863, roll = 150},
            {itemid = 799, roll = 100},
            {itemid = 795, roll = 100},
            {itemid = 796, roll = 100},
            {itemid = 4868, roll = 150},  -- putting all 4 unkown groups in this collumn
            {itemid = 4751, roll = 100},
            {itemid = 690, roll = 90},
            {itemid = 1602, roll = 70},
        },
    },
    [4] =
    {
        {
            {itemid = 939, roll = 50},  --  Temp fix for Chance to get zero items (This item doesnt drop here)  ~5%
            {itemid = 13254, roll = 95},
            {itemid = 13253, roll = 95},
            {itemid = 13255, roll = 95},
            {itemid = 13252, roll = 95},
            {itemid = 13256, roll = 95},
            {itemid = 13259, roll = 95},
            {itemid = 13258, roll = 95},
            {itemid = 13260, roll = 95},
            {itemid = 13257, roll = 95},
        },
        {
            {itemid = 13292, roll = 64},
            {itemid = 13287, roll = 65},
            {itemid = 13300, roll = 65},
            {itemid = 13298, roll = 65},
            {itemid = 13293, roll = 65},
            {itemid = 13289, roll = 65},
            {itemid = 13286, roll = 64},
            {itemid = 13294, roll = 65},
            {itemid = 13296, roll = 64},
            {itemid = 13299, roll = 65},
            {itemid = 13290, roll = 65},
            {itemid = 13295, roll = 65},
            {itemid = 13288, roll = 64},
            {itemid = 13291, roll = 65},
            {itemid = 13297, roll = 64},
            {itemid = 13447, roll = 30},
        },
        {
            {itemid = 939, roll = 166},  -- Temp fix for Chance to get zero items (This item doesnt drop here) ~16.6%
            {itemid = 4902, roll = 10},
            {itemid = 4814, roll = 176},
            {itemid = 4719, roll = 176},
            {itemid = 4172, roll = 60},
            {itemid = 4174, roll = 60},
            {itemid = 4621, roll = 176},
        },
        {
            {itemid = 895, roll = 59},  -- Scaled back this groups wiki %'s a bit to == 100
            {itemid = 700, roll = 59},
            {itemid = 653, roll = 200},
            {itemid = 1116, roll = 59},
            {itemid = 866, roll = 90},
            {itemid = 1122, roll = 90},
            {itemid = 703, roll = 176},
            {itemid = 654, roll = 59},
            {itemid = 749, roll = 59},
            {itemid = 859, roll = 59},
            {itemid = 746, roll = 90},
        },
    },
    [15] =
    {
        {
            {itemid = 18378, roll = 222},
            {itemid = 17699, roll = 302},
            {itemid = 17509, roll = 245},
            {itemid = 18005, roll = 208},
        },
        {
            {itemid = 1133, roll = 0},  -- Yes "0" on ffxiclopedia
            {itemid = 4486, roll = 176},
            {itemid = 4272, roll = 176},
        },
        {
            {itemid = 19026, roll = 354},
            {itemid = 19024, roll = 165},
            {itemid = 19025, roll = 89},
        },
        {
            {itemid = 14764, roll = 586},
            {itemid = 655, roll = 184},
            {itemid = 747, roll = 207},
        },
        {
            {itemid = 17842, roll = 238},
            {itemid = 14762, roll = 250},
            {itemid = 17700, roll = 225},
            {itemid = 18006, roll = 275},
        },
        {
            {itemid = 737, roll = 122},
            {itemid = 4172, roll = 54},
            {itemid = 644, roll = 41},
            {itemid = 902, roll = 81},
            {itemid = 702, roll = 149},
            {itemid = 866, roll = 54},
            {itemid = 4175, roll = 27},
            {itemid = 700, roll = 41},
            {itemid = 887, roll = 95},
            {itemid = 703, roll = 108},
            {itemid = 844, roll = 135},
            {itemid = 738, roll = 54},
            {itemid = 895, roll = 14},
            {itemid = 830, roll = 14},
            {itemid = 645, roll = 68},
            {itemid = 4173, roll = 14},
            {itemid = 1132, roll = 135},
        },
        {
            {itemid = 836, roll = 96},
            {itemid = 658, roll = 27},
            {itemid = 942, roll = 164},
            {itemid = 844, roll = 260},
            {itemid = 837, roll = 96},
            {itemid = 1132, roll = 288},
            {itemid = 1110, roll = 41},
        }
    },
    [12] =
    {
        {
            {itemid = 13056, roll = 90},
            {itemid = 939, roll = 910},  -- temp fix for 100% drop rate PCC (This item doesnt drop here) 91%
        },
        {
            {itemid = 939, roll = 467},  -- temp placeholder for the "chance to get no item" (This item doesnt drop here) 46.7%
            {itemid = 18086, roll = 48},
            {itemid = 18046, roll = 61},
            {itemid = 18210, roll = 46},
            {itemid = 15286, roll = 302},
            {itemid = 18350, roll = 76},
        },
        {
            {itemid = 939, roll = 413},  -- temp placeholder for the "chance to get no item" (This item doesnt drop here) 41.3%
            {itemid = 17696, roll = 42},
            {itemid = 17936, roll = 77},
            {itemid = 17693, roll = 73},
            {itemid = 15287, roll = 258},
            {itemid = 4717, roll = 68},
            {itemid = 4947, roll = 55},
            {itemid = 4858, roll = 14},
        },
        {
            {itemid = 4858, roll = 114},
            {itemid = 4717, roll = 174},
            {itemid = 4947, roll = 138},
            {itemid = 769, roll = 16},
            {itemid = 770, roll = 17},
            {itemid = 771, roll = 17},
            {itemid = 772, roll = 18},
            {itemid = 773, roll = 17},
            {itemid = 774, roll = 16},
            {itemid = 775, roll = 18},
            {itemid = 776, roll = 16},
            {itemid = 749, roll = 102},
            {itemid = 748, roll = 120},
            {itemid = 699, roll = 22},
            {itemid = 811, roll = 18},
            {itemid = 793, roll = 18},
            {itemid = 790, roll = 20},
            {itemid = 808, roll = 19},
            {itemid = 792, roll = 21},
            {itemid = 788, roll = 35},
            {itemid = 815, roll = 17},
            {itemid = 798, roll = 23},
            {itemid = 4172, roll = 21},
            {itemid = 4174, roll = 16},
        },
        {
            {itemid = 4896, roll = 116},
            {itemid = 4874, roll = 113},
            {itemid = 4751, roll = 137},
            {itemid = 4858, roll = 67},
            {itemid = 4714, roll = 99},
            {itemid = 811, roll = 58},
            {itemid = 793, roll = 52},
            {itemid = 790, roll = 51},
            {itemid = 808, roll = 65},
            {itemid = 792, roll = 61},
            {itemid = 788, roll = 63},
            {itemid = 815, roll = 55},
            {itemid = 798, roll = 62},
        },
        {
            {itemid = 939, roll = 1000},
            {itemid = 914, roll = 1000},
        },
    },
    [17] =
    {
        {
            {itemid = 837, roll = 1000},
        },
        {
            {itemid = 17827, roll = 217},
            {itemid = 17451, roll = 174},
            {itemid = 17793, roll = 333},
            {itemid = 17589, roll = 174},
        },
        {
            {itemid = 13402, roll = 101},
            {itemid = 19027, roll = 43},
            {itemid = 920, roll = 275},
            {itemid = 1013, roll = 275},
            {itemid = 19025, roll = 203},
            {itemid = 19026, roll = 116},
        },
        {
            {itemid = 655, roll = 159},
            {itemid = 747, roll = 290},
        },
        {
            {itemid = 13182, roll = 406},
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
            {itemid = 866, roll = 72},
        },
        {
            {itemid = 1110, roll = 87},
            {itemid = 658, roll = 14},
            {itemid = 836, roll = 29},
            {itemid = 837, roll = 43},
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
