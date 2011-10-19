-----------------------------------
-- Area: North Gustaberg
-- NPC: Monument
-- Continues Quest: Hearts of Mythril (100%)
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
require("scripts/zones/North_Gustaberg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

HeartsVar = player:getVar("HeartsOfMythril");

	if (HeartsVar == 1) then
		player:startEvent(0x000b);
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

	if (csid == 0x000b and option == 0) then
		player:setVar("HeartsOfMythril",2);
		player:delKeyItem(0x17);
	end
	
end;




