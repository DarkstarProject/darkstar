-----------------------------------
-- Area: Bastok Mines
-- NPC: Echo Hawk
-- Standard Info NPC
-- Involved in Quest: The Siren's Tear
-- @zone: 234
-- @pos -0.965 5.999 -15.567
-----------------------------------

require("scripts/globals/quests");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

	if (SirensTear == QUEST_AVAILABLE) then
		player:startEvent(0x0005);
	else
		player:startEvent(0x000d);
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