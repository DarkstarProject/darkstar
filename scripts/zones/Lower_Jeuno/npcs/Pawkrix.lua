-----------------------------------
-- Area: Lower Jeuno
-- NPC: Pawkrix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        631,    36,    -- Horo Flour
        4458,  276,    -- Goblin Bread
        4539,  650,    -- Goblin Pie
        4495,   35,    -- Goblin Chocolate
        4543, 1140,    -- Goblin Mushpot
        952,   515,    -- Poison Flour
        1239,  490,    -- Goblin Doll
    }

    player:showText(npc, PAWKRIX_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
