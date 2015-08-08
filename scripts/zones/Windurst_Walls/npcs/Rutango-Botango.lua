-----------------------------------
--	Area: Windurst Walls
--  Location: X:-92  Y:-9  Z:107
--	NPC:  Rutango-Botango
--	Working 100%
--  Involved in Quest: To Bee or Not to Bee?
-----------------------------------

require("scripts/globals/settings");
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
	local ToBee = player:getQuestStatus(WINDURST,TO_BEE_OR_NOT_TO_BEE);
	local ToBeeOrNotStatus = player:getVar("ToBeeOrNot_var");
	
	if (ToBeeOrNotStatus == 10) then 
		player:startEvent(0x0041); -- During Too Bee quest before honey given to Zayhi:  "Oh Crumb...lost his voice"
	elseif (ToBee == QUEST_ACCEPTED and ToBeeOrNotStatus > 0) then 
		player:startEvent(0x0047); -- During Too Bee quest after some honey was given to Zayhi: "lap up more honey"
	elseif (ToBee == QUEST_COMPLETED and player:needToZone()) then
		player:startEvent(0x004c); -- After Too Bee quest but before zone: "master let me speak for you"
	else
		player:startEvent(0x0129); -- Standard Conversation
	end
end;

-- CS/Event ID List for NPC
-- *Rutango-Botango	CS 443 - player:startEvent(0x01bb); -- Long Star Sybil CS
-- Rutango-Botango	CS 297 - player:startEvent(0x0129); -- Standard Conversation
-- *Rutango-Botango	CS 64 - player:startEvent(0x0040); -- Zayhi Coughing
-- Rutango-Botango	CS 65 - player:startEvent(0x0041); -- During Too Bee quest before honey given to Zayhi:  "Oh Crumb...lost his voice"
-- Rutango-Botango	CS 71 - player:startEvent(0x0047); -- During Too Bee quest after some honey was given to Zayhi: "lap up more honey"
-- *Rutango-Botango	CS 75 - player:startEvent(0x004b); -- Combo CS: During Too Bee quest, kicked off from Zayhi
-- Rutango-Botango	CS 76 - player:startEvent(0x004c); -- After Too Bee quest but before zone: "master let me speak for you"

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



