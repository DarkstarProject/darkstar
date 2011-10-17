-----------------------------------
-- Area: Bastok Mines
-- NPC: Griselda
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,GRISELDA_SHOP_DIALOG);

stock = {0x115A,360,1, -- Bottle of pineapple juice

	 0x1127,21,2,  -- Bretzel
	 0x1148,990,2, -- Bottle of melon juice
	 0x118A,432,2, -- Pickled herring
		 
	 0x119D,10,3,  -- Flask of distilled water
	 0x1193,90,3,  -- Loaf of iron bread
	 0x1118,108,3} -- Strip of meat jerky
 
showNationShop(player, BASTOK, stock);
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



