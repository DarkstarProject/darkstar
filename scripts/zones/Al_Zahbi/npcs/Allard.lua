-----------------------------------
-- Area: Al Zahbi
--  NPC: Allard
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,ALLARD_SHOP_DIALOG);

    local stock =
    {
        0x30B2,20000,    --Red Cap
    0x3132,32500,    --Gambison
    0x31B2,16900,    --Bracers
    0x3232,24500,    --Hose
    0x32B2,16000}    --Socks

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

