-----------------------------------
-- Area: Bastok Mines
-- NPC:  Door
-- Involved in Quest: A Thief in Norg!?
-- @pos 70 7 2 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED and player:getVar("aThiefinNorgCS") == 3) then
		player:startEvent(0x00ba);
		return -1;
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
	
	if (csid == 0x00ba) then
		player:setVar("aThiefinNorgCS",4);
	end
end;