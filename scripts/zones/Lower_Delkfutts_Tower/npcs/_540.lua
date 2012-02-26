-----------------------------------
-- Area: Lower Delkfutt's Tower
-- NPC:  Cermet Door
-- Cermet Door for Windy Ambassador  
-- Windurst Mission 3.3 "Appointment to Jeuno"
-- @zone 184
-- @pos 636 16 59
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	currentMission = player:getCurrentMission(WINDURST);
	
	if(currentMission == A_NEW_JOURNEY and player:getVar("MissionStatus") == 4 and player:hasKeyItem(DELKFUTT_KEY) == false) then
		player:messageSpecial(THE_DOOR_IS_FIRMLY_SHUT_OPEN_KEY);
	elseif(currentMission == A_NEW_JOURNEY and player:getVar("MissionStatus") == 4 and player:hasKeyItem(DELKFUTT_KEY)) then
		player:startEvent(0x0000);
	else
		player:messageSpecial(THE_DOOR_IS_FIRMLY_SHUT);
	end
	
	return 1;

end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

	if(csid == 0x0000) then
		player:setVar("MissionStatus",5);
	end

end;