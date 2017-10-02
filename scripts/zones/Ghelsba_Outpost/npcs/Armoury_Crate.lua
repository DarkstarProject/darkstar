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
            {itemid = 891, roll = 1000},
        },
        {
            {itemid = 4900, roll = 306},
            {itemid = 4744, roll = 319},
            {itemid = 4745, roll = 125},
            {itemid = 4746, roll = 222},
        },
        {
            {itemid = 17786, roll = 153},
            {itemid = 18170, roll = 139},
            {itemid = 16687, roll = 83},
            {itemid = 17571, roll = 97},
            {itemid = 17993, roll = 125},
            {itemid = 749, roll = 444},
            {itemid = 773, roll = 56},
        },
        {
            {itemid = 17820, roll = 111},
            {itemid = 17993, roll = 139},
            {itemid = 18170, roll = 139},
            {itemid = 18085, roll = 42},
            {itemid = 16959, roll = 181},
            {itemid = 774, roll = 97},
            {itemid = 769, roll = 69},
            {itemid = 776, roll = 14},
            {itemid = 775, roll = 28},
            {itemid = 772, roll = 28},
            {itemid = 771, roll = 14},
            {itemid = 770, roll = 69},
        },
        {
            {itemid = 13548, roll = 167},
            {itemid = 922, roll = 444},
            {itemid = 0, roll = 600},
        },
    },
    [35] =
    {
        {
            {itemid = 852, roll = 1000},
        },
        {
            {itemid = 13014, roll = 79},
            {itemid = 0, roll = 950},
        },
        {
            {itemid = 15282, roll = 53},
            {itemid = 15275, roll = 79},
            {itemid = 15278, roll = 157},
            {itemid = 694, roll = 184},
            {itemid = 690, roll = 368},
            {itemid = 652, roll = 79},
        },
        {
            {itemid = 0, roll = 600},
            {itemid = 15282, roll = 53},
            {itemid = 15275, roll = 79},
            {itemid = 15278, roll = 157},
            {itemid = 694, roll = 184},
            {itemid = 690, roll = 368},
            {itemid = 652, roll = 79},
        },
        {
            {itemid = 15285, roll = 105},
            {itemid = 15279, roll = 105},
            {itemid = 651, roll = 131},
            {itemid = 643, roll = 131},
            {itemid = 644, roll = 79},
            {itemid = 736, roll = 79},
            {itemid = 795, roll = 131},
        },
        {
            {itemid = 17867, roll = 552},
            {itemid = 4877, roll = 263},
            {itemid = 4878, roll = 210},
            {itemid = 4876, roll = 289},
            {itemid = 4868, roll = 105},
            {itemid = 4751, roll = 79},
            {itemid = 5070, roll = 421},
            {itemid = 4947, roll = 79},
        },
        {
            {itemid = 15271, roll = 552},
            {itemid = 15272, roll = 131},
            {itemid = 809, roll = 0},  -- yes 0%
            {itemid = 15276, roll = 79},
            {itemid = 645, roll = 105},
            {itemid = 15281, roll = 26},
            {itemid = 4132, roll = 184},
            {itemid = 796, roll = 79},
            {itemid = 15273, roll = 157},
            {itemid = 653, roll = 210},
            {itemid = 799, roll = 26},
            {itemid = 15283, roll = 263},
            {itemid = 15277, roll = 105},
            {itemid = 15280, roll = 105},
            {itemid = 15274, roll = 131},
            {itemid = 744, roll = 79},
            {itemid = 806, roll = 131},
            {itemid = 0, roll = 600},
        },
        {
            {itemid = 15271, roll = 552},
            {itemid = 15272, roll = 131},
            {itemid = 809, roll = 0},  -- yes 0%
            {itemid = 15276, roll = 79},
            {itemid = 645, roll = 105},
            {itemid = 15281, roll = 26},
            {itemid = 4132, roll = 184},
            {itemid = 796, roll = 79},
            {itemid = 15273, roll = 157},
            {itemid = 653, roll = 210},
            {itemid = 799, roll = 26},
            {itemid = 15283, roll = 263},
            {itemid = 15277, roll = 105},
            {itemid = 15280, roll = 105},
            {itemid = 15274, roll = 131},
            {itemid = 744, roll = 79},
            {itemid = 806, roll = 131},
            {itemid = 0, roll = 600},
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
