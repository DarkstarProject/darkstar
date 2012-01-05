-----------------------------------
-- Area: Port Bastok
-- NPC: Carmelo
-- Standard Info NPC
-- Involved in Quest: The Siren's Tear
-- @zone: 236
-- @pos: -146.476 -7.48 -10.889
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

	if (SirensTear == QUEST_ACCEPTED) then
		player:startEvent(0x0006);
	elseif (SirensTear == QUEST_COMPLETED) then
		player:startEvent(0x0013);
	else
		player:startEvent(0x00b6);
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

	if (csid == 0x0006) then
		player:setVar("SirensTear",1);
	elseif(csid == 0x0013) then
		player:setVar("SirensTear",2);
	end

end;