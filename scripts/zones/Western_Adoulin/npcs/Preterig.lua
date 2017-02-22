-----------------------------------
--  Area: Western Adoulin
--  NPC: Preterig
--  Type: Shop NPC
--  @zone 256
--  @pos 6 0 -53 256
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
    player:showText(npc, PRETERIG_SHOP_TEXT);
    local stock =
    {
        0x1147, 300,    -- Apple Juice
        0x1738, 125,    -- Frontier Soda
        0x1145, 1560,   -- Melon Pie
        0x1146, 200,    -- Orange Juice
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
