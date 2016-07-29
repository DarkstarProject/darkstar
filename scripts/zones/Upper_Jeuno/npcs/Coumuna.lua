-----------------------------------
-- Area: Upper Jeuno
-- NPC: Coumuna
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
    
player:showText(npc,COUMUNA_SHOP_DIALOG);

stock = {0x4141,4186, -- Greataxe
     0x4086,31000, -- Mythril Degen
     0x404C,11128, -- Kris 
     0x4053,14560, -- Mythril Knife
     0x400F,15488, -- Katars
     0x40CD,13926, -- Two-Handed Sword
     0x401C,29760, -- Mythril Claws
     0x40B7,85250} -- Knight's Sword
 
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



