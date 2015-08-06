-----------------------------------
-- Area: Metalworks
-- NPC:  Pius
-- Involved In Mission: Journey Abroad
-- @pos 99 -21 -12 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	Mission = player:getCurrentMission(player:getNation());
	MissionStatus = player:getVar("MissionStatus");
	
	if (Mission == JOURNEY_TO_BASTOK and MissionStatus == 3 or 
	   Mission == JOURNEY_TO_BASTOK2 and MissionStatus == 8) then
		player:startEvent(0x0163);
	elseif (Mission == THE_THREE_KINGDOMS_BASTOK and MissionStatus == 3 or 
		   Mission == THE_THREE_KINGDOMS_BASTOK2 and MissionStatus == 8) then
		player:startEvent(0x0163,1);
	elseif (Mission == JOURNEY_TO_BASTOK or 
		   Mission == JOURNEY_TO_BASTOK2 or 
		   Mission == THE_THREE_KINGDOMS_BASTOK2 and MissionStatus < 11) then
		player:startEvent(0x0164);
	else
		player:startEvent(0x015e);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if (csid == 0x0163) then
		if (player:getVar("MissionStatus") == 3) then
			player:setVar("MissionStatus",4);
		else
			player:setVar("MissionStatus",9);
		end
	end
	
end;