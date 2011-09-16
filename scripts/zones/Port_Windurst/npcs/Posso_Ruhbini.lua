-----------------------------------
--	Area: Port Windurst
--	NPC: Posso Ruhbini
--	Regional Marchant NPC 
--	Only sells when Windurst controlls Norvallen
--	Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
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

RegionOwner = getRegionOwner(NORVALLEN);

if (RegionOwner ~= WINDURST) then 
	player:showText(npc,POSSORUHBINI_CLOSED_DIALOG);
else
	player:showText(npc,POSSORUHBINI_OPEN_DIALOG);

	stock = {0x2b0,18, --Arrowwood Log
			 0x2ba,87, --Ash Log
			 0x26a,25, --Blue Peas
			 0x26d,25} --Crying Mustard

showShop(player,WINDURST,stock);
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