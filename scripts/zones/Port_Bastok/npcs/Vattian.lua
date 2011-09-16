-----------------------------------
--	Area: Port Bastok
--	NPC: Vattian
--	Only sells when Bastok controlls Kuzotz Region
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
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

RegionOwner = getRegionOwner(KUZOTZ);

if (RegionOwner ~= BASTOK) then 
	player:showText(npc,VATTIAN_CLOSED_DIALOG);
else
	player:showText(npc,VATTIAN_OPEN_DIALOG);
	
	stock = {0x0394,855,		-- Cactuar Needle
		 0x113c,299,		-- Thundermelon
		 0x118b,184}		-- Watermelon
			  
showShop(player,BASTOK,stock);
end
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