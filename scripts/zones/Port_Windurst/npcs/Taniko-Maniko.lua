-----------------------------------
-- Area: Port Windurst
-- NPC: Taniko-Maniko
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,TANIKOMANIKO_SHOP_DIALOG);

stock = {0x4181,2542,1,		--Brass Zaghnal
	 0x4302,7128,1,		--Wrapped Bow
	 0x43ab,162,1,		--Ice Arrow
	 0x43ac,162,1,		--Lightning Arrow

	 0x4015,104,2,		--Cat Baghnakhs
	 0x4001,129,2,		--Cesti
	 0x4109,5864,2,		--Bone Pick
	 0x4301,482,2,		--Self Bow
	 0x43a6,3,2,		--Wooden Arrow
	 0x439c,54,2,		--Hawkeye
	 0x4380,1575,2,		--Boomerang

	 0x4102,4198,3,		--Bone Axe
	 0x4180,309,3,		--Bronze Zaghnal
	 0x41c0,97,3,		--Harpoon
	 0x4300,39,3,		--Shortbow
	 0x43a7,4,3}		--Bone Arrow

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