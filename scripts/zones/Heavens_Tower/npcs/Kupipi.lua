-----------------------------------
-- Area: Heaven's Tower
-- NPC: Kupipi
-- Involved in Mission 2-3
-----------------------------------

package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
require("scripts/zones/Heavens_Tower/TextIDs");

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

		if (currentMission == 9) then
			if (missionStatus == 7) then
				player:startEvent(0x00f2,1,1,1,1,pNation);
			elseif (missionStatus == 8) then
				player:startEvent(0x00f3);
			end
		elseif (currentMission == 7) then
			if (missionStatus == 10) then
				player:startEvent(0x00ee,1,1,1,1,pNation);
			elseif (missionStatus == 11) then
				player:startEvent(0x00f1);
			elseif (pNation == 1) then
				if (missionStatus == 14) then
					player:startEvent(0x00f4);
				elseif (missionStatus == 14.5) then
					player:startEvent(0x00f5);
				else
					player:startEvent(0x00fb);
				end
			elseif (pNation == 0) then
				if (missionStatus == 12) then
					player:startEvent(0x00f6);
				elseif (missionStatus == 13) then
					player:startEvent(0x00f7);
				else
					player:startEvent(0x00fb);
				end
			else
				player:startEvent(0x00fb);
			end
		else
			player:startEvent(0x00fb);
		end
	else
		player:startEvent(0x00fb);
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

	if (csid == 0x00f2) then
		player:addKeyItem(DARK_KEY);
		player:messageSpecial(KEYITEM_OBTAINED,DARK_KEY);
		player:setVar("MissionStatus",8);
	elseif (csid == 0x00ee) then
		if (player:getNation() == 1) then
			player:addKeyItem(SWORD_OFFERING);
			player:messageSpecial(KEYITEM_OBTAINED,SWORD_OFFERING);
		else
			player:addKeyItem(SHIELD_OFFERING);
			player:messageSpecial(KEYITEM_OBTAINED,SHIELD_OFFERING);
		end
		player:setVar("MissionStatus",11);
	elseif (csid == 0x00f6) then
		player:setVar("MissionStatus",13);
	elseif (csid == 0x00f4) then
		player:setVar("MissionStatus",14.5);
	end
end;



