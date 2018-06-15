-----------------------------------
-- Area: Lower Jeuno
--  NPC: Chetak
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
        12466, 20000,    -- Red Cap
        12467, 45760,    -- Wool Cap
        12474, 11166,    -- Wool Hat
        12594, 32500,    -- Gambison
        12610, 33212,    -- Cloak
        12595, 68640,    -- Wool Gambison
        12602, 18088,    -- Wool Robe
        12609,  9527,    -- Black Tunic
        12722, 16900,    -- Bracers
        12738, 15732,    -- Linen Mitts
        12730, 10234,    -- Wool Cuffs
        12737,  4443,    -- White Mitts
    }

    player:showText(npc, CHETAK_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
