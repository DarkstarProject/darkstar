-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Helaku
-- Involved in Missions 2-3
-- @zone 231
-- @pos 49 -1 -12
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
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

	if(player:getCurrentMission(BASTOK) ~= 255) then
		currentMission = player:getCurrentMission(BASTOK);
		missionStatus = player:getVar("MissionStatus");

		if(currentMission == THE_EMISSARY_WINDURST) then
			if(missionStatus == 15 or missionStatus == 16) then
				player:startEvent(0x0219);
			end
		elseif(currentMission == THE_EMISSARY_SANDORIA2) then
			if(missionStatus == 17) then
				player:showText(npc,HELAKU_DIALOG);
			elseif(missionStatus == 18) then
				player:startEvent(0x021e)
			elseif(player:hasKeyItem(KINDRED_CREST)) then
				player:startEvent(0x221);
			end
		elseif(currentMission == THE_EMISSARY) then
			if(missionStatus == 1) then
				player:startEvent(0x02a4);
			elseif(missionStatus == 2) then
				player:startEvent(0x0218);
			elseif(missionStatus == 3) then
				player:showText(npc,HELAKU_DIALOG);
			elseif(missionStatus == 6) then
				player:showText(npc,HELAKU_DIALOG+8);
			elseif(missionStatus == 19) then
				player:startEvent(0x022d);
			end
		elseif(currentMission == 6) then
			if(missionStatus == 4) then
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

	if(csid == 0x0218) then
		player:setVar("MissionStatus",3);
	elseif(csid == 0x219 and option == 0) then
		player:addMission(BASTOK,THE_EMISSARY_SANDORIA2);
		player:setVar("MissionStatus",17);
		player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK)
	elseif(csid == 0x021f) then
		player:addMission(BASTOK,THE_EMISSARY);
		player:setVar("MissionStatus",6);
	elseif(csid == 0x221) then
		player:addMission(BASTOK,THE_EMISSARY);
		player:addKeyItem(KINDRED_REPORT)
		player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
		player:delKeyItem(KINDRED_CREST)
	end
	
end;