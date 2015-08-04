-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Gate: Magical Gizmo
--  Involved In Mission: The Horutoto Ruins Experiment
--	@pos 419 0 -27 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
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
	
	if (player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x002A);
	else
		player:showText(npc,DOOR_FIRMLY_CLOSED);
	end
	
	return 1;
	
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
	
	if (csid == 0x002A) then
		player:setVar("MissionStatus",2);
		
		-- Generate a random value to use for the next part of the mission
		-- where you have to examine 6 Magical Gizmo's, each of them having
		-- a number from 1 to 6 (Remember, setting 0 deletes the var)
		local random_value = math.random(1,6);
		player:setVar("MissionStatus_rv",random_value); -- 'rv' = random value
		player:setVar("MissionStatus_op1",1);
		player:setVar("MissionStatus_op2",1);
		player:setVar("MissionStatus_op3",1);
		player:setVar("MissionStatus_op4",1);
		player:setVar("MissionStatus_op5",1);
		player:setVar("MissionStatus_op6",1);
	end
	
end;