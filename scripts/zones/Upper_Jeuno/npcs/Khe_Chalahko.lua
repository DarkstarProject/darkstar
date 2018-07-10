-----------------------------------
-- Area: Upper Jeuno
--  NPC: Khe Chalahko
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,KHECHALAHKO_SHOP_DIALOG);

    local stock =
    {
        12416,29311,        -- Sallet
     12544,45208,        -- Breastplate
     12800,34776,        -- Cuisses
     12928,21859,        -- Plate Leggins
     12810,53130,        -- Breeches
     12938,32637}        -- Sollerets

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

