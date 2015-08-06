-----------------------------------
-- Area: Upper Jeuno
-- NPC: Souren
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- @pos -51 0 4
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz1"); -- NPC Part1
		if (a == 0 or (a ~= 16 and a ~= 17 and a ~= 18 and a ~= 20 and a ~= 24 and a ~= 19 and a ~= 28 and a ~= 21 and 
		   a ~= 26 and a ~= 22 and a ~= 25 and a ~= 23 and a ~= 27 and a ~= 29 and a ~= 30 and a ~= 31)) then 
			player:startEvent(0x00b6,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(JEUNO,SAVE_THE_CLOCK_TOWER) == QUEST_ACCEPTED) then
		player:startEvent(0x0078);
	elseif (player:getQuestStatus(JEUNO,SAVE_THE_CLOCK_TOWER) == QUEST_COMPLETED) then
		player:startEvent(0x00b5);
	else
		player:startEvent(0x0058);
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
	if (csid == 0x00b6) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 16);
	end
end;



