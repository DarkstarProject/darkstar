-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Armoury Crate
-------------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/zones/Sacrificial_Chamber/TextIDs")
require("scripts/globals/battlefield")

local loot =
{
    [129] =
    {
        {
            {itemid = 13153, roll = 250},
            {itemid = 13156, roll = 250},
            {itemid = 13157, roll = 250},
            {itemid = 13161, roll = 250},
        },
        {
            {itemid = 751, roll = 258},
            {itemid = 4874, roll = 48},
            {itemid = 4751, roll = 143},
            {itemid = 4714, roll = 119},
            {itemid = 4896, roll = 48},
            {itemid = 1255, roll = 48},
            {itemid = 1256, roll = 48},
            {itemid = 1257, roll = 48},
            {itemid = 1258, roll = 48},
            {itemid = 1259, roll = 48},
            {itemid = 1260, roll = 48},
            {itemid = 1261, roll = 48},
            {itemid = 1262, roll = 48},
        },
        {
            {itemid = 751, roll = 833},
            {itemid = 1256, roll = 169},
        },
        {
            {itemid = 13155, roll = 250},
            {itemid = 13148, roll = 250},
            {itemid = 13151, roll = 250},
            {itemid = 13158, roll = 250},
        },
        {
            {itemid = 654, roll = 154},
            {itemid = 797, roll = 154},
            {itemid = 745, roll = 154},
            {itemid = 791, roll = 77},
            {itemid = 4175, roll = 77},
            {itemid = 653, roll = 153},
            {itemid = 801, roll = 30},
            {itemid = 802, roll = 30},
            {itemid = 803, roll = 30},
            {itemid = 805, roll = 30},  -- lots of unknown groupings in group 4
            {itemid = 791, roll = 30},
            {itemid = 702, roll = 30},
            {itemid = 700, roll = 30},
            {itemid = 942, roll = 30},
        },
        {
            {itemid = 654, roll = 77},
            {itemid = 802, roll = 134},
            {itemid = 652, roll = 154},
            {itemid = 801, roll = 50},
            {itemid = 4173, roll = 154},
            {itemid = 784, roll = 121},  -- lots of unknown groupings in group 5
            {itemid = 837, roll = 10},
            {itemid = 1110, roll = 10},
            {itemid = 769, roll = 30},
            {itemid = 770, roll = 30},
            {itemid = 771, roll = 30},
            {itemid = 772, roll = 30},
            {itemid = 773, roll = 30},
            {itemid = 774, roll = 30},
            {itemid = 775, roll = 30},
            {itemid = 776, roll = 30},
            {itemid = 810, roll = 50},
        },
    },
    -- BCNM Amphibian Assualt
    [156] =
    {
        {
            {itemid = 13155, roll = 100},
            {itemid = 13152, roll = 100},
            {itemid = 13150, roll = 100},
            {itemid = 13160, roll = 100},
        },
        {
            {itemid = 13156, roll = 250},
            {itemid = 13148, roll = 250},
            {itemid = 13151, roll = 250},
            {itemid = 13154, roll = 250},
            {itemid = 13158, roll = 250},
        },
        {
            {itemid = 4896, roll = 48},
            {itemid = 4874, roll = 48},
            {itemid = 4751, roll = 143},
            {itemid = 4714, roll = 119},
            {itemid = 4621, roll = 150},
        },
        {
            {itemid = 4175, roll = 77},
            {itemid = 4173, roll = 154},
        },
        {
            {itemid = 1260, roll = 48},
            {itemid = 1257, roll = 48},
            {itemid = 1256, roll = 48},
            {itemid = 1259, roll = 48},
            {itemid = 1261, roll = 48},
            {itemid = 1255, roll = 48},
            {itemid = 1262, roll = 48},
            {itemid = 1258, roll = 48},
        },
        {
            {itemid = 887, roll = 150},
            {itemid = 837, roll = 10},
            {itemid = 751, roll = 850},
            {itemid = 810, roll = 50},
            {itemid = 797, roll = 50},
            {itemid = 803, roll = 50},
            {itemid = 784, roll = 50},
            {itemid = 791, roll = 50},
            {itemid = 802, roll = 50},
            {itemid = 652, roll = 100},
            {itemid = 702, roll = 30},
            {itemid = 771, roll = 30},
            {itemid = 769, roll = 30},
            {itemid = 776, roll = 30},
            {itemid = 772, roll = 30},
            {itemid = 773, roll = 30},
            {itemid = 801, roll = 30},
            {itemid = 775, roll = 30},
            {itemid = 774, roll = 30},
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
