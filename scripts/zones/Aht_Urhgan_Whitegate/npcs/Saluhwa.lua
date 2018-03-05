-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Saluhwa
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,SALUHWA_SHOP_DIALOG);

    local stock =
    {
        0x3002,605,        -- Mapple Shield    (Available when AC is in the city)
     0x3003,1815,        -- Elm Shield    (Available when AC is in the city)
     0x3004,4980,        -- Mahogany Shield    (Available when AC is in the city)
     0x3005,15600,        -- Oak Shield    (Available when AC is in the city)
     0x3007,64791}        -- Round Shield    (Available when AC is in the city)

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

