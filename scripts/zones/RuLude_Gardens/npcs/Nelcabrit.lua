-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  Nelcabrit
-- Involved in Mission: Appointment to Jeuno
-- @zone 243
-- @pos -32 9 -49
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
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
	
	if(currentMission == APPOINTMENT_TO_JEUNO and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x002a);
	elseif(currentMission == APPOINTMENT_TO_JEUNO and mission_status == 4) then
		player:startEvent(0x0043);
	elseif(currentMission == APPOINTMENT_TO_JEUNO and player:getVar("MissionStatus") == 5) then
		player:startEvent(0x0027);
	elseif(player:getRank() == 4 and player:getCurrentMission(SANDORIA) == 255 and getMissionRankPoints(player,13) == 1) then
		player:startEvent(0x0082); -- Start Mission 4-1 Magicite
	elseif(currentMission == MAGICITE_SAN_D_ORIA and player:getVar("MissionStatus") == 4) then
		player:startEvent(0x0024);
	elseif(player:hasKeyItem(MESSAGE_TO_JEUNO_SANDORIA)) then
		player:startEvent(0x0038);
	elseif(pNation == WINDURST) then
		player:startEvent(0x002F);
	elseif(pNation == BASTOK) then
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
	
	if(csid == 0x002a) then
		player:setVar("MissionStatus",4);
		player:delKeyItem(LETTER_TO_THE_AMBASSADOR);
	elseif(csid == 0x0027) then
		player:setRank(4);
		player:setVar("MissionStatus",0);
		player:setRankPoints(0);
		player:addGil(GIL_RATE*5000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*5000);
		player:completeMission(SANDORIA,APPOINTMENT_TO_JEUNO);
	elseif(csid == 0x0082 and option == 1) then
		player:setVar("MissionStatus",1);
		player:addKeyItem(ARCHDUCAL_AUDIENCE_PERMIT);
		player:messageSpecial(KEYITEM_OBTAINED,ARCHDUCAL_AUDIENCE_PERMIT);
	elseif(csid == 0x0024) then
		player:setRank(5);
		player:setVar("MissionStatus",0);
		player:addKeyItem(MESSAGE_TO_JEUNO_SANDORIA);
		player:messageSpecial(KEYITEM_OBTAINED,MESSAGE_TO_JEUNO_SANDORIA);
		player:addGil(GIL_RATE*10000)
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000); 
		player:completeMission(SANDORIA,MAGICITE_SAN_D_ORIA);
	end
	
end;