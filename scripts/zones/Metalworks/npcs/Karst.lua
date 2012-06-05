-----------------------------------
-- Area: Metalworks
-- NPC:  Karst
-- Type: President
-- Involved in Bastok Missions 5-2
-- @pos 106 -21 0 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
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
	
	currentMission = player:getCurrentMission(BASTOK);
	
	if(currentMission == XARCABARD_LAND_OF_TRUTHS and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x025a);
	else
		player:startEvent(0x0259);
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
	
	if(csid == 0x025a) then
		player:setVar("MissionStatus",2);
	end
	
end;