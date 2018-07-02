-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Silke
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bastok_Markets_[S]/TextIDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        6059, 29925,    -- Animus Augeo Schema
        6060, 29925,    -- Animus Minuo Schema
        6061, 36300     -- Adloquim Schema
    }

    player:showText(npc, SILKE_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
