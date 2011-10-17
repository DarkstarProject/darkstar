-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Rubahah
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,RUBAHAH_SHOP_DIALOG);

stock = {0x0275,48,		-- Millioncorn
	 0x08bd,60,		-- Imperial Flour	(available only if AC is in the Al Zahbi)
	 0x08df,316,		-- Coffee Beans	(available only if AC is in the Al Zahbi)
	 0x08a6,68}		-- Imperial Rice	(available only if AC is in the Al Zahbi)
 
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



