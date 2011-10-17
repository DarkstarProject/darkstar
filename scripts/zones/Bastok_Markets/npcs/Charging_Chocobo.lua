-----------------------------------
-- Area: Bastok Markets
-- NPC: Charging Chocobo
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,CHARGINGCHOKOBO_SHOP_DIALOG);

stock = {0x3201,58738,1,	--Mythril Cuisses
	0x3281,36735,1, 	--Mythril Leggins

	0x3211,14131,2, 	--Brass Cuisses
	0x3200,34776,2, 	--Cuisses
	0x3291,8419,2,  	--Brass Greaves
	0x3280,21859,2, 	--Plate Leggins
	0x3318,16891,2, 	--Gorget

	0x3220,191,3,		--Bronze Subligar
	0x3210,1646,3,		--Scale Cuisses
	0x32A0,117,3, 		--Bronze Leggins
	0x3290,998,3}		--Scale Greaves
 
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



