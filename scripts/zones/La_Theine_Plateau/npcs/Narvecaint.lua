-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Narvecaint
-- Involved in Mission: The Rescue Drill
-- @zone 102
-- @pos -263 22 129
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
	
	if(player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL and player:getVar("theRescueDrillMissionCS") == 6) then
		player:startEvent(0x006b);
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
	
	if(csid == 0x006b) then
		player:setVar("theRescueDrillMissionCS",7);
	end
	
end;