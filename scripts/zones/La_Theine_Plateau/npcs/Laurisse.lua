-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Laurisse
-- Involved in Mission: The Rescue Drill
-- @zone 102
-- @pos -292 28 143
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
		theRescueDrillMissionCS = player:getVar("theRescueDrillMissionCS");
		
		if(theRescueDrillMissionCS == 5) then
			player:startEvent(0x006a);
		elseif(theRescueDrillMissionCS <= 9) then
			player:startEvent(0x006d);
		end
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
	
	if(csid == 0x006a) then
		player:setVar("theRescueDrillMissionCS",6);
	end
	
end;