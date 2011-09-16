-----------------------------------
-- Area: Bastok Markets
-- NPC: Peritrage
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
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
	
player:showText(npc,PERITRAGE_SHOP_DIALOG);

stock = {0x4342,14158,1,		-- Zamburak
	 0x4392,294,1,		-- Tathlum

	 0x4341,2166,2,		-- Crossbow
	 0x43B9,22,2,		-- Mythril Bolt

	 0x4340,165,3,		-- Light Crossbow
	 0x43B8,5,3}		-- Crossbow Bolt
 
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