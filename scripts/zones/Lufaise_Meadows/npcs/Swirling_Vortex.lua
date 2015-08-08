-----------------------------------
--  Area: Lufaise Meadows
--  NPC:  Swirling Vortex
--  Entrance to Valkurm Dunes
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/missions");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0064);
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
	
	if (csid == 0x0064 and option == 1) then
		toValkurmDunes(player);
	end
	
end;