-----------------------------------
--	Area: Port Windurst
--	NPC: Aroro 
--	Standard Merchant NPC
--	Working 100%
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
	
player:showText(npc,ARORO_SHOP_DIALOG);

stock = {0x12fe,114,1,  --Blind

		 0x12dc,84,2,   --Poison
		 0x12e6,368,2,  --Bio
		 0x12fd,2300,2, --Sleep 
		 
		 0x129f,62,3,   --Stone
		 0x12a9,143,3,  --Water
		 0x129a,331,3,  --Aero
		 0x1290,855,3,  --Fire
		 0x1295,1619,3, --Blizzard
		 0x12a4,3334,3, --Thunder
		 0x12eb,4747,3, --Burn
		 0x12ec,3770,3, --Frost
		 0x12ed,2300,3, --Choke
		 0x12ee,1867,3, --Rasp
		 0x12ef,1393,3, --Shock
		 0x12f0,6508,3} --Drown

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