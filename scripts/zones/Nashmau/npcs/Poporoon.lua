-----------------------------------
-- Area: Nashmau
-- NPC: Poporoon
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
require("scripts/zones/Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,POPOROON_SHOP_DIALOG);

stock = {0x3298,336,		-- Leather Highboots
	 0x3299,3438,		-- Lizard Ledelsens
	 0x329A,11172,		-- Studded Boots
	 0x329B,20532}		-- Cuir Highboots
 
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



