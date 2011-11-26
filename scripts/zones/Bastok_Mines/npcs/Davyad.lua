-----------------------------------
-- Area: Bastok Mines
-- NPC: Davyad
-- Standard Info NPC
-- Involved in Mission: Bastok 3-2
-----------------------------------

require("scripts/globals/missions");
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
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

activeMission = player:hasCurrentMission(BASTOK,TO_THE_FORSAKEN_MINES);

	if (activeMission == false) then
		player:startEvent(0x0036);
	else
		player:startEvent(0x0035);
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