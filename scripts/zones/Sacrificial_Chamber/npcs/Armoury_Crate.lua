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
            {itemid = 13153, droprate = 250},
            {itemid = 13156, droprate = 250},
            {itemid = 13157, droprate = 250},
            {itemid = 13161, droprate = 250},
        },
        {
            {itemid = 751, droprate = 258},
            {itemid = 4874, droprate = 48},
            {itemid = 4751, droprate = 143},
            {itemid = 4714, droprate = 119},
            {itemid = 4896, droprate = 48},
            {itemid = 1255, droprate = 48},
            {itemid = 1256, droprate = 48},
            {itemid = 1257, droprate = 48},
            {itemid = 1258, droprate = 48},
            {itemid = 1259, droprate = 48},
            {itemid = 1260, droprate = 48},
            {itemid = 1261, droprate = 48},
            {itemid = 1262, droprate = 48},
        },
        {
            {itemid = 751, droprate = 833},
            {itemid = 1256, droprate = 169},
        },
        {
            {itemid = 13155, droprate = 250},
            {itemid = 13148, droprate = 250},
            {itemid = 13151, droprate = 250},
            {itemid = 13158, droprate = 250},
        },
        {
            {itemid = 654, droprate = 154},
            {itemid = 797, droprate = 154},
            {itemid = 745, droprate = 154},
            {itemid = 791, droprate = 77},
            {itemid = 4175, droprate = 77},
            {itemid = 653, droprate = 153},
            {itemid = 801, droprate = 30},
            {itemid = 802, droprate = 30},
            {itemid = 803, droprate = 30},
            {itemid = 805, droprate = 30},  -- lots of unknown groupings in group 4
            {itemid = 791, droprate = 30},
            {itemid = 702, droprate = 30},
            {itemid = 700, droprate = 30},
            {itemid = 942, droprate = 30},
        },
        {
            {itemid = 654, droprate = 77},
            {itemid = 802, droprate = 134},
            {itemid = 652, droprate = 154},
            {itemid = 801, droprate = 50},
            {itemid = 4173, droprate = 154},
            {itemid = 784, droprate = 121},  -- lots of unknown groupings in group 5
            {itemid = 837, droprate = 10},
            {itemid = 1110, droprate = 10},
            {itemid = 769, droprate = 30},
            {itemid = 770, droprate = 30},
            {itemid = 771, droprate = 30},
            {itemid = 772, droprate = 30},
            {itemid = 773, droprate = 30},
            {itemid = 774, droprate = 30},
            {itemid = 775, droprate = 30},
            {itemid = 776, droprate = 30},
            {itemid = 810, droprate = 50},
        },
    },
    -- BCNM Amphibian Assualt
    [156] =
    {
        {
            {itemid = 13155, droprate = 100},
            {itemid = 13152, droprate = 100},
            {itemid = 13150, droprate = 100},
            {itemid = 13160, droprate = 100},
        },
        {
            {itemid = 13156, droprate = 250},
            {itemid = 13148, droprate = 250},
            {itemid = 13151, droprate = 250},
            {itemid = 13154, droprate = 250},
            {itemid = 13158, droprate = 250},
        },
        {
            {itemid = 4896, droprate = 48},
            {itemid = 4874, droprate = 48},
            {itemid = 4751, droprate = 143},
            {itemid = 4714, droprate = 119},
            {itemid = 4621, droprate = 150},
        },
        {
            {itemid = 4175, droprate = 77},
            {itemid = 4173, droprate = 154},
        },
        {
            {itemid = 1260, droprate = 48},
            {itemid = 1257, droprate = 48},
            {itemid = 1256, droprate = 48},
            {itemid = 1259, droprate = 48},
            {itemid = 1261, droprate = 48},
            {itemid = 1255, droprate = 48},
            {itemid = 1262, droprate = 48},
            {itemid = 1258, droprate = 48},
        },
        {
            {itemid = 887, droprate = 150},
            {itemid = 837, droprate = 10},
            {itemid = 751, droprate = 850},
            {itemid = 810, droprate = 50},
            {itemid = 797, droprate = 50},
            {itemid = 803, droprate = 50},
            {itemid = 784, droprate = 50},
            {itemid = 791, droprate = 50},
            {itemid = 802, droprate = 50},
            {itemid = 652, droprate = 100},
            {itemid = 702, droprate = 30},
            {itemid = 771, droprate = 30},
            {itemid = 769, droprate = 30},
            {itemid = 776, droprate = 30},
            {itemid = 772, droprate = 30},
            {itemid = 773, droprate = 30},
            {itemid = 801, droprate = 30},
            {itemid = 775, droprate = 30},
            {itemid = 774, droprate = 30},
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
