-----------------------------------
--	Area: Port Windurst
--	NPC:  Goltata
--  Involved in Quests: Wonder Wands
--	Working 100%
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS);
	if (WonderWands == QUEST_ACCEPTED) then
		player:startEvent(0x0101,0,0,17091);
	elseif (WonderWands == QUEST_COMPLETED) then
		player:startEvent(0x010d);
	else
		player:startEvent(0xe8);
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



