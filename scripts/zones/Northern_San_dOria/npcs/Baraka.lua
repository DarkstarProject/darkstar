-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Helaku
-- Involved in Missions 2-3
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
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

	if (player:hasCurrentMission(1)) then
		missionStatus = player:getVar("MissionStatus");

		if (player:getCurrentMission(1) == 5) then
			if (missionStatus == 1) then
				player:startEvent(0x0245);
			elseif (missionStatus == 2) then
				player:showText(npc,11141);
			else
				player:startEvent(0x021b);
			end
		elseif (player:getCurrentMission(1) == 7) then
			if (missionStatus == 15) then
				player:startEvent(0x0245);
			elseif (missionStatus == 16) then
				player:showText(npc,11141);
			else
				player:startEvent(0x021b);
			end
		end
	else
		pNation = player:getNation();

		if (pNation == 0) then
			player:startEvent(0x0244);
		elseif (pNation == 2) then
			player:startEvent(0x0243);
		else
			player:startEvent(0x021b);
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

	if (csid == 0x0245) then
		if (player:getCurrentMission(1) == 5) then
			player:setVar("MissionStatus",2);
		else
			player:setVar("MissionStatus",16);
		end
	end
end;




