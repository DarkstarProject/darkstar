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
        0x3080,29311,        -- Sallet
     0x3100,45208,        -- Breastplate
     0x3200,34776,        -- Cuisses
     0x3280,21859,        -- Plate Leggins
     0x320A,53130,        -- Breeches
     0x328A,32637}        -- Sollerets

    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

