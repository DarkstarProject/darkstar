-----------------------------------
--	Area: Windurst Waters
--	NPC:  Fuepepe
--	Starts and Finishes Quest: Teacher's Pet
-- Involved in Quest: Making the grade, Class Reunion
--  @zone = 238
--  @pos = 161 -2 161
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED and player:getVar("QuestMakingTheGrade_prog") == 0) then
		if (trade:hasItemQty(544,1) and trade:getItemCount() == 1 and trade:getGil() == 0) then
			player:startEvent(0x01c7); -- Quest Progress: Test Papers Shown and told to deliver them to principal
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local gradestatus = player:getQuestStatus(WINDURST,MAKING_THE_GRADE);
	local prog = player:getVar("QuestMakingTheGrade_prog");
		-- 1 = answers found
		-- 2 = gave test answers to principle
		-- 3 = spoke to chomoro

	if (player:getQuestStatus(WINDURST,TEACHER_S_PET) == QUEST_COMPLETED and gradestatus == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >=3 and player:getQuestStatus(WINDURST,LET_SLEEPING_DOGS_LIE) ~= QUEST_ACCEPTED) then
		player:startEvent(0x01ba); -- Quest Start
	elseif (gradestatus == QUEST_ACCEPTED) then

		if (prog == 0) then
				player:startEvent(0x01bb); -- Get Test Sheets Reminder
		elseif (prog == 1) then
			player:startEvent(0x01c8); -- Deliver Test Sheets Reminder
		elseif (prog == 2 or prog == 3) then
			player:startEvent(0x01ca); -- Quest Finish	
		end
	elseif (gradestatus == QUEST_COMPLETED and player:needToZone() == true) then
		player:startEvent(0x01cb); -- After Quest
	-------------------------------------------------------
	-- Class Reunion
	elseif (player:getQuestStatus(WINDURST,CLASS_REUNION) == QUEST_ACCEPTED and player:getVar("ClassReunionProgress") >= 3 and player:getVar("ClassReunion_TalkedToFupepe") ~= 1) then
		player:startEvent(0x0331); -- he tells you about Uran-Mafran
	-------------------------------------------------------
	else
		player:startEvent(0x1a7); -- Standard Conversation
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
	if (csid == 0x01ba and option == 1) then -- Quest Start
		player:addQuest(WINDURST,MAKING_THE_GRADE);
	elseif (csid == 0x01c7) then -- Quest Progress: Test Papers Shown and told to deliver them to principal
		player:setVar("QuestMakingTheGrade_prog",1);
	elseif (csid == 0x01ca) then -- Quest Finish
		if (player:getFreeSlotsCount() == 0) then
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4855);
		else
			player:completeQuest(WINDURST,MAKING_THE_GRADE);
			player:addFame(WINDURST,WIN_FAME*75);
			player:addItem(4855);
			player:messageSpecial(ITEM_OBTAINED,4855);
			player:setVar("QuestMakingTheGrade_prog",0);
			player:needToZone(true);
		end
	elseif (csid == 0x0331) then
		player:setVar("ClassReunion_TalkedToFupepe",1);
	end	
end;
