-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Nelcabrit
-- Involved in Mission: San d'Oria 3-3, 4-1
-- @pos -32 9 -49 243
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
	currentMission = player:getCurrentMission(SANDORIA);
	missionStatus = player:getVar("MissionStatus");
	
	if (currentMission == APPOINTMENT_TO_JEUNO and missionStatus == 3) then
		player:startEvent(0x002a);
	elseif (currentMission == APPOINTMENT_TO_JEUNO and missionStatus == 4) then
		player:startEvent(0x0043);
	elseif (currentMission == APPOINTMENT_TO_JEUNO and missionStatus == 5) then
		player:startEvent(0x0027);
	elseif (player:getRank() == 4 and player:getCurrentMission(SANDORIA) == 255 and getMissionRankPoints(player,13) == 1) then
		player:startEvent(0x0082); -- Start Mission 4-1 Magicite
	elseif (currentMission == MAGICITE_BASTOK and missionStatus == 1) then
		player:startEvent(0x0085);
	elseif (currentMission == MAGICITE_BASTOK and missionStatus <= 5) then
		player:startEvent(0x0088);
	elseif (currentMission == MAGICITE_SAN_D_ORIA and missionStatus == 6) then
		player:startEvent(0x0024);
	elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_SANDORIA)) then
		player:startEvent(0x0038);
	elseif (pNation == WINDURST) then
		player:startEvent(0x002F);
	elseif (pNation == BASTOK) then
		player:startEvent(0x002E);
	else
		player:startEvent(0x0066);
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
	
	if (csid == 0x002a) then
		player:setVar("MissionStatus",4);
		player:delKeyItem(LETTER_TO_THE_AMBASSADOR);
	elseif (csid == 0x0082 and option == 1) then
		player:setVar("MissionStatus",1);
		player:addKeyItem(ARCHDUCAL_AUDIENCE_PERMIT);
		player:messageSpecial(KEYITEM_OBTAINED,ARCHDUCAL_AUDIENCE_PERMIT);
	elseif (csid == 0x0027 or csid == 0x0024) then
		finishMissionTimeline(player,3,csid,option);
	end
	
end;