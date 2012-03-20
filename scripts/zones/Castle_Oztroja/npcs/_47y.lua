-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Brass statue
-- Gives the second password against the first
-- @zone 151
-- @pos -60 22 -102
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(VanadielDayOfTheYear() % 2 ~= 0) then
		GetNPCByID(17396173):openDoor();
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
printf("upCSID: %u",csid);
printf("upRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
end;