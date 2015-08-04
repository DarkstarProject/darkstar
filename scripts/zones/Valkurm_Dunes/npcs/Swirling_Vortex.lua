-----------------------------------
--  Area: Valkurm Dunes
--  NPC:  Swirling Vortex
--  Entrance to Lufaise Meadows
--	@pos 420.057 0.000 -199.905 103 
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/missions");
require("scripts/zones/Valkurm_Dunes/TextIDs");

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
		player:startEvent(0x000c);
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
	
	if (csid == 0x000c and option == 1) then
		toLufaiseMeadows(player);
	end
	
end;