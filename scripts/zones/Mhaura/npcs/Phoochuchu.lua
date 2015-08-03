-----------------------------------
-- Area: Mhaura
-- NPC:  Phoochuchu
-- Involved in Quest: A Thief in Norg!?
-- @pos -4 -4 69 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED) then
		local aThiefinNorgCS = player:getVar("aThiefinNorgCS");
		if (aThiefinNorgCS == 2) then
			player:startEvent(0x012d);
		elseif (aThiefinNorgCS == 3) then
			player:startEvent(0x012f);
		elseif (aThiefinNorgCS >= 4) then
			player:startEvent(0x012e);
		end
	else
		player:startEvent(0x012c);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x012d) then
		player:setVar("aThiefinNorgCS",3);
	end
	
end;