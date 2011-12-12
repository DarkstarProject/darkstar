-----------------------------------
-- Area: Lower Jeuno
-- NPC: Panta-Putta
-- Starts and Finishes Quest: The Wonder Magic Set
-- @zone 245
-- @pos -61 0 -140
-----------------------------------

package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getFameLevel(JEUNO) >= 4 and player:getQuestStatus(JEUNO,THE_WONDER_MAGIC_SET) == QUEST_AVAILABLE) then 
		player:startEvent(0x004D); -- Start quest
	elseif(player:hasKeyItem(WONDER_MAGIC_SET) == true) then
		player:startEvent(0x0021); -- Finish quest
	else
		player:startEvent(0x004E); -- Standard dialog
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
	if(csid == 0x004D and option == 1) then 
		player:addQuest(JEUNO,THE_WONDER_MAGIC_SET);
	elseif(csid == 0x0021) then 
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13328);
		else
			player:completeQuest(JEUNO,THE_WONDER_MAGIC_SET);
			player:setTitle(FOOLS_ERRAND_RUNNER);
			player:delKeyItem(WONDER_MAGIC_SET);
			player:addItem(13328);
			player:messageSpecial(ITEM_OBTAINED,13328);
			player:addFame(JEUNO,30);
			player:needToZone(true);
		end
	end
end;



