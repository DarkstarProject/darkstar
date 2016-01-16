-----------------------------------
-- Area: Port Jeuno
-- NPC: Leyla
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,LEYLA_SHOP_DIALOG);

stock = {0x439c,55,        -- Hawkeye     
     0x43a8,7,        -- Iron Arrow      
     0x43b8,5,        -- Crossbow Bolt  
     0x119d,10,        -- Distilled Water 
     0x13ae,1000,        -- Enchanting Etude 
     0x13ad,1265,        -- Spirited Etude     
     0x13ac,1567,        -- Learned Etude 
     0x13ab,1913,        -- Quick Etude     
     0x13aa,2208,        -- Vivacious Etude 
     0x13a9,2815,        -- Dextrous Etude 
     0x13a8,3146}        -- Sinewy Etude     
 
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



