-----------------------------------
--  Area: Western Adoulin
--  NPC: Ledericus
--  Type: Shop NPC
--  @zone 256
--  @pos 37 32 117 256
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
    player:showText(npc, LEDERICUS_SHOP_TEXT);
    local stock =
    {
        0x1334, 34000,  -- Scroll of Fira
        0x1335, 604800, -- Scroll of Fira II
        0x1336, 46440,  -- Scroll of Blizzara
        0x1337, 652800, -- Scroll of Blizzara II
        0x1338, 26600,  -- Scroll of Aerora
        0x1339, 556800, -- Scroll of Aerora II
        0x133A, 7476,   -- Scroll of Stonera
        0x133B, 504000, -- Scroll of Stonera II
        0x133C, 54600,  -- Scroll of Thundara
        0x133D, 722700, -- Scroll of Thundara II
        0x133E, 21000,  -- Scroll of Watera
        0x133F, 530265, -- Scroll of Watera II
        0x13EE, 83160,  -- Scroll of Foil
        0x1254, 396825, -- Scroll of Haste II
        0x13F1, 396825, -- Scroll of Flurry II
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
