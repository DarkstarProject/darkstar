-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC: Dabih Jajalioh
-- Standard Merchant NPC
-- Additional script for pereodical
-- goods needed. 
-- Partitially implemented.
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,DABIHJAJALIOH_SHOP_DIALOG);

stock = {0x03b4,60,    --Carnation
     0x027c,119,    --Chamomile
     0x03be,120,    --Marguerite
     0x03b5,96,    --Rain Lily
     0x03ad,80,    --Red Rose
     0x03b7,110}    --Wijnruit

--     Place for difficult script
 
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



