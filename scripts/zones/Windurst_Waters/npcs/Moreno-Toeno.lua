-----------------------------------
--	Area: Windurst Waters
--	NPC:  Morno-Toeno
--	Starts and Finishes Quest: Teacher's Pet
--	Working 100%
--  @zone = 238
--  @pos = 169 -2 159
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
	if (player:getQuestStatus(WINDURST,TEACHER_S_PET) >= 1 and trade:hasItemQty(847,1) == true and trade:hasItemQty(4368,1) == true and trade:getGil() == 0 and trade:getItemCount() == 2) then
		player:startEvent(0x01b8,250,847,4368); -- -- Quest Finish
	end
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	teacherstatus = player:getQuestStatus(WINDURST,TEACHER_S_PET);
	if (teacherstatus == QUEST_AVAILABLE) then
		prog = player:getVar("QuestTeachersPet_prog")
		if (prog == 0) then
			player:startEvent(0x01b5); -- Before Quest
			player:setVar("QuestTeachersPet_prog",1);
		elseif (prog == 1) then 
			player:startEvent(0x01b6,0,847,4368); -- Quest Start
		end
	elseif (teacherstatus == QUEST_ACCEPTED) then
		player:startEvent(0x01b7,0,847,4368); -- Quest Reminder
	elseif (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
		player:startEvent(0x01bc); -- During Making the GRADE
	else   --  Will run through these if fame is not high enough for other quests
		rand = math.random(1,2);
		if (rand == 1) then
			player:startEvent(0x01b9); -- Standard Conversation 1
		else
			player:startEvent(0x01d5); -- Standard Conversation 2
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
	if (csid == 0x01b6 and option == 0) then
		player:addQuest(WINDURST,TEACHER_S_PET);
	elseif (csid == 0x01b6 and option == 1) then
		player:setVar("QuestTeachersPet_prog",0);
	elseif (csid == 0x01b8) then
		player:addGil(GIL_RATE*250);
		player:setVar("QuestTeachersPet_prog",0);
		player:tradeComplete(trade);
		if (player:getQuestStatus(WINDURST,TEACHER_S_PET) == QUEST_ACCEPTED) then
			player:completeQuest(WINDURST,TEACHER_S_PET);
			player:addFame(WINDURST,WIN_FAME*75);
		else
			player:addFame(WINDURST,WIN_FAME*8);
		end
	end
end;
