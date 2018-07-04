-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Dwago
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        17395,  9,    -- Lugworm
        17396,  3,    -- Little worm
        17016, 11,    -- Pet Food Alpha Biscuit
        17017, 82,    -- Pet Food Beta Biscuit
        17862, 98     -- Jug of Bug Broth
    }

    player:showText(npc, DWAGO_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
