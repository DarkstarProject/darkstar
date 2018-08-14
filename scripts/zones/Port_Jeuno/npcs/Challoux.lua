-----------------------------------
-- Area: Port Jeuno
--  NPC: Challoux
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        4545, 62,    -- Gysahl Greens
        840,   4,    -- Chocobo Feather
        17307, 9,    -- Dart
    }

    player:showText(npc, CHALLOUX_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

