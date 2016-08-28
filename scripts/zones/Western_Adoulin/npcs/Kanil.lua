-----------------------------------
--  Area: Western Adoulin
--  NPC: Kanil
--  Type: Shop NPC
--  @zone 256
--  @pos 154 4 -5 256
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
    player:showText(npc, KANIL_SHOP_TEXT);
    local stock = {
        0x0262, 60,     -- San D'Or. Flour
        0x119D, 12,     -- Distilled Water
        0x03A8, 16,     -- Rock Salt
        0x0279, 16,     -- Olive Oil
        0x14B3, 148,    -- Salsa
        0x05F3, 316,    -- Apple Mint
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
