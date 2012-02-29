-----------------------------------
-- Area: Metalworks
-- NPC:  Naji
-- Involved in Quests: The doorman (finish)
-- @zone 237
-- @pos 64 -14 -4
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
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
		end
	elseif(player:hasKeyItem(YASINS_SWORD)) then -- The Doorman
		player:startEvent(0x02ee);
	else
		player:startEvent(0x02bc);
	end
	
end;

--0x02c6  zeruhn mines
--0x02c7  "the chief" and ayame, a letter
--0x02bc  rude default?
--0x02c9  starting 2-3 for windy and sandoria
--0x02ca  ending 2-3
--0x02cb  iron eater join mission
--0x02cd  reminder to go to beadeaux
--0x02d0  next major mission, back from jeuno and on to fei'yin
--0x02d1  acceptance in case previous turned down
--0x03f0
--0x03f1
--0x02f9
--0x02fa
--0x030e
--0x0325
--0x034d
--0x036d
--0x03aa  0x03ab  0x03ac  0x03ad  0x03ae  0x03cb
--0x03c9  0x03ca

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

--Razor_Axe = 16678;

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
	elseif(csid == 0x02ca) then
		player:addKeyItem(ADVENTURERS_CERTIFICATE);
		player:setTitle(CERTIFIED_ADVENTURER);
		player:messageSpecial(KEYITEM_OBTAINED,ADVENTURERS_CERTIFICATE);
		player:addGil(GIL_RATE*3000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
		player:setRank(3);
		player:delKeyItem(KINDRED_REPORT);
		player:setVar("MissionStatus",0);
		player:setVar("Mission_2_3_Started",0);
		player:completeMission(BASTOK,THE_EMISSARY);
	end
end;

