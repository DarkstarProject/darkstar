-----------------------------------
-- Area: Al Zahbi
-- NPC: Kahah Hobichai
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
require("scripts/zones/Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,KAHAHHOBICHAI_SHOP_DIALOG);

stock = {0x005A,200,        -- Rusty Bucket
     0x025d,200,        -- Pickaxe (not available when AC is taken)
     0x03FC,300,        -- Sickle (not available when AC is taken)
     0x03FD,500,        -- Hatchet (not available when AC is taken)
     0x4051,164,        -- Bronze Knife
     0x4052,2425}        -- Knife
 
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



