-----------------------------------
--  Area: Western Adoulin
--  NPC: Eukalline
--  Type: Shop NPC
--  @zone 256
--  @pos 40 32 121 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, EUKALLINE_SHOP_TEXT);
    local stock =
    {
        0x17C5, 52080,  -- Scroll of Indi-Acumen
        0x17BC, 53460,  -- Scroll of Indi-STR
        0x17D3, 53460,  -- Scroll of Indi-Slow
        0x17D0, 61875,  -- Scroll of Indi-Torpor
        0x17CF, 83160,  -- Scroll of Indi-Slip
        0x17D2, 94185,  -- Scroll of Indi-Languor
        0x17D4, 103040, -- Scroll of Indi-Paralysis
        0x17D1, 504000, -- Scroll of Indi-Vex
        0x17CC, 537030, -- Scroll of Indi-Frailty
        0x17CB, 576300, -- Scroll of Indi-Wilt
        0x17CE, 617100, -- Scroll of Indi-Malaise
        0x17D5, 617100, -- Scroll of Indi-Gravity
        0x17CD, 703800, -- Scroll of Indi-Fade
        0x17F3, 709716, -- Scroll of Indi-Haste
    }
    showShop(player, STATIC, stock);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;
