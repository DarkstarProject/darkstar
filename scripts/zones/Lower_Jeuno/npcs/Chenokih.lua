-----------------------------------
-- Area: Lower Jeuno
-- NPC: Chenokih
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
    
player:showText(npc,CHENOKIH_SHOP_DIALOG);

stock = {0x3232,24500, -- Hose
     0x3242,22632, -- Linen Slacks
     0x3233,57600, -- Wool Hose
     0x323A,14756, -- Wool Slops
     0x3241,6348,  -- Black Slacks 
     0x32B2,16000, -- Socks
     0x32C2,14352, -- Shoes
     0x32B3,35200, -- Wool Socks
     0x32BA,9180,  -- Chestnut Sabots
     0x32C1,4128,  -- Sandals
     0x3509,11088, -- Black Cape
     0x3500,1250}  -- Scarlet Ribbon
 
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



