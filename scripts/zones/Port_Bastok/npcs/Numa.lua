-----------------------------------
-- Area: Port Bastok
-- NPC: Numa
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,NUMA_SHOP_DIALOG);

stock = {0x30a9,5079,1,		-- Cotton Hachimaki
	 0x3129,7654,1,		-- Cotton Dogi
	 0x31a9,4212,1,		-- Cotton Tekko
	 0x3229,6133,1,		-- Cotton Sitabaki
	 0x32a9,3924,1,		-- Cotton Kyahan
	 0x3395,3825,1,		-- Silver Obi

	 0x30a8,759,2,		-- Hachimaki
	 0x3128,1145,2,		-- Kenpogi
	 0x31a8,630,2,		-- Tekko
	 0x3228,915,2,		-- Sitabaki
	 0x32a8,584,2,		-- Kyahan
	 0x02c0,132,2,		-- Bamboo Stick

	 0x025d,180,3,		-- Pickaxe
	 0x16eb,13500,3,		-- Toolbag (Ino)
	 0x16ec,18000,3,		-- Toolbag (Shika)
	 0x16ed,18000,3}		-- Toolbag (Cho)
 
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