-----------------------------------
-- Area: Nashmau
--  NPC: Pipiroon
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

    player:showText(npc,PIPIROON_SHOP_DIALOG);

    local stock =
    {
        0x43A1,1204,        -- Grenade
     0x43A3,6000,        -- Riot Grenade
     0x03A0,515,        -- Bomb Ash
     0x0b39,10000}        -- Nashmau Waystone

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

