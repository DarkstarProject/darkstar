-----------------------------------
-- Area: Port Windurst
-- NPC:  Melek
-- Involved in Mission 2-3
-- @zone 240
-- @pos -80 -5 158
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");

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
	
	if(player:getCurrentMission(BASTOK) ~= 255) then
		currentMission = player:getCurrentMission(pNation);
		missionStatus = player:getVar("MissionStatus");

		if(pNation == BASTOK) then
			if(player:hasKeyItem(KINDRED_CREST)) then
				player:startEvent(0x0042);
			elseif(player:hasKeyItem(KINDRED_REPORT)) then
				player:startEvent(0x0043);
			elseif(player:hasKeyItem(SWORD_OFFERING)) then
				player:startEvent(0x0035);
			elseif(currentMission == THE_EMISSARY) then
				if(missionStatus == 1) then --Windy Start
					player:startEvent(0x0030);
				elseif(missionStatus == 6) then
					player:startEvent(0x003D);
				end
			elseif(currentMission == THE_EMISSARY_WINDURST2) then
				if(missionStatus == 7) then
					player:startEvent(0x0040);
				elseif(missionStatus == 8) then
					player:showText(npc,MELEK_DIALOG_A)
				elseif(missionStatus == 9) then
					player:startEvent(0x0043);
				end
			elseif(currentMission == THE_EMISSARY_WINDURST) then
				if(missionStatus == 10) then
					player:startEvent(0x0031);
				elseif(missionStatus == 12) then
					player:showText(npc,MELEK_DIALOG_B)
				elseif(missionStatus == 14) then
					player:startEvent(0x0037);
				elseif(missionStatus == 15) then
					player:showText(npc,MELEK_DIALOG_C)
				end
			else
				player:startEvent(0x002a);
			end
		end
	else
		player:startEvent(0x002a);
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

	if(csid == 0x003d) then
		player:addMission(BASTOK,THE_EMISSARY_WINDURST2);
		player:setVar("MissionStatus",7);
		player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
	elseif(csid == 0x0030) then
		player:addMission(BASTOK,THE_EMISSARY_WINDURST);
		player:setVar("MissionStatus",10);
	elseif(csid == 0x0035) then
		player:addKeyItem(DULL_SWORD) --
		player:messageSpecial(KEYITEM_OBTAINED,DULL_SWORD);
		player:setVar("MissionStatus",12);  --> Gideus next
		player:delKeyItem(SWORD_OFFERING) -- remove sword offering
	elseif(csid == 0x0042) then
		player:addMission(BASTOK,THE_EMISSARY);
		player:addKeyItem(KINDRED_REPORT)
		player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
		player:setVar("MissionStatus",10);  -- return to Bastok
		player:delKeyItem(KINDRED_CREST)
	elseif(csid == 0x0037) then
		player:setVar("MissionStatus",15); -- to Sandy now
	end
	
end;