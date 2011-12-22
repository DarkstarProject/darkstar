-----------------------------------
--	Area: Windurst Walls
--	NPC:  Koru-Moru
--	Starts & Ends Quest: Star Struck
--  Involved in Quest: Making the Grade
--  @zone = 239
--  @pos = -120 -6 124
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);
qMakingTheGrade = player:getQuestStatus(WINDURST,MAKING_THE_GRADE);
count = trade:getItemCount();
gil = trade:getGil();

	if (qMakingTheGrade == QUEST_ACCEPTED) then
		hasTestAnswers = trade:hasItemQty(544,1);
		if (hasTestAnswers and count == 1 and gil == 0) then
			prog = player:getVar("QuestMakingTheGrade_prog");
			if (prog == 1) then 
				player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
			else
				player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
			end
		end
	elseif (qStarStruck ~= QUEST_AVAILABLE) then
		offersTornEpistle = trade:hasItemQty(584,1);
		if (count == 1 and offersTornEpistle) then
			player:startEvent(0x00c7);
		end

		if (qStarStruck == QUEST_ACCEPTED) then
			offersMeteorite = trade:hasItemQty(582,1);
			if (count == 1 and offersMeteorite) then
				player:startEvent(0x00d3);
			end
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

qStarStruck = player:getQuestStatus(WINDURST,STAR_STRUCK);
qClassReunion = player:getQuestStatus(WINDURST,CLASS_REUNION);
qMakingTheGrade = player:getQuestStatus(WINDURST,MAKING_THE_GRADE);
hasTornEpistle = player:hasItem(584);

	if (qMakingTheGrade == QUEST_ACCEPTED) then
		prog = player:getVar("QuestMakingTheGrade_prog");
		if (prog == 0 and player:hasItem(544)) then
			player:startEvent(0x011f); -- MAKING THE GRADE: Have test answers but not talked/given to Fuepepe
		elseif (prog == 1) then
			player:startEvent(0x011d); -- MAKING THE GRADE: Turn in Test Answer & Told to go back to Fuepepe & Chomoro
		elseif (prog >= 2) then
			player:startEvent(0x011e); -- MAKING THE GRADE: Reminder to go away
		else
			player:startEvent(0x00c1);
		end
	elseif (qStarStruck == QUEST_ACCEPTED) then
		player:startEvent(0x00c6);
	elseif (hasTornEpistle and qClassReunion ~= QUEST_ACCEPTED) then 
		player:startEvent(0x00c5);
	elseif (qStarStruck == QUEST_COMPLETED) then
		player:startEvent(0x00d5);
	else
		player:startEvent(0x00c1);
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
	if (csid == 0x011d) then  -- Giving him KI from Principle
		player:tradeComplete();
		player:addKeyItem(TATTERED_TEST_SHEET);
		player:messageSpecial(KEYITEM_OBTAINED,TATTERED_TEST_SHEET);
		player:setVar("QuestMakingTheGrade_prog",2);
	elseif (csid == 0x00d3) then
		player:tradeComplete();
		player:addItem(12502);
		player:messageSpecial(ITEM_OBTAINED,12502);
		player:completeQuest(WINDURST,STAR_STRUCK);
	elseif (csid == 0x00c7) then
		player:tradeComplete();
		player:messageSpecial(GIL_OBTAINED,50);
		player:addGil(50);
	elseif (csid == 0x00c5 and option == 0) then
		player:addQuest(WINDURST,STAR_STRUCK);
	end
end;