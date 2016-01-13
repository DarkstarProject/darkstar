-----------------------------------
-- Area: Selbina
--  NPC: Falgima
-- Standard Merchant NPC
-----------------------------------

local text = require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc, text.FALGIMA_SHOP_DIALOG);

    local stock =
    {
    0x1288,5351,        -- Scroll of Invisible
     0x1289,2325,        -- Scroll of Sneak
     0x128A,1204,        -- Scroll of Deodorize
     0x13F0,30360}        -- Scroll of Flurry

    showShop(player, STATIC, stock);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;