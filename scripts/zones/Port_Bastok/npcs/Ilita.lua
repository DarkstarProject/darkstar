-----------------------------------
-- Area: Port Bastok
--  NPC: Ilita
-- Linkshell Merchant
--   !pos -142 -1 -25 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs")
require("scripts/globals/shop")


function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        512,  6000,    -- Linkshell
        16285, 375,    -- Pendant Compass
    }

    player:showText(npc, ILITA_SHOP_DIALOG, 513)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
