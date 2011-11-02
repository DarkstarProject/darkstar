-----------------------------------
-- Area: Metalworks
-- NPC: Iron Eater
-- Involved in Missions
-----------------------------------

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

	currentMission = player:getCurrentMission(1);
	missionStatus = player:getVar("MissionStatus")

	if (currentMission == 10 and missionStatus == 0) then -- Four Musketeers
		player:startEvent(0x02cb);
	elseif (currentMission == 10 and missionStatus == 1) then
		player:startEvent(0x02cc);
	else
		player:startEvent(0x0301);
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

	if (csid == 0x02cb and option == 0) then
		player:setVar("MissionStatus",1);
	end

end;



