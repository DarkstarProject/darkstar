-----------------------------------
--	Area: Windurst_Woods
--	NPC: Nhobi Zalkia
--	Only sells when Windurst controlls Kuzotz Region
--	Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Windurst_Woods/TextIDs");

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

if (RegionOwner ~= WINDURST) then 
	player:showText(npc,NHOBI_ZALKIA_CLOSED_DIALOG);
else
	player:showText(npc,NHOBI_ZALKIA_OPEN_DIALOG);
	
	stock = {0x0394,855, --Cactuar Needle
			 0x113c,299, --Thundermelon
			 0x118b,184} --Watermelon

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