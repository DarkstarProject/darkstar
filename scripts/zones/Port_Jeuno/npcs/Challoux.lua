-----------------------------------
-- Area: Port Jeuno
--  NPC: Challoux
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
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

    player:showText(npc, ID.text.CHALLOUX_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
