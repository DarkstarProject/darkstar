-----------------------------------
-- Area: Lower Jeuno
--  NPC: Chenokih
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
        12850, 24500,    -- Hose
        12866, 22632,    -- Linen Slacks
        12851, 57600,    -- Wool Hose
        12858, 14756,    -- Wool Slops
        12865,  6348,    -- Black Slacks
        129781, 6000,    -- Socks
        12994, 14352,    -- Shoes
        12979, 35200,    -- Wool Socks
        12986,  9180,    -- Chestnut Sabots
        12993,  4128,    -- Sandals
        13577, 11088,    -- Black Cape
        13568,  1250,    -- Scarlet Ribbon
    }

    player:showText(npc, CHENOKIH_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

