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
	local pNation = player:getNation();
	local currentMission = player:getCurrentMission(pNation);
	local MissionStatus = player:getVar("MissionStatus");
	
	if(pNation == (BASTOK)then
		if(currentMission == THE_EMISSARY and MissionStatus == 2) then
			player:showText(npc,11141);
		-- San->Win route
		elseif(currentMission == THE_EMISSARY and MissionStatus == 1) then
			player:startEvent(0x0245);
		end
	elseif(pNation == (SANDORIA) and currentMission(BASTOK) ~= 255) then
		player:startEvent(0x0244);
	elseif(pNation == (WINDURST) and currentMission(BASTOK) ~= 255) then
		player:startEvent(0x0243);
	else
		player:startEvent(0x021b);
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

	if(csid == 0x0245) then
		player:setVar("MissionStatus",2);
		player:delKeyItem(LETTER_TO_THE_CONSULS_BASTOK);
	end	
end;