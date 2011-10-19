-----------------------------------
-- Area: Lower Jeuno
-- NPC: Bki Tbujhja
-- Involved in Quest: The Old Monument
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("TheOldMonument_Event") == 1) then
		player:startEvent(0x00b5);
	elseif (player:getVar("PathOfTheBard_Event") == 0 and player:getQuestStatus(JEUNO,A_MINSTREL_IN_DESPAIR) == 2) then
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
	
	if (csid == 0x00b5) then
	   	player:setVar("TheOldMonument_Event",2);
	elseif (csid == 0x00b6 and option == 0) then
		player:setVar("PathOfTheBard_Event",1);
	end
end;

