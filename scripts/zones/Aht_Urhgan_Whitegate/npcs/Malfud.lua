-----------------------------------
-- Area: Aht Urhfan Whitegate
--  NPC: Malfud
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,MALFUD_SHOP_DIALOG);

    local stock =
    {
        0x03A8,16,         -- Rock Salt
     0x0272,255,        -- Black Pepper
     0x0279,16,        -- Olive Oil
     0x1124,44,        -- Eggplant
     0x1126,40,        -- Mithran Tomato
     0x08A5,12}        -- Pine Nuts

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

