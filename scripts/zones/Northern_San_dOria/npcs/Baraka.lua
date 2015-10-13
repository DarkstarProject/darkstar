-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Baraka
-- Involved in Missions 2-3
-- @zone 231
-- @pos 36 -2 -2
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

	if (player:getCurrentMission(BASTOK) ~= 255) then
		missionStatus = player:getVar("MissionStatus");

		if (player:getCurrentMission(BASTOK) == THE_EMISSARY) then
			if (missionStatus == 1) then
				player:startEvent(0x0245);
			elseif (missionStatus == 2) then
				player:showText(npc,11141);
			elseif (missionStatus == 7) then
				player:startEvent(0x0245);
			else
				player:startEvent(0x021b);
			end
		end
	else
		pNation = player:getNation();

		if (pNation == SANDORIA) then
			player:startEvent(0x0244);
		elseif (pNation == WINDURST) then
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
		if (player:getCurrentMission(BASTOK) == THE_EMISSARY) then
			if (player:getVar("MissionStatus") < 2) then
				player:setVar("MissionStatus",2);
				player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
				
			elseif (player:getVar("MissionStatus") == 7) then
				player:setVar("MissionStatus",7.5);
				
			end
		end
	end
	
end;