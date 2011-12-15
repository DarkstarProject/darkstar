-----------------------------------
-- Area: Lower Jeuno
-- NPC: Teigero Bangero
-- Involved in Quests: Save the Clock Tower
-- @zone 245
-- @pos -58 0 -143
-----------------------------------

package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(555,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
		if(a == 0 or (a ~= 128 and a ~= 160 and a ~= 192 and a ~= 384 and a ~= 640 and a ~= 224 and a ~= 896 and a ~= 416 and 
		   a ~= 704 and a ~= 448 and a ~= 672 and a ~= 480 and a ~= 736 and a ~= 928 and a ~= 960 and a ~= 992)) then 
			player:startEvent(0x004a,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x004B);
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
	if(csid == 0x004a) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 128);
	end
end;