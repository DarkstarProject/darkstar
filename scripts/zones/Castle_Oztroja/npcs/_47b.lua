-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Handle
-- Open trap door or brass door
-- @pos 20 0 -13 151
-----------------------------------

require("scripts/globals/missions");

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
			if(player:getCurrentMission(WINDURST) == TO_EACH_HIS_OWN_RIGHT and player:getVar("MissionStatus") == 3) then
				player:startEvent(0x002B);
			end
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
	
	if(csid == 0x002B) then
		player:setVar("MissionStatus",4);
	end
	
end;