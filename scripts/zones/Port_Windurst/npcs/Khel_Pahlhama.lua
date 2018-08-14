-----------------------------------
-- Area: Port Windurst
--  NPC: Khel Pahlhama
--  Linkshell Merchant
-- !pos 21 -2 -20 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Windurst/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        512,  8000,    -- Linkshell
        16285, 375,    -- Pendant Compass
    }

    player:showText(npc, KHEL_PAHLHAMA_SHOP_DIALOG, 513)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
