-----------------------------------
-- Area: Norg
--  NPC: Solby-Maholby
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        17395,     9,    -- Lugworm
        4899,    450,    -- Earth Spirit Pact
        2870,   9000,    -- Norg Waystone
        4965,  79380,    -- Scroll of Aisha: Ichi
        4966,  93243,    -- Scroll of Myoshu: Ichi
        4967,  90283,    -- Scroll of Yurin: Ichi
        4968, 133000,    -- Scroll of Migawa: Ichi
        4970, 140319,    -- Scroll of Gekka: Ichi
        4971, 140319,    -- Scroll of Yain: Ichi
    }

    player:showText(npc, ID.text.SOLBYMAHOLBY_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
