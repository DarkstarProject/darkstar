-----------------------------------
-- Area: Windurst Woods
-- NPC: Manyny
-- Standard Merchant NPC
-- Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,MANYNY_SHOP_DIALOG);

stock = {0x13a8,3112, --Sinewy Etude
		 0x13a9,2784, --Dextrous Etude
		 0x13aa,2184, --Vivacious Etude
		 0x13ab,1892, --Quick Etude
		 0x13ac,1550, --Learned Etude
		 0x13ad,1252, --Spirited Etude
		 0x13ae,990}  --Enchanting Etude
 
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