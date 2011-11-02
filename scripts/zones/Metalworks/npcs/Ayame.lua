-----------------------------------
-- Area: Metalworks
-- NPC: Naji
-- Involved in Missions
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
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

		if (currentMission == 3 and player:hasKeyItem(C_L_REPORTS)) then
			player:startEvent(0x02c8);
		end
	else
		--player:startEvent();
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

	if (csid == 0x02c8) then
		player:completeMission(1);
		player:delKeyItem(C_L_REPORTS);
		player:addRankPoints(10);
		player:setVar("MissionStatus",0);
	end
end;

