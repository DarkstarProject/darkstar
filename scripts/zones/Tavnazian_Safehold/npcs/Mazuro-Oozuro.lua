-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Mazuro-Oozuro
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,MAZUROOOZURO_SHOP_DIALOG);

    local stock =
    {
        0x426d,108,        -- Lufaise Fly
     0x43e7,2640,        -- Clothespole
     0x02b0,200,        -- Arrowwood Log
     0x02b2,7800,        -- Elm Log
     0x0b37,10000}        -- Safehold Waystone

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

