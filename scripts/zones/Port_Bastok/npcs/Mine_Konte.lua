-----------------------------------
-- Area: Port Bastok
-- NPC: Mine Konte
-- Involved in Quest: Out of One's Shell
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

	OutOfOneShell = player:getQuestStatus(BASTOK,OUT_OF_ONE_S_SHELL);

	if (OutOfOneShell == QUEST_ACCEPTED and player:getVar("OutOfTheShellZone") == 0) then
		player:startEvent(0x0053);
	else
		player:startEvent(0x002a);	
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