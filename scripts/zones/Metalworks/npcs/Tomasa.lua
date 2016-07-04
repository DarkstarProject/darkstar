-----------------------------------
-- Area: Metalworks
-- NPC:  Tomasa
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,TOMASA_SHOP_DIALOG);

stock = {0x112C,257,1,        -- Sausage Roll
     0x1139,73,1,        -- Hard-Boiled Egg
     0x1141,3036,1,        -- Egg Soup
     0x115A,368,1,        -- Pineapple Juice

     0x1127,22,2,        -- Bretzel
     0x11E2,143,2,        -- Sausage
     0x1148,1012,2,        -- Melon Juice

     0x1193,92,3,        -- Iron Bread
     0x1154,294,3,        -- Baked Popoto
     0x1167,184,3,        -- Pebble Soup
     0x119D,10,3}        -- Distilled Water
 
showNationShop(player, BASTOK, stock);
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



