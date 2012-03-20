-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Handle
-- Open trap door or brass door
-- @zone 151
-- @pos 20 0 -13
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	X = player:getXPos();
	Z = player:getZPos();

	if(X < 21.6 and X > 18 and Z > -15.6 and Z < -12.4) then
		
		if(VanadielDayOfTheYear() % 2 == 0) then
			GetNPCByID(17396151):openDoor();
		else
			GetNPCByID(17396152):openDoor();
		end
	else
		player:messageSpecial(0);
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