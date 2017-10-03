-----------------------------------
-- Area: Ghelsba_Outpost
-- NPC:  Armoury Crate
-- Ghelsba_Outpost Armoury_Crate
-------------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil
package.loaded["scripts/globals/bcnm"] = nil
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/zones/Ghelsba_Outpost/TextIDs")
require("scripts/globals/battlefield")

local loot =
{
    [34] =
    {
        {
            {itemid = 891, droprate = 1000},
        },
        {
            {itemid = 4900, droprate = 306},
            {itemid = 4744, droprate = 319},
            {itemid = 4745, droprate = 125},
            {itemid = 4746, droprate = 222},
        },
        {
            {itemid = 17786, droprate = 153},
            {itemid = 18170, droprate = 139},
            {itemid = 16687, droprate = 83},
            {itemid = 17571, droprate = 97},
            {itemid = 17993, droprate = 125},
            {itemid = 749, droprate = 444},
            {itemid = 773, droprate = 56},
        },
        {
            {itemid = 17820, droprate = 111},
            {itemid = 17993, droprate = 139},
            {itemid = 18170, droprate = 139},
            {itemid = 18085, droprate = 42},
            {itemid = 16959, droprate = 181},
            {itemid = 774, droprate = 97},
            {itemid = 769, droprate = 69},
            {itemid = 776, droprate = 14},
            {itemid = 775, droprate = 28},
            {itemid = 772, droprate = 28},
            {itemid = 771, droprate = 14},
            {itemid = 770, droprate = 69},
        },
        {
            {itemid = 13548, droprate = 167},
            {itemid = 922, droprate = 444},
            {itemid = 0, droprate = 600},
        },
    },
    [35] =
    {
        {
            {itemid = 852, droprate = 1000},
        },
        {
            {itemid = 13014, droprate = 79},
            {itemid = 0, droprate = 950},
        },
        {
            {itemid = 15282, droprate = 53},
            {itemid = 15275, droprate = 79},
            {itemid = 15278, droprate = 157},
            {itemid = 694, droprate = 184},
            {itemid = 690, droprate = 368},
            {itemid = 652, droprate = 79},
        },
        {
            {itemid = 0, droprate = 600},
            {itemid = 15282, droprate = 53},
            {itemid = 15275, droprate = 79},
            {itemid = 15278, droprate = 157},
            {itemid = 694, droprate = 184},
            {itemid = 690, droprate = 368},
            {itemid = 652, droprate = 79},
        },
        {
            {itemid = 15285, droprate = 105},
            {itemid = 15279, droprate = 105},
            {itemid = 651, droprate = 131},
            {itemid = 643, droprate = 131},
            {itemid = 644, droprate = 79},
            {itemid = 736, droprate = 79},
            {itemid = 795, droprate = 131},
        },
        {
            {itemid = 17867, droprate = 552},
            {itemid = 4877, droprate = 263},
            {itemid = 4878, droprate = 210},
            {itemid = 4876, droprate = 289},
            {itemid = 4868, droprate = 105},
            {itemid = 4751, droprate = 79},
            {itemid = 5070, droprate = 421},
            {itemid = 4947, droprate = 79},
        },
        {
            {itemid = 15271, droprate = 552},
            {itemid = 15272, droprate = 131},
            {itemid = 809, droprate = 0},  -- yes 0%
            {itemid = 15276, droprate = 79},
            {itemid = 645, droprate = 105},
            {itemid = 15281, droprate = 26},
            {itemid = 4132, droprate = 184},
            {itemid = 796, droprate = 79},
            {itemid = 15273, droprate = 157},
            {itemid = 653, droprate = 210},
            {itemid = 799, droprate = 26},
            {itemid = 15283, droprate = 263},
            {itemid = 15277, droprate = 105},
            {itemid = 15280, droprate = 105},
            {itemid = 15274, droprate = 131},
            {itemid = 744, droprate = 79},
            {itemid = 806, droprate = 131},
            {itemid = 0, droprate = 600},
        },
        {
            {itemid = 15271, droprate = 552},
            {itemid = 15272, droprate = 131},
            {itemid = 809, droprate = 0},  -- yes 0%
            {itemid = 15276, droprate = 79},
            {itemid = 645, droprate = 105},
            {itemid = 15281, droprate = 26},
            {itemid = 4132, droprate = 184},
            {itemid = 796, droprate = 79},
            {itemid = 15273, droprate = 157},
            {itemid = 653, droprate = 210},
            {itemid = 799, droprate = 26},
            {itemid = 15283, droprate = 263},
            {itemid = 15277, droprate = 105},
            {itemid = 15280, droprate = 105},
            {itemid = 15274, droprate = 131},
            {itemid = 744, droprate = 79},
            {itemid = 806, droprate = 131},
            {itemid = 0, droprate = 600},
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
