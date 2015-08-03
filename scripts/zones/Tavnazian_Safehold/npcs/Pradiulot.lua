-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Pradiulot
-- Involved in Quest: Unforgiven
-- @zone 26
-- @pos -20.814 -22 8.399
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
require("scripts/globals/quests");
-----------------------------------
-- For those who don't know
-- at the end of if (player:getQuestStatus(REGION,QUEST_NAME)
-- == 0 means QUEST_AVAILABLE
-- == 1 means QUEST_ACCEPTED
-- == 2 means QUEST_COMPLETED 
-- e.g. if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == 0 
-- means if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == QUEST AVAILABLE

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == 2 and trade:getGil() == 1 == true) then
		player:startEvent(0x00CE); -- Dialogue after completing quest (optional)
		end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local Unforgiven = player:getQuestStatus(OTHER_AREAS,UNFORGIVEN);

if (Unforgiven == 1 and player:getVar("UnforgivenVar") == 1) then
	player:startEvent(0x00CC); -- Dialogue for final stage of Unforgiven Quest

elseif (player:getQuestStatus(OTHER_AREAS,UNFORGIVEN) == 2 and player:getVar("UnforgivenVar") == 2) then
	player:startEvent(0x00CE); -- Dialogue after completing quest (optional)

else	
	player:startEvent(0x0173); -- Default Dialogue
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
if (csid == 0x00CC) then
	player:setVar("UnforgivenVar",2);
	player:addKeyItem(440)
	player:messageSpecial(KEYITEM_OBTAINED,440); -- Map of Tavnazia
	player:completeQuest(OTHER_AREAS,UNFORGIVEN);
	player:addFame(OTHER_AREAS,30);
	
elseif (csid == 0x00CE) then
	player:setVar("UnforgivenVar",0);
	
	end
end;



