-----------------------------------
--	Area: Mhaura
--	NPC: Pikini-Mikini
--	Standard Merchant NPC
--	Working 100%
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,PIKINIMIKINI_SHOP_DIALOG);

stock = {0x1036,2335,  --Eye Drops
		 0x1034,284,   --Antidote
		 0x1037,720,   --Echo Drops
		 0x1010,819,   --Potion
		 0x119d,10,	   --Distilled Water
		 0x43f3,9,	   --Lugworm
		 0x3fd,450,	   --Hatchet
		 0x126c,3888,  --Scroll of Regen
		 0x126e,7047,  --Scroll of Regen II
		 0x1311,10080, --Scroll of Sleepga
		 0x1252,27216, --Scroll of Baramnesi
		 0x1253,27216, --Scroll of Baramnesra
		 0x1118,108,   --Meat Jerky
		 0x14b3,133,   --Salsa
		 0x0b33,9000}  --Mhaura Waystone
 
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



