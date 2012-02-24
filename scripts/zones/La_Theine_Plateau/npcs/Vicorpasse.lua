-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Vicorpasse
-- Involved in Mission: The Rescue Drill
-- @zone 102
-- @pos -344 37 266
-----------------------------------

require("scripts/globals/keyitems");
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
		
		if(theRescueDrillMissionCS == 4) then
			player:startEvent(0x006c);
		elseif(theRescueDrillMissionCS == 10) then
			player:startEvent(0x0073);
		end
	else
		player:startEvent(0x0005);
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
	
	if(csid == 0x006c) then
		player:setVar("theRescueDrillMissionCS",5);
	elseif(csid == 0x0073) then
		player:addKeyItem(RESCUE_TRAINING_CERTIFICATE);
		player:messageSpecial(KEYITEM_OBTAINED,RESCUE_TRAINING_CERTIFICATE);
		player:setVar("theRescueDrillMissionCS",11);
	end
	
end;