-----------------------------------
--	Area: Port Windurst
--	NPC:  Gold Skull
--	Mission NPC
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
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
	missionActive = player:hasCurrentMission(pNation);

	if (missionActive) then
		currentMission = player:getCurrentMission(pNation);
		missionStatus = player:getVar("MissionStatus");

		if (player:hasKeyItem(SWORD_OFFERING)) then
			player:startEvent(0x0035);
		elseif (player:hasKeyItem(KINDRED_REPORT)) then
			player:startEvent(0x0044);
		elseif (currentMission == 9) then
			if (missionStatus == 7) then
				player:startEvent(0x003e);
			elseif (missionStatus == 8) then
				player:showText(npc,GOLD_SKULL_DIALOG + 27);
			elseif (missionStatus == 9) then
				player:startEvent(0x0039);
			end
		elseif (currentMission == 7) then
			if (missionStatus == 10) then
				player:startEvent(0x0032);
			elseif (missionStatus == 12) then
				player:startEvent(0x0036);
			elseif (missionStatus == 14) then
				player:showText(npc,GOLD_SKULL_DIALOG);
			elseif (missionStatus == 15) then
				player:startEvent(0x0039);
			end
		else
			player:startEvent(0x002b);
		end
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

	if (csid == 0x0035) then
		player:setVar("MissionStatus", 12);
		player:addKeyItem(DULL_SWORD);
		player:messageSpecial(KEYITEM_OBTAINED,DULL_SWORD);
		player:delKeyItem(SWORD_OFFERING);
	end
end;
