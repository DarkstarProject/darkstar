-----------------------------------
-- Area: Lower Jeuno
-- NPC: Yoskolo
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,YOSKOLO_SHOP_DIALOG);

stock = {0x119d,10,        -- Distilled Water
     0x1146,184,        -- Orange Juice
     0x1147,276,        -- Apple Juice
     0x1148,1012,        -- Melon Juice
     0x1159,855,        -- Grape Juice
     0x115a,368,        -- Pineapple Juice
     0x11cc,5544,        -- Icecap Rolanberry
     0x13b6,6380,        -- Scroll of Fire Carol
     0x13b7,7440,        -- Scroll of Ice Carol
     0x13b8,5940,        -- Scroll of Wind Carol
     0x13b9,4600,        -- Scroll of Earth Carol
     0x13ba,7920,        -- Scroll of Lightning Carol
     0x13bb,5000,        -- Scroll of Water Carol
     0x13bc,4200,        -- Scroll of Light Carol
     0x13bd,8400,        -- Scroll of Dark Carol
     0x13d6,60000}        -- Scroll of Sentinel's Scherzo
 
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



