-----------------------------------
-- Area: Nashmau
--  NPC: Chichiroon
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Nashmau/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,CHICHIROON_SHOP_DIALOG);

    local stock =
    {
        0x1579,99224,    --Bolter's Die
     0x157a,85500,    --Caster's Die
     0x157b,97350,    --Courser's Die
     0x157c,100650,    --Blitzer's Die
     0x157d,109440,    --Tactician's Die
     0x157e,116568}    --Allies' Die

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

