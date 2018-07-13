-----------------------------------
-- Area: Nashmau
--  NPC: Jajaroon
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Nashmau/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        2176,    48,    -- Fire Card
        2177,    48,    -- Ice Card
        2178,    48,    -- Wind Card
        2179,    48,    -- Earth Card
        2180,    48,    -- Thunder Card
        2181,    48,    -- Water Card
        2182,    48,    -- Light Card
        2183,    48,    -- Dark Card
        5870, 10000,    -- Trump Card Case
        5488, 35200,    -- Samurai Die
        5489,   600,    -- Ninja Die
        5490, 82500,    -- Dragoon Die
        5491, 40000,    -- Summoner Die
        5492,  3525,    -- Blue Mage Die
        5493,   316,    -- Corsar Die
        5494,  9216,    -- Puppetmaster Die
    }

    player:showText(npc, JAJAROON_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
