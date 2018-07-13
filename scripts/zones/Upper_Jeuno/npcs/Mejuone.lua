-----------------------------------
-- Area: Upper Jeuno
--  NPC: Mejuone
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

    player:showText(npc,MEJUONE_SHOP_DIALOG);

    local stock =
    {
        4545,62,        -- Gysahl Greens
     840,7,        -- Chocobo Feather
     17307,9}        -- Dart

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

