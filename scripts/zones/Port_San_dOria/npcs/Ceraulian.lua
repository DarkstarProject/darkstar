-----------------------------------
-- Area: Port San d'Oria
-- NPC: Ceraulian
-- Involved in Quest: The Holy Crest
-- @zone 
-- @pos 
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getMainLvl() >= 30 and player:getQuestStatus(SANDORIA,THE_HOLY_CREST) == QUEST_AVAILABLE) then
		player:startEvent(0x0018);
	else
		player:startEvent(0x024b);
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

	if(csid == 0x0018) then
		player:setVar("TheHolyCrest_Event",1);
	end
	
end;