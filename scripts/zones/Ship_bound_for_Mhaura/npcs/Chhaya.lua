-----------------------------------
-- Area: Ship Bound for Mhaura
-- NPC:  Chhaya
-- Standard Merchant NPC
-- @pos -1.139 -2.101 -9.000 221
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Ship_bound_for_Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
player:showText(npc,CHHAYA_SHOP_DIALOG);

stock = {0x1010,910,    --Potion
     0x1020,4832,    --Ether
     0x1034,316,    --Antidote
     0x1036,2595,    --Eye Drops
     0x1037,800}    --Echo Drops
 
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



