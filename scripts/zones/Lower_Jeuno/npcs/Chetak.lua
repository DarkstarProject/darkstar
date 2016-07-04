-----------------------------------
-- Area: Lower Jeuno
-- NPC: Chetak
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
    
player:showText(npc,CHETAK_SHOP_DIALOG);

stock = {0x30B2,20000, -- Red Cap
     0x30B3,45760, -- Wool Cap
     0x30BA,11166, -- Wool Hat
     0x3132,32500, -- Gambison
     0x3142,33212, -- Cloak
     0x3133,68640, -- Wool Gambison
     0x313A,18088, -- Wool Robe
     0x3141,9527,  -- Black Tunic
     0x31B2,16900, -- Bracers
     0x31C2,15732, -- Linen Mitts 
     0x31BA,10234, -- Wool Cuffs 
     0x31C1,4443}  -- White Mitts
 
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



