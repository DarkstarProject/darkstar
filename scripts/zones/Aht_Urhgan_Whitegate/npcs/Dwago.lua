-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Dwago
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,DWAGO_SHOP_DIALOG);

    local stock =
    {
        0x43F3,9,    --Lugworm
     0x43F4,3,    --Little worm
     0x4278,11,    --Pet Food Alpha Biscuit
     0x4279,82,    --Pet Food Beta Biscuit
     0x45C6,98}    --Jug of Bug Broth

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

