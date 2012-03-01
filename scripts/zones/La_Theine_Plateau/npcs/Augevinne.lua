-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Augevinne
-- Involved in Mission: The Rescue Drill
-- @zone 102
-- @pos -361 39 266
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
		MissionStatus = player:getVar("MissionStatus");
		
		if(MissionStatus >= 5 and MissionStatus <= 7) then
			player:startEvent(0x0067);
		elseif(mission_status == 8) then
			player:showText(npc, RESCUE_DRILL + 21);
		elseif(mission_status >= 9) then
			player:showText(npc, RESCUE_DRILL + 26);
		end
	else
		player:showText(npc, RESCUE_DRILL);
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;