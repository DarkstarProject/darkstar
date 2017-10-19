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
            {itemid = 1441, droprate = 169},
            {itemid = 17939, droprate = 268},
            {itemid = 17823, droprate = 99},
            {itemid = 18173, droprate = 85},
            {itemid = 17694, droprate = 70},
            {itemid = 17464, droprate = 85},
            {itemid = 18351, droprate = 225},
        },
        {
            {itemid = 1442, droprate = 169},
            {itemid = 17789, droprate = 14},
            {itemid = 17838, droprate = 239},
            {itemid = 18088, droprate = 85},
            {itemid = 18211, droprate = 254},
            {itemid = 17578, droprate = 183},
            {itemid = 17695, droprate = 70},
        },
        {
            {itemid = 860, droprate = 535},
            {itemid = 883, droprate = 366},
            {itemid = 17108, droprate = 48},
        },
        {
            {itemid = 902, droprate = 99},
            {itemid = 703, droprate = 70},
            {itemid = 1132, droprate = 70},
            {itemid = 830, droprate = 28},
            {itemid = 4173, droprate = 113},
            {itemid = 703, droprate = 211},
            {itemid = 942, droprate = 141},
            {itemid = 737, droprate = 56},
            {itemid = 644, droprate = 85},
            {itemid = 887, droprate = 70},
            {itemid = 700, droprate = 85},
            {itemid = 866, droprate = 42},
            {itemid = 645, droprate = 42},
            {itemid = 895, droprate = 70},
            {itemid = 702, droprate = 85},
            {itemid = 4172, droprate = 28},
            {itemid = 738, droprate = 42},
            {itemid = 4174, droprate = 42},
            {itemid = 4175, droprate = 7},
        },
        {
            {itemid = 1527, droprate = 208},
            {itemid = 883, droprate = 296},
            {itemid = 4199, droprate = 155},
            {itemid = 4201, droprate = 70},
            {itemid = 4205, droprate = 141},
            {itemid = 4203, droprate = 113},
        },
        {
            {itemid = 3341, droprate = 1000},
        },
        {
            {itemid = 4209, droprate = 169},
            {itemid = 4207, droprate = 70},
            {itemid = 4211, droprate = 113},
            {itemid = 4213, droprate = 155},
            {itemid = 17840, droprate = 254},
            {itemid = 785, droprate = 99},
            {itemid = 804, droprate = 42},
            {itemid = 786, droprate = 56},
            {itemid = 787, droprate = 28},
        },
        {
            {itemid = 4135, droprate = 296},
            {itemid = 4119, droprate = 225},
            {itemid = 4173, droprate = 197},
            {itemid = 4175, droprate = 282},
        },
        {
            {itemid = 887, droprate = 141},
            {itemid = 1132, droprate = 14},
            {itemid = 902, droprate = 113},
            {itemid = 737, droprate = 28},
            {itemid = 644, droprate = 85},
            {itemid = 4174, droprate = 56},
            {itemid = 895, droprate = 28},
            {itemid = 703, droprate = 296},
            {itemid = 738, droprate = 14},
            {itemid = 700, droprate = 56},
            {itemid = 866, droprate = 70},
            {itemid = 1465, droprate = 42},
            {itemid = 645, droprate = 42},
            {itemid = 702, droprate = 42},
            {itemid = 4173, droprate = 42},
            {itemid = 823, droprate = 113},
            {itemid = 830, droprate = 28},
        },
        {
            {itemid = 1132, droprate = 127},
            {itemid = 837, droprate = 56},
            {itemid = 942, droprate = 225},
            {itemid = 844, droprate = 423},
            {itemid = 836, droprate = 70},
            {itemid = 658, droprate = 42},
            {itemid = 1110, droprate = 85},
        },
        {
            {itemid = 703, droprate = 563},
            {itemid = 1446, droprate = 296},
            {itemid = 831, droprate = 14},
            {itemid = 722, droprate = 141},
        }
    },
    [10] =
    {
        {
            {itemid = 846, droprate = 1000},  -- LootID 12 needs 100% chance to drop 4k gil
        },
        {
            {itemid = 1601, droprate = 1000},
        },
        {
            {itemid = 12486, droprate = 364},
            {itemid = 846, droprate = 636},  -- Temp fix for Chance to get zero items (This item doesnt drop here)  ~63.6%
        },
        {
            {itemid = 12400, droprate = 175},
            {itemid = 12399, droprate = 175},
            {itemid = 12395, droprate = 175},
            {itemid = 12390, droprate = 175},
            {itemid = 809, droprate = 100},
            {itemid = 795, droprate = 100},
            {itemid = 796, droprate = 100},
        },
        {
            {itemid = 13659, droprate = 250},
            {itemid = 13668, droprate = 250},
            {itemid = 13662, droprate = 250},
            {itemid = 13672, droprate = 250},
        },
        {
            {itemid = 4947, droprate = 70},
            {itemid = 5070, droprate = 70},
            {itemid = 17863, droprate = 150},
            {itemid = 799, droprate = 100},
            {itemid = 795, droprate = 100},
            {itemid = 796, droprate = 100},
            {itemid = 4868, droprate = 150},  -- putting all 4 unkown groups in this collumn
            {itemid = 4751, droprate = 100},
            {itemid = 690, droprate = 90},
            {itemid = 1602, droprate = 70},
        },
    },
    [4] =
    {
        {
            {itemid = 939, droprate = 50},  --  Temp fix for Chance to get zero items (This item doesnt drop here)  ~5%
            {itemid = 13254, droprate = 95},
            {itemid = 13253, droprate = 95},
            {itemid = 13255, droprate = 95},
            {itemid = 13252, droprate = 95},
            {itemid = 13256, droprate = 95},
            {itemid = 13259, droprate = 95},
            {itemid = 13258, droprate = 95},
            {itemid = 13260, droprate = 95},
            {itemid = 13257, droprate = 95},
        },
        {
            {itemid = 13292, droprate = 64},
            {itemid = 13287, droprate = 65},
            {itemid = 13300, droprate = 65},
            {itemid = 13298, droprate = 65},
            {itemid = 13293, droprate = 65},
            {itemid = 13289, droprate = 65},
            {itemid = 13286, droprate = 64},
            {itemid = 13294, droprate = 65},
            {itemid = 13296, droprate = 64},
            {itemid = 13299, droprate = 65},
            {itemid = 13290, droprate = 65},
            {itemid = 13295, droprate = 65},
            {itemid = 13288, droprate = 64},
            {itemid = 13291, droprate = 65},
            {itemid = 13297, droprate = 64},
            {itemid = 13447, droprate = 30},
        },
        {
            {itemid = 939, droprate = 166},  -- Temp fix for Chance to get zero items (This item doesnt drop here) ~16.6%
            {itemid = 4902, droprate = 10},
            {itemid = 4814, droprate = 176},
            {itemid = 4719, droprate = 176},
            {itemid = 4172, droprate = 60},
            {itemid = 4174, droprate = 60},
            {itemid = 4621, droprate = 176},
        },
        {
            {itemid = 895, droprate = 59},  -- Scaled back this groups wiki %'s a bit to == 100
            {itemid = 700, droprate = 59},
            {itemid = 653, droprate = 200},
            {itemid = 1116, droprate = 59},
            {itemid = 866, droprate = 90},
            {itemid = 1122, droprate = 90},
            {itemid = 703, droprate = 176},
            {itemid = 654, droprate = 59},
            {itemid = 749, droprate = 59},
            {itemid = 859, droprate = 59},
            {itemid = 746, droprate = 90},
        },
    },
    [15] =
    {
        {
            {itemid = 18378, droprate = 222},
            {itemid = 17699, droprate = 302},
            {itemid = 17509, droprate = 245},
            {itemid = 18005, droprate = 208},
        },
        {
            {itemid = 1133, droprate = 0},  -- Yes "0" on ffxiclopedia
            {itemid = 4486, droprate = 176},
            {itemid = 4272, droprate = 176},
        },
        {
            {itemid = 19026, droprate = 354},
            {itemid = 19024, droprate = 165},
            {itemid = 19025, droprate = 89},
        },
        {
            {itemid = 14764, droprate = 586},
            {itemid = 655, droprate = 184},
            {itemid = 747, droprate = 207},
        },
        {
            {itemid = 17842, droprate = 238},
            {itemid = 14762, droprate = 250},
            {itemid = 17700, droprate = 225},
            {itemid = 18006, droprate = 275},
        },
        {
            {itemid = 737, droprate = 122},
            {itemid = 4172, droprate = 54},
            {itemid = 644, droprate = 41},
            {itemid = 902, droprate = 81},
            {itemid = 702, droprate = 149},
            {itemid = 866, droprate = 54},
            {itemid = 4175, droprate = 27},
            {itemid = 700, droprate = 41},
            {itemid = 887, droprate = 95},
            {itemid = 703, droprate = 108},
            {itemid = 844, droprate = 135},
            {itemid = 738, droprate = 54},
            {itemid = 895, droprate = 14},
            {itemid = 830, droprate = 14},
            {itemid = 645, droprate = 68},
            {itemid = 4173, droprate = 14},
            {itemid = 1132, droprate = 135},
        },
        {
            {itemid = 836, droprate = 96},
            {itemid = 658, droprate = 27},
            {itemid = 942, droprate = 164},
            {itemid = 844, droprate = 260},
            {itemid = 837, droprate = 96},
            {itemid = 1132, droprate = 288},
            {itemid = 1110, droprate = 41},
        }
    },
    [12] =
    {
        {
            {itemid = 13056, droprate = 90},
            {itemid = 939, droprate = 910},  -- temp fix for 100% drop rate PCC (This item doesnt drop here) 91%
        },
        {
            {itemid = 939, droprate = 467},  -- temp placeholder for the "chance to get no item" (This item doesnt drop here) 46.7%
            {itemid = 18086, droprate = 48},
            {itemid = 18046, droprate = 61},
            {itemid = 18210, droprate = 46},
            {itemid = 15286, droprate = 302},
            {itemid = 18350, droprate = 76},
        },
        {
            {itemid = 939, droprate = 413},  -- temp placeholder for the "chance to get no item" (This item doesnt drop here) 41.3%
            {itemid = 17696, droprate = 42},
            {itemid = 17936, droprate = 77},
            {itemid = 17693, droprate = 73},
            {itemid = 15287, droprate = 258},
            {itemid = 4717, droprate = 68},
            {itemid = 4947, droprate = 55},
            {itemid = 4858, droprate = 14},
        },
        {
            {itemid = 4858, droprate = 114},
            {itemid = 4717, droprate = 174},
            {itemid = 4947, droprate = 138},
            {itemid = 769, droprate = 16},
            {itemid = 770, droprate = 17},
            {itemid = 771, droprate = 17},
            {itemid = 772, droprate = 18},
            {itemid = 773, droprate = 17},
            {itemid = 774, droprate = 16},
            {itemid = 775, droprate = 18},
            {itemid = 776, droprate = 16},
            {itemid = 749, droprate = 102},
            {itemid = 748, droprate = 120},
            {itemid = 699, droprate = 22},
            {itemid = 811, droprate = 18},
            {itemid = 793, droprate = 18},
            {itemid = 790, droprate = 20},
            {itemid = 808, droprate = 19},
            {itemid = 792, droprate = 21},
            {itemid = 788, droprate = 35},
            {itemid = 815, droprate = 17},
            {itemid = 798, droprate = 23},
            {itemid = 4172, droprate = 21},
            {itemid = 4174, droprate = 16},
        },
        {
            {itemid = 4896, droprate = 116},
            {itemid = 4874, droprate = 113},
            {itemid = 4751, droprate = 137},
            {itemid = 4858, droprate = 67},
            {itemid = 4714, droprate = 99},
            {itemid = 811, droprate = 58},
            {itemid = 793, droprate = 52},
            {itemid = 790, droprate = 51},
            {itemid = 808, droprate = 65},
            {itemid = 792, droprate = 61},
            {itemid = 788, droprate = 63},
            {itemid = 815, droprate = 55},
            {itemid = 798, droprate = 62},
        },
        {
            {itemid = 939, droprate = 1000},
            {itemid = 914, droprate = 1000},
        },
    },
    [17] =
    {
        {
            {itemid = 837, droprate = 1000},
        },
        {
            {itemid = 17827, droprate = 217},
            {itemid = 17451, droprate = 174},
            {itemid = 17793, droprate = 333},
            {itemid = 17589, droprate = 174},
        },
        {
            {itemid = 13402, droprate = 101},
            {itemid = 19027, droprate = 43},
            {itemid = 920, droprate = 275},
            {itemid = 1013, droprate = 275},
            {itemid = 19025, droprate = 203},
            {itemid = 19026, droprate = 116},
        },
        {
            {itemid = 655, droprate = 159},
            {itemid = 747, droprate = 290},
        },
        {
            {itemid = 13182, droprate = 406},
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
            {itemid = 866, droprate = 72},
        },
        {
            {itemid = 1110, droprate = 87},
            {itemid = 658, droprate = 14},
            {itemid = 836, droprate = 29},
            {itemid = 837, droprate = 43},
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
