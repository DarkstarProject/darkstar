-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Handle (right)
-- Open door (_474)
-- @zone 151
-- @pos -60 24 -68
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(VanadielDayOfTheYear() % 2 == 0) then
		GetNPCByID(17396173):openDoor();
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;