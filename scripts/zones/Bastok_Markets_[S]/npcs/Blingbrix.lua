-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Blingbrix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,BLINGBRIX_SHOP_DIALOG);

    local stock =
    {
        0x1014,4500,    --Hi-Potion
    0x1024,28000,    --Hi-Ether
    0x025D,200,    --Pickaxe
    0x03FC,300}    --Sickle

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

