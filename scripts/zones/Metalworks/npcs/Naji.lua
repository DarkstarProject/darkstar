-----------------------------------
-- Area: Metalworks
-- NPC:  Naji
-- Involved in Quests: The doorman (finish)
-- @zone 237
-- @pos 64 -14 -4
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getCurrentMission(BASTOK) ~= 255) then
		
		currentMission = player:getCurrentMission(BASTOK);
		
		if(currentMission == THE_ZERUHN_REPORT and player:hasKeyItem(ZERUHN_REPORT)) then
			if(player:seenKeyItem(ZERUHN_REPORT)) then
				player:startEvent(0x02C6,0);
			else
				player:startEvent(0x02C6,1);
			end
		elseif(currentMission == THE_CRYSTAL_LINE and player:hasKeyItem(C_L_REPORTS)) then
			player:startEvent(0x02c7);
		elseif(player:hasKeyItem(KINDRED_REPORT)) then
			player:startEvent(0x02ca);
		elseif(currentMission == THE_EMISSARY) then
			if(player:hasKeyItem(LETTER_TO_THE_CONSULS_BASTOK) == false and player:getVar("MissionStatus") == 0) then
				player:startEvent(0x02c9);
			else
				player:showText(npc,GOOD_LUCK);
			end
		elseif(player:hasKeyItem(MESSAGE_TO_JEUNO_BASTOK) and player:getVar("MissionStatus") == 0) then
			player:startEvent(0x02d0);
		elseif(currentMission == DARKNESS_RISING and player:getVar("MissionStatus") == 1) then
			player:startEvent(0x02d1);
		else
			player:startEvent(0x02bc);
		end
	elseif(player:hasKeyItem(YASINS_SWORD)) then -- The Doorman
		player:startEvent(0x02ee);
	else
		player:startEvent(0x02bc);
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

	if(csid == 0x02ee) then
		if(player:getFreeSlotsCount(0) >= 1) then
			player:addItem(16678);
			player:messageSpecial(ITEM_OBTAINED, 16678); -- Razor Axe
			player:delKeyItem(YASINS_SWORD);
			player:setVar("theDoormanCS",0);
			player:addFame(BASTOK,BAS_FAME*30);
			player:completeQuest(BASTOK,THE_DOORMAN);
		else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 16678); -- Razor Axe
	    end
	elseif(csid == 0x02C6) then
		player:delKeyItem(ZERUHN_REPORT);
		player:completeMission(BASTOK,THE_ZERUHN_REPORT);
	elseif(csid == 0x02c9) then
		player:addKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_BASTOK);
		player:setVar("MissionStatus",1);
	elseif(csid == 0x02d0 and option == 0 or csid == 0x02d1) then
		player:delKeyItem(MESSAGE_TO_JEUNO_BASTOK);
		player:addKeyItem(NEW_FEIYIN_SEAL);
		player:messageSpecial(KEYITEM_OBTAINED,NEW_FEIYIN_SEAL);
		player:setVar("MissionStatus",2);
	elseif(csid == 0x02d0 and option == 1) then
		player:delKeyItem(MESSAGE_TO_JEUNO_BASTOK);
		player:setVar("MissionStatus",1);
	elseif(csid == 0x02ca) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;