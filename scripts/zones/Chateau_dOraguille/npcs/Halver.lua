-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Halver
-- Involved in Mission 2-3
-- @zone 233
-- @pos 2 0 0
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
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
	
	HALVER_OFFSET = 6719;
	pNation = player:getNation();
	currentMission = player:getCurrentMission(pNation);
	
	if(pNation == SANDORIA) then
		if(currentMission == JOURNEY_ABROAD and player:getVar("MissionStatus") == 1) then
			player:startEvent(0x01f9);
		elseif(currentMission == JOURNEY_ABROAD and player:getVar("MissionStatus") == 11) then
			player:startEvent(0x01fb);
		elseif(currentMission == JOURNEY_ABROAD) then
			player:startEvent(0x0214);
		elseif(currentMission == APPOINTMENT_TO_JEUNO and player:getVar("MissionStatus") == 1) then
			player:startEvent(0x01fc);
		end
	elseif(pNation == BASTOK) then
		if(currentMission == THE_EMISSARY) then
			missionStatus = player:getVar("MissionStatus");
			if(missionStatus == 3) then
				player:startEvent(0x01f5);
			elseif(missionStatus == 4) then
				player:showText(npc,HALVER_OFFSET+279);
			end
		elseif(currentMission == THE_EMISSARY_SANDORIA2) then
			missionStatus = player:getVar("MissionStatus");
			if(missionStatus == 17) then
				player:startEvent(0x01f7);
			elseif(missionStatus == 18) then
				player:showText(npc,HALVER_OFFSET+279);
			else
				player:showText(npc,HALVER_OFFSET+1092)
			end
		else
			player:showText(npc,HALVER_OFFSET+1092)
		end
	elseif(pNation == WINDURST) then
	else
		player:showText(npc,HALVER_OFFSET+1092)
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

	if(csid == 0x01f5) then
		player:addMission(BASTOK,THE_EMISSARY_SANDORIA);
		player:setVar("MissionStatus",4);
	elseif(csid == 0x01f7) then
		player:setVar("MissionStatus",18);
	elseif(csid == 0x01f9) then
		player:setVar("MissionStatus",2);
		player:addKeyItem(LETTER_TO_THE_CONSULS_SANDORIA);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_SANDORIA);
	elseif(csid == 0x01fb) then
		finishMissionTimeline(player,1,csid,option);
	elseif(csid == 0x01fc) then
		player:setVar("MissionStatus",2);
	end
	
end;