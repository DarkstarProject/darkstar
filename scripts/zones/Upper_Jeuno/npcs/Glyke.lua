-----------------------------------
-- Area: Upper Jeuno
-- NPC: Glyke
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,GLYKE_SHOP_DIALOG);

stock = {0x1193,92,    -- Iron Bread
     0x1138,128,    -- Tortilla
     0x1104,184,    -- White Bread
     0x1140,1400,    -- Pea Soup
     0x1168,2070,    -- Boiled Crab
     0x1155,662,    -- Roast Mutton
     0x1136,440,    -- Baked Apple
     0x11CB,1711,    -- Windurst Salad
     0x11CF,4585,    -- Herb Quus
     0x1146,184,    -- Orange Juice
     0x1147,276,    -- Apple Juice
     0x115A,368,    -- Pineapple Juice
     0x1148,1012,    -- Mellon Juice
     0x1159,855}    -- Grape Juice
 
showShop(player, STATIC, stock);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



