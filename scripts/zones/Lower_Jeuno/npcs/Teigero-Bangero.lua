-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Teigero Bangero
-- Involved in Quests: Save the Clock Tower, The Lost Cardian
-- @zone 245
-- @pos -58 0 -143
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
	if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
		if (a == 0 or (a ~= 128 and a ~= 160 and a ~= 192 and a ~= 384 and a ~= 640 and a ~= 224 and a ~= 896 and a ~= 416 and 
		   a ~= 704 and a ~= 448 and a ~= 672 and a ~= 480 and a ~= 736 and a ~= 928 and a ~= 960 and a ~= 992)) then 
			player:startEvent(0x004a,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	TheKindCardian = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);

	if (player:getQuestStatus(JEUNO,THE_WONDER_MAGIC_SET) == QUEST_AVAILABLE) then 
		player:startEvent(0x0022); -- Base Standard CS & dialog
	elseif (player:getQuestStatus(JEUNO,COOK_S_PRIDE) ~= QUEST_COMPLETED) then 
		rand = math.random(1,2);
		if (rand == 1) then 
			player:startEvent(0x004B); -- During Panta and Naruru Quests
		else
			player:startEvent(0x0020); -- Same...
		end
	elseif (player:getQuestStatus(JEUNO,THE_LOST_CARDIAN) == QUEST_AVAILABLE) then 
		if (player:getVar("theLostCardianVar") == 0) then 
			player:startEvent(0x001D); -- First dialog for "The lost cardien" quest
		else
			player:startEvent(0x0042);
		end
	elseif (TheKindCardian == QUEST_ACCEPTED) then 
		player:startEvent(0x0042); -- During quest "The kind cardien"
	elseif (TheKindCardian == QUEST_COMPLETED) then 
		player:startEvent(0x0043); -- New standard dialog after "The kind cardien"
	else
		player:startEvent(0x0022); -- Base Standard CS & dialog
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
	if (csid == 0x004a) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 128);
	elseif (csid == 0x001D) then 
		player:setVar("theLostCardianVar",1);
	end
end;