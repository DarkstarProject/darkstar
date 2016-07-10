-----------------------------------
--  Area: Western Adoulin
--  NPC: Ansegusele
--  Type: Shop NPC
--  @zone 256
--  @pos 74 4 -126 256
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
    player:showText(npc, ANSEGUSELE_SHOP_TEXT);
    local stock =
    {
        0x110B, 44, -- Faerie Apple
        0x1124, 44, -- Eggplant
        0x115C, 24, -- Rarab Tail
        0x026B, 48, -- Popoto
        0x1174, 80, -- Pamamas
        0x1125, 32, -- San D'Or. Carrot
        0x0276, 96, -- Ogre Pumpkin
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
