-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Blingbrix
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
        4116,  4500,    --Hi-Potion
        4132, 28000,    --Hi-Ether
        605,    200,    --Pickaxe
        1020,   300     --Sickle
    }

    player:showText(npc, BLINGBRIX_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
