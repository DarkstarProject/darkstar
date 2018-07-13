-----------------------------------
-- Area: Selbina
--  NPC: Torapiont
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,TORAPIONT_SHOP_DIALOG);

    local stock =
    {
        16411,11491,        --Claws
     16451,7727,        --Mythril Dagger
     16513,11588,        --Tuck
     16584,37800,        --Mythril Claymore
     16643,11040,        --Battleaxe
     16705,4095,        --Greataxe
     17050,333,        --Willow Wand
     17051,1409,        --Yew Wand
     17089,571,        --Holly Staff
     17307,9,        --Dart
     17336,5,        --Crossbow Bolt
     17318,3,        --Wooden Arrow
     17320,7}        --Iron Arrow

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

