-----------------------------------
-- Area: Upper Jeuno
--  NPC: Mejuone
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
        4545, 62,    -- Gysahl Greens
        840,   7,    -- Chocobo Feather
        17307, 9,    -- Dart
    }

    player:showText(npc, MEJUONE_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

