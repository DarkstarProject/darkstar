-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Great Hall
-- Involved in Missions: 3-3, 5-2, 6-1
-- @pos 0 -1 13 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	currentMission = player:getCurrentMission(SANDORIA);
	
	if(currentMission == APPOINTMENT_TO_JEUNO and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x0219);
	elseif(currentMission == THE_SHADOW_LORD and player:getVar("MissionStatus") == 4) then
		player:startEvent(0x003D);
	elseif(currentMission == LEAUTE_S_LAST_WISHES and player:getVar("MissionStatus") == 1) then
	    player:startEvent(87);
    else
        player:startEvent(0x202);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(csid == 0x0219) then
		player:setVar("MissionStatus",3);
		player:addKeyItem(LETTER_TO_THE_AMBASSADOR);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_AMBASSADOR);
	elseif(csid == 0x003D) then
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 87)then
        player:setVar('MissionStatus',2);
	end
	
end;
