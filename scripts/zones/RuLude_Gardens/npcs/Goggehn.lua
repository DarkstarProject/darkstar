-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Goggehn
-- Involved in Mission: Bastok 3-3, 4-1
-- @zone 243
-- @pos 3 9 -76
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	pNation = player:getNation();
	currentMission = player:getCurrentMission(BASTOK);
	missionStatus = player:getVar("MissionStatus");
	
	if (currentMission == JEUNO_MISSION and missionStatus == 1) then
		player:startEvent(0x0029);
	elseif (currentMission == JEUNO_MISSION and missionStatus == 2) then
		player:startEvent(0x0042);
	elseif (currentMission == JEUNO_MISSION and missionStatus == 3) then
		player:startEvent(0x0026);
	elseif (player:getRank() == 4 and player:getCurrentMission(BASTOK) == 255 and getMissionRankPoints(player,13) == 1) then
		if (player:hasKeyItem(ARCHDUCAL_AUDIENCE_PERMIT)) then
			player:startEvent(0x0081,1);
		else
			player:startEvent(0x0081); -- Start Mission 4-1 Magicite
		end
	elseif (currentMission == MAGICITE_BASTOK and missionStatus == 1) then
		player:startEvent(0x0084);
	elseif (currentMission == MAGICITE_BASTOK and missionStatus <= 5) then
		player:startEvent(0x0087);
	elseif (currentMission == MAGICITE_BASTOK and missionStatus == 6) then
		player:startEvent(0x0023);
	elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_BASTOK)) then
		player:startEvent(0x0037);
	elseif (pNation == WINDURST) then
		player:startEvent(0x0004);
	elseif (pNation == SANDORIA) then
		player:startEvent(0x0002);
	else
		player:startEvent(0x0065);
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x0029) then
		player:setVar("MissionStatus",2);
		player:delKeyItem(LETTER_TO_THE_AMBASSADOR);
	elseif (csid == 0x0081 and option == 1) then
		player:setVar("MissionStatus",1);
		if (player:hasKeyItem(ARCHDUCAL_AUDIENCE_PERMIT) == false) then
			player:addKeyItem(ARCHDUCAL_AUDIENCE_PERMIT);
			player:messageSpecial(KEYITEM_OBTAINED,ARCHDUCAL_AUDIENCE_PERMIT);
		end
	elseif (csid == 0x0026 or csid == 0x0023) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;