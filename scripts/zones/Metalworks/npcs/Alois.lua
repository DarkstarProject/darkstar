-----------------------------------
-- Area: Metalworks
-- NPC: Alois
-- Involved in Missions
-- @zone 237
-- @pos 96 -20 14
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getCurrentMission(BASTOK) == WADING_BEASTS and trade:hasItemQty(4362,1) and trade:getItemCount() == 1) then -- Trade Lizard Egg
		if(player:hasCompletedMission(BASTOK,WADING_BEASTS) == false) then
			player:startEvent(0x0174);
		else
			player:startEvent(0x0175);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0172);
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
	
	if(csid == 0x0174 or csid == 0x0175) then
		finishMissionTimeline(player,1,csid,option);
	end
	
end;