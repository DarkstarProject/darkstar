-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Sutarara
-- Involved in Quests: Tenshodo Menbership (before accepting)
-- @zone 245
-- @pos 30 0 -2
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
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
	TenshodoMembership = player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP);
	
	if(TenshodoMembership ~= QUEST_COMPLETED) then 
		player:startEvent(0x00d0);
	elseif(TenshodoMembership == QUEST_COMPLETED) then 
		player:startEvent(0x00d3);
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