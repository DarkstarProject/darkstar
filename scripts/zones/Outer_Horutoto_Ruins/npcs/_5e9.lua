-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Gate: Magical Gizmo
--  Involved In Mission: The Heart of the Matter
--	Working ???%
-----------------------------------

package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Check if we are on Windurst Mission 1-2
	if(player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
		windurst_mission_1_2 = player:getVar("windurst_mission_1_2");
		if(windurst_mission_1_2 == 4 and player:hasKeyItem(SOUTHEASTERN_STAR_CHARM)) then
			player:startEvent(0x2c);
			-- Set the progress
			player:setVar("windurst_mission_1_2",5);
		else
			player:messageSpecial(DOOR_FIRMLY_SHUT);
		end
	else
		player:messageSpecial(DOOR_FIRMLY_SHUT);
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

	-- If we just finished the cutscene for Windurst Mission 1-2
	if(csid == 0x2c) then
		player:messageSpecial(ALL_G_ORBS_ENERGIZED);
		-- Remove the charm that opens this door
		player:delKeyItem(SOUTHEASTERN_STAR_CHARM);
	end
end;




