-----------------------------------
--  Area: Western Adoulin
--  NPC: Ishvad
--  Type: Shop NPC
--  @zone 256
--  @pos 44 32 125 256
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
    player:showText(npc, ISHVAD_SHOP_TEXT);
    local stock =
    {
        0x17BA, 100,    -- Scroll of Indi-Poison
        0x17C8, 372,    -- Scroll of Indi-Voidance
        0x17C7, 1400,   -- Scroll of Indi-Precision
        0x17B9, 2335,   -- Scroll of Indi-Regen
        0x17CA, 2425,   -- Scroll of Indi-Attunement
        0x17C9, 6692,   -- Scroll of Indi-Focus
        0x17C4, 10926,  -- Scroll of Indi-Barrier
        0x17BB, 21000,  -- Scroll of Indi-Refresh
        0x17C2, 21000,  -- Scroll of Indi-CHR
        0x17C1, 23940,  -- Scroll of Indi-MND
        0x17C3, 25270,  -- Scroll of Indi-Fury
        0x17C0, 30912,  -- Scroll of Indi-INT
        0x17BF, 32640,  -- Scroll of Indi-AGI
        0x17C6, 34000,  -- Scroll of Indi-Fend
        0x17BE, 43740,  -- Scroll of Indi-VIT
        0x17BD, 46440,  -- Scroll of Indi-DEX
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
