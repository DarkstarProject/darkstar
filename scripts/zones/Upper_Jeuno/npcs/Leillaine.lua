-----------------------------------
-- Area: Upper Jeuno
-- NPC: Leillaine
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
    
player:showText(npc,LEILLAINE_SHOP_DIALOG);

stock = {0x119D,10,        -- Distilled Water
     0x1036,2387,        -- Eye Drops
     0x1034,290,        -- Antidote
     0x1037,736,        -- Echo Drops
     0x1010,837,        -- Potion
     0x1020,4445,        -- Ether
     0x103B,22400}        -- Remedy
 
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



