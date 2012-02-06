-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Gate: Magical Gizmo
--  Involved In Mission: The Horutoto Ruins Experiment
--	Working ???%
-----------------------------------

package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Check if we are on Windurst Mission 1-1
	if(player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT) then
		windurst_mission_1_1 = player:getVar("windurst_mission_1_1");
		if(windurst_mission_1_1 == 2) then
			-- The mission is active
			player:startEvent(0x2A);
			-- Set the progress
			player:setVar("windurst_mission_1_1",3);
			
			-- Generate a random value to use for the next part of the mission
			-- where you have to examine 6 Magical Gizmo's, each of them having
			-- a number from 1 to 6 (Remember, setting 0 deletes the var)
			random_value = math.random(1,6);
			player:setVar("windurst_mission_1_1_rv",random_value); -- 'rv' = random value
			player:setVar("windurst_mission_1_1_op1",1);
			player:setVar("windurst_mission_1_1_op2",1);
			player:setVar("windurst_mission_1_1_op3",1);
			player:setVar("windurst_mission_1_1_op4",1);
			player:setVar("windurst_mission_1_1_op5",1);
			player:setVar("windurst_mission_1_1_op6",1);
		else
			-- There's nohing at this door
			player:showText(npc,DOOR_FIRMLY_CLOSED);
		end
	else
		-- There's nohing at this door
		player:showText(npc,DOOR_FIRMLY_CLOSED);
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
end;



