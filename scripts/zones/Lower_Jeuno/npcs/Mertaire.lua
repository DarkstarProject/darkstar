-----------------------------------
-- Area: Lower Jeuno
-- NPC: Mertaire
-- Starts and Finishes Quest: The Old Monument (start only), A Minstrel in Despair, Painful Memory (BARD AF1)
-- @pos -17 0 -61 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(JEUNO, THE_OLD_MONUMENT) == QUEST_COMPLETED) then
		if (trade:hasItemQty(634,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0065);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local painfulMemory = player:getQuestStatus(JEUNO,PAINFUL_MEMORY);
	local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);
	local job = player:getMainJob()
	local level = player:getMainLvl()

	if (job ~= 10 and level >= ADVANCED_JOB_LEVEL) then
		if (player:getVar("TheOldMonument_Event") == 0 and player:getQuestStatus(JEUNO,THE_OLD_MONUMENT) == QUEST_AVAILABLE) then
			player:startEvent(0x0066);
		end
	elseif (job == 10 and level >= AF1_QUEST_LEVEL and painfulMemory == QUEST_AVAILABLE) then
		if (player:getVar("PainfulMemoryCS") == 0) then
			player:startEvent(0x008a); -- Long dialog for "Painful Memory"
		else
			player:startEvent(0x0089); -- Short dialog for "Painful Memory"
		end
	elseif (painfulMemory == QUEST_ACCEPTED) then
		player:startEvent(0x0088); -- During Quest "Painful Memory"
	elseif (painfulMemory == QUEST_COMPLETED) then
		player:startEvent(0x0087); -- Standard dialog after completed "Painful Memory"

		if (circleOfTime == QUEST_AVAILABLE and level >= 50 and job == 10 ) then
			player:startEvent(0x8B); -- Start "The Circle of Time"
			player:addQuest(JEUNO,THE_CIRCLE_OF_TIME);
			player:setVar("circleTime",1);
		end

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

	if (csid == 0x0066 and option == 0) then
		player:setVar("TheOldMonument_Event",1);
	elseif (csid == 0x0065) then
		player:addGil(GIL_RATE*2100);
		player:messageSpecial(GIL_OBTAINED, GIL_RATE*2100);
		player:tradeComplete();
		player:completeQuest(JEUNO,A_MINSTREL_IN_DESPAIR);		
		player:addFame(JEUNO, JEUNO_FAME*30);
	elseif (csid == 0x008a and option == 1 or csid == 0x0089 and option == 1) then
		player:addQuest(JEUNO,PAINFUL_MEMORY);
		player:setVar("PainfulMemoryCS",0);
		player:addKeyItem(MERTAIRES_BRACELET);
		player:messageSpecial(KEYITEM_OBTAINED,MERTAIRES_BRACELET); -- Mertaire's Bracelet (key item).
	elseif (csid == 0x008a and option == 0) then
		player:setVar("PainfulMemoryCS",1);
	end
end;

