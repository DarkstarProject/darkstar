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
	
	currentMission = player:getCurrentMission(SANDORIA);
	
	if(currentMission == APPOINTMENT_TO_JEUNO and player:getVar("MissionStatus") == 3) then
		player:startEvent(0x002a);
	elseif(currentMission == APPOINTMENT_TO_JEUNO and player:getVar("MissionStatus") == 5) then
		player:startEvent(0x0027);
	end
	-- 0x0082 : Start Mission 4-1
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
	end
	
end;