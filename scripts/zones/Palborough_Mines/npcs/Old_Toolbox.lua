-----------------------------------
-- Area: Palborough Mines
-- NPC: Old Toolbox
-- Continues Quest: The Eleventh's Hour
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR) == QUEST_ACCEPTED and player:hasKeyItem(OLD_TOOLBOX) == false) then
		player:startEvent(0x0017);
	else
		player:startEvent(0x0016);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

	if (csid == 0x0017 and option == 0) then
		player:addKeyItem(OLD_TOOLBOX);
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;