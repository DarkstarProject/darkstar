-----------------------------------
-- Area: Upper Jeuno
--  NPC: Leillaine
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        4509,    10,    -- Distilled Water
        4150,  2387,    -- Eye Drops
        4148,   290,    -- Antidote
        4151,   736,    -- Echo Drops
        4112,   837,    -- Potion
        4128,  4445,    -- Ether
        4155, 22400,    -- Remedy
    }

    player:showText(npc, LEILLAINE_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

