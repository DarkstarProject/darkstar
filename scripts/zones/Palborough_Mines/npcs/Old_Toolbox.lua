-----------------------------------
-- Area: Palborough Mines
-- NPC: Old Toolbox
-- Continues Quest: The Eleventh's Hour
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
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

Elevenths = player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR);
HasToolbox = player:hasKeyItem(0x18);

	if (Elevenths == QUEST_ACCEPTED and not HasToolbox) then
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
		player:addKeyItem(0x18);
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




