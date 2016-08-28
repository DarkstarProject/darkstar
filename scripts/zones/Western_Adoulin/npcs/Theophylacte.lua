-----------------------------------
--  Area: Western Adoulin
--  NPC: Theophylacte
--  Type: Shop NPC
--  @zone 256
--  @pos 154 4 -33 256
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
    player:showText(npc, THEOPHYLACTE_SHOP_TEXT);
    local stock =
    {
        0x1010, 910,    -- Potion
        0x1014, 4500,   -- Hi-Potion
        0x1020, 4832,   -- Ether
        0x1024, 28000,  -- Hi-Ether
        0x1034, 316,    -- Antidote
        0x1037, 800,    -- Echo Drops
        0x103B, 3360,   -- Remedy
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
