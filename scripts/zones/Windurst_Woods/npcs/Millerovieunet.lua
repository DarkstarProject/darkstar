-----------------------------------
--	Area: Windurst_Woods
--	NPC: Millerovieunet
--	Only sells when Windurst controlls Qufim Region
--	Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
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

RegionOwner = getRegionOwner(QUFIM);

if (RegionOwner ~= WINDURST) then 
	player:showText(npc,MILLEROVIEUNET_CLOSED_DIALOG);
else
	player:showText(npc,MILLEROVIEUNET_OPEN_DIALOG);
	
	stock = {0x03ba,4121} --Magic Pot Shard
			  
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



