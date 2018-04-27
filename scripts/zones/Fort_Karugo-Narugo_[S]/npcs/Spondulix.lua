-----------------------------------
-- Area: Fort Karugo-Narugo
--  NPC: Spondulix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, SPONDULIX_SHOP_DIALOG);
    local stock =
    {
        4116,  4500, -- Hi-Potion
        4132, 28000, -- Hi-Ether
        2563,  3035, -- Karugo Clay
    };
    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
