-----------------------------------
-- Area: Port Bastok
-- NPC: Tete
-- Continues Quest: The Wisdom Of Elders
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
------------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(BASTOK,THE_WISDOM_OF_ELDERS) == QUEST_ACCEPTED) then
		player:startEvent(0x00af);
	else
		player:startEvent(0x0023);
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

	if (csid == 0x00af) then
		player:setVar("TheWisdomVar",2);
	end
	
end;