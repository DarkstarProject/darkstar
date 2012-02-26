-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC:  Halver
-- Involved in Mission 2-3
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
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
		elseif(currentMission == THE_EMISSARY_SANDORIA) then
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

-- 0x01fc jeuno
-- 0x0233  0x0234  0x0237  0x0238  0x0042  0x0041  0x0043  0x0070  0x001e  0x001c  0x001d  0x001b  0x001a  0x000a  0x0009  0x0019  0x0017  0x0018  0x0016  0x0001  0x001f  0x01f9  0x0214  0x01f5  0x01f6  0x01f7  0x01f8  0x01fb  0x021f  0x01fc  0x01fe  0x01fd  0x0215  0x0216  0x0222  0x0224  0x0225  0x022b  0x0063  0x003a  0x0066  0x0064  0x022e  0x0235  0x0236  0x023b  0x023c  0x0239  0x023a
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
		player:setVar("MissionStatus",0);
		player:setRankPoints(0);
		player:delKeyItem(KINDRED_REPORT);
		player:addGil(GIL_RATE*3000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
		player:addKeyItem(ADVENTURERS_CERTIFICATE);
		player:messageSpecial(KEYITEM_OBTAINED,ADVENTURERS_CERTIFICATE);
		player:setRank(3);
		player:completeMission(SANDORIA,JOURNEY_ABROAD);
	elseif(csid == 0x01fc) then
		player:setVar("MissionStatus",2);
	end
	
end;