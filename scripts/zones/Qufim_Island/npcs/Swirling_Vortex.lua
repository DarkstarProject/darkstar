-----------------------------------
--  Area: Qufim Island
--  NPC:  Swirling Vortex
--  Entrance to Qufim Island
--  @pos -436.000 -13.499 340.117 126
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/zones/Qufim_Island/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	
	if (player:hasCompletedMission(COP,THE_MOTHERCRYSTALS)) then
		player:startEvent(0x012c);
	else
		player:messageSpecial(AN_EMPTY_LIGHT_SWIRLS);
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
	
	if (csid == 0x012c and option == 1) then
		toMisareauxCoast(player);
	end
	
end;