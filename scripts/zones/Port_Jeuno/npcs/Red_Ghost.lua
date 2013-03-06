-----------------------------------
-- Area: Port Jeuno
-- NPC: Red Ghost
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
require("scripts/zones/Port_Jeuno/TextIDs");
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
	local WildcatJeuno = player:getVar("WildcatJeuno");
	if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_AVAILABLE and player:getMaskBit(WildcatJeuno,15) == false) then
		player:startEvent(314);
	else
		player:startEvent(0x22);
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
	if (csid == 314) then
		player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",15,true)
	end
end;
