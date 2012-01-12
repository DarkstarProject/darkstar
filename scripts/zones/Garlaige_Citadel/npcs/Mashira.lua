-----------------------------------
-- Area: Lower Jeuno
-- NPC: Mashira
-- Involved in Quests: Rubbish day
-- @zone 200
-- @pos 141 -6 138
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getQuestStatus(JEUNO,RUBBISH_DAY) == QUEST_ACCEPTED and player:getVar("RubbishDayVar") == 0) then 
		player:startEvent(0x000b,1); -- For the quest "Rubbish day"
	else
		player:startEvent(0x000b,3); -- Standard dialog and menu
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
	if(csid == 0x000b and option == 1) then
		player:delKeyItem(MAGIC_TRASH);
		player:setVar("RubbishDayVar",1);
	end
end;



