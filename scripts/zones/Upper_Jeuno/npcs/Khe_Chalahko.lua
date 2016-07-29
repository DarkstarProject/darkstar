-----------------------------------
-- Area: Upper Jeuno
-- NPC: Khe Chalahko
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
    
player:showText(npc,KHECHALAHKO_SHOP_DIALOG);

stock = {0x3080,29311,        -- Sallet
     0x3100,45208,        -- Breastplate
     0x3200,34776,        -- Cuisses
     0x3280,21859,        -- Plate Leggins
     0x320A,53130,        -- Breeches
     0x328A,32637}        -- Sollerets
 
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



