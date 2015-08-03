-----------------------------------
-- Area: Palborough Mines
-- NPC: Old Toolbox
-- Continues Quest: The Eleventh's Hour (100%)
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
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
	player:startEvent(0x0e);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0e) then
		player:setPos(-73, 0, 60, 1, 0xac);
	end
   
end;