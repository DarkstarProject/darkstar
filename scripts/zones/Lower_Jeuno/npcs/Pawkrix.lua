-----------------------------------
-- Area: Lower Jeuno
-- NPC: 
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
    
player:showText(npc,PAWKRIX_SHOP_DIALOG);

stock = {0x0277,36,   -- Horo Flour
     0x116A,276,  -- Goblin Bread
     0x11BB,650,  -- Goblin Pie
     0x118F,35,   -- Goblin Chocolate
     0x11BF,1140, -- Goblin Mushpot 
     0x03B8,515,  -- Poison Flour
     0x04D7,490}  -- Goblin Doll
 
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



