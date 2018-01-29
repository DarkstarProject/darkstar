-----------------------------------
-- Area: Western Adoulin
--  NPC: Tevigogo
-- Type: Shop NPC
--  @zone 256
--  !pos -151 3 -36 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, TEVIGOGO_SHOP_TEXT);
    local stock =
    {
        0x025D, 200,    -- Pickaxe
        0x03FD, 500,    -- Hatchet
        0x03FC, 300,    -- Sickle
        0x439B, 10,     -- Dart
        0x439C, 60,     -- Hawkeye
        0x43A8, 8,      -- Iron Arrow
    }
    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
