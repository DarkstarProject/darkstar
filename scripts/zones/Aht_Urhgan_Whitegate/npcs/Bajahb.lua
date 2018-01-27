-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Bajahb
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

    player:showText(npc,BAJAHB_SHOP_DIALOG);

    local stock =
    {
        0x3088,10260,    --Iron Mask
    0x3108,15840,    --Chainmail
    0x3188,8460,    --Chain Mittens
    0x3208,12600,    --Chain Hose
    0x3288,7740}    --Greaves

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

