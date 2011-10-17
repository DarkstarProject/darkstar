-----------------------------------
-- Area: Windurst Waters
-- NPC: Ness Rugetomal
-- Standard Merchant NPC
-- Working 100%
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,NESSRUGETOMALL_SHOP_DIALOG);

stock = {0x112a,10,1,	--Ginger Cookie
		 0x1137,727,1,	--Carp Sushi
		 0x1149,323,1,	--Tomato Juice
		 0x116b,1656,1,	--Nebimonite Bake

		 0x112d,14,2,	--Cinna-cookie
		 0x1146,184,2,	--Orange Juice
		 0x1168,2070,2,	--Boiled Crab

		 0x119e,21,3,	--Acorn Cookie
		 0x1118,108,3,	--Meat Jerky
		 0x119d,10,3,	--Distilled Water
		 0x11ba,846}	--Roast Pipira
 
showNationShop(player, WINDURST, stock);
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



