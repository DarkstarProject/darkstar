-----------------------------------
-- Area: Port Windurst
-- NPC: Lebondur
-- Regional Marchant NPC 
-- Only sells when Windurst controls Vollbow.
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

RegionOwner = getRegionOwner(VOLLBOW);

if (RegionOwner ~= WINDURST) then 
	player:showText(npc,LEBONDUR_CLOSED_DIALOG);
else
	player:showText(npc,LEBONDUR_OPEN_DIALOG);

	stock = {0x27c,119,  --Chamomile
			 0x360,88,   --Fish Scales
			 0x3a8,14,   --Rock Salt
			 0x582,1656} --Sweet William
	
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