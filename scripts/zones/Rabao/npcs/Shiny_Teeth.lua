-----------------------------------
-- Area: Rabao
--  NPC: Shiny Teeth
-- Standard Merchant NPC
-- !pos -30 8 99 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,SHINY_TEETH_SHOP_DIALOG);

    local stock =
    {
        16450,1867,    --Dagger     1867 - 2111
         16460,11128,    --Kris     11128 - 12096
         16466,2231,    --Knife     2231 - 2522
         16552,4163,    --Scimitar     4163 - 4706
         16553,35308,    --Tulwar     35308
         16558,62560,    --Falchion     62560 - 70720
         17060,2439,    --Rod     2439 - 4680
         16401,103803,    --Jamadhars     103803 - 104944
         17155,23887,    --Composite Bow     23887 - 24150
         17298,294,    --Tathlum     294 - 332
         17320,7,        --Iron Arrow     7 - 10
         17340,92,        --Bullet     92 - 174
         17315,5460,    --Riot Grenade     5460 - 5520
         17284,8996}    --Chakram     8996 - 10995

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;