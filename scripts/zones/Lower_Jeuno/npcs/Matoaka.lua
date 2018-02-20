-----------------------------------
-- Area: Lower Jeuno
--  NPC: Matoaka
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,MATOAKA_SHOP_DIALOG);

    local stock =
    {
        0x340F,1250, -- Silver Earring
     0x3490,1250, -- Silver Ring
     0x3410,4140} -- Mythril Earring

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

