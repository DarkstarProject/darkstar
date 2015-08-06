-----------------------------------
-- Area: Port Bastok
-- NPC:  Otto
-- Standard Info NPC
-- Involved in Quest: The Siren's Tear
-- @zone: 236
-- @pos -145.929 -7.48 -13.701
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

	if (SirensTear == QUEST_ACCEPTED and player:getVar("SirensTear") == 0) then
		player:startEvent(0x0005);
	else
		player:startEvent(0x0014);
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