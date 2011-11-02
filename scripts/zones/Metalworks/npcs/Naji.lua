-----------------------------------
-- Area: Metalworks
-- NPC: Naji
-- Involved in Missions
-----------------------------------

require("scripts/globals/keyitems");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
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

	if (player:hasCurrentMission(1)) then
		currentMission = player:getCurrentMission(1);

		if (currentMission == 0 and player:hasKeyItem(ZERUHN_REPORT)) then
			if (player:seenKeyItem(ZERUHN_REPORT)) then
				player:startEvent(0x02C6,0);
			else
				player:startEvent(0x02C6,1);
			end
		elseif (currentMission == 3 and player:hasKeyItem(C_L_REPORTS)) then
			player:startEvent(0x02c7);
		elseif (player:hasKeyItem(KINDRED_REPORT)) then
			player:startEvent(0x02ca);
		elseif (currentMission == 5) then
			if (player:getVar("MissionStatus") == 0 and player:hasKeyItem(LETTER_TO_THE_CONSULS_BASTOK) == false) then
				player:startEvent(0x02c9);
			else
				player:showText(npc,GOOD_LUCK);
			end
		end
	elseif (player:hasKeyItem(YASINS_SWORD)) then	--The Doorman
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

	if (csid == 0x02ee) then
		player:completeQuest(BASTOK,THE_DOORMAN);
		player:addItem(RAZOR_AXE,1);
		player:messageSpecial(ITEM_OBTAINED, RAZOR_AXE);
		player:delKeyItem(YASINS_SWORD);
	elseif (csid == 0x02C6) then
		player:completeMission(BASTOK);
		player:delKeyItem(ZERUHN_REPORT);
	elseif (csid == 0x02c9) then
		player:addKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_CONSULS_BASTOK);
		player:setVar("MissionStatus",1);
	elseif (csid == 0x02ca) then
		player:completeMission(1);
		player:addKeyItem(ADVENTURERS_CERTIFICATE);
		player:setTitle(CERTIFIED_ADVENTURER);
		player:messageSpecial(KEYITEM_OBTAINED,ADVENTURERS_CERTIFICATE);
		player:addGil(GIL_RATE*3000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
		player:setRank(3);
		player:delKeyItem(KINDRED_REPORT);
		player:setVar("MissionStatus",0);
		player:setVar("Mission_2_3_Started",0);
	end
end;

