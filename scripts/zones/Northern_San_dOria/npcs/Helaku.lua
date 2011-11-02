-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Helaku
-- Involved in Missions 2-3
-----------------------------------

package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

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
		missionStatus = player:getVar("MissionStatus");

		if (currentMission == 7) then
			if (missionStatus == 15 or missionStatus == 16) then
				player:startEvent(0x0219);
			end
		elseif (currentMission == 8) then
			if (missionStatus == 17) then
				player:showText(npc,HELAKU_DIALOG);
			elseif (missionStatus == 18) then
				player:startEvent(0x021e)
			elseif (player:hasKeyItem(KINDRED_CREST)) then
				player:startEvent(0x221);
			end
		elseif (currentMission == 5) then
			if (missionStatus == 1) then
				player:startEvent(0x02a4);
			elseif (missionStatus == 2) then
				player:startEvent(0x0218);
			elseif (missionStatus == 3) then
				player:showText(npc,HELAKU_DIALOG);
			elseif (missionStatus == 6) then
				player:showText(npc,HELAKU_DIALOG+8);
			elseif (missionStatus == 19) then
				player:startEvent(0x022d);
			end
		elseif (currentMission == 6) then
			if (missionStatus == 4) then
				player:startEvent(0x021e);
			else
				player:startEvent(0x021f);
			end
		else
			player:startEvent(0x021d);
		end
	else
		player:startEvent(0x021d);
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

	if (csid == 0x0218) then
		player:setVar("MissionStatus",3);
	elseif (csid == 0x219 and option == 0) then
		player:addMission(1,8);
		player:setVar("MissionStatus",17);
		player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK)
	elseif (csid == 0x021f) then
		player:addMission(1,5);
		player:setVar("MissionStatus",6);
	elseif (csid == 0x221) then
		player:addMission(1,5);
		player:addKeyItem(KINDRED_REPORT)
		player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
		player:delKeyItem(KINDRED_CREST)
	end
end;




