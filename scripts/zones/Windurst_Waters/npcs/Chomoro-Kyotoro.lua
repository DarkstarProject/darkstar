-----------------------------------
--	Area: Windurst Waters
--	NPC: Chomoro-Kyotoro
--  Involved in Quest: Making the Grade
--  @zone = 238
--  @pos = 133 -5 167
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
qMakingTheGrade = player:getQuestStatus(WINDURST,MAKING_THE_GRADE);

	if (qMakingTheGrade == QUEST_ACCEPTED) then
		prog = player:getVar("QuestMakingTheGrade_prog");
		if (prog == 0) then
			player:startEvent(0x01c6);
		elseif (prog == 1) then
			player:startEvent(0x01c9);
		elseif (prog == 2) then
			player:startEvent(0x01cc);
		else
			player:startEvent(0x01cd);
		end
	else 
		player:startEvent(0x01b0);
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