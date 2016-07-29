-----------------------------------
-- Area: Upper Jeuno
-- NPC: Antonia
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
    
player:showText(npc,ANTONIA_SHOP_DIALOG);

stock = {0x42A5,6256,  -- Mythril Rod
         0x4283,11232, -- Oak Cudgel
         0x428C,18048, -- Mythril Mace
         0x4294,6033,  -- Warhammer
         0x42CA,37440, -- Oak Pole
         0x41C4,44550, -- Halberd
         0x4186,10596, -- Scythe
         0x43A8,7}    -- Iron Arrow
 
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



