-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Zauko
-- Involved in Quests: Save the Clock Tower
-- @zone 245
-- @pos -3 0 11
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
		if(a == 0 or (a ~= 256 and a ~= 288 and a ~= 320 and a ~= 384 and a ~= 768 and a ~= 352 and a ~= 896 and a ~= 416 and 
		   a ~= 832 and a ~= 448 and a ~= 800 and a ~= 480 and a ~= 864 and a ~= 928 and a ~= 960 and a ~= 992)) then 
			player:startEvent(0x0032,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0076);
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
	if(csid == 0x0032) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 256);
	end
end;