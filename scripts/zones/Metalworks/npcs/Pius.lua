-----------------------------------
-- Area: Metalworks
-- NPC:  Pius
-- Involved In Mission: Journey Abroad
-- @zone 237
-- @pos 99.916 -21.17 -12.537
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
	
	Mission = player:getCurrentMission(SANDORIA);
	
	if(Mission == JOURNEY_TO_BASTOK and player:getVar("MissionStatus") == 3 or Mission == JOURNEY_TO_BASTOK2 and player:getVar("MissionStatus") == 8) then
		player:startEvent(0x0163);
	elseif(Mission == JOURNEY_TO_BASTOK or Mission == JOURNEY_TO_BASTOK2) then
		player:startEvent(0x0164);
	else
		player:startEvent(0x015e);--
	end
	
end;
--0x015e  0x0163  0x0164
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
	
	if(csid == 0x0163) then
		if(player:getVar("MissionStatus") == 3) then
			player:setVar("MissionStatus",4);
		else
			player:setVar("MissionStatus",9);
		end
	end
	
end;