-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Great Hall
-- Involved in Missions: 3-3, 5-2, 6-1, 8-2, 9-1
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
	elseif(currentMission == THE_SHADOW_LORD and player:getVar("MissionStatus") == 5) then
		player:startEvent(0x003D);
	elseif(currentMission == LEAUTE_S_LAST_WISHES and player:getVar("MissionStatus") == 1) then
	    player:startEvent(87);
	elseif(currentMission == LIGHTBRINGER and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x0064);
	elseif(currentMission == LIGHTBRINGER and player:getVar("MissionStatus") == 6) then
		player:startEvent(0x0068)
	elseif(currentMission == BREAKING_BARRIERS and player:getVar("MissionStatus") == 0) then
		player:startEvent(0x0020)
	elseif(currentMission == THE_HEIR_TO_THE_LIGHT and player:getVar("SANDO92") == 5)then
	     player:startEvent(0x0008);
	elseif(currentMission == BREAKING_BARRIERS and player:getVar("MissionStatus") == 4) then
		if(player:hasKeyItem(FIGURE_OF_TITAN) and player:hasKeyItem(FIGURE_OF_GARUDA) and player:hasKeyItem(FIGURE_OF_LEVIATHAN)) then
			player:startEvent(0x004c);
		end
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
	elseif(csid == 0x0064) then
		player:setVar("Mission8-1Completed",0) -- dont need this var anymore. JP midnight is done and prev mission completed.
		player:setVar("MissionStatus",1);
	elseif(csid == 0x0068) then
		player:setVar("Mission8-2Kills",0);
		finishMissionTimeline(player,3,csid,option);
	elseif(csid == 0x0008) then
		player:setVar("SANDO92",6);
	elseif(csid == 0x0020) then
		player:setVar("Cutscenes_8-2",0); -- dont need this var now that mission is flagged and cs have been triggered to progress
		player:setVar("MissionStatus",1);
	elseif(csid == 0x004c) then
		finishMissionTimeline(player,3,csid,option);
	end
	
end;
