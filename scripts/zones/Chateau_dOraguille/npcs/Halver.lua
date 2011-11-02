-----------------------------------
-- Area: Chateau d'Oraguille
-- NPC: Halver
-- Involved in Mission 2-3
-----------------------------------


package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
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
	missionActive = player:hasCurrentMission(pNation);

	if (missionActive) then
		currentMission = player:getCurrentMission(pNation);
		missionStatus = player:getVar("MissionStatus");

		if (pNation == 1) then
			if (currentMission == 5 and missionStatus == 3) then
				player:startEvent(0x01f5);
			elseif (currentMission == 6 and missionStatus == 4) then
				player:showText(npc,HALVER_OFFSET+279);
			elseif (currentMission == 8) then
				if (missionStatus == 17) then
					player:startEvent(0x01f7);
				elseif (missionStatus == 18) then
					player:showText(npc,HALVER_OFFSET+279);
				else
					player:showText(npc,HALVER_OFFSET+1092)
				end
			else
				player:showText(npc,HALVER_OFFSET+1092)
			end
		elseif (pNation == 2) then
		elseif (pNation == 0) then
		end
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

	if (csid == 0x01f5) then
		player:addMission(1,6);
		player:setVar("MissionStatus",4);
	elseif (csid == 0x01f7) then
		player:setVar("MissionStatus",18);
	end
end;



